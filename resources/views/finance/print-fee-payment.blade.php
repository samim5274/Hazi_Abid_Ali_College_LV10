<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Payment Invoice - {{ $company->name }}</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 0;
        }

        body {
            font-family: 'Consolas', 'Courier New', monospace;
            margin: 0;
            padding: 0;
            background: #fff;
            /* display: flex;
            justify-content: center; */
        }

        .page {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
            width: 100%;
            height: 100%;
        }

        .container {
            width: 48%;
            padding: 12px;
            box-sizing: border-box;
            /* border: 1px dashed #000; optional (print cut guide) */
            page-break-inside: avoid;
        }

        .header {
            text-align: center;
            margin-bottom: 8px;
        }

        .header h1 {
            font-size: 20px;
            margin-bottom: 2px;
            text-transform: uppercase;
        }

        .header h2 {
            font-size: 16px;
            margin-bottom: 5px;
            text-decoration: underline;
        }

        .header p {
            font-size: 12px;
            margin: 1px 0;
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
            width: 90px;
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
            background: #f0f0f0;
            font-weight: bold;
        }

        .total-row {
            font-weight: bold;
            background: #e6e6e6;
        }

        .signature-section {
            display: flex;
            justify-content: space-between;
            margin-top: 15px;
            padding: 0 10px;
            font-size: 12px;
        }

        .signature-block {
            width: 30%;
            text-align: center;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin-bottom: 4px;
        }

        .footer-note {
            text-align: center;
            font-size: 10px;
            margin-top: 5px;
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
    <div class="page">
        <div class="container">

            <!-- HEADER -->
            <div class="header">
                <h1>{{ $company->name }}</h1>
                <p>{{ $company->address }}</p>
                <p>Email: {{ $company->email ?? 'N/A' }} | Phone: {{ $company->phone ?? 'N/A' }}</p>
                <h2>Payment Invoice</h2>
                <p>Office Copy</p>
            </div>

            <!-- INVOICE + STUDENT INFO -->
            <div class="info-section">
                <div>
                    <div><strong>Invoice No:</strong> {{ $payment->invoice_no ?? 'N/A' }}</div>
                    <div><strong>Receipt No:</strong> {{ $payment->receipt_no ?? 'N/A' }}</div>
                    <div><strong>Pay Date:</strong> {{ \Carbon\Carbon::parse($payment->payment_date)->format('d M, Y') }}</div>
                    <div><strong>P.M:</strong> {{ $payment->payment_method ?? 'N/A' }}</div>
                </div>
                <div>
                    <div><strong>Student:</strong> {{ $payment->student->first_name ?? '' }} {{ $payment->student->last_name ?? '' }}</div>
                    <div><strong>Class:</strong> {{ $payment->student->room->name ?? '' }} ({{ $payment->student->room->section ?? '' }})</div>
                    @if($payment->teacher)
                        <div><strong>Handled By:</strong> {{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div><strong>Pay for:</strong> {{ date('F', mktime(0, 0, 0, $payment->month, 1)) }} {{ $payment->year }}</div>
                </div>
            </div>

            <!-- PAYMENT ITEMS TABLE -->
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th style="text-align:left">Fee Item</th>
                        <th>Amount (৳)</th>
                        <th>Discount (৳)</th>
                        <th>Paid (৳)</th>
                        <th>Due (৳)</th>
                    </tr>
                </thead>
                <tbody>
                    @php 
                        $totalAmount = 0;
                        $totalPaid = 0;
                        $totalDiscount = 0;
                        $totalDue = 0;
                    @endphp
                    @forelse($feeStructures as $key => $item)
                        @php
                            $totalAmount += $item->amount;
                            $totalPaid += $item->paid;
                            $totalDiscount += $item->discount;
                            $totalDue += $item->due;
                        @endphp
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td style="text-align:left">{{ $item->feeStructure->category->name ?? 'N/A' }}</td>
                            <td>{{ number_format($item->amount, 2) }}</td>
                            <td>{{ number_format($item->discount, 2) }}</td>
                            <td>{{ number_format($item->paid, 2) }}</td>
                            <td>{{ number_format($item->due, 2) }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6">No payment items found</td>
                        </tr>
                    @endforelse
                    <tr class="total-row">
                        <td colspan="2" style="text-align:right;">Total</td>
                        <td>{{ number_format($totalAmount, 2) }}</td>
                        <td>{{ number_format($totalDiscount, 2) }}</td>
                        <td>{{ number_format($totalPaid, 2) }}</td>
                        <td>{{ number_format($totalDue, 2) }}</td>
                    </tr>
                </tbody>
            </table>

            <!-- SIGNATURE -->
            <div class="signature-section">
                <div class="signature-block">
                    @if($payment->teacher)
                        <div>{{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div class="line"></div>
                    <small>Prepared By</small>
                </div>
                <div class="signature-block">
                    @if($payment->teacher)
                        <div>{{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div class="line"></div>
                    <small>Approved By</small>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="footer-note">
                <strong>Note:</strong> Computer generated invoice. || Developed by <strong>BGMIT</strong>
            </div>

        </div>

        <div class="container">

            <!-- HEADER -->
            <div class="header">
                <h1>{{ $company->name }}</h1>
                <p>{{ $company->address }}</p>
                <p>Email: {{ $company->email ?? 'N/A' }} | Phone: {{ $company->phone ?? 'N/A' }}</p>
                <h2>Payment Invoice</h2>
                <p>Student Copy</p>
            </div>

            <!-- INVOICE + STUDENT INFO -->
            <div class="info-section">
                <div>
                    <div><strong>Invoice No:</strong> {{ $payment->invoice_no ?? 'N/A' }}</div>
                    <div><strong>Receipt No:</strong> {{ $payment->receipt_no ?? 'N/A' }}</div>
                    <div><strong>Pay Date:</strong> {{ \Carbon\Carbon::parse($payment->payment_date)->format('d M, Y') }}</div>
                    <div><strong>P.M:</strong> {{ $payment->payment_method ?? 'N/A' }}</div>
                </div>
                <div>
                    <div><strong>Student:</strong> {{ $payment->student->first_name ?? '' }} {{ $payment->student->last_name ?? '' }}</div>
                    <div><strong>Class:</strong> {{ $payment->student->room->name ?? '' }} ({{ $payment->student->room->section ?? '' }})</div>
                    @if($payment->teacher)
                        <div><strong>Handled By:</strong> {{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div><strong>Pay for:</strong> {{ date('F', mktime(0, 0, 0, $payment->month, 1)) }} {{ $payment->year }}</div>
                </div>
            </div>

            <!-- PAYMENT ITEMS TABLE -->
            <table>
                <thead>
                    <tr>
                        <th>#</th>
                        <th style="text-align:left">Fee Item</th>
                        <th>Amount (৳)</th>
                        <th>Discount (৳)</th>
                        <th>Paid (৳)</th>
                        <th>Due (৳)</th>
                    </tr>
                </thead>
                <tbody>
                    @php 
                        $totalAmount = 0;
                        $totalPaid = 0;
                        $totalDiscount = 0;
                        $totalDue = 0;
                    @endphp
                    @forelse($feeStructures as $key => $item)
                        @php
                            $totalAmount += $item->amount;
                            $totalPaid += $item->paid;
                            $totalDiscount += $item->discount;
                            $totalDue += $item->due;
                        @endphp
                        <tr>
                            <td>{{ $key + 1 }}</td>
                            <td style="text-align:left">{{ $item->feeStructure->category->name ?? 'N/A' }}</td>
                            <td>{{ number_format($item->amount, 2) }}</td>
                            <td>{{ number_format($item->discount, 2) }}</td>
                            <td>{{ number_format($item->paid, 2) }}</td>
                            <td>{{ number_format($item->due, 2) }}</td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="6">No payment items found</td>
                        </tr>
                    @endforelse
                    <tr class="total-row">
                        <td colspan="2" style="text-align:right;">Total</td>
                        <td>{{ number_format($totalAmount, 2) }}</td>
                        <td>{{ number_format($totalDiscount, 2) }}</td>
                        <td>{{ number_format($totalPaid, 2) }}</td>
                        <td>{{ number_format($totalDue, 2) }}</td>
                    </tr>
                </tbody>
            </table>

            <!-- SIGNATURE -->
            <div class="signature-section">
                <div class="signature-block">
                    @if($payment->teacher)
                        <div>{{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div class="line"></div>
                    <small>Prepared By</small>
                </div>
                <div class="signature-block">
                    @if($payment->teacher)
                        <div>{{ $payment->teacher->first_name }} {{ $payment->teacher->last_name }}</div>
                    @endif
                    <div class="line"></div>
                    <small>Approved By</small>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="footer-note">
                <strong>Note:</strong> Computer generated invoice. || Developed by <strong>BGMIT</strong>
            </div>

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
