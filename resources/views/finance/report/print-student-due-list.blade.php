<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Due List - {{ $company->name }}</title>
    <style>
        @page { size: A4 landscape; margin: 10mm; }
        body { font-family: 'Consolas','Courier New',monospace; margin:0; padding:0; background:#fff; }
        .header { text-align:center; margin-bottom:10px; }
        .header h1 { font-size:20px; margin:0 0 2px; text-transform:uppercase; }
        .header h2 { font-size:16px; margin:4px 0 4px; text-decoration:underline; }
        .header p { font-size:12px; margin:1px 0; }

        .meta { display:flex; justify-content:space-between; font-size:12px; margin:8px 0 10px; }
        .meta div { line-height:1.4; }
        .meta strong { display:inline-block; width:90px; }

        table { width:100%; border-collapse:collapse; font-size:12px; }
        th, td { border:1px solid #000; padding:5px 6px; text-align:center; }
        th { background:#f0f0f0; font-weight:bold; }
        td.left { text-align:left; }
        .total-row { font-weight:bold; background:#e6e6e6; }

        .footer-note { text-align:center; font-size:10px; margin-top:8px; }

        @media print {
            table, tr, td, th { page-break-inside: avoid !important; }
        }
    </style>
</head>
<body>

    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>Email: {{ $company->email ?? 'N/A' }} | Phone: {{ $company->phone ?? 'N/A' }}</p>
        <h2>Students Due List</h2>
    </div>

    <div class="meta">
        <div>
            <div><strong>Print Date:</strong> {{ now()->format('d M, Y') }}</div>
            <div><strong>Total Students:</strong> {{ $studentsWithDue->count() }}</div>
        </div>
        <div>
            {{-- চাইলে filter info (month/class) এখানে দেখাতে পারো --}}
            <div><strong>Report:</strong> Due > 0</div>
        </div>
    </div>

    @php
        $sumFee = 0;
        $sumPaid = 0;
        $sumDue = 0;
    @endphp

    <table>
        <thead>
            <tr>
                <th style="width:40px;">#</th>
                <th class="left">Student</th>
                <th style="width:70px;">Roll</th>
                <th class="left" style="width:160px;">Class</th>
                <th style="width:110px;">Total Due (৳)</th>
            </tr>
        </thead>
        <tbody>
            @forelse($studentsWithDue as $i => $st)
                @php
                    $sumDue += (float)$st->final_due;
                @endphp
                <tr>
                    <td>{{ $i + 1 }}</td>
                    <td class="left">{{ $st->first_name }} {{ $st->last_name }}</td>
                    <td>{{ $st->roll_number ?? '-' }}</td>
                    <td class="left">{{ $st->class_name ?? '-' }} {{ $st->class_section ? "({$st->class_section})" : '' }}</td>
                    <td><strong>৳{{ number_format($st->final_due, 2) }}/-</strong></td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">No due students found</td>
                </tr>
            @endforelse

            @if($studentsWithDue->count() > 0)
                <tr class="total-row">
                    <td colspan="4" class="left" style="text-align:right;">Grand Total</td>
                    <td>৳{{ number_format($sumDue, 2) }}/-</td>
                </tr>
            @endif
        </tbody>
    </table>

    <div class="footer-note">
        <strong>Note:</strong> Computer generated report. || Developed by <strong>BGMIT</strong>
    </div>

    <script>
        window.onload = function () {
            window.print();
            setTimeout(() => window.close(), 800);
        }
    </script>

</body>
</html>
