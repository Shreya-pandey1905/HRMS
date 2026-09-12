<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Employee Document</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

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
                            Add Employee Document
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
                                Add Employee Document
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- ADD EMPLOYEE DOCUMENT CARD -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Add Employee Document
                    </h5>

                </div>


                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/employee-document-names">

                        <div class="row">

                            <!-- EMPLOYEE NAME -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Employee Name
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
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- DOCUMENT NAME -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Document Name
                                    </label>

                                    <select name="documentId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Document
                                        </option>

                                        <c:forEach var="documentName"
                                                   items="${documentNames}">

                                            <option value="${documentName.id}">
                                                    ${documentName.docName}
                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>

                        </div>


                        <!-- ADD BUTTON -->

                        <button type="submit"
                                class="btn btn-primary">

                            <i class="ti ti-plus"></i>

                            Add

                        </button>

                    </form>

                </div>

            </div>

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