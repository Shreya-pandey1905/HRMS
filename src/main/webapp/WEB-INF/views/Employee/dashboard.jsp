<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/personal-dashboard-data.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Dashboard">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Dashboard">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Dashboard</title>


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
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>


<body>

<div id="global-loader">

    <div class="page-loader"></div>

</div>


<div class="main-wrapper">


    <!-- ================= HEADER ================= -->

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


    <!-- ================= SIDEBAR ================= -->

    <div class="sidebar" id="sidebar">


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

                    <c:choose>
                        <c:when test="${not empty profileImgUrl}">
                            <img src="${profileImgUrl}"
                                 alt="Profile"
                                 class="img-fluid rounded-circle"
                                 style="width:100%;height:100%;object-fit:cover;"
                                 onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                 alt="Profile"
                                 class="img-fluid rounded-circle">
                        </c:otherwise>
                    </c:choose>

                </div>


                <h6 class="fs-12 fw-normal mb-1">
                    ${sidebarDisplayName}
                </h6>


                <p class="fs-10 mb-0">
                    ${sidebarRoleLabel}
                </p>

            </div>

        </div>


        <!-- ================= SIDEBAR MENU ================= -->

        <div class="sidebar-menu">

            <ul>


                <li class="menu-title">

                    <span>MAIN MENU</span>

                </li>


                <!-- DASHBOARD -->

                <li class="active">

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

                <li>

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


                <!-- ================= DOCUMENTS ================= -->
                <!-- ================= DOCUMENTS ================= -->

                <li class="submenu active">

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-text"></i>

                        <span>Documents</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <!-- COMPANY LETTERS -->

                        <li>

                            <a href="${pageContext.request.contextPath}/company-letters">

                                <span>Company Letters</span>

                            </a>

                        </li>


                        <!-- MY DOCUMENTS -->

                        <li>

                            <a href="${pageContext.request.contextPath}/file-uploads?action=list">

                                <span>My Documents</span>

                            </a>

                        </li>


                        <!-- UPLOAD DOCUMENTS -->

                        <li>

                            <a href="${pageContext.request.contextPath}/file-uploads">

                                <span>Upload Documents</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- HELP & SUPPORT -->

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


    <!-- ================= PAGE WRAPPER ================= -->

    <div class="page-wrapper">

        <div class="content">
            <%
                request.setAttribute("dashTitle", "Employee Dashboard");
                request.setAttribute("homeUrl", request.getContextPath() + "/employee/dashboard");
            %>
            <%@ include file="../common/personal-dashboard-content.jsp" %>
        </div>

        <!-- FOOTER -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                HRMS
            </p>


            <p class="mb-0">
                Human Resource Management System
            </p>

        </div>

    </div>

</div>


<!-- SCRIPTS -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>