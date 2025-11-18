<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            max-width: 960px;
        }
        .card {
            margin-bottom: 1.5rem;
        }
    </style>
</head>
<body>
    <div class="container py-5">
        <h1 class="mb-4">Account Information</h1>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">Account Details</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <p><strong>Username:</strong> johndoe</p>
                        <p><strong>Email:</strong> johndoe@example.com</p>
                        <p><strong>Member Since:</strong> January 1, 2023</p>
                    </div>
                    <div class="col-md-6 text-md-end">
                        <a href="#" class="btn btn-primary">Edit Profile</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header">
                <h5 class="card-title mb-0">Subscription</h5>
            </div>
            <div class="card-body">
                <p><strong>Plan:</strong> Premium</p>
                <p><strong>Status:</strong> Active</p>
                <p><strong>Next Billing Date:</strong> February 1, 2024</p>
                <a href="#" class="btn btn-secondary">Manage Subscription</a>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>