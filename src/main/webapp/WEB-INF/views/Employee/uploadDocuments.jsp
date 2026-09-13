<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../common/personal-dashboard-data.jsp" %>
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

    <meta name="robots"
          content="noindex, nofollow">

    <title>Upload Documents - HRMS</title>

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


    <%
        request.setAttribute("activeMenu", "uploadDocuments");
    %>
    <%@ include file="../common/employee-sidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">

                        Upload Documents

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

                                Upload Documents

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


            <!-- ================= PENDING DOCUMENTS ================= -->

            <c:if test="${not empty pendingDocuments}">

                <div class="alert alert-warning d-flex align-items-center mb-4">

                    <i class="ti ti-alert-circle fs-24 me-3"></i>


                    <div>

                        <h6 class="mb-1">

                            Documents Required

                        </h6>


                        <p class="mb-0">

                            You have documents assigned by Admin
                            that need to be submitted.

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


            <!-- ================= UPLOAD DOCUMENTS ================= -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-1">

                        Upload Documents

                    </h5>


                    <p class="text-muted mb-0">

                        Upload one or more documents

                    </p>

                </div>


                <div class="card-body">


                    <form method="post"
                          action="${pageContext.request.contextPath}/file-uploads"
                          enctype="multipart/form-data">


                        <input type="hidden"
                               name="userId"
                               value="${userId}">


                        <div id="documentRows">


                            <!-- ================= FIRST ROW ================= -->

                            <div class="document-row border rounded p-3 mb-3">

                                <div class="row align-items-end">


                                    <!-- DOCUMENT TYPE -->

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


                                    <!-- FILE -->

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


                                    <!-- ADD / REMOVE BUTTONS -->

                                    <div class="col-md-2">

                                        <div class="d-flex gap-2">

                                            <!-- ADD BUTTON -->

                                            <button type="button"
                                                    class="btn btn-light border add-row"
                                                    title="Add Document">

                                                <span style="font-size:20px; font-weight:bold;">
                                                    +
                                                </span>

                                            </button>


                                            <!-- REMOVE BUTTON -->

                                            <button type="button"
                                                    class="btn btn-danger remove-row"
                                                    title="Remove Document"
                                                    style="display:none;">

                                                <span style="font-size:20px; font-weight:bold;">
                                                    −
                                                </span>

                                            </button>

                                        </div>

                                    </div>


                                </div>

                            </div>


                        </div>


                        <!-- ================= UPLOAD BUTTON ================= -->

                        <div class="text-end mt-3">

                            <button type="submit"
                                    class="btn btn-primary">

                                Upload Documents

                            </button>

                        </div>


                    </form>

                </div>

            </div>


        </div>


        <!-- ================= FOOTER ================= -->

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


<!-- ================= SCRIPTS ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- ================= ADD / REMOVE ROWS ================= -->

<script>

    document.addEventListener("click", function (event) {


        /* ================= ADD ROW ================= */

        const addButton =
            event.target.closest(".add-row");


        if (addButton) {


            const container =
                document.getElementById("documentRows");


            const firstRow =
                container.querySelector(".document-row");


            const newRow =
                firstRow.cloneNode(true);


            /* CLEAR DOCUMENT TYPE */

            const select =
                newRow.querySelector(
                    "select[name='documentId']"
                );


            if (select) {

                select.value = "";

            }


            /* CLEAR FILE */

            const fileInput =
                newRow.querySelector(
                    "input[type='file']"
                );


            if (fileInput) {

                fileInput.value = "";

            }


            /* SHOW REMOVE BUTTON */

            const removeButton =
                newRow.querySelector(".remove-row");


            if (removeButton) {

                removeButton.style.display =
                    "inline-block";

            }


            /* ADD BUTTON REMAINS AVAILABLE */

            const newAddButton =
                newRow.querySelector(".add-row");


            if (newAddButton) {

                newAddButton.style.display =
                    "inline-block";

            }


            container.appendChild(newRow);


            return;

        }


        /* ================= REMOVE ROW ================= */

        const removeButton =
            event.target.closest(".remove-row");


        if (removeButton) {


            const row =
                removeButton.closest(".document-row");


            const rows =
                document.querySelectorAll(
                    ".document-row"
                );


            /* DO NOT REMOVE LAST ROW */

            if (rows.length > 1) {

                row.remove();

            }


            return;

        }

    });

</script>


</body>

</html>
