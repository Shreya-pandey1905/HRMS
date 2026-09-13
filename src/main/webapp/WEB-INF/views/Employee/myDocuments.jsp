<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ include file="../common/personal-dashboard-data.jsp" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS My Documents">

    <meta name="keywords"
          content="HRMS, Documents, Employee Documents">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

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
        request.setAttribute("activeMenu", "myDocuments");
    %>
    <%@ include file="../common/employee-sidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">


            <!-- ================= PAGE HEADER ================= -->

            <div class="page-header">

                <div class="row align-items-center">


                    <div class="col">

                        <h3 class="page-title">

                            My Documents

                        </h3>


                        <ul class="breadcrumb">


                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>


                            <li class="breadcrumb-item">

                                Documents

                            </li>


                            <li class="breadcrumb-item active">

                                My Documents

                            </li>


                        </ul>

                    </div>

                </div>

            </div>


            <!-- ================= DOCUMENT LIST ================= -->

            <div class="card">


                <div class="card-header">

                    <h5 class="card-title mb-0">

                        My Uploaded Documents

                    </h5>

                </div>


                <div class="card-body">


                    <div class="table-responsive">


                        <table class="table table-striped table-hover"
                               id="myDocumentsTable">


                            <thead>

                            <tr>

                                <th>
                                    #
                                </th>

                                <th>
                                    File Name
                                </th>

                                <th>
                                    Document ID
                                </th>

                                <th>
                                    Action
                                </th>

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


                                            <!-- VIEW -->

                                            <a href="${pageContext.request.contextPath}${file.filePath}"
                                               target="_blank"
                                               class="btn btn-sm btn-light me-2"
                                               title="View">

                                                <i class="ti ti-eye"></i>

                                            </a>


                                            <!-- DOWNLOAD -->

                                            <a href="${pageContext.request.contextPath}${file.filePath}"
                                               download
                                               class="btn btn-sm btn-light me-2"
                                               title="Download">

                                                <i class="ti ti-download"></i>

                                            </a>


                                            <!-- DELETE -->

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

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>
