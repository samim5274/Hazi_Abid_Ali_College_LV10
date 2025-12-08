<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Date Wise Expense Report - {{ $company->name }}</title>

    <style>
        @page {
            size: A4;
            margin: 25px;
        }

        body {
            font-family: "DejaVu Sans", sans-serif;
            background: #fff;
            color: #000;
            padding: 20px;   /* ✅ BODY PADDING ADDED */
            box-sizing: border-box;
        }

        .container {
            width: 100%;
        }

        .header {
            text-align: center;
            margin-bottom: 18px;
        }

        .header h1 {
            font-size: 28px;
            margin-bottom: 6px;
        }

        .header p {
            font-size: 13.5px;
            margin: 3px 0;
        }

        .report-info {
            text-align: center;
            font-weight: bold;
            margin: 18px 0;
            font-size: 14.5px;
        }

        hr {
            border: none;
            border-top: 1px solid #000;
            margin: 12px 0 22px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 13.5px;
        }

        table th, table td {
            border: 1px solid #000;
            padding: 9px;
            text-align: center;
        }

        table th {
            background: #f2f2f2;
            font-weight: bold;
        }

        .total-row {
            font-weight: bold;
            background: #e9e9e9;
        }

        .signature-section {
            display: flex;
            justify-content: space-between;
            margin-top: 60px;
            padding: 0 40px;
        }

        .signature-block {
            width: 35%;
            text-align: center;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin-bottom: 6px;
        }

        .footer-note {
            text-align: center;
            font-size: 11.5px;
            margin-top: 35px;
        }

        @media print {
            body { margin: 0; padding: 10px; }
        }
    </style>
</head>
<body>

<div class="container">

    <!--  HEADER -->
    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>Email: {{ $company->email }} | Phone: {{ $company->phone }}</p>
    </div>

    <hr>

    <!--  REPORT TITLE -->
    <div class="report-info">
        Sub Category Wise Expense Report  
        <br>
        From: {{ \Carbon\Carbon::parse($from_date)->format('d M Y') }} 
        To: {{ \Carbon\Carbon::parse($to_date)->format('d M Y') }}
    </div>

    <!--  EXPENSE TABLE -->
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Date</th>
                <th>Title</th>
                <th>User</th>
                <th>Category</th>
                <th>Sub Category</th>
                <th>Amount (৳)</th>
            </tr>
        </thead>
        <tbody>
            @php $total = 0; @endphp

            @forelse($expenses as $key => $expense)
                @php $total += $expense->amount; @endphp
                <tr>
                    <td>{{ $key + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($expense->date)->format('d M Y') }}</td>
                    <td>{{ $expense->title }}</td>
                    <td>{{ $expense->user->first_name ?? '' }} {{ $expense->user->last_name ?? '' }}</td>
                    <td>{{ $expense->category->name ?? 'N/A' }}</td>
                    <td>{{ $expense->subcategory->name ?? 'N/A' }}</td>
                    <td>{{ number_format($expense->amount, 2) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="7">No Expense Found</td>
                </tr>
            @endforelse

            <!--  TOTAL ROW -->
            <tr class="total-row">
                <td colspan="6" align="right">Grand Total</td>
                <td>{{ number_format($total, 2) }} ৳</td>
            </tr>
        </tbody>
    </table>

    <!--  SIGNATURE -->
    <div class="signature-section">
        <div class="signature-block">
            <div class="line"></div>
            <small>Prepared By</small>
        </div>

        <div class="signature-block">
            <div class="line"></div>
            <small>Approved By</small>
        </div>
    </div>

    <!--  FOOTER -->
    <div class="footer-note">
        Developed by <strong>BGMIT</strong> | Created by <strong>SAMIM-HOSSaIN</strong> | +880 1533-021557
    </div>

</div>

<!--  AUTO PRINT -->
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
