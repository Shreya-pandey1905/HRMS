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
          content="HRMS Task Report">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Task Report">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Task Report</title>


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
                        Task Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Task Report

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
                                    <a href="${pageContext.request.contextPath}/task-report?export=pdf" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
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
            <!-- Layout copied from the template's task-report.html: stat
                 cards in a 2x2 grid on the left half, chart + status
                 breakdown on the right half (same shape as Project Report). -->

            <div class="row">

                <div class="col-lg-6 col-md-6 d-flex">
                    <div class="row flex-fill">

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Total Tasks</span>
                                        <h5>${summary.totalTasks}</h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;height: 5px;">
                                        <div class="progress-bar bg-pink" style="width: 100%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Completed</span>
                                        <h5>${summary.completedTasks}</h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-valuenow="${summary.completedTasks}" aria-valuemin="0" aria-valuemax="${summary.totalTasks}" style="width: 100%;height: 5px;">
                                        <div class="progress-bar bg-success" style="width: ${summary.totalTasks > 0 ? (summary.completedTasks * 100 / summary.totalTasks) : 0}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Inprogress</span>
                                        <h5>${summary.inprogressTasks}</h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-valuenow="${summary.inprogressTasks}" aria-valuemin="0" aria-valuemax="${summary.totalTasks}" style="width: 100%;height: 5px;">
                                        <div class="progress-bar bg-warning" style="width: ${summary.totalTasks > 0 ? (summary.inprogressTasks * 100 / summary.totalTasks) : 0}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 col-md-6 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <div class="mb-2">
                                        <span class="fs-14 fw-normal text-truncate mb-1">Pending</span>
                                        <h5>${summary.pendingTasks}</h5>
                                    </div>
                                    <div class="progress" role="progressbar" aria-valuenow="${summary.pendingTasks}" aria-valuemin="0" aria-valuemax="${summary.totalTasks}" style="width: 100%;height: 5px;">
                                        <div class="progress-bar bg-purple" style="width: ${summary.totalTasks > 0 ? (summary.pendingTasks * 100 / summary.totalTasks) : 0}%"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="col-lg-6 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header border-0">
                            <div class="d-flex align-items-center">
                                <span class="me-2"><i class="ti ti-chart-pie text-danger"></i></span>
                                <h5>Tasks by Status</h5>
                            </div>
                        </div>
                        <div class="card-body pt-0">
                            <div class="row align-items-center">
                                <div class="col-md-6 d-flex justify-content-center">
                                    <div id="task-chart"></div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row gy-4">
                                        <div class="col-md-6">
                                            <p class="fs-16 fw-normal mb-0 text-gray-5">Completed</p>
                                            <p class="fs-20 fw-bold text-dark">${summary.completedTasks}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="fs-16 fw-normal mb-0 text-gray-5">Inprogress</p>
                                            <p class="fs-20 fw-bold text-dark">${summary.inprogressTasks}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="fs-16 fw-normal mb-0 text-gray-5">Pending</p>
                                            <p class="fs-20 fw-bold text-dark">${summary.pendingTasks}</p>
                                        </div>
                                        <div class="col-md-6">
                                            <p class="fs-16 fw-normal mb-0 text-gray-5">On Hold</p>
                                            <p class="fs-20 fw-bold text-dark">${summary.onholdTasks}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= TABLE ================= -->

            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                    <h5 class="mb-0">Tasks List</h5>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Priority</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskPriority('')">All</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskPriority('High')">High</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskPriority('Medium')">Medium</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskPriority('Low')">Low</a></li>
                            </ul>
                        </div>
                        <div class="dropdown me-3">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Select Status</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskStatus('')">All</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskStatus('Completed')">Completed</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskStatus('Inprogress')">Inprogress</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskStatus('Pending')">Pending</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="filterTaskStatus('Onhold')">On Hold</a></li>
                            </ul>
                        </div>
                        <div class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Recent</a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortTaskTable('recent')">Recently Added</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortTaskTable('asc')">Ascending</a></li>
                                <li><a href="javascript:void(0);" class="dropdown-item rounded-1" onclick="sortTaskTable('desc')">Descending</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

                <div class="card-body p-0">
                    <div class="custom-datatable-filter table-responsive">
                        <table class="table datatable">
                            <thead class="thead-light">
                                <tr>
                                    <th>Task Id</th>
                                    <th>Task Name</th>
                                    <th>Project Name</th>
                                    <th>Due Date</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${taskList}">
                                    <tr>
                                        <td>${row.taskId}</td>
                                        <td>${row.taskName}</td>
                                        <td>${row.projectName}</td>
                                        <td>
                                            <c:if test="${not empty row.deadline}">${fn:substring(row.deadline, 0, 10)}</c:if>
                                        </td>
                                        <td>${row.priority}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.status == 'Completed'}">
                                                    <span class="badge badge-soft-success">${row.status}</span>
                                                </c:when>
                                                <c:when test="${row.status == 'Inprogress'}">
                                                    <span class="badge badge-soft-warning">${row.status}</span>
                                                </c:when>
                                                <c:when test="${row.status == 'Pending'}">
                                                    <span class="badge badge-soft-purple">${row.status}</span>
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

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<!-- Needed because this page has a "datatable" table, and must come
     BEFORE script.js: script.js calls $('.datatable').DataTable() as
     soon as it loads, so if the plugin isn't loaded yet that call
     throws and the page loader never gets hidden. -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    if (typeof ApexCharts !== 'undefined') {

        new ApexCharts(document.querySelector("#task-chart"), {
            chart: {
                type: 'pie',
                height: 280
            },
            series: [${summary.completedTasks}, ${summary.inprogressTasks}, ${summary.pendingTasks}, ${summary.onholdTasks}],
            labels: ['Completed', 'Inprogress', 'Pending', 'On Hold']
        }).render();
    }

    // Priority is column 4, Status is column 5 in the Tasks List table.
    function filterTaskPriority(priority) {
        $('.datatable').DataTable().column(4).search(priority, false, false).draw();
    }

    function filterTaskStatus(status) {
        $('.datatable').DataTable().column(5).search(status, false, false).draw();
    }

    function sortTaskTable(direction) {
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
