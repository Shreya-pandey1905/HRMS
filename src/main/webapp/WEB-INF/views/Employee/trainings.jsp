<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Trainers.Training" %>

<%
    List<Training> trainings =
            (List<Training>) request.getAttribute("trainings");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>My Training - HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <!-- HEADER -->

    <div class="header">

        <div class="main-header">

            <div class="header-left">

                <a href="${pageContext.request.contextPath}/employee/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>

                <a href="${pageContext.request.contextPath}/employee/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>

            </a>


            <div class="header-user">

                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <div class="input-group input-group-flat d-inline-flex me-1">

                            <span class="input-icon-addon">
                                <i class="ti ti-search"></i>
                            </span>

                            <input type="text"
                                   class="form-control"
                                   placeholder="Search in HRMS">

                            <span class="input-group-text">
                                <kbd>CTRL + /</kbd>
                            </span>

                        </div>


                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <div class="dropdown mobile-user-menu">

                <a href="javascript:void(0);"
                   class="nav-link dropdown-toggle"
                   data-bs-toggle="dropdown"
                   aria-expanded="false">

                    <i class="fa fa-ellipsis-v"></i>

                </a>


                <div class="dropdown-menu dropdown-menu-end">

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Profile

                    </a>

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Settings

                    </a>

                    <a class="dropdown-item"
                       href="javascript:void(0);">

                        Logout

                    </a>

                </div>

            </div>

        </div>

    </div>

    <!-- /HEADER -->


    <!-- SIDEBAR -->

    <div class="sidebar"
         id="sidebar">

        <div class="sidebar-logo">

            <a href="${pageContext.request.contextPath}/employee/dashboard"
               class="logo logo-normal">

                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/employee/dashboard"
               class="logo-small">

                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/employee/dashboard"
               class="dark-logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">

            </a>

        </div>


        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">

                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Profile"
                         class="img-fluid rounded-circle">

                </div>


                <h6 class="fs-12 fw-normal mb-1">
                    Employee
                </h6>


                <p class="fs-10 mb-0">
                    Employee
                </p>

            </div>

        </div>


        <!-- SIDEBAR MENU -->

        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>


                <!-- DASHBOARD -->

                <li>

                    <a href="${pageContext.request.contextPath}/employee/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Employee Dashboard</span>

                    </a>

                </li>


                <!-- EMPLOYEES -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-users"></i>

                        <span>Employees</span>

                    </a>

                </li>


                <!-- ATTENDANCE -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-time"></i>

                        <span>Attendance</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <li class="submenu">

                            <a href="javascript:void(0);">

                                <span>Leaves</span>

                                <span class="menu-arrow"></span>

                            </a>


                            <ul>

                                <li>

                                    <a href="javascript:void(0);">
                                        <span>Apply Leaves</span>
                                    </a>

                                </li>


                                <li>

                                    <a href="javascript:void(0);">
                                        <span>Leave Details</span>
                                    </a>

                                </li>


                                <li>

                                    <a href="javascript:void(0);">
                                        <span>Employee</span>
                                    </a>

                                </li>

                            </ul>

                        </li>


                        <li>

                            <a href="javascript:void(0);">

                                <span>Attendance (Employee)</span>

                            </a>

                        </li>


                        <li>

                            <a href="javascript:void(0);">

                                <span>Timesheet</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- PAYROLL -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-cash"></i>

                        <span>Payroll</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>

                        <li>

                            <a href="javascript:void(0);">

                                <span>Payslips</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- MY TRAINING -->

                <li class="active">

                    <a href="${pageContext.request.contextPath}/employee/trainings">

                        <i class="ti ti-school"></i>

                        <span>My Training</span>

                    </a>

                </li>


                <!-- CALENDAR -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-event"></i>

                        <span>Calendar</span>

                    </a>

                </li>


                <!-- PERFORMANCE -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-chart-line"></i>

                        <span>Performance</span>

                    </a>

                </li>


                <!-- DOCUMENTS -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-text"></i>

                        <span>Documents</span>

                    </a>


                    <ul>

                        <li>

                            <a href="javascript:void(0);">

                                <span>Company Slips</span>

                            </a>

                        </li>


                        <li>

                            <a href="javascript:void(0);">

                                <span>My Documents</span>

                            </a>

                        </li>


                        <li>

                            <a href="javascript:void(0);">

                                <span>Upload Documents</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- HELP -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-headset"></i>

                        <span>Help &amp; Support</span>

                    </a>

                </li>


                <!-- TICKETS -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

                </li>


                <!-- LOGOUT -->

                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>

            </ul>

        </div>

    </div>

    <!-- /SIDEBAR -->


    <!-- PAGE WRAPPER -->

    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="d-md-flex d-block align-items-center
                        justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">
                        My Training
                    </h2>


                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/employee/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>


                            <li class="breadcrumb-item">
                                Training
                            </li>


                            <li class="breadcrumb-item active">
                                My Training
                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- TRAINING LIST -->

            <div class="card">

                <div class="card-header">

                    <h5 class="mb-0">
                        My Training List
                    </h5>

                </div>


                <div class="card-body p-0">

                    <div class="custom-datatable-filter table-responsive">

                        <table id="employeeTrainingsTable"
                               class="table table-nowrap datatable">

                            <thead class="thead-light">

                            <tr>

                                <th>Training ID</th>

                                <th>Trainer Name</th>

                                <th>Training Type</th>

                                <th>Training Cost</th>

                                <th>Description</th>

                                <th>Status</th>

                                <th>Start Date</th>

                                <th>End Date</th>

                            </tr>

                            </thead>


                            <tbody>

                            <%
                                if (trainings != null &&
                                        !trainings.isEmpty()) {

                                    for (Training training : trainings) {

                                        String trainerName =
                                                ((training.getTrainerFirstName() == null)
                                                        ? ""
                                                        : training.getTrainerFirstName())
                                                        + " "
                                                        + ((training.getTrainerLastName() == null)
                                                        ? ""
                                                        : training.getTrainerLastName());

                                        String status =
                                                training.getStatus() == null
                                                        ? ""
                                                        : training.getStatus();
                            %>

                            <tr>

                                <td>
                                    <%= training.getTrainingId() %>
                                </td>


                                <td>
                                    <%= trainerName.trim() %>
                                </td>


                                <td>
                                    <%= training.getTrainingTypeName() == null
                                            ? ""
                                            : training.getTrainingTypeName() %>
                                </td>


                                <td>
                                    <%= training.getTrainingCost() %>
                                </td>


                                <td>

                                    <span class="text-truncate d-inline-block"
                                          style="max-width:250px;">

                                        <%= training.getDescription() == null
                                                ? ""
                                                : training.getDescription() %>

                                    </span>

                                </td>


                                <td>

                                    <% if ("Active".equalsIgnoreCase(status)) { %>

                                    <span class="badge badge-success
                                                     d-inline-flex
                                                     align-items-center">

                                            <i class="ti ti-point-filled me-1"></i>

                                            Active

                                        </span>

                                    <% } else { %>

                                    <span class="badge badge-danger
                                                     d-inline-flex
                                                     align-items-center">

                                            <i class="ti ti-point-filled me-1"></i>

                                            <%= status %>

                                        </span>

                                    <% } %>

                                </td>


                                <td>

                                    <%= training.getStartDate() == null
                                            ? ""
                                            : training.getStartDate() %>

                                </td>


                                <td>

                                    <%= training.getEndDate() == null
                                            ? ""
                                            : training.getEndDate() %>

                                </td>

                            </tr>

                            <%
                                }

                            } else {
                            %>

                            <tr>

                                <td colspan="8"
                                    class="text-center">

                                    No training assigned to you.

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

        </div>

    </div>

</div>


<!-- SCRIPTS -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- DataTables -->

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>


<script>

    $('#employeeTrainingsTable').DataTable({

        "pageLength": 5,

        "ordering": true,

        "searching": true,

        "lengthChange": true

    });

</script>

</body>

</html>