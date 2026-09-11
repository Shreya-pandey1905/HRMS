<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ include file="../common/personal-dashboard-data.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Manager Dashboard">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Manager Dashboard">

    <meta name="author" content="HRMS Team">

    <meta name="robots" content="noindex, nofollow">

    <title>HRMS Manager Dashboard</title>


    <!-- Favicon -->
    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- CSS -->
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

<!-- Global Loader -->
<div id="global-loader">

    <div class="page-loader"></div>

</div>


<!-- Main Wrapper -->
<div class="main-wrapper">


    <!-- ========================================================= -->
    <!-- HEADER -->
    <!-- ========================================================= -->

    <div class="header">

        <div class="main-header">


            <!-- Header Logo -->
            <div class="header-left">

                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>


                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <!-- Mobile Button -->
            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">

                    <span></span>
                    <span></span>
                    <span></span>

                </span>

            </a>


            <!-- Header User -->
            <div class="header-user">

                <div class="nav user-menu nav-list">


                    <div class="me-auto d-flex align-items-center"
                         id="header-search">


                        <!-- Sidebar Toggle -->
                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <!-- Search -->
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


                        <!-- Settings -->
                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- Mobile User Menu -->
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


    <!-- ========================================================= -->
    <!-- SIDEBAR -->
    <!-- ========================================================= -->

    <div class="sidebar"
         id="sidebar">


        <!-- Sidebar Logo -->
        <div class="sidebar-logo">


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="logo logo-normal">

                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="logo-small">

                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">

            </a>


            <a href="${pageContext.request.contextPath}/manager/dashboard"
               class="dark-logo">

                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">

            </a>

        </div>


        <!-- Manager Profile -->
        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">


                <div class="avatar avatar-lg online mb-3">

                    <c:choose>
                        <c:when test="${not empty profileImgUrl}">
                            <img src="${profileImgUrl}"
                                 alt="Manager Profile"
                                 class="img-fluid rounded-circle"
                                 style="width:100%;height:100%;object-fit:cover;"
                                 onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                 alt="Manager Profile"
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


        <!-- ========================================================= -->
        <!-- SIDEBAR MENU -->
        <!-- ========================================================= -->

        <div class="sidebar-menu">

            <ul>


                <!-- MENU TITLE -->
                <li class="menu-title">

                    <span>MAIN MENU</span>

                </li>


                <!-- ================================================= -->
                <!-- DASHBOARD -->
                <!-- ================================================= -->

                <li class="active">
                    <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=dashboard">
                        <i class="ti ti-smart-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>


                <!-- ================================================= -->
                <!-- PROJECTS -->
                <!-- ================================================= -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-briefcase"></i>

                        <span>Projects</span>

                        <span class="menu-arrow ms-2"></span>

                    </a>

                    <ul>

                        <li class="active">

                            <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=projectDetails">

                                <span>Project</span>

                            </a>

                        </li>

                        <li>

                           <li>
                               <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=taskDetails">
                                   <span>Tasks</span>
                               </a>
                           </li>

                        </li>

                        <li>

                            <a href="javascript:void(0);">

                                <span>Task Board</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- LEAVE -->
                <!-- ================================================= -->

                <li class="submenu">

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-off"></i>

                        <span>Leave</span>

                        <span class="menu-arrow"></span>

                    </a>


                    <ul>


                        <!-- Leaves -->
                        <li class="submenu">

                            <a href="javascript:void(0);">

                                <span>Leaves</span>

                                <span class="menu-arrow"></span>

                            </a>


                            <ul>


                                <!-- Leave Approval -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Leave Approval</span>

                                    </a>

                                </li>


                                <!-- Timesheet Approval -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Timesheet Approval</span>

                                    </a>

                                </li>


                                <!-- Leave Allocation -->
                                <li>

                                    <a href="javascript:void(0);">

                                        <span>Leave Allocation</span>

                                    </a>

                                </li>


                            </ul>

                        </li>


                    </ul>

                </li>


                <!-- ================================================= -->
                <!-- TICKETS -->
                <!-- ================================================= -->

                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

                </li>


                <!-- ================================================= -->
                <!-- LOGOUT -->
                <!-- ================================================= -->

                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>


            </ul>

        </div>

    </div>


    <!-- ========================================================= -->
    <!-- PAGE WRAPPER -->
    <!-- ========================================================= -->

    <div class="page-wrapper">

        <div class="content">
            <%
                request.setAttribute("dashTitle", "Employee Dashboard");
                request.setAttribute("homeUrl", request.getContextPath() + "/ManagerDashboardServlet?action=dashboard");
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


<!-- ========================================================= -->
<!-- JAVASCRIPT -->
<!-- ========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>
