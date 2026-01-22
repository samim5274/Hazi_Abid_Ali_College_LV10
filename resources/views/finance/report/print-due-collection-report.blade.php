<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Due Collection Report - {{ $company->name }}</title>
    <style>
        @page { size: A4 landscape; margin: 10mm; }
        body { font-family: 'Consolas','Courier New',monospace; margin:0; padding:0; background:#fff; }
        .header { text-align:center; margin-bottom:10px; }
        .header h1 { font-size:20px; margin:0 0 2px; text-transform:uppercase; }
        .header h2 { font-size:16px; margin:4px 0 4px; text-decoration:underline; }
        .header p { font-size:12px; margin:1px 0; }

        .meta { display:flex; justify-content:space-between; font-size:12px; margin:8px 0 10px; }
        .meta div { line-height:1.4; }
        .meta strong { display:inline-block; width:95px; }

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
        <h2>Due Collection Report</h2>
    </div>

    <div class="meta">
        <div>
            <div><strong>Print Date:</strong> {{ now()->format('d M, Y') }}</div>
            <div><strong>Date Range:</strong> {{ $startDate->format('d M, Y') }} - {{ $endDate->format('d M, Y') }}</div>
        </div>
        <div>
            <div><strong>Total Records:</strong> {{ $dueCollections->count() }}</div>
        </div>
    </div>

    @php
        $totalPrev = 0;
        $totalPaid = 0;
        $totalRemain = 0;
    @endphp

    <table>
        <thead>
            <tr>
                <th style="width:40px;">#</th>
                <th class="left" style="width:140px;">Receipt / Invoice</th>
                <th class="left">Student</th>
                <th style="width:95px;">Date</th>
                <th style="width:110px;">Previous Due (৳)</th>
                <th style="width:110px;">Paid (৳)</th>
                <th style="width:120px;">Remaining (৳)</th>
                <th class="left" style="width:130px;">Collected By</th>
            </tr>
        </thead>

        <tbody>
            @forelse($dueCollections as $i => $val)
                @php
                    $totalPrev += (float) $val->previous_due;
                    $totalPaid += (float) $val->paid_amount;
                    $totalRemain += (float) $val->remaining_due;
                @endphp

                <tr>
                    <td>{{ $i + 1 }}</td>

                    <td class="left">
                        R: {{ $val->receipt_no ?? '-' }} <br>
                        I: {{ $val->invoice_no ?? '-' }}
                    </td>

                    <td class="left">
                        {{ $val->student->roll_number ?? '-' }} -
                        {{ $val->student->first_name ?? '' }} {{ $val->student->last_name ?? '' }}
                    </td>

                    <td>
                        {{ $val->collection_date ? \Carbon\Carbon::parse($val->collection_date)->format('d M Y') : '-' }}
                    </td>

                    <td>৳{{ number_format($val->previous_due ?? 0, 2) }}</td>
                    <td>৳{{ number_format($val->paid_amount ?? 0, 2) }}</td>
                    <td>৳{{ number_format($val->remaining_due ?? 0, 2) }}</td>

                    <td class="left">
                        {{ $val->user->first_name ?? '' }} {{ $val->user->last_name ?? '' }}
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="9">No due collections found for this date range.</td>
                </tr>
            @endforelse

            @if($dueCollections->count() > 0)
                <tr class="total-row">
                    <td colspan="4" style="text-align:right;">Grand Total</td>
                    <td>৳{{ number_format($totalPrev, 2) }}</td>
                    <td>৳{{ number_format($totalPaid, 2) }}</td>
                    <td>৳{{ number_format($totalRemain, 2) }}</td>
                    <td colspan="2"></td>
                </tr>
            @endif
        </tbody>
    </table>

    <div style="margin-top:18px; padding:0 10px;">
        <table style="width:100%; border-collapse:collapse; font-size:12px;">
            <tr>
                <td style="width:33%; text-align:center;">
                    <div style="height:40px;"></div>{{ Auth::guard('teacher')->user()->first_name }}
                    <div style="border-top:1px solid #000; margin:0 20px 4px;"></div>
                    <strong>Prepared By</strong>
                </td>

                <td style="width:33%; text-align:center;">
                    <div style="height:40px;"></div><span> </span>
                    <div style="border-top:1px solid #000; margin:0 20px 4px;"></div>
                    <strong>Checked By</strong>
                </td>

                <td style="width:33%; text-align:center;">
                    <div style="height:40px;"></div><span> </span>
                    <div style="border-top:1px solid #000; margin:0 20px 4px;"></div>
                    <strong>Authorized By</strong>
                </td>
            </tr>
        </table>
    </div>


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
