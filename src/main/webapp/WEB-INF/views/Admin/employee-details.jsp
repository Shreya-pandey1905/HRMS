<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Employee Details | HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

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

                 <li>    <a href="${pageContext.request.contextPath}/admin/employees?action=grid">
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

    <div class="page-wrapper">

        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">Employee Details</h2>

                    <nav>
                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/employee/employees">
                                    Employees
                                </a>
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">
                                Employee Details
                            </li>

                        </ol>
                    </nav>

                </div>

            </div>


            <!-- Employee Details -->
            <div class="row">

                <!-- LEFT SIDE -->
                <div class="col-xl-4 theiaStickySidebar">

                    <!-- Profile Card -->
                    <div class="card card-bg-1">

                        <div class="card-body p-0">

                            <span class="avatar avatar-xl avatar-rounded border border-2 border-white m-auto d-flex mb-2">

                                <c:choose>

                                    <c:when test="${not empty employeeDetails.user.profilePicture}">

                                        <img src="${pageContext.request.contextPath}/${employeeDetails.user.profilePicture}"
                                             class="w-auto h-auto"
                                             alt="Profile">

                                    </c:when>

                                    <c:otherwise>

                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-13.jpg"
                                             class="w-auto h-auto"
                                             alt="Profile">

                                    </c:otherwise>

                                </c:choose>

                            </span>


                            <div class="text-center px-3 pb-3 border-bottom">

                                <div class="mb-3">

                                    <h5 class="d-flex align-items-center justify-content-center mb-1">

                                        ${employeeDetails.user.firstName}
                                        ${employeeDetails.user.lastName}

                                        <i class="ti ti-discount-check-filled text-success ms-1"></i>

                                    </h5>


                                    <span class="badge badge-soft-dark fw-medium me-2">

                                        <i class="ti ti-point-filled me-1"></i>

                                        ${employeeDetails.user.designationName}

                                    </span>

                                    <span class="badge badge-soft-secondary fw-medium">
                                        Employee
                                    </span>

                                </div>


                                <div>

                                    <!-- User ID -->
                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-id me-2"></i>

                                            User ID

                                        </span>

                                        <p class="text-dark">
                                            ${employeeDetails.user.userId}
                                        </p>

                                    </div>


                                    <!-- Department -->
                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-star me-2"></i>

                                            Department

                                        </span>

                                        <p class="text-dark">

                                            ${employeeDetails.user.departmentName}

                                        </p>

                                    </div>


                                    <!-- Date Of Joining -->
                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-calendar-check me-2"></i>

                                            Date Of Join

                                        </span>

                                        <p class="text-dark">

                                            ${employeeDetails.user.dateOfJoining}

                                        </p>

                                    </div>


                                    <!-- Reporting Manager -->
                                    <div class="d-flex align-items-center justify-content-between">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-calendar-check me-2"></i>

                                            Reporting Manager

                                        </span>

                                        <p class="text-gray-9 mb-0">

                                            ${employeeDetails.user.reportingManager}

                                        </p>

                                    </div>


                                    <div class="row gx-2 mt-3">

                                        <div class="col-6">

                                            <div>

                                                <a href="#"
                                                   class="btn btn-dark w-100"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#edit_employee">

                                                    <i class="ti ti-edit me-1"></i>

                                                    Edit Info

                                                </a>

                                            </div>

                                        </div>


                                        <div class="col-6">

                                            <div>

                                                <a href="#"
                                                   class="btn btn-primary w-100">

                                                    <i class="ti ti-message-heart me-1"></i>

                                                    Message

                                                </a>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>


                            <!-- BASIC INFORMATION -->
                            <div class="p-3 border-bottom">

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <h6>Basic information</h6>

                                    <a href="javascript:void(0);"
                                       class="btn btn-icon btn-sm"
                                       data-bs-toggle="modal"
                                       data-bs-target="#edit_employee">

                                        <i class="ti ti-edit"></i>

                                    </a>

                                </div>


                                <!-- Phone -->
                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-phone me-2"></i>

                                        Phone

                                    </span>

                                    <p class="text-dark">

                                        ${employeeDetails.user.phoneNumber}

                                    </p>

                                </div>


                                <!-- Email -->
                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-mail-check me-2"></i>

                                        Email

                                    </span>

                                    <a href="mailto:${employeeDetails.user.email}"
                                       class="text-info d-inline-flex align-items-center">

                                        ${employeeDetails.user.email}

                                        <i class="ti ti-copy text-dark ms-2"></i>

                                    </a>

                                </div>


                                <!-- Gender -->
                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-gender-male me-2"></i>

                                        Gender

                                    </span>

                                    <p class="text-dark text-end">

                                        ${employeeDetails.user.gender}

                                    </p>

                                </div>


                                <!-- Birthday -->
                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-cake me-2"></i>

                                        Birthday

                                    </span>

                                    <p class="text-dark text-end">

                                        ${employeeDetails.user.dateOfBirth}

                                    </p>

                                </div>


                                <!-- Address -->
                                <div class="d-flex align-items-center justify-content-between">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-map-pin-check me-2"></i>

                                        Address

                                    </span>

                                    <p class="text-dark text-end">

                                        ${employeeDetails.user.address}

                                    </p>

                                </div>

                            </div>


                            <!-- PERSONAL INFORMATION -->
                            <!-- These fields are not available in current User table -->
                            <div class="p-3 border-bottom">

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <h6>Personal Information</h6>

                                    <a href="javascript:void(0);"
                                       class="btn btn-icon btn-sm"
                                       data-bs-toggle="modal"
                                       data-bs-target="#edit_personal">

                                        <i class="ti ti-edit"></i>

                                    </a>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-e-passport me-2"></i>

                                        Passport No

                                    </span>

                                    <p class="text-dark">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-calendar-x me-2"></i>

                                        Passport Exp Date

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-gender-male me-2"></i>

                                        Nationality

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-bookmark-plus me-2"></i>

                                        Religion

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-hotel-service me-2"></i>

                                        Marital status

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-briefcase-2 me-2"></i>

                                        Employment of spouse

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-baby-bottle me-2"></i>

                                        No. of children

                                    </span>

                                    <p class="text-dark text-end">-</p>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- EMERGENCY CONTACT -->
                    <div class="d-flex align-items-center justify-content-between mb-2">

                        <h6>Emergency Contact Number</h6>

                        <a href="javascript:void(0);"
                           class="btn btn-icon btn-sm"
                           data-bs-toggle="modal"
                           data-bs-target="#edit_emergency">

                            <i class="ti ti-edit"></i>

                        </a>

                    </div>


                    <div class="card">

                        <div class="card-body p-0">

                            <c:choose>

                                <c:when test="${not empty employeeDetails.familyDetails}">

                                    <c:forEach var="family"
                                               items="${employeeDetails.familyDetails}"
                                               varStatus="status">

                                        <div class="p-3 border-bottom">

                                            <div class="d-flex align-items-center justify-content-between">

                                                <div>

                                                    <span class="d-inline-flex align-items-center">

                                                        <c:choose>

                                                            <c:when test="${status.index == 0}">
                                                                Primary
                                                            </c:when>

                                                            <c:otherwise>
                                                                Secondary
                                                            </c:otherwise>

                                                        </c:choose>

                                                    </span>


                                                    <h6 class="d-flex align-items-center fw-medium mt-1">

                                                        ${family.name}

                                                        <span class="d-inline-flex mx-1">

                                                            <i class="ti ti-point-filled text-danger"></i>

                                                        </span>

                                                        ${family.relation}

                                                    </h6>

                                                </div>


                                                <p class="text-dark">

                                                    ${family.phone}

                                                </p>

                                            </div>

                                        </div>

                                    </c:forEach>

                                </c:when>

                                <c:otherwise>

                                    <div class="p-3">

                                        No emergency contact available.

                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>


                <!-- RIGHT SIDE -->
                <div class="col-xl-8">

                    <div>

                        <div class="tab-content custom-accordion-items">

                            <div class="tab-pane active show"
                                 id="bottom-justified-tab1"
                                 role="tabpanel">

                                <div class="accordion accordions-items-seperate"
                                     id="accordionExample">


                                    <!-- ABOUT EMPLOYEE -->
                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingOne">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center flex-fill">

                                                    <h5>About Employee</h5>

                                                    <a href="#"
                                                       class="btn btn-sm btn-icon ms-auto"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#edit_employee">

                                                        <i class="ti ti-edit"></i>

                                                    </a>

                                                    <a href="#"
                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                       data-bs-toggle="collapse"
                                                       data-bs-target="#primaryBorderOne"
                                                       aria-expanded="false"
                                                       aria-controls="primaryBorderOne">

                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                    </a>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderOne"
                                             class="accordion-collapse collapse show border-top"
                                             aria-labelledby="headingOne"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body mt-2">

                                                ${employeeDetails.user.aboutEmployee}

                                            </div>

                                        </div>

                                    </div>


                                    <!-- BANK INFORMATION -->
                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingTwo">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center flex-fill">

                                                    <h5>Bank Information</h5>

                                                    <a href="#"
                                                       class="btn btn-sm btn-icon ms-auto"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#edit_bank">

                                                        <i class="ti ti-edit"></i>

                                                    </a>

                                                    <a href="#"
                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                       data-bs-toggle="collapse"
                                                       data-bs-target="#primaryBorderTwo"
                                                       aria-expanded="false"
                                                       aria-controls="primaryBorderTwo">

                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                    </a>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderTwo"
                                             class="accordion-collapse collapse border-top"
                                             aria-labelledby="headingTwo"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <c:choose>

                                                    <c:when test="${not empty employeeDetails.bankDetails}">

                                                        <div class="row">

                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Bank Name
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${employeeDetails.bankDetails.bankName}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Bank account no
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${employeeDetails.bankDetails.accountNumber}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    IFSC Code
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${employeeDetails.bankDetails.IFSCCode}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Branch
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${employeeDetails.bankDetails.branchName}

                                                                </h6>

                                                            </div>

                                                        </div>

                                                    </c:when>

                                                    <c:otherwise>

                                                        <p class="mb-0">
                                                            No bank information available.
                                                        </p>

                                                    </c:otherwise>

                                                </c:choose>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- FAMILY INFORMATION -->
                                    <div class="accordion-item">

                                        <div class="accordion-header"
                                             id="headingThree">

                                            <div class="accordion-button">

                                                <div class="d-flex align-items-center justify-content-between flex-fill">

                                                    <h5>Family Information</h5>

                                                    <div class="d-flex">

                                                        <a href="#"
                                                           class="btn btn-icon btn-sm"
                                                           data-bs-toggle="modal"
                                                           data-bs-target="#edit_familyinformation">

                                                            <i class="ti ti-edit"></i>

                                                        </a>

                                                        <a href="#"
                                                           class="d-flex align-items-center collapsed collapse-arrow"
                                                           data-bs-toggle="collapse"
                                                           data-bs-target="#primaryBorderThree"
                                                           aria-expanded="false"
                                                           aria-controls="primaryBorderThree">

                                                            <i class="ti ti-chevron-down fs-18"></i>

                                                        </a>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <div id="primaryBorderThree"
                                             class="accordion-collapse collapse border-top"
                                             aria-labelledby="headingThree"
                                             data-bs-parent="#accordionExample">

                                            <div class="accordion-body">

                                                <c:choose>

                                                    <c:when test="${not empty employeeDetails.familyDetails}">

                                                        <c:forEach var="family"
                                                                   items="${employeeDetails.familyDetails}">

                                                            <div class="row mb-3">

                                                                <div class="col-md-3">

                                                                    <span class="d-inline-flex align-items-center">
                                                                        Name
                                                                    </span>

                                                                    <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                        ${family.name}

                                                                    </h6>

                                                                </div>


                                                                <div class="col-md-3">

                                                                    <span class="d-inline-flex align-items-center">
                                                                        Relationship
                                                                    </span>

                                                                    <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                        ${family.relation}

                                                                    </h6>

                                                                </div>


                                                                <div class="col-md-3">

                                                                    <span class="d-inline-flex align-items-center">
                                                                        Date of birth
                                                                    </span>

                                                                    <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                        ${family.dateOfBirth}

                                                                    </h6>

                                                                </div>


                                                                <div class="col-md-3">

                                                                    <span class="d-inline-flex align-items-center">
                                                                        Phone
                                                                    </span>

                                                                    <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                        ${family.phone}

                                                                    </h6>

                                                                </div>

                                                            </div>

                                                            <hr>

                                                        </c:forEach>

                                                    </c:when>

                                                    <c:otherwise>

                                                        <p class="mb-0">
                                                            No family information available.
                                                        </p>

                                                    </c:otherwise>

                                                </c:choose>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- EDUCATION + EXPERIENCE -->
                                    <div class="row">

                                        <!-- EDUCATION -->
                                        <div class="col-md-6">

                                            <div class="accordion-item">

                                                <div class="row">

                                                    <div class="accordion-header"
                                                         id="headingFour">

                                                        <div class="accordion-button">

                                                            <div class="d-flex align-items-center justify-content-between flex-fill">

                                                                <h5>Education Details</h5>

                                                                <div class="d-flex">

                                                                    <a href="#"
                                                                       class="btn btn-icon btn-sm"
                                                                       data-bs-toggle="modal"
                                                                       data-bs-target="#edit_education">

                                                                        <i class="ti ti-edit"></i>

                                                                    </a>

                                                                    <a href="#"
                                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                                       data-bs-toggle="collapse"
                                                                       data-bs-target="#primaryBorderFour"
                                                                       aria-expanded="false"
                                                                       aria-controls="primaryBorderFour">

                                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                                    </a>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>


                                                    <div id="primaryBorderFour"
                                                         class="accordion-collapse collapse border-top"
                                                         aria-labelledby="headingFour"
                                                         data-bs-parent="#accordionExample">

                                                        <div class="accordion-body">

                                                            <c:choose>

                                                                <c:when test="${not empty employeeDetails.educationDetails}">

                                                                    <c:forEach var="education"
                                                                               items="${employeeDetails.educationDetails}">

                                                                        <div class="mb-3">

                                                                            <div class="d-flex align-items-center justify-content-between">

                                                                                <div>

                                                                                    <span class="d-inline-flex align-items-center fw-normal">

                                                                                        ${education.universityName}

                                                                                    </span>

                                                                                    <h6 class="d-flex align-items-center mt-1">

                                                                                        ${education.educationType}

                                                                                    </h6>

                                                                                </div>

                                                                                <p class="text-dark">

                                                                                    ${education.startdate}
                                                                                    -
                                                                                    ${education.enddate}

                                                                                </p>

                                                                            </div>

                                                                        </div>

                                                                    </c:forEach>

                                                                </c:when>

                                                                <c:otherwise>

                                                                    <p class="mb-0">
                                                                        No education details available.
                                                                    </p>

                                                                </c:otherwise>

                                                            </c:choose>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- EXPERIENCE -->
                                        <div class="col-md-6">

                                            <div class="accordion-item">

                                                <div class="row">

                                                    <div class="accordion-header"
                                                         id="headingFive">

                                                        <div class="accordion-button collapsed">

                                                            <div class="d-flex align-items-center justify-content-between flex-fill">

                                                                <h5>Experience</h5>

                                                                <div class="d-flex">

                                                                    <a href="#"
                                                                       class="btn btn-icon btn-sm"
                                                                       data-bs-toggle="modal"
                                                                       data-bs-target="#edit_experience">

                                                                        <i class="ti ti-edit"></i>

                                                                    </a>

                                                                    <a href="#"
                                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                                       data-bs-toggle="collapse"
                                                                       data-bs-target="#primaryBorderFive"
                                                                       aria-expanded="false"
                                                                       aria-controls="primaryBorderFive">

                                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                                    </a>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>


                                                    <div id="primaryBorderFive"
                                                         class="accordion-collapse collapse border-top"
                                                         aria-labelledby="headingFive"
                                                         data-bs-parent="#accordionExample">

                                                        <div class="accordion-body">

                                                            <p class="text-muted mb-0">
                                                                Experience details are not available in the current database.
                                                            </p>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- PROJECTS / ASSETS -->
                                    <div class="card">

                                        <div class="card-body">

                                            <div class="contact-grids-tab p-0 mb-3">

                                                <ul class="nav nav-underline"
                                                    id="myTab"
                                                    role="tablist">

                                                    <li class="nav-item"
                                                        role="presentation">

                                                        <button class="nav-link active"
                                                                id="info-tab2"
                                                                data-bs-toggle="tab"
                                                                data-bs-target="#basic-info2"
                                                                type="button"
                                                                role="tab"
                                                                aria-selected="true">

                                                            Projects

                                                        </button>

                                                    </li>


                                                    <li class="nav-item"
                                                        role="presentation">

                                                        <button class="nav-link"
                                                                id="address-tab2"
                                                                data-bs-toggle="tab"
                                                                data-bs-target="#address2"
                                                                type="button"
                                                                role="tab"
                                                                aria-selected="false">

                                                            Assets

                                                        </button>

                                                    </li>

                                                </ul>

                                            </div>


                                            <div class="tab-content"
                                                 id="myTabContent3">


                                                <!-- PROJECTS -->
                                                <div class="tab-pane fade show active"
                                                     id="basic-info2"
                                                     role="tabpanel"
                                                     aria-labelledby="info-tab2"
                                                     tabindex="0">

                                                    <div class="row">

                                                        <div class="col-md-12">

                                                            <div class="card mb-0">

                                                                <div class="card-body">

                                                                    <p class="text-muted mb-0">

                                                                        Project details are not available
                                                                        in the current database.

                                                                    </p>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>


                                                <!-- ASSETS -->
                                                <div class="tab-pane fade"
                                                     id="address2"
                                                     role="tabpanel"
                                                     aria-labelledby="address-tab2"
                                                     tabindex="0">

                                                    <div class="row">

                                                        <div class="col-md-12">

                                                            <div class="card mb-0">

                                                                <div class="card-body">

                                                                    <p class="text-muted mb-0">

                                                                        Asset details are not available
                                                                        in the current database.

                                                                    </p>

                                                                </div>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>

</html>