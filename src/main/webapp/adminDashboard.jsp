<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Leave" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HRMS | Admin Dashboard</title>

    <!-- Bootstrap -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
            rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            rel="stylesheet">

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            background: #f5f7fb;
            font-family: Arial, sans-serif;
            color: #172033;
        }

        /* ================= NAVBAR ================= */

        .navbar {
            background: #0b1f3a !important;
            padding: 15px 0;
        }

        .navbar-brand {
            font-size: 24px;
            letter-spacing: 1px;
        }

        .navbar-brand i {
            margin-right: 8px;
        }

        .nav-link {
            color: #dce6f2 !important;
            margin-left: 20px;
            transition: 0.3s;
        }

        .nav-link:hover {
            color: white !important;
        }

        .signout {
            color: #ffb4b4 !important;
        }

        .signout:hover {
            color: #ff6b6b !important;
        }


        /* ================= MAIN ================= */

        .dashboard-container {
            max-width: 1250px;
            margin: 0 auto;
            padding: 55px 25px;
        }


        /* ================= WELCOME ================= */

        .welcome-section {
            margin-bottom: 35px;
        }

        .welcome-section h1 {
            font-size: 34px;
            font-weight: 700;
            color: #0b1f3a;
            margin-bottom: 8px;
        }

        .welcome-section p {
            color: #6c7685;
            font-size: 16px;
            margin-bottom: 0;
        }


        /* ================= DASHBOARD CARDS ================= */

        .dashboard-card {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 30px;
            height: 100%;
            text-decoration: none;
            color: #172033;

            display: block;

            transition: all 0.25s ease;
        }

        .dashboard-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(11, 31, 58, 0.10);
            color: #172033;
        }

        .card-icon {
            width: 55px;
            height: 55px;

            display: flex;
            align-items: center;
            justify-content: center;

            border-radius: 10px;

            background: #e9f0f8;
            color: #0b1f3a;

            font-size: 26px;

            margin-bottom: 20px;
        }

        .dashboard-card h4 {
            font-size: 21px;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .dashboard-card p {
            margin: 0;
            color: #727d8d;
            font-size: 15px;
        }


        /* ================= RECENT LEAVE ================= */

        .recent-section {
            margin-top: 45px;
        }

        .recent-header {
            display: flex;
            justify-content: space-between;
            align-items: center;

            margin-bottom: 18px;
        }

        .recent-header h3 {
            font-size: 24px;
            font-weight: 700;
            color: #0b1f3a;
            margin: 0;
        }

        .view-all {
            text-decoration: none;
            color: #0b1f3a;
            font-size: 14px;
            font-weight: 600;
        }

        .view-all:hover {
            text-decoration: underline;
        }


        /* ================= TABLE ================= */

        .leave-table-container {
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            overflow: hidden;
        }

        .leave-table {
            margin-bottom: 0;
        }

        .leave-table thead {
            background: #f8fafc;
        }

        .leave-table th {
            color: #4b5563;
            font-size: 14px;
            font-weight: 700;
            padding: 17px 20px;
            border-bottom: 1px solid #e5e7eb;
        }

        .leave-table td {
            padding: 17px 20px;
            color: #4b5563;
            vertical-align: middle;
            border-bottom: 1px solid #eef1f5;
            font-size: 14px;
        }

        .leave-table tbody tr:last-child td {
            border-bottom: none;
        }

        .leave-table tbody tr:hover {
            background: #fafcff;
        }


        /* ================= STATUS ================= */

        .status {
            display: inline-block;

            padding: 6px 13px;

            border-radius: 20px;

            font-size: 11px;
            font-weight: 700;

            letter-spacing: 0.4px;
        }

        .status-approved {
            background: #dcfce7;
            color: #15803d;
        }

        .status-pending {
            background: #fef3c7;
            color: #a16207;
        }

        .status-rejected {
            background: #fee2e2;
            color: #b91c1c;
        }


        /* ================= RESPONSIVE ================= */

        @media (max-width: 768px) {

            .dashboard-container {
                padding: 35px 18px;
            }

            .welcome-section h1 {
                font-size: 27px;
            }

            .recent-header {
                align-items: flex-start;
            }

            .leave-table-container {
                overflow-x: auto;
            }

            .leave-table {
                min-width: 700px;
            }
        }

    </style>

</head>


<body>


<!-- ================= NAVBAR ================= -->

<nav class="navbar navbar-expand-lg navbar-dark shadow-sm">

    <div class="container">

        <a class="navbar-brand fw-bold" href="adminDashboard.jsp">
            <i class="bi bi-people-fill"></i>
            HRMS
        </a>


        <button
                class="navbar-toggler"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navbarNav">

            <span class="navbar-toggler-icon"></span>

        </button>


        <div class="collapse navbar-collapse" id="navbarNav">

            <ul class="navbar-nav ms-auto">

                <li class="nav-item">
                    <a class="nav-link" href="adminDashboard">
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="leave">
                        Leave
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="documents">
                        Documents
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="employee">
                        Employees
                    </a>
                </li>

                <li class="nav-item">
                    <a class="nav-link signout" href="SignOut">
                        Sign Out
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>



<!-- ================= MAIN ================= -->

<div class="dashboard-container">


    <%
        String name = (String) session.getAttribute("name_key");

        if (name == null) {
            name = "Administrator";
        }
    %>


    <!-- ================= WELCOME ================= -->

    <div class="welcome-section">

        <h1>
            Welcome, <%= name %>
        </h1>

        <p>
            People Operations · ADMIN
        </p>

    </div>



    <!-- ================= THREE CARDS ================= -->

    <div class="row g-4">


        <!-- LEAVE -->

        <div class="col-lg-4 col-md-6">

            <a href="leave" class="dashboard-card">

                <div class="card-icon">

                    <i class="bi bi-calendar-check"></i>

                </div>

                <h4>
                    Leave
                </h4>

                <p>
                    Submit and track requests.
                </p>

            </a>

        </div>



        <!-- DOCUMENTS -->

        <div class="col-lg-4 col-md-6">

            <a href="Document.jsp" class="dashboard-card">

                <div class="card-icon">

                    <i class="bi bi-folder2-open"></i>

                </div>

                <h4>
                    Documents
                </h4>

                <p>
                    Upload secure personal files.
                </p>

            </a>

        </div>



        <!-- EMPLOYEES -->

        <div class="col-lg-4 col-md-6">

            <a href="employee" class="dashboard-card">

                <div class="card-icon">

                    <i class="bi bi-people"></i>

                </div>

                <h4>
                    Employees
                </h4>

                <p>
                    Manage employee accounts.
                </p>

            </a>

        </div>


    </div>



    <!-- ================= RECENT LEAVE REQUESTS ================= -->

    <div class="recent-section">


        <div class="recent-header">

            <h3>
                Recent Leave Requests
            </h3>

            <a href="leave" class="view-all">
                View All
            </a>

        </div>



        <div class="leave-table-container">

            <table class="table leave-table">

                <thead>

                <tr>

                    <th>
                        Employee
                    </th>

                    <th>
                        Type
                    </th>

                    <th>
                        Dates
                    </th>

                    <th>
                        Status
                    </th>

                </tr>

                </thead>

  <tbody>

  <%
      List<Leave> leaves =
              (List<Leave>) request.getAttribute("leaves");

      if (leaves != null && !leaves.isEmpty()) {

          for (Leave leave : leaves) {
  %>

  <tr>

      <td>
          <strong>
              <%= leave.getUser_name() %>
          </strong>
      </td>

      <td>
          <%= leave.getType() %>
      </td>

      <td>
          <%= leave.getStartDate() %>
          to
          <%= leave.getEndDate() %>
      </td>

      <td>

          <span class="status
              <%= "APPROVED".equalsIgnoreCase(leave.getStatus())
                      ? "status-approved"
                      : "REJECTED".equalsIgnoreCase(leave.getStatus())
                      ? "status-rejected"
                      : "status-pending" %>">

              <%= leave.getStatus() %>

          </span>

      </td>

  </tr>

  <%
          }

      } else {
  %>

  <tr>
      <td colspan="4" class="text-center text-muted py-4">
          No leave requests found.
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



<!-- Bootstrap JS -->

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js">
</script>


</body>

</html>