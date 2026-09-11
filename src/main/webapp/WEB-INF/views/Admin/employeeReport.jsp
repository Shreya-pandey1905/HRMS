<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Employee Report">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Employee Report">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Employee Report</title>


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


<div id="global-loader">

    <div class="page-loader"></div>

</div>


<div class="main-wrapper">


    <!-- ================= HEADER ================= -->

    <%@ include file="adminHeader.jsp" %>



    <!-- ================= SIDEBAR ================= -->

    <%@ include file="adminSidebar.jsp" %>


    <!-- ================= PAGE WRAPPER ================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE BREADCRUMB -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Employee Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Employee Report

                            </li>

                        </ol>

                    </nav>

                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                    <div class="mb-2">
                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                <i class="ti ti-file-export me-1"></i>Export
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= SUMMARY CARDS + CHART ================= -->
            <!-- Layout copied from the template's employee-report.html: stat
                 cards in a 2x2 grid on the left half, chart on the right half. -->

            <div class="row">

                <div class="col-xl-6 d-flex">
                    <div class="row flex-fill">

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-icon.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Total Employee</p>
                                            <h5>${summary.totalEmployees}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-success.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Active Employee</p>
                                            <h5>${summary.activeEmployees}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-info.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">New Employee</p>
                                            <h5>${summary.newEmployees}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="overflow-hidden d-flex mb-2 align-items-center">
                                        <span class="me-2"><img src="${pageContext.request.contextPath}/assets/img/reports-img/employee-report-danger.svg" alt="Img" class="img-fluid"></span>
                                        <div>
                                            <p class="fs-14 fw-normal mb-1 text-truncate">Inactive Employee</p>
                                            <h5>${summary.inactiveEmployees}</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0 pb-0">
                            <div class="d-flex flex-wrap justify-content-between align-items-center row-gap-2">
                                <div class="d-flex align-items-center">
                                    <span class="me-2"><i class="ti ti-chart-bar text-danger"></i></span>
                                    <h5>Employee</h5>
                                </div>
                                <div class="d-flex align-items-center">
                                    <p class="d-inline-flex align-items-center me-3 mb-0">
                                        <i class="ti ti-square-filled fs-12 text-success me-2"></i>Active Employees
                                    </p>
                                    <p class="d-inline-flex align-items-center mb-0">
                                        <i class="ti ti-square-filled fs-12 text-gray-1 me-2"></i>Inactive Employees
                                    </p>
                                </div>
                            </div>
                        </div>
                        <div class="card-body py-0">
                            <div id="employee-chart" style="min-height:280px;"></div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= TABLE ================= -->

            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5 class="mb-0">Employees List</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Active</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Inactive</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Recent</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Recently Added</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Descending</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table datatable">
                            <thead class="thead-light">
                                <tr>
                                    <th>Emp Id</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Department</th>
                                    <th>Phone</th>
                                    <th>Joining Date</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${employeeList}">
                                    <tr>
                                        <td>${row.userId}</td>
                                        <td>${row.employeeName}</td>
                                        <td>${row.email}</td>
                                        <td>${row.departmentName}</td>
                                        <td>${row.phoneNumber}</td>
                                        <td>
                                            <c:if test="${not empty row.dateOfJoining}">${fn:substring(row.dateOfJoining, 0, 10)}</c:if>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.status == 'Active'}">
                                                    <span class="badge badge-soft-success">${row.status}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-soft-danger">${row.status}</span>
                                                </c:otherwise>
                                            </c:choose>
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


<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<!-- Needed because this page has a "datatable" table, and must come
     BEFORE script.js: script.js calls $('.datatable').DataTable() as
     soon as it loads, so if the plugin isn't loaded yet that call
     throws and the page loader never gets hidden. -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    var employeeCategories = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            '${entry.key}'<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    var employeeActiveSeries = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            ${entry.value[0]}<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    var employeeInactiveSeries = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            ${entry.value[1]}<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    if (typeof ApexCharts !== 'undefined') {

        new ApexCharts(document.querySelector("#employee-chart"), {
            chart: {
                type: 'bar',
                height: 280
            },
            stroke: {
                curve: 'smooth'
            },
            series: [
                { name: 'Active Employees', data: employeeActiveSeries },
                { name: 'Inactive Employees', data: employeeInactiveSeries }
            ],
            xaxis: {
                categories: employeeCategories
            }
        }).render();
    }

</script>


</body>

</html>
