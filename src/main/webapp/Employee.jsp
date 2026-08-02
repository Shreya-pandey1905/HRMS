<%@ page import="java.util.*" %>
<%@ page import="model.User" %>

<%
List<User> employees = (List<User>)request.getAttribute("employees");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Employee - HRMS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>

<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
    <div class="container">
        <a class="navbar-brand fw-bold" href="index.jsp">
            <i class="bi bi-people-fill"></i> HRMS
        </a>

        <button class="navbar-toggler" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="Dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="leave">Leave</a></li>
                <li class="nav-item"><a class="nav-link" href="Document.jsp">Documents</a></li>
                <li class="nav-item"><a class="nav-link active" href="employee">Employee</a></li>
                <li class="nav-item"><a class="nav-link text-warning" href="SignOut">Sign Out</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">

    <div class="row justify-content-center">
        <div class="col-lg-6">

            <div class="card shadow">
                <div class="card-header bg-primary text-white">
                    <h4 class="mb-0">
                        <i class="bi bi-person-plus-fill"></i> Add Employee
                    </h4>
                </div>

                <div class="card-body">
                    <form action="AddEmployee" method="post">

                        <div class="mb-3">
                            <label class="form-label">Employee Name</label>
                            <input type="text" class="form-control" name="name" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Work Email</label>
                            <input type="email" class="form-control" name="email" required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Department</label>
                            <select class="form-select" name="department">
                                <option>Human Resources</option>
                                <option>Information Technology</option>
                                <option>Finance</option>
                                <option>Marketing</option>
                                <option>Sales</option>
                                <option>Operations</option>
                            </select>
                        </div>

                        <button class="btn btn-primary w-100">
                            <i class="bi bi-person-plus"></i> Add Employee
                        </button>

                    </form>
                </div>
            </div>

        </div>
    </div>

    <div class="card shadow mt-5">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">
                <i class="bi bi-people"></i> Employee List
            </h4>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover table-striped">
                <thead class="table-primary">
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                <%
                    if(employees != null){
                        for(User user : employees){
                %>
                    <tr>
                        <td><%= user.getName() %></td>
                        <td><%= user.getEmail() %></td>
                        <td><%= user.getDepartment() %></td>
                        <td><%= user.getRole() %></td>
                    </tr>
                <%
                        }
                    }else{
                %>
                    <tr>
                        <td colspan="5" class="text-center text-danger">No Employees Found</td>
                    </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>