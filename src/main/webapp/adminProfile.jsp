<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS - Human Resource Management System</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="bi bi-people-fill"></i> HRMS
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="Dashboard.jsp">Dashboard</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="leave">Leave</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="Document.jsp">Documents</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="employee">Employees</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link text-warning" href="SignOut">Sign Out</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Main Content -->
<div class="container mt-5 pt-5">

    <div class="card shadow border-0">
        <div class="card-body p-5">

<%
    String name = (String) session.getAttribute("name_key");

%>
            <h2 class="text-primary mb-3">
                Welcome to HR Management System, <span><%= name %></span>!
            </h2>

            <p class="text-secondary">
                Manage employees, leaves, documents, attendance, payroll, and other HR operations from one place.
            </p>

        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>