<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Documents">

    <meta name="keywords"
          content="HRMS, Documents, Employee Documents">

    <meta name="author" content="HRMS Team">

    <meta name="robots" content="noindex, nofollow">

    <title>My Documents - HRMS</title>

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

    <!-- Header -->
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
    <!-- /Header -->


    <!-- Sidebar -->
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


        <!-- Sidebar Menu -->
        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>

                <!-- Dashboard -->
                <li>

                    <a href="${pageContext.request.contextPath}/admin/dashboard">

                        <i class="ti ti-smart-home"></i>

                        <span>Employee Dashboard</span>

                    </a>

                </li>


                <!-- Employees -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-users"></i>

                        <span>Employees</span>

                    </a>

                </li>


                <!-- Attendance -->
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


                <!-- Payroll -->
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


                <!-- My Training -->
                <li>

                    <a href="${pageContext.request.contextPath}/employee/trainings">

                        <i class="ti ti-school"></i>

                        <span>My Training</span>

                    </a>

                </li>


                <!-- Calendar -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-calendar-event"></i>

                        <span>Calendar</span>

                    </a>

                </li>


                <!-- Performance -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-chart-line"></i>

                        <span>Performance</span>

                    </a>

                </li>


                <!-- Documents -->
                <li class="submenu active">

                    <a href="javascript:void(0);">

                        <i class="ti ti-file-text"></i>

                        <span>Documents</span>

                        <span class="menu-arrow"></span>

                    </a>

                    <ul>

                        <li>

                            <a href="${pageContext.request.contextPath}/file-uploads">

                                <span>My Documents</span>

                            </a>

                        </li>

                        <li>

                            <a href="${pageContext.request.contextPath}/file-uploads">

                                <span>Upload Documents</span>

                            </a>

                        </li>

                    </ul>

                </li>


                <!-- Help & Support -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-headset"></i>

                        <span>Help &amp; Support</span>

                    </a>

                </li>


                <!-- Tickets -->
                <li>

                    <a href="javascript:void(0);">

                        <i class="ti ti-ticket"></i>

                        <span>Tickets</span>

                    </a>

                </li>


                <!-- Logout -->
                <li class="mt-2">

                    <a href="javascript:void(0);">

                        <i class="ti ti-logout"></i>

                        <span>Logout</span>

                    </a>

                </li>

            </ul>

        </div>

    </div>
    <!-- /Sidebar -->


    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        My Documents
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Documents
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                My Documents

                            </li>

                        </ol>

                    </nav>

                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="ms-2 head-icons">

                        <a href="javascript:void(0);"
                           data-bs-toggle="tooltip"
                           data-bs-placement="top"
                           title="Collapse"
                           id="collapse-header">

                            <i class="ti ti-chevrons-up"></i>

                        </a>

                    </div>

                </div>

            </div>
            <!-- /Breadcrumb -->


            <!-- Pending Documents -->
            <c:if test="${not empty pendingDocuments}">

                <div class="alert alert-warning d-flex align-items-center mb-4">

                    <i class="ti ti-alert-circle fs-24 me-3"></i>

                    <div>

                        <h6 class="mb-1">
                            Documents Required
                        </h6>

                        <p class="mb-0">
                            You have documents assigned by Admin that need to be submitted.
                        </p>

                    </div>

                </div>


                <div class="card mb-4">

                    <div class="card-header">

                        <h5 class="card-title mb-0">
                            Pending Documents
                        </h5>

                    </div>

                    <div class="card-body">

                        <div class="row">

                            <c:forEach var="pending"
                                       items="${pendingDocuments}">

                                <div class="col-md-6 mb-3">

                                    <div class="border rounded p-3 d-flex align-items-center">

                                        <span class="avatar avatar-md bg-warning-transparent me-3">

                                            <i class="ti ti-file-alert fs-20"></i>

                                        </span>

                                        <div>

                                            <h6 class="mb-1">
                                                    ${pending.fileName}
                                            </h6>

                                            <span class="badge bg-warning">
                                                PENDING
                                            </span>

                                        </div>

                                    </div>

                                </div>

                            </c:forEach>

                        </div>

                    </div>

                </div>

            </c:if>
            <!-- /Pending Documents -->


            <!-- Upload Documents -->
            <div class="card mb-4">

                <div class="card-header d-flex align-items-center justify-content-between">

                    <div>

                        <h5 class="card-title mb-1">
                            Upload Documents
                        </h5>

                        <p class="text-muted mb-0">
                            Upload one or more documents
                        </p>

                    </div>

                </div>


                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/file-uploads"
                          enctype="multipart/form-data">

                        <input type="hidden"
                               name="userId"
                               value="${userId}">


                        <div id="documentRows">

                            <!-- First upload row -->
                            <div class="document-row border rounded p-3 mb-3">

                                <div class="row align-items-end">

                                    <!-- Document Type -->
                                    <div class="col-md-5 mb-3 mb-md-0">

                                        <label class="form-label">

                                            Document Type

                                            <span class="text-danger">*</span>

                                        </label>

                                        <select name="documentId"
                                                class="form-select"
                                                required>

                                            <option value="">
                                                Select Document
                                            </option>

                                            <c:forEach var="document"
                                                       items="${documentNames}">

                                                <option value="${document.id}">
                                                        ${document.docName}
                                                </option>

                                            </c:forEach>

                                        </select>

                                    </div>


                                    <!-- File -->
                                    <div class="col-md-5 mb-3 mb-md-0">

                                        <label class="form-label">

                                            Choose File

                                            <span class="text-danger">*</span>

                                        </label>

                                        <input type="file"
                                               name="file"
                                               class="form-control"
                                               required>

                                    </div>


                                    <!-- Add -->
                                    <div class="col-md-2">

                                        <button type="button"
                                                class="btn btn-light border w-100 add-row">

                                            <i class="ti ti-plus"></i>

                                            Add

                                        </button>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <div class="text-end mt-3">

                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="ti ti-upload me-1"></i>

                                Upload Documents

                            </button>

                        </div>

                    </form>

                </div>

            </div>
            <!-- /Upload Documents -->


            <!-- My Documents -->
            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between">

                    <div>

                        <h5 class="card-title mb-1">
                            My Uploaded Documents
                        </h5>

                        <p class="text-muted mb-0">
                            Documents uploaded by you
                        </p>

                    </div>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-hover datatable">

                            <thead>

                            <tr>

                                <th>#</th>

                                <th>File Name</th>

                                <th>Document ID</th>

                                <th>Action</th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="file"
                                       items="${files}"
                                       varStatus="status">

                                <tr>

                                    <td>
                                            ${status.count}
                                    </td>

                                    <td>

                                        <div class="d-flex align-items-center">

                                            <span class="avatar avatar-sm bg-primary-transparent me-2">

                                                <i class="ti ti-file"></i>

                                            </span>

                                            <span>
                                                    ${file.fileName}
                                            </span>

                                        </div>

                                    </td>

                                    <td>
                                            ${file.documentId}
                                    </td>

                                    <td>

                                        <div class="d-flex align-items-center">

                                            <!-- View -->
                                            <a href="${pageContext.request.contextPath}${file.filePath}"
                                               target="_blank"
                                               class="btn btn-sm btn-light me-2"
                                               title="View">

                                                <i class="ti ti-eye"></i>

                                            </a>

                                            <!-- Download -->
                                            <a href="${pageContext.request.contextPath}${file.filePath}"
                                               download
                                               class="btn btn-sm btn-light me-2"
                                               title="Download">

                                                <i class="ti ti-download"></i>

                                            </a>

                                            <!-- Delete -->
                                            <a href="${pageContext.request.contextPath}/file-uploads?action=delete&id=${file.id}"
                                               class="btn btn-sm btn-light text-danger"
                                               onclick="return confirm('Are you sure you want to delete this document?');"
                                               title="Delete">

                                                <i class="ti ti-trash"></i>

                                            </a>

                                        </div>

                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>
            <!-- /My Documents -->

        </div>


        <!-- Footer -->
        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                HRMS
            </p>

            <p class="mb-0">
                Human Resource Management System
            </p>

        </div>

    </div>
    <!-- /Page Wrapper -->

</div>
<!-- /Main Wrapper -->


<!-- Scripts -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- Add More Upload Rows -->

<script>

    document.addEventListener("click", function (event) {

        if (event.target.closest(".add-row")) {

            const container =
                document.getElementById("documentRows");

            const firstRow =
                container.querySelector(".document-row");

            const newRow =
                firstRow.cloneNode(true);

            newRow.querySelector("select").value = "";

            newRow.querySelector("input[type='file']").value = "";

            newRow.querySelector(".add-row").innerHTML =
                '<i class="ti ti-trash"></i> Remove';

            newRow.querySelector(".add-row")
                .classList.remove("btn-light");

            newRow.querySelector(".add-row")
                .classList.add("btn-danger");

            newRow.querySelector(".add-row")
                .classList.add("remove-row");

            container.appendChild(newRow);
        }


        if (event.target.closest(".remove-row")) {

            const row =
                event.target.closest(".document-row");

            row.remove();

        }

    });

</script>


</body>

</html>