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
          content="HRMS Company Letters">

    <meta name="keywords"
          content="HRMS, Company Letters">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>Company Letters</title>

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
        request.setAttribute("activeMenu", "companyLetters");
    %>
    <%@ include file="../common/employee-sidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Company Letters
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

                                Company Letters

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- ================= COMPANY LETTERS ================= -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Company Letters
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-hover datatable">

                            <thead>

                            <tr>

                                <th>
                                    Document ID
                                </th>

                                <th>
                                    Document Name
                                </th>

                                <th>
                                    Generated Date
                                </th>

                                <th>
                                    Attachment
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="letter"
                                       items="${letters}">

                                <tr>

                                    <td>
                                            ${letter.generatedLetterId}
                                    </td>


                                    <td>
                                            ${letter.letterName}
                                    </td>


                                    <td>
                                            ${letter.generatedDate}
                                    </td>


                                    <td>
                                            ${letter.letterFile}
                                    </td>


                                    <td>

                                        <a href="${pageContext.request.contextPath}${letter.letterFile}"
                                           target="_blank"
                                           class="btn btn-sm btn-light me-1"
                                           title="View">

                                            <i class="ti ti-eye"></i>

                                        </a>


                                        <a href="${pageContext.request.contextPath}${letter.letterFile}"
                                           download
                                           class="btn btn-sm btn-light"
                                           title="Download">

                                            <i class="ti ti-download"></i>

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

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


<!-- ================= SCRIPTS ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>
