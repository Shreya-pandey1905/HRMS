
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Smarthr Admin Template</title>
<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

<!-- Apple Touch Icon -->
<link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

<!-- Feather CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

<!-- Tabler Icon CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

<!-- Datetimepicker CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

<!-- Color Picker CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">

<!-- Daterangepicker CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

<!-- Main CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

	<div id="global-loader" style="display: none;">
		<div class="page-loader"></div>
	</div>

	<!-- Main Wrapper -->
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
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="ti ti-smart-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

            <!-- EMPLOYEES -->
                      <li class="submenu">
                          <a href="javascript:void(0);">
                              <i class="ti ti-users"></i>
                              <span>Employees</span>
                              <span class="menu-arrow"></span>
                          </a>
                          <ul>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/departments">
                                      Add Department
                                  </a>
                              </li>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/roles">
                                      Add Role
                                  </a>
                              </li>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/designations">
                                      Add Designation
                                  </a>
                              </li>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/employees">
                                      Employee List
                                  </a>
                              </li>
                              <li>
                               <a href="${pageContext.request.contextPath}/admin/employees?action=grid">
                                   Employee Grid
                               </a>
                              </li>
                              <li>
                                  <a href="${pageContext.request.contextPath}/admin/employees/details">
                                      Employee Details
                                  </a>
                              </li>
                          </ul>
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
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-briefcase"></i>
                        <span>Projects</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Project</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
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

        <!-- Breadcrumb -->
        <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
            <div class="my-auto mb-2">
                <h2 class="mb-1">Employee</h2>
                <nav>
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/admin">
                                <i class="ti ti-smart-home"></i>
                            </a>
                        </li>
                        <li class="breadcrumb-item">Employee</li>
                        <li class="breadcrumb-item active" aria-current="page">Employee List</li>
                    </ol>
                </nav>
            </div>

            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                <div class="me-2 mb-2">
                    <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
                        <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                           class="btn btn-icon btn-sm active bg-primary text-white me-1">
                            <i class="ti ti-list-tree"></i>
                        </a>
                        <a href="#" class="btn btn-icon btn-sm">
                            <i class="ti ti-layout-grid"></i>
                        </a>
                    </div>
                </div>

                <div class="me-2 mb-2">
                    <div class="dropdown">
                        <a href="javascript:void(0);"
                           class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                           data-bs-toggle="dropdown">
                            <i class="ti ti-file-export me-1"></i>Export
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3">
                            <li>
                                <a href="#" class="dropdown-item rounded-1">
                                    <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                                </a>
                            </li>
                            <li>
                                <a href="#" class="dropdown-item rounded-1">
                                    <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="mb-2">
                    <a href="${pageContext.request.contextPath}/admin/employees?action=add"
                       class="btn btn-primary d-flex align-items-center">
                        <i class="ti ti-circle-plus me-2"></i>Add Employee
                    </a>
                </div>

                <div class="head-icons ms-2">
                    <a href="javascript:void(0);" id="collapse-header">
                        <i class="ti ti-chevrons-up"></i>
                    </a>
                </div>

            </div>
        </div>
        <!-- /Breadcrumb -->

        <!-- Employee Statistics -->
        <c:set var="totalEmployees" value="0"/>
        <c:set var="activeEmployees" value="0"/>
        <c:set var="inactiveEmployees" value="0"/>

        <c:forEach var="employee" items="${employees}">
            <c:set var="totalEmployees" value="${totalEmployees + 1}"/>

            <c:if test="${employee.status == 'Active'}">
                <c:set var="activeEmployees" value="${activeEmployees + 1}"/>
            </c:if>

            <c:if test="${employee.status == 'Inactive'}">
                <c:set var="inactiveEmployees" value="${inactiveEmployees + 1}"/>
            </c:if>
        </c:forEach>

        <div class="row">

            <!-- Total -->
            <div class="col-lg-3 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-body d-flex align-items-center">
                        <div>
                            <span class="avatar avatar-lg bg-dark rounded-circle">
                                <i class="ti ti-users"></i>
                            </span>
                        </div>
                        <div class="ms-2">
                            <p class="fs-12 fw-medium mb-1">Total Employee</p>
                            <h4>${totalEmployees}</h4>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Active -->
            <div class="col-lg-3 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-body d-flex align-items-center">
                        <div>
                            <span class="avatar avatar-lg bg-success rounded-circle">
                                <i class="ti ti-user-share"></i>
                            </span>
                        </div>
                        <div class="ms-2">
                            <p class="fs-12 fw-medium mb-1">Active</p>
                            <h4>${activeEmployees}</h4>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Inactive -->
            <div class="col-lg-3 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-body d-flex align-items-center">
                        <div>
                            <span class="avatar avatar-lg bg-danger rounded-circle">
                                <i class="ti ti-user-pause"></i>
                            </span>
                        </div>
                        <div class="ms-2">
                            <p class="fs-12 fw-medium mb-1">Inactive</p>
                            <h4>${inactiveEmployees}</h4>
                        </div>
                    </div>
                </div>
            </div>

            <!-- New Joiners -->
            <div class="col-lg-3 col-md-6 d-flex">
                <div class="card flex-fill">
                    <div class="card-body d-flex align-items-center">
                        <div>
                            <span class="avatar avatar-lg bg-info rounded-circle">
                                <i class="ti ti-user-plus"></i>
                            </span>
                        </div>
                        <div class="ms-2">
                            <p class="fs-12 fw-medium mb-1">New Joiners</p>
                            <h4>0</h4>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Employee List -->
        <div class="card">

            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                <h5>Employee List</h5>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                    <div class="me-3">
                        <div class="input-icon-end position-relative">
                            <input type="text"
                                   class="form-control date-range bookingrange"
                                   placeholder="dd/mm/yyyy - dd/mm/yyyy">
                            <span class="input-icon-addon">
                                <i class="ti ti-chevron-down"></i>
                            </span>
                        </div>
                    </div>

                    <div class="dropdown me-3">
                        <a href="javascript:void(0);"
                           class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                           data-bs-toggle="dropdown">
                            Designation
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3">
                            <li>
                                <a href="#" class="dropdown-item rounded-1">All</a>
                            </li>
                        </ul>
                    </div>

                    <div class="dropdown me-3">
                        <a href="javascript:void(0);"
                           class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                           data-bs-toggle="dropdown">
                            Select Status
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3">
                            <li>
                                <a href="#" class="dropdown-item rounded-1">Active</a>
                            </li>
                            <li>
                                <a href="#" class="dropdown-item rounded-1">Inactive</a>
                            </li>
                        </ul>
                    </div>

                    <div class="dropdown">
                        <a href="javascript:void(0);"
                           class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                           data-bs-toggle="dropdown">
                            Sort By
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end p-3">
                            <li>
                                <a href="#" class="dropdown-item rounded-1">Ascending</a>
                            </li>
                            <li>
                                <a href="#" class="dropdown-item rounded-1">Descending</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>

            <div class="card-body p-0">

                <div class="custom-datatable-filter table-responsive">

                    <table class="table datatable">

                        <thead class="thead-light">
                            <tr>
                                <th class="no-sort">
                                    <div class="form-check form-check-md">
                                        <input class="form-check-input"
                                               type="checkbox"
                                               id="select-all">
                                    </div>
                                </th>
                                <th>Emp ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone</th>
                                <th>Designation</th>
                                <th>Joining Date</th>
                                <th>Status</th>
                                <th>Modified By</th>
                                <th class="no-sort">Action</th>
                            </tr>
                        </thead>

                        <tbody>

                        <c:choose>

                            <c:when test="${not empty employees}">

                                <c:forEach var="employee" items="${employees}">

                                    <tr>

                                        <!-- Checkbox -->
                                        <td>
                                            <div class="form-check form-check-md">
                                                <input class="form-check-input"
                                                       type="checkbox"
                                                       value="${employee.userId}">
                                            </div>
                                        </td>

                                        <!-- Employee ID -->
                                        <td>
                                            <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}">
                                                Emp-${employee.userId}
                                            </a>
                                        </td>

                                        <!-- Name -->
                                        <td>
                                            <div class="d-flex align-items-center">

                                                <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}"
                                                   class="avatar avatar-md">

                                                    <c:choose>
                                                        <c:when test="${not empty employee.profilePicture}">
                                                            <img src="${pageContext.request.contextPath}/${employee.profilePicture}"
                                                                 class="img-fluid rounded-circle"
                                                                 alt="Profile">
                                                        </c:when>

                                                        <c:otherwise>
                                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                                                 class="img-fluid rounded-circle"
                                                                 alt="Profile">
                                                        </c:otherwise>
                                                    </c:choose>

                                                </a>

                                                <div class="ms-2">

                                                    <p class="text-dark mb-0">
                                                        <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}">
                                                            ${employee.firstName} ${employee.lastName}
                                                        </a>
                                                    </p>

                                                    <span class="fs-12">
                                                        Department ID:  ${employee.departmentName}
                                                    </span>

                                                </div>

                                            </div>
                                        </td>

                                        <!-- Email -->
                                        <td>${employee.email}</td>

                                        <!-- Phone -->
                                        <td>${employee.phoneNumber}</td>

                                        <!-- Designation -->
                                        <td>
                                          ${employee.designationName}
                                        </td>

                                        <!-- Joining Date -->
                                        <td>
                                            <c:if test="${not empty employee.dateOfJoining}">
                                                ${employee.dateOfJoining.dayOfMonth}
                                                ${employee.dateOfJoining.month}
                                                ${employee.dateOfJoining.year}
                                            </c:if>
                                        </td>

                                        <!-- Status -->
                                        <td>

                                            <c:choose>

                                                <c:when test="${employee.status == 'Active'}">
                                                    <span class="badge badge-success d-inline-flex align-items-center badge-xs">
                                                        <i class="ti ti-point-filled me-1"></i>
                                                        Active
                                                    </span>
                                                </c:when>

                                                <c:otherwise>
                                                    <span class="badge badge-danger d-inline-flex align-items-center badge-xs">
                                                        <i class="ti ti-point-filled me-1"></i>
                                                        Inactive
                                                    </span>
                                                </c:otherwise>

                                            </c:choose>

                                        </td>

                                        <!-- Modified By -->
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty employee.modifiedBy}">
                                                    ${employee.modifiedBy}
                                                </c:when>
                                                <c:otherwise>
                                                    -
                                                </c:otherwise>
                                            </c:choose>
                                        </td>

                                        <!-- Actions -->
                                     <td>
    <div class="action-icon d-inline-flex">

        <a href="${pageContext.request.contextPath}/admin/employees?action=edit&id=${employee.userId}"
           class="me-2"
           title="Edit">
            <i class="ti ti-edit"></i>
        </a>

        <a href="${pageContext.request.contextPath}/admin/employees?action=delete&id=${employee.userId}"
           title="Delete"
           onclick="return confirm('Are you sure you want to permanently delete this employee?');">
            <i class="ti ti-trash"></i>
        </a>

    </div>
</td>

                                    </tr>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <tr>
                                    <td colspan="10" class="text-center">
                                        No employees found
                                    </td>
                                </tr>

                            </c:otherwise>

                        </c:choose>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>

		<!-- /Page Wrapper -->




	</div>
	<!-- /Main Wrapper -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>