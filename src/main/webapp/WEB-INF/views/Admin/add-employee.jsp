
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS - Employee Management">
    <meta name="keywords" content="HRMS, employee, admin, employee management">
    <meta name="author" content="HRMS">
    <meta name="robots" content="noindex, nofollow">

    <title>Add Employee | HRMS</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180"
          href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Flatpickr -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <!-- Daterangepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Datatable -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <!-- Datetimepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Bootstrap Tagsinput -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<!-- Global Loader -->
<div id="global-loader" style="display: none;">
    <div class="page-loader"></div>
</div>


<!-- ================= SIDEBAR ================= -->

<div class="sidebar" id="sidebar">

    <!-- Sidebar Logo -->
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


    <!-- Admin Profile -->
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


    <!-- Sidebar Menu -->
    <div class="sidebar-menu">

        <ul>

            <li class="menu-title">
                <span>MAIN MENU</span>
            </li>


            <!-- DASHBOARD -->
            <li>
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
                            Leaves
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Attendance (Admin)
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Timesheet
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
                            Add Event
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Add Master Event
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Event List
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
                            Add Employee Salary
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Master Payroll
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Employee Salary List
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Generate Payslips Monthly
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Transaction History
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
                            Trainer List
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
                                    Trainer Type
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
                                    Upload Document
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0);">
                                    Document List
                                </a>
                            </li>

                        </ul>

                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Generate Letter
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
                            Master Document
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Master Document List
                        </a>
                    </li>

                </ul>

            </li>


            <!-- PERFORMANCE -->
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
                            Project
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Tasks
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Task Board
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
                            Employee Report
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Attendance Report
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Leave Report
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Payslip Report
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Task Report
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            Daily Report
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


            <!-- HELP -->
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


<!-- ================= MAIN WRAPPER ================= -->

