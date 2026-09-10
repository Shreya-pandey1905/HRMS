<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Roles | HRMS</title>

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

    <!-- ========================================================= -->
    <!-- Page Content -->
    <!-- ========================================================= -->

    <div class="page-wrapper">

        <div class="content">

            <!-- Page Header -->

            <div class="d-md-flex d-block align-items-center justify-content-between mb-3">

                <div>

                    <h2 class="mb-1">
                        Roles
                    </h2>

                    <p class="role-count mb-0">
                        Manage employee roles
                    </p>

                </div>

                <div class="mt-3 mt-md-0">

                    <button type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#add_role">

                        <i class="ti ti-plus me-1"></i>

                        Add Role

                    </button>

                </div>

            </div>


            <!-- Success Message -->

            <c:if test="${not empty success}">

                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <c:out value="${success}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert"
                            aria-label="Close">
                    </button>

                </div>

            </c:if>


            <!-- Error Message -->

            <c:if test="${not empty error}">

                <div class="alert alert-danger alert-dismissible fade show"
                     role="alert">

                    <c:out value="${error}"/>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert"
                            aria-label="Close">
                    </button>

                </div>

            </c:if>


            <!-- ========================================================= -->
            <!-- Role Table -->
            <!-- ========================================================= -->

            <div class="card">

                <div class="card-header">

                    <div class="d-flex align-items-center justify-content-between">

                        <h5 class="card-title mb-0">
                            Role List
                        </h5>

                        <span class="role-count">

                            Total:

                            <c:choose>

                                <c:when test="${not empty roles}">
                                    ${roles.size()}
                                </c:when>

                                <c:otherwise>
                                    0
                                </c:otherwise>

                            </c:choose>

                        </span>

                    </div>

                </div>


                <div class="card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover mb-0">

                            <thead>

                            <tr>

                                <th>#</th>

                                <th>Role Name</th>

                                <th>Status</th>

                                <th>Created By</th>

                                <th>Created At</th>

                                <th>Modified By</th>

                                <th>Modified At</th>

                                <th class="text-end">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:choose>

                                <c:when test="${not empty roles}">

                                    <c:forEach var="role"
                                               items="${roles}"
                                               varStatus="status">

                                        <tr>

                                            <!-- Serial Number -->

                                            <td>
                                                ${status.count}
                                            </td>


                                            <!-- Role Name -->

                                            <td>

                                                <strong>

                                                    <c:out value="${role.roleName}"/>

                                                </strong>

                                            </td>


                                            <!-- Status -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.status == 'Active'}">

                                                        <span class="badge bg-success">
                                                            Active
                                                        </span>

                                                    </c:when>

                                                    <c:otherwise>

                                                        <span class="badge bg-danger">
                                                            Inactive
                                                        </span>

                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Created By -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty role.createdBy}">

                                                        <c:out value="${role.createdBy}"/>

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Created At -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.createdAt != null}">

                                                        ${role.createdAt}

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Modified By -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty role.modifiedBy}">

                                                        <c:out value="${role.modifiedBy}"/>

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Modified At -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.modifiedAt != null}">

                                                        ${role.modifiedAt}

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Actions -->

                                            <td class="text-end">

                                                <!-- Edit -->

                                                <button type="button"
                                                        class="btn btn-sm btn-light me-1 edit-role"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#edit_role"
                                                        data-id="${role.roleId}"
                                                        data-name="${role.roleName}"
                                                        data-status="${role.status}"
                                                        title="Edit Role">

                                                    <i class="ti ti-edit"></i>

                                                </button>


                                                <!-- Delete -->

                                                <button type="button"
                                                        class="btn btn-sm btn-light delete-role"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#delete_role"
                                                        data-id="${role.roleId}"
                                                        data-name="${role.roleName}"
                                                        title="Delete Role">

                                                    <i class="ti ti-trash"></i>

                                                </button>

                                            </td>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="8"
                                            class="text-center py-5">

                                            <div>

                                                <i class="ti ti-user-shield fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No roles available
                                                </h5>

                                                <p class="text-muted mb-0">
                                                    Add a role to get started.
                                                </p>

                                            </div>

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


        <!-- ========================================================= -->
        <!-- Footer -->
        <!-- ========================================================= -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                © 2026 HRMS
            </p>

            <p class="mb-0">
                Human Resource Management System
            </p>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Add Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="add_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Add Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <div class="modal-body">

                    <!-- Role Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Role Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="roleName"
                               class="form-control"
                               placeholder="Enter role name"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">

                            Status

                            <span class="text-danger">*</span>

                        </label>

                        <select name="status"
                                class="form-select"
                                required>

                            <option value="">
                                Select Status
                            </option>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-plus me-1"></i>

                        Add Role

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Edit Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="edit_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Edit Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="roleId"
                       id="editRoleId">


                <div class="modal-body">

                    <!-- Role Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Role Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="roleName"
                               id="editRoleName"
                               class="form-control"
                               placeholder="Enter role name"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">

                            Status

                            <span class="text-danger">*</span>

                        </label>

                        <select name="status"
                                id="editRoleStatus"
                                class="form-select"
                                required>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-device-floppy me-1"></i>

                        Save Changes

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Delete Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="delete_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Delete Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="delete">

                <input type="hidden"
                       name="roleId"
                       id="deleteRoleId">


                <div class="modal-body">

                    <div class="text-center">

                        <i class="ti ti-trash fs-1 text-danger"></i>

                        <h5 class="mt-3">
                            Are you sure?
                        </h5>

                        <p class="text-muted mb-0">

                            Do you want to delete

                            <strong id="deleteRoleName"></strong>?

                        </p>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-danger">

                        <i class="ti ti-trash me-1"></i>

                        Delete

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>

<!-- JAVASCRIPT -->
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


<script>

    document.addEventListener("DOMContentLoaded", function () {

        /* =========================================================
           Edit Role
           ========================================================= */

        const editButtons =
            document.querySelectorAll(".edit-role");

        editButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const roleId =
                    button.getAttribute("data-id");

                const roleName =
                    button.getAttribute("data-name");

                const roleStatus =
                    button.getAttribute("data-status");

                document.getElementById("editRoleId").value =
                    roleId;

                document.getElementById("editRoleName").value =
                    roleName;

                document.getElementById("editRoleStatus").value =
                    roleStatus;

            });

        });


        /* =========================================================
           Delete Role
           ========================================================= */

        const deleteButtons =
            document.querySelectorAll(".delete-role");

        deleteButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const roleId =
                    button.getAttribute("data-id");

                const roleName =
                    button.getAttribute("data-name");

                document.getElementById("deleteRoleId").value =
                    roleId;

                document.getElementById("deleteRoleName").textContent =
                    roleName;

            });

        });

    });

</script>

</body>

</html>