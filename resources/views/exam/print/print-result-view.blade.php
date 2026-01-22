<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Student Result - {{ $company->name ?? 'SMS' }}</title>

    <style>
        /* ===== Page setup ===== */
        @page { size: A4; margin: 14mm; }
        * { box-sizing: border-box; }
        body{
            margin:0;
            font-family: "DejaVu Sans", Arial, sans-serif;
            color:#111;
            background:#fff;
        }

        /* ===== Layout ===== */
        .page{ width:100%; }
        .header{
            text-align:center;
            padding-bottom: 10px;
            border-bottom: 2px solid #111;
            margin-bottom: 12px;
        }
        .company{
            font-size: 20px;
            font-weight: 800;
            margin:0;
            letter-spacing: .2px;
        }
        .meta{
            margin-top: 4px;
            font-size: 12px;
            line-height: 1.45;
            color:#333;
        }

        .bar{
            display:flex;
            align-items:flex-start;
            justify-content: space-between;
            gap:12px;
            border:1px solid #111;
            padding:10px 12px;
            margin: 10px 0 12px;
        }
        .bar h2{
            margin:0;
            font-size: 15px;
            font-weight: 800;
        }
        .bar .right{
            text-align:right;
            font-size: 11.5px;
            line-height: 1.6;
            color:#333;
        }
        .badge{
            display:inline-block;
            padding: 2px 8px;
            border: 1px solid #111;
            font-size: 10.5px;
            font-weight: 700;
            margin-left: 6px;
        }

        /* ===== Summary boxes ===== */
        .summary{
            display:flex;
            gap:10px;
            margin: 0 0 12px;
        }
        .box{
            flex:1;
            border:1px solid #111;
            padding:10px 12px;
        }
        .box .label{ font-size: 11px; color:#333; font-weight:700; }
        .box .value{ font-size: 18px; font-weight: 900; margin-top: 2px; }

        /* ===== Tables ===== */
        table{
            width:100%;
            border-collapse: collapse;
            table-layout: fixed;
            font-size: 11.5px;
        }
        th, td{
            border:1px solid #111;
            padding: 7px 6px;
            vertical-align: top;
        }
        thead th{
            background:#f2f2f2;
            font-weight: 800;
            text-align:center;
        }
        .t-center{ text-align:center; }
        .t-right{ text-align:right; }
        .muted{ color:#444; font-size: 10.5px; }

        /* Section headings inside table */
        .section-row td{
            background:#fafafa;
            font-weight: 800;
        }

        /* Footer */
        .footer{
            margin-top: 3.5rem;
            font-size: 10.5px;
            color:#333;
            display:flex;
            justify-content: space-between;
            gap:12px;
        }
        .sign{
            width: 32%;
            text-align:center;
        }
        .line{
            border-top: 1px solid #111;
            height:1px;
            margin-bottom: 6px;
        }

        /* Print behavior */
        .no-print{ display:inline-block; }
        @media print{
            .no-print{ display:none !important; }
            table, tr, td, th { page-break-inside: avoid; }
            thead{ display: table-header-group; }
        }

        /* Small print button */
        .btn{
            border:1px solid #111;
            padding: 6px 10px;
            font-size: 12px;
            font-weight: 700;
            background:#fff;
            cursor:pointer;
        }
    </style>
</head>

<body>
@php
    // marks normalize (grouped or not)
    $isGrouped = $marks instanceof \Illuminate\Support\Collection
        && $marks->count()
        && $marks->first() instanceof \Illuminate\Support\Collection;

    $groupedMarks = $isGrouped
        ? $marks
        : $marks->groupBy(fn($item) => optional($item->exam)->name ?? 'No Exam');

    $student = optional($groupedMarks->flatten()->first())->student;

    $flat = $groupedMarks->flatten();
    $overallTotal = (int) $flat->sum('marks_obtained');
    $overallSubjectsCount = (int) $flat->count();
    $overallAvgGpa = $overallSubjectsCount ? ($flat->sum('gpa') / $overallSubjectsCount) : 0;

    $allGrades = $flat->pluck('grade')->filter()->toArray();
    $overallAvgGrade = count($allGrades)
        ? collect($allGrades)->countBy()->sortDesc()->keys()->first()
        : '-';

    $generatedAt = now()->format('d M Y, h:i A');
@endphp

<div class="page">

    <!-- Header -->
    <div class="header">
        <p class="company">{{ $company->name ?? 'SMS' }}</p>
        <div class="meta">
            <div>{{ $company->address ?? '' }}</div>
            <div>
                @if(!empty($company->email)) Email: {{ $company->email }} @endif
                @if(!empty($company->phone)) | Phone: {{ $company->phone }} @endif
            </div>
        </div>
    </div>

    <!-- Info bar -->
    <div class="bar">
        <div>
            <h2>Student Result Sheet</h2>
            <div class="muted" style="margin-top:4px;">
                Student: <strong>{{ $student->first_name ?? 'N/A' }} {{ $student->last_name ?? '' }}</strong>
                @if(!empty($student?->roll_number)) <span class="badge">Roll: {{ $student->roll_number }}</span> @endif
                @if(!empty($student?->class_id)) <span class="badge">{{ $student->room->name ?? 'N/A' }}</span> @endif
            </div>
        </div>

        <div class="right">
            <div><strong>Generated:</strong> {{ $generatedAt }}</div>
            <div class="no-print" style="margin-top:6px;">
                <button class="btn" onclick="window.print()">Print</button>
            </div>
        </div>
    </div>

    <!-- Summary -->
    <div class="summary">
        <div class="box">
            <div class="label">Overall Total Marks</div>
            <div class="value">{{ $overallTotal }}</div>
        </div>
        <div class="box">
            <div class="label">Overall Avg GPA / Grade</div>
            <div class="value">{{ number_format($overallAvgGpa, 2) }} / {{ $overallAvgGrade }}</div>
            <div class="muted">Calculated from all subjects</div>
        </div>
    </div>

    <!-- Full details table -->
    <table>
        <thead>
            <tr>
                <th style="width:40px;">#</th>
                <th>Subject</th>
                <th style="width:160px;">Exam</th>
                <th style="width:70px;">Obj</th>
                <th style="width:70px;">Thy</th>
                <th style="width:70px;">Total</th>
                <th style="width:80px;">Grade</th>
                <th style="width:80px;">GPA</th>
            </tr>
        </thead>

        <tbody>
            @foreach($groupedMarks as $examName => $examMarks)
                @php
                    $examTotal = (int) $examMarks->sum('marks_obtained');
                    $count = (int) $examMarks->count();
                    $examAvgGpa = $count ? ($examMarks->sum('gpa') / $count) : 0;

                    $grades = $examMarks->pluck('grade')->filter()->toArray();
                    $examAvgGrade = count($grades)
                        ? collect($grades)->countBy()->sortDesc()->keys()->first()
                        : '-';
                @endphp

                <tr class="section-row">
                    <td colspan="6">
                        {{ $examName }} — Total: {{ $examTotal }} | Avg: {{ number_format($examAvgGpa, 2) }} / {{ $examAvgGrade }}
                    </td>
                </tr>

                @foreach($examMarks as $val)
                <tr>
                    <td class="t-center">{{ $loop->iteration }}</td>
                    <td>
                        <strong>{{ optional($val->subject)->name ?? '-' }}</strong>
                        @if(!empty($val->teacher))
                            <div class="muted">
                                Teacher: {{ $val->teacher->first_name ?? '' }}
                                {{ $val->teacher->last_name ?? '' }}
                            </div>
                        @endif
                    </td>
                    <td class="t-center">{{ $examName }}</td>
                    <td class="t-center">
                        {{ $val->marks_objective ?? '—' }}
                    </td>
                    <td class="t-center">
                        {{ $val->marks_theury ?? '—' }}
                    </td>
                    <td class="t-center">
                        <strong>{{ $val->marks_obtained ?? '—' }}</strong>
                    </td>
                    <td class="t-center">
                        {{ $val->grade ?? '-' }}
                    </td>
                    <td class="t-center">
                        {{ number_format($val->gpa ?? 0, 2) }}
                    </td>
                </tr>
                @endforeach


            @endforeach
        </tbody>
    </table>

    <!-- Footer / Sign -->
    <div class="footer">
        <div class="sign">
            <div class="line"></div>
            Prepared By
            <p>{{ Auth::guard('teacher')->user()->first_name }} {{ Auth::guard('teacher')->user()->last_name }}</p>
        </div>
        <div class="sign">
            <div class="line"></div>
            Checked By
        </div>
        <div class="sign">
            <div class="line"></div>
            Approved By
        </div>
    </div>

</div>

<script>
    // Auto print (optional). Keep it if you want auto-open print.
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 800);
    }
</script>
</body>
</html>
