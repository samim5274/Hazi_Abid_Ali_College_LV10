<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Transaction Report - {{ $company->name }}</title>
    <style>
        @page {
            size: A4;
            margin: 10mm;
        }

        body {
            font-family: 'Consolas', 'Courier New', monospace;
            margin: 0;
            padding: 0;
            background: #fff;
            display: flex;
            justify-content: center;
        }

        .container {
            width: 95%;
            padding: 15px;
            box-sizing: border-box;
            display: flex;
            flex-direction: column;
            page-break-inside: avoid;
        }

        .header {
            text-align: center;
            margin-bottom: 10px;
        }

        .header h1 {
            font-size: 22px;
            margin-bottom: 2px;
            text-transform: uppercase;
        }

        .header p {
            font-size: 12px;
            margin: 2px 0;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            font-size: 12px;
        }

        .info-section div {
            line-height: 1.3;
        }

        .info-section strong {
            display: inline-block;
            width: 120px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            margin-top: 5px;
        }

        table th, table td {
            border: 1px solid #000;
            padding: 5px 6px;
            text-align: center;
        }

        table th {
            background: #3F4D67;
            color: #fff;
            font-weight: bold;
        }

        tbody tr:nth-child(even) {
            background-color: #f9fafb;
        }

        .badge {
            padding: 3px 8px;
            border-radius: 999px;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
        }

        .badge-deposit {
            background-color: #dcfce7;
            color: #166534;
        }

        .badge-withdraw {
            background-color: #fee2e2;
            color: #991b1b;
        }

        .amount {
            font-weight: 600;
        }

        .total-row {
            font-weight: bold;
            background: #e6e6e6;
        }

        .footer-note {
            text-align: center;
            font-size: 10px;
            margin-top: 10px;
        }

        @media print {
            body {
                display: block;
            }
            .container, table, tr, td, th {
                page-break-inside: avoid !important;
            }
        }
    </style>
</head>
<body>

<div class="container">

    <!-- HEADER -->
    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>Email: {{ $company->email ?? 'N/A' }} | Phone: {{ $company->phone ?? 'N/A' }}</p>
        <h2>Bank Transaction Report</h2>
        <p>Date: {{ request('start_date') ?? 'All' }} - {{ request('end_date') ?? 'All' }}</p>
    </div>

    <!-- TABLE -->
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Date</th>
                <th>Bank Name</th>
                <th>Status</th>
                <th>Amount</th>
            </tr>
        </thead>
        <tbody>
            @php 
                $totalDeposit = 0;
                $totalWithdraw = 0;
            @endphp
            @forelse($transectionDetails as $deposit)
                @php
                    if($deposit->status == 'Deposit') $totalDeposit += $deposit->amount;
                    else $totalWithdraw += $deposit->amount;
                @endphp
                <tr>
                    <td>{{ $loop->iteration }}</td>
                    <td>{{ \Carbon\Carbon::parse($deposit->date)->format('d M, Y') }}</td>
                    <td>
                        <span class="badge">
                            {{ $deposit->bank->bank_name }}
                        </span>
                    </td>
                    <td>
                        <span class="badge">
                            {{ $deposit->status }}
                        </span>
                    </td>
                    <td class="amount">
                        {{ $deposit->status == 'Deposit' ? '+' : '-' }} ৳ {{ number_format($deposit->amount,2) }}
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="5">No transactions found.</td>
                </tr>
            @endforelse
            <tr class="total-row">
                <td colspan="4" style="text-align:right;">Balance</td>
                <td class="amount">৳ {{ number_format($totalDeposit - $totalWithdraw,2) }}</td>
            </tr>
        </tbody>
    </table>

    <!-- FOOTER -->
    <div class="footer-note">
        Computer generated report. || Developed by <strong>BGMIT</strong>
    </div>

</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => {
            window.close();
        }, 800);
    }
</script>

</body>
</html>
