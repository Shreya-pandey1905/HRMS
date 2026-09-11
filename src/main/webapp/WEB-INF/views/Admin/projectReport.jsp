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
          content="HRMS Project Report">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Project Report">

    <meta name="author"
          content="HRMS Team">

    <meta name="robots"
          content="noindex, nofollow">

    <title>HRMS Project Report</title>


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
                        Project Report
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                Reports
                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Project Report

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- ================= SUMMARY CARDS ================= -->

            <div class="row">

                <div class="col-lg-3 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <div class="d-flex align-items-center overflow-hidden mb-2">
                                <div class="ms-2 overflow-hidden">
                                    <p class="fs-12 fw-normal mb-1 text-truncate">Total Projects</p>
                                    <h4>${summary.totalProjects}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <div class="d-flex align-items-center overflow-hidden mb-2">
                                <div class="ms-2 overflow-hidden">
                                    <p class="fs-12 fw-normal mb-1 text-truncate">Active Projects</p>
                                    <h4>${summary.activeProjects}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <div class="d-flex align-items-center overflow-hidden mb-2">
                                <div class="ms-2 overflow-hidden">
                                    <p class="fs-12 fw-normal mb-1 text-truncate">Inactive Projects</p>
                                    <h4>${summary.inactiveProjects}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <div class="d-flex align-items-center overflow-hidden mb-2">
                                <div class="ms-2 overflow-hidden">
                                    <p class="fs-12 fw-normal mb-1 text-truncate">Overdue Projects</p>
                                    <h4>${summary.overdueProjects}</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>


            <!-- ================= CHART ================= -->

            <div class="card">

                <div class="card-header">
                    <h5 class="mb-0">Projects by Status</h5>
                </div>

                <div class="card-body">
                    <div id="project-chart" style="min-height:280px;"></div>
                </div>

            </div>


            <!-- ================= TABLE ================= -->

            <div class="card">

                <div class="card-header">
                    <h5 class="mb-0">Project List</h5>
                </div>

                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table datatable">
                            <thead class="thead-light">
                                <tr>
                                    <th>Project Id</th>
                                    <th>Project Name</th>
                                    <th>Client</th>
                                    <th>Manager</th>
                                    <th>Members</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Priority</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="row" items="${projectList}">
                                    <tr>
                                        <td>${row.projectId}</td>
                                        <td>${row.projectName}</td>
                                        <td>${row.clientName}</td>
                                        <td>${row.managerName}</td>
                                        <td>${row.members}</td>
                                        <td>
                                            <c:if test="${not empty row.startDate}">${fn:substring(row.startDate, 0, 10)}</c:if>
                                        </td>
                                        <td>
                                            <c:if test="${not empty row.endDate}">${fn:substring(row.endDate, 0, 10)}</c:if>
                                        </td>
                                        <td>${row.priority}</td>
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

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    if (typeof ApexCharts !== 'undefined') {

        new ApexCharts(document.querySelector("#project-chart"), {
            chart: {
                type: 'pie',
                height: 280
            },
            series: [${summary.activeProjects}, ${summary.inactiveProjects}],
            labels: ['Active', 'Inactive']
        }).render();
    }

</script>


</body>

</html>
