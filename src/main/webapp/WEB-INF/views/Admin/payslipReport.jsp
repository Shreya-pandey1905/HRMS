<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description"
          content="HRMS Payslip Report">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Payslip Report">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Payslip Report</title>


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
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

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
                        Payslip Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Payslip Report

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
                                    <a href="${pageContext.request.contextPath}/payslip-report?export=pdf" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
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
            <!-- Layout adapted from the template's payslip-report.html: since
                 there is no "last week" history or payment-type data in this
                 project's schema, the 4 cards show real totals derived from
                 the payslip list (count/sum/max/min) instead of the
                 template's made-up percentage-change figures. -->

            <div class="row">

                <div class="col-xl-6 d-flex">
                    <div class="row flex-fill">

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Total Payslips</span>
                                        <h5><fmt:formatNumber value="${summary.totalPayslips}" maxFractionDigits="0"/></h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Total Paid Amount</span>
                                        <h5>$<fmt:formatNumber value="${summary.totalPaidAmount}" maxFractionDigits="2"/></h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Highest Paid</span>
                                        <h5>$<fmt:formatNumber value="${summary.highestPaid}" maxFractionDigits="2"/></h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Lowest Paid</span>
                                        <h5>$<fmt:formatNumber value="${summary.lowestPaid}" maxFractionDigits="2"/></h5>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0 pb-0">
                            <div class="d-flex align-items-center">
                                <span class="me-2"><i class="ti ti-chart-area-line text-danger"></i></span>
                                <h5>Paid Amount by Employee</h5>
                            </div>
                        </div>
                        <div class="card-body py-0">
                            <div id="payslip-chart" style="min-height:280px;"></div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= TABLE ================= -->

            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5 class="mb-0">Payslip List</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Recent</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortPayslipTable('recent')">Recently Added</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortPayslipTable('asc')">Ascending</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortPayslipTable('desc')">Descending</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">
                        <table class="table datatable">
                            <thead class="thead-light">
                                <tr>
                                    <th>Id</th>
                                    <th>Employee</th>
                                    <th>Paid Amount</th>
                                    <th>Paid Month</th>
                                    <th>Paid Year</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${payslipList}">
                                    <tr>
                                        <td>${row.payslipId}</td>
                                        <td>${row.employeeName}</td>
                                        <td>$<fmt:formatNumber value="${row.paidAmount}" maxFractionDigits="2"/></td>
                                        <td>${row.paidMonth}</td>
                                        <td>${row.paidYear}</td>
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

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<!-- Needed because this page has a "datatable" table, and must come
     BEFORE script.js: script.js calls $('.datatable').DataTable() as
     soon as it loads, so if the plugin isn't loaded yet that call
     throws and the page loader never gets hidden. -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    var payslipCategories = [
        <c:forEach var="row" items="${payslipList}" varStatus="loop">
            '${fn:escapeXml(row.employeeName)}'<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    var payslipAmountSeries = [
        <c:forEach var="row" items="${payslipList}" varStatus="loop">
            ${row.paidAmount}<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    if (typeof ApexCharts !== 'undefined') {

        new ApexCharts(document.querySelector("#payslip-chart"), {
            chart: {
                type: 'bar',
                height: 280
            },
            series: [{ name: 'Paid Amount', data: payslipAmountSeries }],
            xaxis: {
                categories: payslipCategories
            }
        }).render();
    }

    function sortPayslipTable(direction) {
        var table = $('.datatable').DataTable();
        if (direction === 'asc') {
            table.order([1, 'asc']).draw();
        } else if (direction === 'desc') {
            table.order([1, 'desc']).draw();
        } else {
            table.order([0, 'desc']).draw();
        }
    }

</script>


</body>

</html>
