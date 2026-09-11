```
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Admin Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Admin Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">

    <title>HRMS Admin Dashboard</title>

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


          <style>
              .sidebar {
                  height: 100vh !important;
                  overflow-y: auto !important;
                  overflow-x: hidden !important;
              }

              .sidebar-menu {
                  height: auto !important;
                  overflow: visible !important;
              }

              .sidebar::-webkit-scrollbar {
                  width: 5px;
              }

              .sidebar::-webkit-scrollbar-thumb {
                  background: #ccc;
                  border-radius: 10px;
              }
          </style>

    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<c:set var="totalEmployees" value="0"/>
<c:set var="presentToday" value="0"/>
<c:set var="onLeave" value="0"/>
<c:set var="pendingLeaves" value="0"/>

<div id="global-loader">
    <div class="page-loader"></div>
</div>

<div class="main-wrapper">

    <!-- HEADER -->
    <div class="header">
        <div class="main-header">

            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
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

    <!-- SIDEBAR -->
    <div class="sidebar" id="sidebar">

        <div class="sidebar-logo">

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo logo-normal">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo-small">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="dark-logo">
                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">
            </a>

        </div>

        <!-- ADMIN PROFILE -->
        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">
                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Admin Profile"
                         class="img-fluid rounded-circle">
                </div>

                <h6 class="fs-12 fw-normal mb-1">
                    Admin
                </h6>

                <p class="fs-10 mb-0">
                    Administrator
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
                <li class="active">
                    <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard">
                                            <i class="ti ti-smart-home"></i>
                                            <span>Dashboard</span>
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
                        <i class="ti ti-calendar-check"></i>
                        <span>Attendance</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Leaves</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Attendance (Admin)</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Timesheet</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- EVENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-calendar-event"></i>
                        <span>Events</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Master Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Event List</span>
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
                                <span>Add Employee Salary</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Payroll</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Employee Salary List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Payslips Monthly</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Transaction History</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- TRAINING -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-school"></i>
                        <span>Training</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Trainer List</span>
                            </a>
                        </li>

                        <li class="submenu">

                            <a href="javascript:void(0);">
                                <span>Trainers</span>
                                <span class="menu-arrow"></span>
                            </a>

                            <ul>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Trainer Type</span>
                                    </a>
                                </li>

                            </ul>

                        </li>

                    </ul>

                </li>

                <!-- DOCUMENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-file-description"></i>
                        <span>Documents</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li class="submenu">

                            <a href="javascript:void(0);">
                                <span>Upload Documents</span>
                                <span class="menu-arrow"></span>
                            </a>

                            <ul>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Upload Document</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Document List</span>
                                    </a>
                                </li>

                            </ul>

                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Letter</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- MASTER DOCUMENT -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-files"></i>
                        <span>Master Document</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PERFORMANCE & GOAL -->
                <li>

                    <a href="javascript:void(0);">
                        <i class="ti ti-chart-line"></i>
                        <span>Performance &amp; Goal</span>
                    </a>

                </li>

                <!-- PROJECTS -->
                <li class="submenu active">

                    <a href="javascript:void(0);">
                        <i class="ti ti-briefcase"></i>
                        <span>Projects</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                           <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails">
                               <span>Project</span>
                           </a>
                        </li>

                        <li class="active">
                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails">
                                <span>Tasks</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Board</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- REPORTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-report-analytics"></i>
                        <span>Reports</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Employee Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Attendance Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Leave Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Payslip Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Daily Report</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PROMOTIONS -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-trending-up"></i>
                        <span>Promotions</span>
                    </a>
                </li>

                <!-- RESIGNATION -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-logout-2"></i>
                        <span>Resignation</span>
                    </a>
                </li>

                <!-- TERMINATION -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-user-x"></i>
                        <span>Termination</span>
                    </a>
                </li>

                <!-- HELP & SUPPORT -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-headset"></i>
                        <span>Help &amp; Supports</span>
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


<!-- Page Wrapper -->
        <div class="page-wrapper">
            <div class="content">
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <i class="ti ti-check me-2"></i>
                    ${sessionScope.successMessage}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert"
                            aria-label="Close">
                    </button>

                </div>

                <c:remove var="successMessage" scope="session"/>
            </c:if>

                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                    <div class="my-auto mb-2">
                        <h2 class="mb-1">Tasks</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"><i class="ti ti-smart-home"></i></a></li>
                                <li class="breadcrumb-item">Admin</li>
                                <li class="breadcrumb-item active" aria-current="page">Tasks</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="my-xl-auto right-content d-flex align-items-center">
                        <div class="mb-2">
                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=addTask"
                               class="btn btn-primary d-flex align-items-center">
                                <i class="ti ti-circle-plus me-2"></i>Add Task
                            </a>
                        </div>
                        <div class="head-icons ms-2 mb-0">
                            <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header"><i class="ti ti-chevrons-up"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Priority / Date -->
                <div class="row align-items-center mb-3">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center flex-wrap row-gap-3">
                            <h6 class="me-2 mb-0">Priority</h6>

                            <ul class="nav nav-pills border d-inline-flex p-1 rounded bg-light todo-tabs">
                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'All' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails&priority=All">
                                        All
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'High' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails&priority=High">
                                        High
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'Medium' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails&priority=Medium">
                                        Medium
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'Low' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails&priority=Low">
                                        Low
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="d-flex align-items-center justify-content-lg-end">
                            <div class="input-icon w-120 position-relative">
                                <span class="input-icon-addon">
                                    <i class="ti ti-calendar"></i>
                                </span>
                                <input type="text"
                                       class="form-control datetimepicker"
                                       placeholder="mm/dd/yyyy">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- LEFT SIDE: PROJECTS -->
                    <div class="col-xl-4">

                        <c:choose>

                            <c:when test="${not empty taskProjects}">

                                <c:forEach var="project" items="${taskProjects}">

                                    <c:set var="projectTaskCount" value="0"/>
                                    <c:set var="completedTaskCount" value="0"/>

                                    <c:forEach var="task" items="${tasks}">
                                        <c:if test="${task.projectId == project.projectId}">
                                            <c:set var="projectTaskCount"
                                                   value="${projectTaskCount + 1}"/>

                                            <c:if test="${task.status == 'Completed'}">
                                                <c:set var="completedTaskCount"
                                                       value="${completedTaskCount + 1}"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                    <div class="card">
                                        <div class="card-body">

                                            <div class="d-flex align-items-center pb-3 mb-3 border-bottom">

                                                <a href="javascript:void(0);"
                                                   class="flex-shrink-0 me-2">
                                                    <img src="${pageContext.request.contextPath}/assets/img/social/project-01.svg"
                                                         alt="Project">
                                                </a>

                                                <div>
                                                    <h6 class="mb-1">
                                                        ${project.projectName}
                                                    </h6>

                                                    <div class="d-flex align-items-center">
                                                        <span>
                                                            ${projectTaskCount} tasks
                                                        </span>

                                                        <span class="mx-1">
                                                            <i class="ti ti-point-filled text-primary"></i>
                                                        </span>

                                                        <span>
                                                            ${completedTaskCount} Completed
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <span class="mb-1 d-block">Deadline</span>

                                                        <p class="text-dark mb-0">
                                                            <c:choose>
                                                                <c:when test="${not empty project.endDate}">
                                                                    ${project.endDate.toLocalDate()}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <span class="mb-1 d-block">Value</span>

                                                        <p class="text-dark mb-0">
                                                            ${project.projectValue}
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="bg-light p-2">
                                                <div class="row align-items-center">

                                                    <div class="col-6">
                                                        <span class="fw-medium d-flex align-items-center">
                                                            <i class="ti ti-clock text-primary me-2"></i>
                                                            Project
                                                        </span>
                                                    </div>

                                                    <div class="col-6">

                                                        <c:set var="completionPercent" value="0"/>

                                                        <c:if test="${projectTaskCount > 0}">
                                                            <c:set var="completionPercent"
                                                                   value="${(completedTaskCount * 100) / projectTaskCount}"/>
                                                        </c:if>

                                                        <small class="text-dark">
                                                            ${completionPercent}% Completed
                                                        </small>

                                                        <div class="progress progress-xs mt-1">
                                                            <div class="progress-bar"
                                                                 role="progressbar"
                                                                 style="width:${completionPercent}%">
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <div class="card">
                                    <div class="card-body text-center py-5">
                                        <i class="ti ti-clipboard-off fs-36 text-muted mb-3"></i>
                                        <h6>No Projects</h6>
                                        <p class="text-muted mb-0">
                                            No projects have tasks for the selected priority.
                                        </p>
                                    </div>
                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>


                    <!-- RIGHT SIDE: TASKS -->
                    <div class="col-xl-8">

                        <c:choose>

                            <c:when test="${not empty tasks}">

                                <c:forEach var="project" items="${taskProjects}">

                                    <c:set var="projectTaskCount" value="0"/>
                                    <c:set var="completedTaskCount" value="0"/>

                                    <c:forEach var="task" items="${tasks}">
                                        <c:if test="${task.projectId == project.projectId}">
                                            <c:set var="projectTaskCount"
                                                   value="${projectTaskCount + 1}"/>

                                            <c:if test="${task.status == 'Completed'}">
                                                <c:set var="completedTaskCount"
                                                       value="${completedTaskCount + 1}"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${projectTaskCount > 0}">

                                        <div class="card">
                                            <div class="card-body">

                                                <h5 class="mb-3">
                                                    ${project.projectName}
                                                </h5>

                                                <div class="bg-light p-3 rounded">

                                                    <span class="d-block mb-1">
                                                        Tasks Done
                                                    </span>

                                                    <h4 class="mb-2">
                                                        ${completedTaskCount} / ${projectTaskCount}
                                                    </h4>

                                                    <c:set var="completionPercent" value="0"/>

                                                    <c:if test="${projectTaskCount > 0}">
                                                        <c:set var="completionPercent"
                                                               value="${(completedTaskCount * 100) / projectTaskCount}"/>
                                                    </c:if>

                                                    <div class="progress progress-xs mb-2">
                                                        <div class="progress-bar"
                                                             role="progressbar"
                                                             style="width:${completionPercent}%">
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        ${completionPercent}% Completed
                                                    </p>

                                                </div>

                                            </div>
                                        </div>


                                        <c:forEach var="task" items="${tasks}">

                                            <c:if test="${task.projectId == project.projectId}">

                                                <div class="card">
                                                    <div class="card-body">

                                                        <div class="d-flex align-items-center justify-content-between">

                                                            <div class="d-flex align-items-center">

                                                                <i class="ti ti-grid-dots me-2"></i>

                                                                <c:choose>
                                                                    <c:when test="${task.priority == 'High'}">
                                                                        <i class="ti ti-star-filled text-danger me-2"></i>
                                                                    </c:when>

                                                                    <c:when test="${task.priority == 'Medium'}">
                                                                        <i class="ti ti-star-filled text-warning me-2"></i>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <i class="ti ti-star text-muted me-2"></i>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <h6 class="mb-0">
                                                                    ${task.title}
                                                                </h6>

                                                            </div>

                                                            <div class="d-flex align-items-center">

                                                                <c:if test="${not empty task.deadline}">
                                                                    <span class="badge bg-transparent-dark text-dark rounded-pill me-2">
                                                                        <i class="ti ti-calendar me-1"></i>
                                                                        ${task.deadline.toLocalDate()}
                                                                    </span>
                                                                </c:if>

                                                                <span class="badge badge-skyblue">
                                                                    ${task.status}
                                                                </span>

                                                            </div>

                                                        </div>

                                                        <c:if test="${not empty task.description}">
                                                            <p class="text-muted mt-3 mb-0">
                                                                ${task.description}
                                                            </p>
                                                        </c:if>

                                                        <div class="d-flex align-items-center mt-3 mb-2">
                                                            <i class="ti ti-user me-2"></i>
                                                            <span>${task.employeeName}</span>
                                                        </div>

                                                    </div>
                                                </div>

                                            </c:if>

                                        </c:forEach>

                                    </c:if>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <div class="card">
                                    <div class="card-body text-center py-5">

                                        <i class="ti ti-clipboard-off fs-36 text-muted mb-3"></i>

                                        <h5>No Tasks Found</h5>

                                        <p class="text-muted mb-0">
                                            There are no tasks for the selected priority.
                                        </p>

                                    </div>
                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>
            </div>

            <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
                <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
                <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
            </div>
        </div>
        <!-- /Page Wrapper -->

        <!-- Add Task -->
        <div class="modal fade" id="add_task">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Add New Task  </h4>
                        <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>
                    </div>
                    <form action="${pageContext.request.contextPath}/AdminDashboardServlet"
                          method="post">
                           <input type="hidden" name="action" value="addTask">

                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label class="form-label">Title</label>
                                        <input type="text"
                                               class="form-control"
                                               name="title"
                                               required>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Due Date</label>
                                        <div class="input-icon-end position-relative">
                                            <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy">
                                            <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Project</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option>Office Management</option>
                                            <option>Clinic Management </option>
                                            <option>Educational Platform</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label me-2">Team Members</label>
                                        <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput" name="Label" value="Jerald,Andrew,Philip,Davis">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tag</label>
                                        <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab,Rated">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option>Inprogress</option>
                                            <option>Completed</option>
                                            <option>Pending</option>
                                            <option>Onhold</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Priority</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option>Medium</option>
                                            <option>High</option>
                                            <option>Low</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Who Can See this Task?</label>
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="form-check me-3">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
                                            <label class="form-check-label text-dark" for="flexRadioDefault1">
                                                Public
                                            </label>
                                        </div>
                                        <div class="form-check me-3">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked="">
                                            <label class="form-check-label text-dark" for="flexRadioDefault2">
                                                Private
                                            </label>
                                        </div>
                                        <div class="form-check ">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault3" checked="">
                                            <label class="form-check-label text-dark" for="flexRadioDefault3">
                                                Admin Only
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Descriptions</label>
                                        <div class="summernote"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Upload Attachment</label>
                                    <div class="bg-light rounded p-2">
                                        <div class="profile-uploader border-bottom mb-2 pb-2">
                                            <div class="drag-upload-btn btn btn-sm btn-white border px-3">
                                                Select File
                                                <input type="file" class="form-control image-sign" multiple="">
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between border-bottom mb-2 pb-2">
                                            <div class="d-flex align-items-center">
                                                <h6 class="fs-12 fw-medium me-1">Logo.zip</h6>
                                                <span class="badge badge-soft-info">21MB </span>
                                            </div>
                                            <a href="#" class="btn btn-sm btn-icon"><i class="ti ti-trash"></i></a>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h6 class="fs-12 fw-medium me-1">Files.zip</h6>
                                                <span class="badge badge-soft-info">25MB </span>
                                            </div>
                                            <a href="#" class="btn btn-sm btn-icon"><i class="ti ti-trash"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Add New Task</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /Add Task -->

        <!-- Edit Task -->
        <div class="modal fade" id="edit_task">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Task  </h4>
                        <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>
                    </div>
                    <form action="tasks.html">
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-12">
                                    <div class="mb-3">
                                        <label class="form-label">Title</label>
                                        <input type="text" class="form-control" value="Patient appointment booking">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Due Date</label>
                                        <div class="input-icon-end position-relative">
                                            <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy">
                                            <span class="input-icon-addon">
                                     <i class="ti ti-calendar text-gray-7"></i>
                                  </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Project</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option selected>Office Management</option>
                                            <option>Clinic Management </option>
                                            <option>Educational Platform</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label me-2">Team Members</label>
                                        <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput" name="Label" value="Jerald,Andrew,Philip,Davis">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Tag</label>
                                        <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option selected>Inprogress</option>
                                            <option>Completed</option>
                                            <option>Pending</option>
                                            <option>Onhold</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="mb-3">
                                        <label class="form-label">Priority</label>
                                        <select class="select">
                                            <option>Select</option>
                                            <option selected>Medium</option>
                                            <option>High</option>
                                            <option>Low</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Who Can See this Task?</label>
                                    <div class="d-flex align-items-center mb-3">
                                        <div class="form-check me-3">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault4">
                                            <label class="form-check-label text-dark" for="flexRadioDefault4">
                                                Public
                                            </label>
                                        </div>
                                        <div class="form-check me-3">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault5" checked="">
                                            <label class="form-check-label text-dark" for="flexRadioDefault5">
                                                Private
                                            </label>
                                        </div>
                                        <div class="form-check ">
                                            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault6">
                                            <label class="form-check-label text-dark" for="flexRadioDefault6">
                                                Admin Only
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="mb-3">
                                        <label class="form-label">Descriptions</label>
                                        <div class="summernote"></div>
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <label class="form-label">Upload Attachment</label>
                                    <div class="bg-light rounded p-2">
                                        <div class="profile-uploader border-bottom mb-2 pb-2">
                                            <div class="drag-upload-btn btn btn-sm btn-white border px-3">
                                                Select File
                                                <input type="file" class="form-control image-sign" multiple="">
                                            </div>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between border-bottom mb-2 pb-2">
                                            <div class="d-flex align-items-center">
                                                <h6 class="fs-12 fw-medium me-1">Logo.zip</h6>
                                                <span class="badge badge-soft-info">21MB </span>
                                            </div>
                                            <a href="#" class="btn btn-sm btn-icon"><i class="ti ti-trash"></i></a>
                                        </div>
                                        <div class="d-flex align-items-center justify-content-between">
                                            <div class="d-flex align-items-center">
                                                <h6 class="fs-12 fw-medium me-1">Files.zip</h6>
                                                <span class="badge badge-soft-info">25MB </span>
                                            </div>
                                            <a href="#" class="btn btn-sm btn-icon"><i class="ti ti-trash"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- /Edit Task -->

        <!-- Todo Details -->
        <div class="modal fade" id="view_todo">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-dark">
                        <h4 class="modal-title text-white">Respond to any pending messages</h4>
                        <span class="badge badge-danger d-inline-flex align-items-center"><i class="ti ti-square me-1"></i>Urgent</span>
                        <span><i class="ti ti-star-filled text-warning"></i></span>
                        <a href="#"><i class="ti ti-trash text-white"></i></a>
                        <button type="button" class="btn-close custom-btn-close bg-transparent fs-16 text-white position-static" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>
                    </div>
                    <div class="modal-body">
                        <h5 class="mb-2">Task Details</h5>
                        <div class="border rounded mb-3 p-2">
                            <div class="row row-gap-3">
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <span class="d-block mb-1">Created On</span>
                                        <p class="text-dark">22 July 2025</p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <span class="d-block mb-1">Due Date</span>
                                        <p class="text-dark">22 July 2025</p>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="text-center">
                                        <span class="d-block mb-1">Status</span>
                                        <span class="badge badge-soft-success d-inline-flex align-items-center">
                                  <i class="fas fa-circle fs-6 me-1"></i>Completed
                               </span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3">
                            <h5 class="mb-2">Description</h5>
                            <p>Hiking is a long, vigorous walk, usually on trails or footpaths in the countryside. Walking for pleasure developed in Europe during the eighteenth century. Religious pilgrimages have existed much longer but they involve walking
                                long distances for a spiritual purpose associated with specific religions and also we achieve inner peace while we hike at a local park.
                            </p>
                        </div>
                        <div class="mb-3">
                            <h5 class="mb-2">Tags</h5>
                            <div class="d-flex align-items-center">
                                <span class="badge badge-danger me-2">Internal</span>
                                <span class="badge badge-success me-2">Projects</span>
                                <span class="badge badge-secondary">Reminder</span>
                            </div>
                        </div>
                        <div>
                            <h5 class="mb-2">Assignee</h5>
                            <div class="avatar-list-stacked avatar-group-sm">
                                <span class="avatar avatar-rounded">
                            <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-23.jpg" alt="img">
                         </span>
                                <span class="avatar avatar-rounded">
                            <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-24.jpg" alt="img">
                         </span>
                                <span class="avatar avatar-rounded">
                            <img class="border border-white" src="${pageContext.request.contextPath}/assets/img/profiles/avatar-25.jpg" alt="img">
                         </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Todo Details -->

        <!-- Delete Modal -->
        <div class="modal fade" id="delete_modal">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body text-center">
                        <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
                      <i class="ti ti-trash-x fs-36"></i>
                   </span>
                        <h4 class="mb-1">Confirm Delete</h4>
                        <p class="mb-3">You want to delete all the marked items, this cant be undone once you delete.</p>
                        <div class="d-flex justify-content-center">
                            <a href="javascript:void(0);" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</a>
                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails" class="btn btn-danger">Yes, Delete</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /Delete Modal -->


    </div>
    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Daterangepikcer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Select2 JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

    <!-- Summernote JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>

    <!-- Bootstrap Tagsinput JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/assets/js/todo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>



</body>
</html>

```