<div class="main-wrapper">


    <!-- ================= HEADER ================= -->

    <div class="header">

        <div class="main-header">

            <div class="header-left">

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="Logo">

                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="Logo">

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

                    <!-- Search -->
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


                    <!-- Right Header -->
                    <div class="d-flex align-items-center">

                        <!-- Fullscreen -->
                        <div class="me-1">

                            <a href="#"
                               class="btn btn-menubar btnFullscreen">

                                <i class="ti ti-maximize"></i>

                            </a>

                        </div>


                        <!-- Applications -->
                        <div class="dropdown me-1">

                            <a href="#"
                               class="btn btn-menubar"
                               data-bs-toggle="dropdown">

                                <i class="ti ti-layout-grid-remove"></i>

                            </a>

                            <div class="dropdown-menu dropdown-menu-end">

                                <div class="card mb-0 border-0 shadow-none">

                                    <div class="card-header">
                                        <h4>Applications</h4>
                                    </div>

                                    <div class="card-body">

                                        <a href="javascript:void(0);"
                                           class="d-block pb-2">

                                            <span class="avatar avatar-md bg-transparent-dark me-2">
                                                <i class="ti ti-calendar text-gray-9"></i>
                                            </span>

                                            Calendar

                                        </a>

                                        <a href="javascript:void(0);"
                                           class="d-block py-2">

                                            <span class="avatar avatar-md bg-transparent-dark me-2">
                                                <i class="ti ti-subtask text-gray-9"></i>
                                            </span>

                                            To Do

                                        </a>

                                        <a href="javascript:void(0);"
                                           class="d-block py-2">

                                            <span class="avatar avatar-md bg-transparent-dark me-2">
                                                <i class="ti ti-notes text-gray-9"></i>
                                            </span>

                                            Notes

                                        </a>

                                        <a href="javascript:void(0);"
                                           class="d-block py-2">

                                            <span class="avatar avatar-md bg-transparent-dark me-2">
                                                <i class="ti ti-folder text-gray-9"></i>
                                            </span>

                                            File Manager

                                        </a>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- Chat -->
                        <div class="me-1">

                            <a href="javascript:void(0);"
                               class="btn btn-menubar position-relative">

                                <i class="ti ti-brand-hipchat"></i>

                                <span class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">
                                    5
                                </span>

                            </a>

                        </div>


                        <!-- Email -->
                        <div class="me-1">

                            <a href="javascript:void(0);"
                               class="btn btn-menubar">

                                <i class="ti ti-mail"></i>

                            </a>

                        </div>


                        <!-- Notification -->
                        <div class="me-1 notification_item">

                            <a href="#"
                               class="btn btn-menubar position-relative me-1"
                               id="notification_popup"
                               data-bs-toggle="dropdown">

                                <i class="ti ti-bell"></i>

                                <span class="notification-status-dot"></span>

                            </a>

                            <div class="dropdown-menu dropdown-menu-end notification-dropdown p-4">

                                <div class="d-flex align-items-center justify-content-between border-bottom p-0 pb-3 mb-3">

                                    <h4 class="notification-title">
                                        Notifications (0)
                                    </h4>

                                </div>

                                <div class="text-center py-4">

                                    <i class="ti ti-bell-off fs-32 text-muted"></i>

                                    <p class="mb-0 mt-2 text-muted">
                                        No new notifications
                                    </p>

                                </div>

                            </div>

                        </div>


                        <!-- Profile -->
                        <div class="dropdown profile-dropdown">

                            <a href="javascript:void(0);"
                               class="dropdown-toggle d-flex align-items-center"
                               data-bs-toggle="dropdown">

                                <span class="avatar avatar-sm online">

                                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg"
                                         alt="Admin"
                                         class="img-fluid rounded-circle">

                                </span>

                            </a>


                            <div class="dropdown-menu shadow-none">

                                <div class="card mb-0">

                                    <div class="card-header">

                                        <div class="d-flex align-items-center">

                                            <span class="avatar avatar-lg me-2 avatar-rounded">

                                                <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-12.jpg"
                                                     alt="Admin">

                                            </span>

                                            <div>

                                                <h5 class="mb-0">
                                                    Admin
                                                </h5>

                                                <p class="fs-12 fw-medium mb-0">
                                                    Administrator
                                                </p>

                                            </div>

                                        </div>

                                    </div>


                                    <div class="card-body">

                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="javascript:void(0);">

                                            <i class="ti ti-user-circle me-1"></i>
                                            My Profile

                                        </a>

                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="javascript:void(0);">

                                            <i class="ti ti-settings me-1"></i>
                                            Settings

                                        </a>

                                    </div>


                                    <div class="card-footer py-1">

                                        <a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
                                           href="javascript:void(0);">

                                            <i class="ti ti-logout me-2"></i>
                                            Logout

                                        </a>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>


            <!-- Mobile Menu -->
            <div class="dropdown mobile-user-menu">

                <a href="javascript:void(0);"
                   class="nav-link dropdown-toggle"
                   data-bs-toggle="dropdown">

                    <i class="fa fa-ellipsis-v"></i>

                </a>

                <div class="dropdown-menu dropdown-menu-end">

                    <a class="dropdown-item"
                       href="javascript:void(0);">
                        My Profile
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


    <!-- ================= PAGE WRAPPER ================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- Page Header -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Add Employee
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/employees?action=list">
                                    Employees
                                </a>

                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Add Employee

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- Add Employee Card -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title">
                        Add New Employee
                    </h5>

                </div>


                <form action="${pageContext.request.contextPath}/admin/employees"
                      method="post"
                      enctype="multipart/form-data">

                    <input type="hidden"
                           name="action"
                           value="add">


                    <div class="card-body">


                        <!-- Profile Picture -->

                        <div class="row">

                            <div class="col-md-12">

                                <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                    <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark">

                                        <i class="ti ti-photo text-gray-2 fs-16"></i>

                                    </div>


                                    <div class="profile-upload">

                                        <div class="mb-2">

                                            <h6 class="mb-1">
                                                Upload Profile Image
                                            </h6>

                                            <p class="fs-12">
                                                Image should be below 4 MB
                                            </p>

                                        </div>


                                        <div class="profile-uploader d-flex align-items-center">

                                            <div class="drag-upload-btn btn btn-sm btn-primary me-2">

                                                Upload

                                                <input type="file"
                                                       class="form-control image-sign"
                                                       name="profilePicture">

                                            </div>


                                            <button type="button"
                                                    class="btn btn-light btn-sm">

                                                Cancel

                                            </button>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- Employee Fields -->

                        <div class="row">


                            <!-- First Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        First Name
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           name="firstName"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- Last Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Last Name
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           name="lastName"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- Joining Date -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Joining Date
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="input-icon-end position-relative">

                                        <input type="date"
                                               name="dateOfJoining"
                                               class="form-control"
                                               required>

                                        <span class="input-icon-addon">

                                            <i class="ti ti-calendar text-gray-7"></i>

                                        </span>

                                    </div>

                                </div>

                            </div>


                            <!-- Date Of Birth -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Date of Birth
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="input-icon-end position-relative">

                                        <input type="date"
                                               name="dateOfBirth"
                                               class="form-control"
                                               required>

                                        <span class="input-icon-addon">

                                            <i class="ti ti-calendar text-gray-7"></i>

                                        </span>

                                    </div>

                                </div>

                            </div>


                            <!-- Email -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Email
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="email"
                                           name="email"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- Password -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Password
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="pass-group">

                                        <input type="password"
                                               name="password"
                                               class="pass-input form-control"
                                               required>

                                        <span class="ti toggle-password ti-eye-off"></span>

                                    </div>

                                </div>

                            </div>


                            <!-- Confirm Password -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Confirm Password
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="pass-group">

                                        <input type="password"
                                               name="confirmPassword"
                                               class="pass-inputs form-control"
                                               required>

                                        <span class="ti toggle-passwords ti-eye-off"></span>

                                    </div>

                                </div>

                            </div>


                            <!-- Phone -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Phone Number
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           name="phoneNumber"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                            <!-- Gender -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Gender
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="gender"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Gender
                                        </option>

                                        <option value="Male">
                                            Male
                                        </option>

                                        <option value="Female">
                                            Female
                                        </option>

                                        <option value="Other">
                                            Other
                                        </option>

                                    </select>

                                </div>

                            </div>


                            <!-- Role -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Role
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="roleId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Role
                                        </option>

                                        <c:forEach var="role"
                                                   items="${roles}">

                                            <option value="${role.roleId}">
                                                ${role.roleName}
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- Department -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Department
                                    </label>

                                    <select name="departmentId"
                                            class="form-select">

                                        <option value="">
                                            Select Department
                                        </option>

                                        <c:forEach var="department"
                                                   items="${departments}">

                                            <option value="${department.departmentId}">
                                                ${department.departmentName}
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- Designation -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Designation
                                    </label>

                                    <select name="designationId"
                                            class="form-select">

                                        <option value="">
                                            Select Designation
                                        </option>

                                        <c:forEach var="designation"
                                                   items="${designations}">

                                            <option value="${designation.designationId}">
                                                ${designation.designationName}
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- Reporting Manager -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Reporting Manager
                                    </label>

                                    <select name="reportingManager"
                                            class="form-select">

                                        <option value="">
                                            Select Reporting Manager
                                        </option>

                                        <c:forEach var="manager"
                                                   items="${managers}">

                                            <option value="${manager.userId}">
                                                ${manager.firstName}
                                                ${manager.lastName}
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- Address -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Address
                                        <span class="text-danger">*</span>

                                    </label>

                                    <textarea name="address"
                                              class="form-control"
                                              rows="3"
                                              required></textarea>

                                </div>

                            </div>


                            <!-- About Employee -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">

                                        About Employee
                                        <span class="text-danger">*</span>

                                    </label>

                                    <textarea name="aboutEmployee"
                                              class="form-control"
                                              rows="4"
                                              required></textarea>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Form Footer -->

                    <div class="card-footer d-flex justify-content-end">

                        <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                           class="btn btn-outline-light border me-2">

                            Cancel

                        </a>

                        <button type="submit"
                                class="btn btn-primary">

                            Save

                        </button>

                    </div>

                </form>

            </div>

        </div>


        <!-- Footer -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                2014 - 2025 &copy; SmartHR.
            </p>

            <p>
                Designed &amp; Developed By
                <a href="javascript:void(0);"
                   class="text-primary">
                    Dreams
                </a>
            </p>

        </div>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>

</html>

