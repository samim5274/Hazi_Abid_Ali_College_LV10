<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <title>Exam Wise Result Sheet - {{ $company->name ?? 'SMS' }}</title>

    <style>
        @page { size: A4 landscape; margin: 8mm; }
        * { box-sizing: border-box; }

        html, body{
            margin:0;
            font-family: "DejaVu Sans", Arial, sans-serif;
            color:#000;
            background:#fff;
        }

        /* ===== HEADER ===== */
        .header{
            text-align:center;
            border-bottom: 2px solid #000;
            padding: 6px 0 8px;
            margin-bottom: 8px;
        }
        .company{
            margin:0;
            font-size: 17px;
            font-weight: 900;
        }
        .meta{
            font-size: 10.5px;
            line-height:1.35;
        }

        /* ===== BAR ===== */
        .bar{
            display:flex;
            justify-content: space-between;
            align-items:flex-start;
            gap:10px;
            border: 1px solid #000;
            padding: 7px 9px;
            margin: 8px 0 10px;
        }
        .bar h2{
            margin:0;
            font-size: 12.5px;
            font-weight: 900;
        }
        .badge{
            display:inline-block;
            padding: 1px 7px;
            border:1px solid #000;
            font-size: 9.8px;
            font-weight: 900;
            margin-left: 6px;
        }
        .right{
            text-align:right;
            font-size: 10px;
            line-height:1.45;
        }

        .btn{
            border:1px solid #000;
            padding: 5px 9px;
            font-size: 10.5px;
            font-weight: 900;
            background:#fff;
            cursor:pointer;
        }
        .no-print{ display:inline-block; }
        @media print{ .no-print{ display:none !important; } }

        /* ✅ ===== EXAM SECTION (FIXED) ===== */
        .exam{
            margin-bottom: 10px;
            page-break-inside: avoid;
            break-inside: avoid;
        }

        /* ✅ only after first exam, force new page */
        .exam.break-before{
            page-break-before: always;
            break-before: page;
        }

        .exam-title{
            display:flex;
            justify-content: space-between;
            align-items:center;
            gap:10px;
            padding: 6px 8px;
            border:1px solid #000;
            font-weight:900;
            font-size: 11.5px;
            margin-bottom: 6px;
        }
        .exam-title .sub{
            font-size: 9.8px;
            font-weight:800;
        }

        /* ===== TABLE ===== */
        .table-wrap{
            border:1px solid #000;
        }

        table{
            width:100%;
            border-collapse: collapse;
            table-layout: fixed;
            font-size: 9.8px;
        }

        th, td{
            border:1px solid #000;
            padding: 4px 3px;
            vertical-align: middle;
            overflow:hidden;
            text-overflow: ellipsis;
        }

        thead { display: table-header-group; }

        thead th{
            font-weight: 900;
            text-align:center;
            white-space: normal;
            line-height: 1.15;
        }

        .col-student{
            text-align:left;
            font-weight: 900;
            width: 190px;
            white-space: nowrap;
        }

        .num{
            text-align:center;
            font-weight:700;
        }

        .roll{
            font-size: 9.8px;
            font-weight:800;
        }

        tfoot th{
            font-weight: 900;
            text-align:center;
        }
        tfoot th:first-child{
            text-align:left;
        }

        .note{
            margin-top: 6px;
            font-size: 9.5px;
            text-align:right;
        }

        @media print{
            table, tr, td, th{ page-break-inside: avoid; }
        }
    </style>

</head>
<body>

@php $generatedAt = now()->format('d M Y, h:i A'); @endphp

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

<div class="bar">
    <div>
        <h2>
            Exam Wise Mark Sheet 
        </h2>
        <div style="margin-top:4px; font-size:11px; color:#374151;">
            Room/Class:
            <strong>{{ $room->name ?? 'N/A' }}</strong>
            @if(!empty($room?->section))
                <span class="badge">Section: {{ $room->section }}</span>
            @endif
            <span class="badge">Students: {{ $students->count() }}</span>
        </div>
    </div>

    <div class="right">
        <div><strong>Generated:</strong> {{ $generatedAt }}</div>
        <div class="no-print" style="margin-top:6px;">
            <button class="btn" onclick="window.print()">Print</button>
        </div>
    </div>
</div>

@foreach($examSheets as $examName => $sheet)
    @php
        $subjects = $sheet['subjects'];
        $lookup = $sheet['lookup'];
    @endphp

    <div class="exam {{ !$loop->first ? 'break-before' : '' }}">
        <div class="exam-title">
            <div>{{ $examName }}</div>
            <div class="sub">Students: {{ $students->count() }} | Subjects: {{ $subjects->count() }}</div>
        </div>

        <div class="table-wrap">
            <table>
                <thead>
                    <tr>
                        <th class="col-student" rowspan="2">Student Name/Subject</th>

                        @foreach($subjects as $sub)
                            <th colspan="2">{{ $sub->name ?? 'N/A' }}</th>
                        @endforeach

                        <th style="width:90px;" rowspan="2">Total</th>
                    </tr>

                    <tr>
                        @foreach($subjects as $sub)
                            <th style="width:55px;">Obj</th>
                            <th style="width:55px;">Thy</th>
                        @endforeach
                    </tr>
                </thead>

                <tbody>
                @foreach($students as $std)
                    @php $rowTotal = 0; @endphp

                    <tr>
                        <td class="col-student">
                            {{ $std->first_name }} {{ $std->last_name }}
                            @if(!empty($std->roll_number))
                                <span class="roll">(Roll: {{ $std->roll_number }})</span>
                            @endif
                        </td>

                        @foreach($subjects as $sub)
                            @php
                                $cell = $lookup[$std->id][$sub->id] ?? null;

                                $obj   = $cell['obj'] ?? null;
                                $thy   = $cell['thy'] ?? null;
                                $total = $cell['total'] ?? null;

                                $rowTotal += is_numeric($total) ? (float)$total : 0;
                            @endphp

                            <td class="num">{{ is_null($obj) ? '-' : $obj }}</td>
                            <td class="num">{{ is_null($thy) ? '-' : $thy }}</td>
                        @endforeach

                        <td class="num" style="font-weight:900;">{{ $rowTotal }}</td>
                    </tr>
                @endforeach
                </tbody>

                <tfoot>
                    @php $grandTotal = 0; @endphp
                    <tr>
                        <th class="col-student" style="background:#0f766e;color:#fff;text-align:left;">
                            Subject Total
                        </th>

                        @foreach($subjects as $sub)
                            @php
                                $colObj = 0; $colThy = 0; $colTotal = 0;

                                foreach($students as $std){
                                    $cell = $lookup[$std->id][$sub->id] ?? null;

                                    $colObj   += is_numeric($cell['obj'] ?? null) ? (float)$cell['obj'] : 0;
                                    $colThy   += is_numeric($cell['thy'] ?? null) ? (float)$cell['thy'] : 0;
                                    $colTotal += is_numeric($cell['total'] ?? null) ? (float)$cell['total'] : 0;
                                }

                                $grandTotal += $colTotal;
                            @endphp

                            <th class="num" style="background:#0f766e;color:#fff;">{{ $colObj }}</th>
                            <th class="num" style="background:#0f766e;color:#fff;">{{ $colThy }}</th>
                        @endforeach

                        <th class="num" style="background:#0f766e;color:#fff;font-weight:900;">
                            {{ $grandTotal }}
                        </th>
                    </tr>
                </tfoot>
            </table>

        </div>

        <div class="note">Note: Auto-generated mark sheet.</div>
    </div>

@endforeach

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 800);
    }
</script>

</body>
</html>
