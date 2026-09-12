<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employee Documents - HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

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

    <%@ include file="adminHeader.jsp" %>

    <%@ include file="adminSidebar.jsp" %>


    <div class="page-wrapper">

        <div class="content">


            <!-- Page Header -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            Employee Documents
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
                                Employee Documents
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- Employee Documents Card -->

            <div class="card">

                <div class="card-header">

                    <div>

                        <h5 class="card-title mb-1">
                            Employee Uploaded Documents
                        </h5>

                        <p class="text-muted mb-0">
                            Documents uploaded by employees
                        </p>

                    </div>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-hover datatable">

                            <thead>

                            <tr>

                                <th>#</th>

                                <th>Employee</th>

                                <th>Email</th>

                                <th>Document Name</th>

                                <th>File</th>

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


                                    <!-- Employee -->

                                    <td>

                                        <div class="d-flex align-items-center">

                                            <span class="avatar avatar-sm bg-primary-transparent me-2">

                                                <i class="ti ti-user"></i>

                                            </span>

                                            <span>
                                                    ${file.employeeName}
                                            </span>

                                        </div>

                                    </td>


                                    <!-- Email -->

                                    <td>
                                            ${file.employeeEmail}
                                    </td>


                                    <!-- Document Name -->

                                    <td>
                                            ${file.documentName}
                                    </td>


                                    <!-- File -->

                                    <td>

                                        <span class="text-muted">

                                            <i class="ti ti-file me-1"></i>

                                            ${file.fileName}

                                        </span>

                                    </td>


                                    <!-- Actions -->

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

                                            <a href="${pageContext.request.contextPath}/admin-employee-documents?action=delete&id=${file.id}"
                                               class="btn btn-sm btn-light text-danger"
                                               title="Delete"
                                               onclick="return confirm('Are you sure you want to delete this employee document?');">

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

</div>


<!-- Scripts -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


</body>

</html>