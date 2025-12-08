<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Teacher Attendance Report - {{ $company->name }}</title>

<style>
    @page {
        size: A4;
        margin: 20mm;
    }

    body {
        font-family: "Open Sans", sans-serif;
        background: #fff;
        color: #000;
    }

    /* School Header */
    .header {
        text-align: center;
        border-bottom: 2px solid #333;
        padding-bottom: 10px;
        margin-bottom: 20px;
        position: relative;
    }

    .header img {
        width: 80px;
        position: absolute;
        left: 0;
        top: 0;
    }

    .school-info h1 {
        margin: 0;
        font-size: 22px;
        text-transform: uppercase;
        font-weight: 700;
        letter-spacing: 1px;
    }

    .school-info p {
        margin: 3px 0;
        font-size: 13px;
    }

    /* Title */
    .report-title {
        text-align: center;
        margin-bottom: 15px;
    }
    .report-title h2 {
        font-size: 20px;
        margin-bottom: 4px;
        font-weight: 700;
    }
    .report-title span {
        font-size: 13px;
        color: #555;
    }

    /* Table */
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 10px;
        font-size: 13px;
    }
    th, td {
        border: 1px solid #ddd;
        padding: 8px 6px;
        text-align: left;
    }
    th {
        background: #f3f4f6;
        font-weight: 600;
        text-transform: uppercase;
        font-size: 12px;
    }

    tr:nth-child(even) {
        background: #fafafa;
    }

    /* Signatures */
    .signature-area {
        margin-top: 50px;
        display: flex;
        justify-content: space-between;
    }

    .signature-box {
        width: 40%;
        text-align: center;
        border-top: 1px solid #000;
        padding-top: 5px;
    }

    /* Footer */
    .footer {
        position: fixed;
        bottom: 5px;
        left: 0;
        right: 0;
        text-align: center;
        font-size: 11px;
        color: #555;
    }

    /* Page Number */
    .footer:after {
        content: "Page " counter(page);
    }
</style>

</head>
<body>

<!-- Header -->
<div class="header">
    <img src="{{asset('assets/images/favicon.svg')}}" alt="Logo">

    <div class="school-info">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>Email: {{ $company->email }} | Phone: {{ $company->phone }} | Website: {{ $company->website }}</p>
    </div>
</div>

<!-- Title -->
<div class="report-title">
    <h2>Teacher Attendance Report</h2>
    <span>
        {{ request('start_date') }} — {{ request('end_date') }}
    </span>
</div>

<!-- Table -->
<table>
    <thead>
        <tr>
            <th>#</th>
            <th>Teacher Name</th>
            <th>Date</th>
            <th>Time</th>
            <th>Status</th>
        </tr>
    </thead>

    <tbody>
        @foreach ($data as $val)
        <tr>
            <td>{{ $loop->iteration }}</td>

            <td>{{ $val->teacher->first_name }} {{ $val->teacher->last_name }}</td>

            <td>{{ \Carbon\Carbon::parse($val->attendance_date)->format('d M, Y') }}</td>

            <td>{{ \Carbon\Carbon::parse($val->attendance_time)->format('h:i A') }}</td>

            <td>{{ ucfirst($val->status) }}</td>
        </tr>
        @endforeach
    </tbody>
</table>

<!-- Signatures -->
<div class="signature-area">
    <div class="signature-box">
        Headmaster Signature
    </div>

    <div class="signature-box">
        Prepared By
    </div>
</div>

<!-- Footer -->
<div class="footer">
    Generated on: {{ now()->format('d M, Y h:i A') }} |
</div>

<script>
    window.onload = function() {
        window.print();
        setTimeout(() => {
            window.close();
        }, 300); 
    };
</script>

</body>
</html>
