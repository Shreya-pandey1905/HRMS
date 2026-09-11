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
          content="HRMS Attendance Report">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Attendance Report">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Attendance Report</title>


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
                        Attendance Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Attendance Report

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
            <!-- Layout copied from the template's attendance-report.html: stat
                 cards in a 2x2 grid on the left half, chart on the right half. -->

            <div class="row">

                <div class="col-xl-6">
                    <div class="row">

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center overflow-hidden mb-2">
                                        <div class="attendence-icon">
                                            <span><i class="ti ti-calendar text-primary"></i></span>
                                        </div>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="fs-12 fw-normal mb-1 text-truncate">Total Days</p>
                                            <h4>${summary.totalDays}</h4>
                                        </div>
                                    </div>
                                    <div class="attendance-report-bar mb-2">
                                        <div class="progress" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="height: 5px;">
                                            <div class="progress-bar bg-success" style="width: 100%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center overflow-hidden mb-2">
                                        <div class="attendence-icon">
                                            <span><i class="ti ti-calendar text-success"></i></span>
                                        </div>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="fs-12 fw-normal mb-1 text-truncate">Total Present</p>
                                            <h4>${summary.totalPresent}</h4>
                                        </div>
                                    </div>
                                    <div class="attendance-report-bar mb-2">
                                        <div class="progress" role="progressbar" aria-valuenow="${summary.totalPresent}" aria-valuemin="0" aria-valuemax="${summary.totalDays}" style="height: 5px;">
                                            <div class="progress-bar bg-success" style="width: ${summary.totalDays > 0 ? (summary.totalPresent * 100 / summary.totalDays) : 0}%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center overflow-hidden mb-2">
                                        <div class="attendence-icon">
                                            <span><i class="ti ti-calendar text-danger"></i></span>
                                        </div>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="fs-12 fw-normal mb-1 text-truncate">Total Absent</p>
                                            <h4>${summary.totalAbsent}</h4>
                                        </div>
                                    </div>
                                    <div class="attendance-report-bar mb-2">
                                        <div class="progress" role="progressbar" aria-valuenow="${summary.totalAbsent}" aria-valuemin="0" aria-valuemax="${summary.totalDays}" style="height: 5px;">
                                            <div class="progress-bar bg-danger" style="width: ${summary.totalDays > 0 ? (summary.totalAbsent * 100 / summary.totalDays) : 0}%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="d-flex align-items-center overflow-hidden mb-2">
                                        <div class="attendence-icon">
                                            <span><i class="ti ti-calendar text-warning"></i></span>
                                        </div>
                                        <div class="ms-2 overflow-hidden">
                                            <p class="fs-12 fw-normal mb-1 text-truncate">Total Half Day</p>
                                            <h4>${summary.totalHalfDay}</h4>
                                        </div>
                                    </div>
                                    <div class="attendance-report-bar mb-2">
                                        <div class="progress" role="progressbar" aria-valuenow="${summary.totalHalfDay}" aria-valuemin="0" aria-valuemax="${summary.totalDays}" style="height: 5px;">
                                            <div class="progress-bar bg-warning" style="width: ${summary.totalDays > 0 ? (summary.totalHalfDay * 100 / summary.totalDays) : 0}%"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-xl-6">
                    <div class="card">
                        <div class="card-header border-0 pb-0">
                            <div class="d-flex flex-wrap justify-content-between align-items-center">
                                <div class="d-flex align-items-center">
                                    <span class="me-2"><i class="ti ti-chart-line text-danger"></i></span>
                                    <h5>Attendance</h5>
                                </div>
                                <div class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-sm fs-12 btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                        This Year
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-2">
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">2024</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">2023</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body py-0 px-2">
                            <div id="attendance-chart" style="min-height:280px;"></div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= TABLE ================= -->

            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5 class="mb-0">Employee Attendance</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        <div class="me-3">
                            <div class="input-icon-end position-relative">
                                <input type="text" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy">
                                <span class="input-icon-addon"><i class="ti ti-chevron-down"></i></span>
                            </div>
                        </div>
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Present</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Absent</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Half Day</a></li>
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
                                    <th>Attendance Id</th>
                                    <th>Employee</th>
                                    <th>Date</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Lunch In</th>
                                    <th>Lunch Out</th>
                                    <th>Working Hours</th>
                                    <th>Overtime Hours</th>
                                    <th>Break Hours</th>
                                    <th>Late (min)</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${attendanceList}">
                                    <tr>
                                        <td>${row.attendanceId}</td>
                                        <td>${row.employeeName}</td>
                                        <td>
                                            <c:if test="${not empty row.date}">${fn:substring(row.date, 0, 10)}</c:if>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty row.checkIn}">${fn:substring(row.checkIn, 11, 16)}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty row.checkOut}">${fn:substring(row.checkOut, 11, 16)}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty row.lunchIn}">${fn:substring(row.lunchIn, 11, 16)}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${not empty row.lunchOut}">${fn:substring(row.lunchOut, 11, 16)}</c:when>
                                                <c:otherwise>-</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${row.workingHours}</td>
                                        <td>${row.overtimeHours}</td>
                                        <td>${row.breakHours}</td>
                                        <td>${row.late}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.status == 'Present'}">
                                                    <span class="badge badge-soft-success">${row.status}</span>
                                                </c:when>
                                                <c:when test="${row.status == 'Absent'}">
                                                    <span class="badge badge-soft-danger">${row.status}</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge badge-soft-warning">${row.status}</span>
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

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<!-- Needed because this page has a "datatable" table, and must come
     BEFORE script.js: script.js calls $('.datatable').DataTable() as
     soon as it loads, so if the plugin isn't loaded yet that call
     throws and the page loader never gets hidden. -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    var attendanceCategories = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            '${entry.key}'<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    var attendancePresentSeries = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            ${entry.value[0]}<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    var attendanceAbsentSeries = [
        <c:forEach var="entry" items="${chartData}" varStatus="loop">
            ${entry.value[1]}<c:if test="${!loop.last}">,</c:if>
        </c:forEach>
    ];

    if (typeof ApexCharts !== 'undefined') {

        new ApexCharts(document.querySelector("#attendance-chart"), {
            chart: {
                type: 'line',
                height: 280
            },
            series: [
                { name: 'Present', data: attendancePresentSeries },
                { name: 'Absent', data: attendanceAbsentSeries }
            ],
            xaxis: {
                categories: attendanceCategories
            }
        }).render();
    }

</script>


</body>

</html>
