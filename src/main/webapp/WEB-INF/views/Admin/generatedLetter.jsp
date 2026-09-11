<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Generated Letter List</title>

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

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>

    <%@ include file="adminSidebar.jsp" %>


    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            Generated Letter List
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Admin
                            </li>

                            <li class="breadcrumb-item active">
                                Generated Letter List
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- ADD / GENERATE LETTER -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Generate Letter
                    </h5>

                </div>


                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/generated-letter"
                          enctype="multipart/form-data">


                        <div class="row">


                            <!-- EMPLOYEE -->

                            <div class="col-md-4">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Employee
                                    </label>

                                    <select name="userId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Employee
                                        </option>


                                        <c:forEach var="employee"
                                                   items="${employees}">

                                            <option value="${employee.userId}">

                                                    ${employee.firstName}
                                                    ${employee.lastName}
                                                (${employee.email})

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- LETTER NAME -->

                            <div class="col-md-4">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Letter Name
                                    </label>

                                    <input type="text"
                                           name="letterName"
                                           class="form-control"
                                           placeholder="Enter Letter Name"
                                           required>

                                </div>

                            </div>


                            <!-- LETTER FILE -->

                            <div class="col-md-4">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Letter File
                                    </label>

                                    <input type="file"
                                           name="letterFile"
                                           class="form-control"
                                           required>

                                </div>

                            </div>


                        </div>


                        <button type="submit"
                                class="btn btn-primary">

                            <i class="ti ti-plus me-1"></i>

                            Generate Letter

                        </button>


                    </form>

                </div>

            </div>


            <!-- GENERATED LETTER LIST -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Generated Letter List
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-hover datatable">

                            <thead>

                            <tr>

                                <th>
                                    #
                                </th>

                                <th>
                                    Employee
                                </th>

                                <th>
                                    Email
                                </th>

                                <th>
                                    Letter Name
                                </th>

                                <th>
                                    Attachment
                                </th>

                                <th>
                                    Generated Date
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="letter"
                                       items="${letters}"
                                       varStatus="status">

                                <tr>


                                    <!-- NUMBER -->

                                    <td>
                                            ${status.count}
                                    </td>


                                    <!-- EMPLOYEE -->

                                    <td>
                                            ${letter.employeeName}
                                    </td>


                                    <!-- EMAIL -->

                                    <td>
                                            ${letter.employeeEmail}
                                    </td>


                                    <!-- LETTER NAME -->

                                    <td>
                                            ${letter.letterName}
                                    </td>


                                    <!-- ATTACHMENT -->

                                    <td>

                                        <a href="${pageContext.request.contextPath}${letter.letterFile}"
                                           target="_blank">

                                            <i class="ti ti-file"></i>

                                            View File

                                        </a>

                                    </td>


                                    <!-- DATE -->

                                    <td>
                                            ${letter.generatedDate}
                                    </td>


                                    <!-- ACTION -->

                                    <td>


                                        <!-- VIEW -->

                                        <a href="${pageContext.request.contextPath}${letter.letterFile}"
                                           target="_blank"
                                           class="btn btn-sm btn-light me-1"
                                           title="View">

                                            <i class="ti ti-eye"></i>

                                        </a>


                                        <!-- DOWNLOAD -->

                                        <a href="${pageContext.request.contextPath}${letter.letterFile}"
                                           download
                                           class="btn btn-sm btn-light me-1"
                                           title="Download">

                                            <i class="ti ti-download"></i>

                                        </a>


                                        <!-- DELETE -->

                                        <a href="${pageContext.request.contextPath}/generated-letter?action=delete&id=${letter.generatedLetterId}"
                                           class="btn btn-sm btn-light text-danger"
                                           title="Delete"
                                           onclick="return confirm('Are you sure you want to delete this generated letter?');">

                                            <i class="ti ti-trash"></i>

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