<%@ page import="java.util.*" %>
<%@ page import="model.Leave" %>

<%
List<Leave> leaves = (List<Leave>)request.getAttribute("leaves");
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Management - HRMS</title>
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
                <li class="nav-item"><a class="nav-link" href="adminDashboard">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link active" href="Leave">Leave</a></li>
                <li class="nav-item"><a class="nav-link" href="documents">Documents</a></li>
                <li class="nav-item"><a class="nav-link" href="employee">Employee</a></li>
                <li class="nav-item"><a class="nav-link text-warning" href="SignOut">Sign Out</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container py-5">

    <div class="card shadow mb-5">
        <div class="card-header bg-primary text-white">
            <h4 class="mb-0">
                <i class="bi bi-calendar-plus"></i> Apply Leave
            </h4>
        </div>

        <div class="card-body">
            <form action="ApplyLeave" method="post">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label class="form-label">Leave Type</label>
                        <select class="form-select" name="type" required>
                            <option selected disabled>Select Leave Type</option>
                            <option value="CASUAL">Casual Leave</option>
                            <option value="SICK">Sick Leave</option>
                            <option value="PAID">Paid Leave</option>
                            <option value="UNPAID">Unpaid Leave</option>
                        </select>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">Start Date</label>
                        <input type="date" class="form-control" name="startDate" required>
                    </div>

                    <div class="col-md-3 mb-3">
                        <label class="form-label">End Date</label>
                        <input type="date" class="form-control" name="endDate" required>
                    </div>

                </div>

                <div class="mb-3">
                    <label class="form-label">Reason</label>
                    <textarea class="form-control" name="reason" rows="4" placeholder="Enter reason for leave..." required></textarea>
                </div>

                <button class="btn btn-primary">
                    <i class="bi bi-send"></i> Submit Request
                </button>

            </form>
        </div>
    </div>

    <div class="card shadow">
        <div class="card-header bg-dark text-white">
            <h4 class="mb-0">
                <i class="bi bi-list-check"></i> Leave Requests
            </h4>
        </div>

        <div class="card-body">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-primary">
                    <tr>
                        <th>Employee Name</th>
                        <th>Leave Type</th>
                        <th>Duration</th>
                        <th>Reason</th>
                        <th>Status</th>
                        <th width="180">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    if(leaves != null && !leaves.isEmpty()){
                        for(Leave leave : leaves){
                    %>
                    <tr>
                        <td><%= leave.getUser_name() %></td>
                        <td><%= leave.getType() %></td>
                        <td><%= leave.getStartDate() %> to <%= leave.getEndDate() %></td>
                        <td><%= leave.getReason() %></td>
                        <td>
                            <span class="badge bg-warning">
                                <%= leave.getStatus() %>
                            </span>
                        </td>
                        <td>
                            <a href="ApproveLeave?id=<%= leave.getId() %>" class="btn btn-success btn-sm">Approve</a>
                            <a href="RejectLeave?id=<%= leave.getId() %>" class="btn btn-danger btn-sm">Reject</a>
                        </td>
                    </tr>
                    <%
                        }
                    }else{
                    %>

                    <tr>
                        <td colspan="6" class="text-center text-muted">
                            No Leave Requests Found
                        </td>
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