<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Due Reminder</title>
</head>
<body style="font-family: Arial, sans-serif; line-height: 1.6;">
    <h3>Dear {{ $student->first_name }} {{ $student->last_name }},</h3>

    <p>This is a gentle reminder that you have an outstanding due amount.</p>

    <table cellpadding="6" cellspacing="0" border="1" style="border-collapse: collapse;">
        <tr>
            <td><strong>Roll</strong></td>
            <td>{{ $student->roll_number ?? '-' }}</td>
        </tr>
        <tr>
            <td><strong>Class</strong></td>
            <td>{{ $student->class_name ?? '-' }} {{ !empty($student->class_section) ? '(' . $student->class_section . ')' : '' }}</td>
        </tr>
        <tr>
            <td><strong>Due Amount</strong></td>
            <td><strong>৳{{ number_format($student->final_due ?? 0, 2) }}</strong></td>
        </tr>
    </table>

    <p>Please complete your payment at your earliest convenience.</p>

    <p>
        Regards,<br>
        <strong>{{ $company->name ?? '' }}</strong><br>
        {{ $company->phone ?? '' }}
    </p>
</body>
</html>
