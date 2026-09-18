<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employee Document List</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

</head>

<body>

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>
    <%@ include file="adminSidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">

            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="row align-items-center"
                     style="display:flex; width:100%;">

                    <div class="col">

                        <h3 class="page-title">
                            Employee Document List
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
                                Employee Document List
                            </li>

                        </ul>

                    </div>


                    <!-- ADD DOCUMENT BUTTON - RIGHT SIDE -->

                    <div class="col-auto"
                         style="margin-left:auto !important;">

                        <a href="${pageContext.request.contextPath}/employee-document-names?action=add"
                           class="btn btn-primary">

                            <i class="ti ti-plus"></i>

                            Add Document Name

                        </a>

                    </div>

                </div>

            </div>


            <!-- EMPLOYEE DOCUMENT ASSIGNMENT LIST -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Employee Document List
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-striped table-hover"
                               id="employeeDocumentListTable">

                            <thead>

                            <tr>

                                <th>
                                    Employee Name
                                </th>

                                <th>
                                    Document Name
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="assignment"
                                       items="${assignments}">

                                <tr>

                                    <td>
                                            ${assignment.employeeName}
                                    </td>

                                    <td>
                                            ${assignment.documentName}
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


<!-- JAVASCRIPT -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>

    $(document).ready(function () {

        $('#employeeDocumentListTable').DataTable({

            pageLength: 10,

            lengthMenu: [10, 25, 50, 100]

        });

    });

</script>

</body>

</html>