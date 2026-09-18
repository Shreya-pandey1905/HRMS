<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Manager Tasks">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Manager Dashboard">

    <meta name="author" content="HRMS Team">

    <meta name="robots" content="noindex, nofollow">

    <title>HRMS Manager Tasks</title>


    <!-- Favicon -->
    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">


    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>


    <!-- CSS -->
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

</head>


<body>


<!-- Default Dashboard Values -->
<c:set var="totalEmployees" value="0"/>
<c:set var="presentToday" value="0"/>
<c:set var="onLeave" value="0"/>
<c:set var="pendingLeaves" value="0"/>


<!-- Global Loader -->
<div id="global-loader">

    <div class="page-loader"></div>

</div>


<!-- Main Wrapper -->
<div class="main-wrapper">


    <!-- ========================================================= -->
    <!-- HEADER -->
    <!-- ========================================================= -->

    <div class="header">

        <div class="main-header">


            <!-- Header Logo -->
            <div class="header-left">

                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>


                <a href="${pageContext.request.contextPath}/manager/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <!-- Mobile Button -->
            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">

                    <span></span>
                    <span></span>
                    <span></span>

                </span>

            </a>


            <!-- Header User -->
            <div class="header-user">

                <div class="nav user-menu nav-list">


                    <div class="me-auto d-flex align-items-center"
                         id="header-search">


                        <!-- Sidebar Toggle -->
                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <!-- Search -->
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


                        <!-- Settings -->
                        <a href="javascript:void(0);"
                           class="btn btn-menubar">

                            <i class="ti ti-settings-cog"></i>

                        </a>

                    </div>

                </div>

            </div>


            <!-- Mobile User Menu -->
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

    <!-- Sidebar -->
        <jsp:include page="/WEB-INF/views/common/manager-sidebar.jsp" />

    <!-- ========================================================= -->
    <!-- PAGE WRAPPER -->
    <!-- ========================================================= -->

    <div class="page-wrapper">
            <div class="content">
            <c:if test="${not empty sessionScope.successMessage}">
                <div class="alert alert-success alert-dismissible fade show"
                     role="alert">

                    <i class="ti ti-check me-2"></i>
                    ${sessionScope.successMessage}

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="alert"
                            aria-label="Close">
                    </button>

                </div>

                <c:remove var="successMessage" scope="session"/>
            </c:if>

                <!-- Page Header -->
                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                    <div class="my-auto mb-2">
                        <h2 class="mb-1">Tasks</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=dashboard"><i class="ti ti-smart-home"></i></a></li>
                                <li class="breadcrumb-item">Manager</li>
                                <li class="breadcrumb-item active" aria-current="page">Tasks</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="my-xl-auto right-content d-flex align-items-center">
                        <div class="mb-2">
                            <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=addTask"
                               class="btn btn-primary d-flex align-items-center">
                                <i class="ti ti-circle-plus me-2"></i>Add Task
                            </a>
                        </div>
                        <div class="head-icons ms-2 mb-0">
                            <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header"><i class="ti ti-chevrons-up"></i></a>
                        </div>
                    </div>
                </div>

                <!-- Priority / Date -->
                <div class="row align-items-center mb-3">
                    <div class="col-lg-6">
                        <div class="d-flex align-items-center flex-wrap row-gap-3">
                            <h6 class="me-2 mb-0">Priority</h6>

                            <ul class="nav nav-pills border d-inline-flex p-1 rounded bg-light todo-tabs">
                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'All' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=taskDetails&priority=All">
                                        All
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'High' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=taskDetails&priority=High">
                                        High
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'Medium' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=taskDetails&priority=Medium">
                                        Medium
                                    </a>
                                </li>

                                <li class="nav-item">
                                    <a class="nav-link btn btn-sm ${selectedPriority == 'Low' ? 'active' : ''}"
                                       href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=taskDetails&priority=Low">
                                        Low
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="col-lg-6">
                        <div class="d-flex align-items-center justify-content-lg-end">
                            <div class="input-icon w-120 position-relative">
                                <span class="input-icon-addon">
                                    <i class="ti ti-calendar"></i>
                                </span>
                                <input type="text"
                                       class="form-control datetimepicker"
                                       placeholder="mm/dd/yyyy">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">

                    <!-- LEFT SIDE: PROJECTS -->
                    <div class="col-xl-4">

                        <c:choose>

                            <c:when test="${not empty taskProjects}">

                                <c:forEach var="project" items="${taskProjects}">

                                    <c:set var="projectTaskCount" value="0"/>
                                    <c:set var="completedTaskCount" value="0"/>

                                    <c:forEach var="task" items="${tasks}">
                                        <c:if test="${task.projectId == project.projectId}">
                                            <c:set var="projectTaskCount"
                                                   value="${projectTaskCount + 1}"/>

                                            <c:if test="${task.status == 'Completed'}">
                                                <c:set var="completedTaskCount"
                                                       value="${completedTaskCount + 1}"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                    <div class="card">
                                        <div class="card-body">

                                            <div class="d-flex align-items-center pb-3 mb-3 border-bottom">

                                                <a href="javascript:void(0);"
                                                   class="flex-shrink-0 me-2">
                                                    <img src="${pageContext.request.contextPath}/assets/img/social/project-01.svg"
                                                         alt="Project">
                                                </a>

                                                <div>
                                                    <h6 class="mb-1">
                                                        ${project.projectName}
                                                    </h6>

                                                    <div class="d-flex align-items-center">
                                                        <span>
                                                            ${projectTaskCount} tasks
                                                        </span>

                                                        <span class="mx-1">
                                                            <i class="ti ti-point-filled text-primary"></i>
                                                        </span>

                                                        <span>
                                                            ${completedTaskCount} Completed
                                                        </span>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="row">

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <span class="mb-1 d-block">Deadline</span>

                                                        <p class="text-dark mb-0">
                                                            <c:choose>
                                                                <c:when test="${not empty project.endDate}">
                                                                    ${project.endDate.toLocalDate()}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    -
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </p>
                                                    </div>
                                                </div>

                                                <div class="col-sm-6">
                                                    <div class="mb-3">
                                                        <span class="mb-1 d-block">Value</span>

                                                        <p class="text-dark mb-0">
                                                            ${project.projectValue}
                                                        </p>
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="bg-light p-2">
                                                <div class="row align-items-center">

                                                    <div class="col-6">
                                                        <span class="fw-medium d-flex align-items-center">
                                                            <i class="ti ti-clock text-primary me-2"></i>
                                                            Project
                                                        </span>
                                                    </div>

                                                    <div class="col-6">

                                                        <c:set var="completionPercent" value="0"/>

                                                        <c:if test="${projectTaskCount > 0}">
                                                            <c:set var="completionPercent"
                                                                   value="${(completedTaskCount * 100) / projectTaskCount}"/>
                                                        </c:if>

                                                        <small class="text-dark">
                                                            ${completionPercent}% Completed
                                                        </small>

                                                        <div class="progress progress-xs mt-1">
                                                            <div class="progress-bar"
                                                                 role="progressbar"
                                                                 style="width:${completionPercent}%">
                                                            </div>
                                                        </div>

                                                    </div>

                                                </div>
                                            </div>

                                        </div>
                                    </div>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <div class="card">
                                    <div class="card-body text-center py-5">
                                        <i class="ti ti-clipboard-off fs-36 text-muted mb-3"></i>
                                        <h6>No Projects</h6>
                                        <p class="text-muted mb-0">
                                            No projects have tasks for the selected priority.
                                        </p>
                                    </div>
                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>


                    <!-- RIGHT SIDE: TASKS -->
                    <div class="col-xl-8">

                        <c:choose>

                            <c:when test="${not empty tasks}">

                                <c:forEach var="project" items="${taskProjects}">

                                    <c:set var="projectTaskCount" value="0"/>
                                    <c:set var="completedTaskCount" value="0"/>

                                    <c:forEach var="task" items="${tasks}">
                                        <c:if test="${task.projectId == project.projectId}">
                                            <c:set var="projectTaskCount"
                                                   value="${projectTaskCount + 1}"/>

                                            <c:if test="${task.status == 'Completed'}">
                                                <c:set var="completedTaskCount"
                                                       value="${completedTaskCount + 1}"/>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>

                                    <c:if test="${projectTaskCount > 0}">

                                        <div class="card">
                                            <div class="card-body">

                                                <h5 class="mb-3">
                                                    ${project.projectName}
                                                </h5>

                                                <div class="bg-light p-3 rounded">

                                                    <span class="d-block mb-1">
                                                        Tasks Done
                                                    </span>

                                                    <h4 class="mb-2">
                                                        ${completedTaskCount} / ${projectTaskCount}
                                                    </h4>

                                                    <c:set var="completionPercent" value="0"/>

                                                    <c:if test="${projectTaskCount > 0}">
                                                        <c:set var="completionPercent"
                                                               value="${(completedTaskCount * 100) / projectTaskCount}"/>
                                                    </c:if>

                                                    <div class="progress progress-xs mb-2">
                                                        <div class="progress-bar"
                                                             role="progressbar"
                                                             style="width:${completionPercent}%">
                                                        </div>
                                                    </div>

                                                    <p class="mb-0">
                                                        ${completionPercent}% Completed
                                                    </p>

                                                </div>

                                            </div>
                                        </div>


                                        <c:forEach var="task" items="${tasks}">

                                            <c:if test="${task.projectId == project.projectId}">

                                                <div class="card">
                                                    <div class="card-body">

                                                        <div class="d-flex align-items-center justify-content-between">

                                                            <div class="d-flex align-items-center">

                                                                <i class="ti ti-grid-dots me-2"></i>

                                                                <c:choose>
                                                                    <c:when test="${task.priority == 'High'}">
                                                                        <i class="ti ti-star-filled text-danger me-2"></i>
                                                                    </c:when>

                                                                    <c:when test="${task.priority == 'Medium'}">
                                                                        <i class="ti ti-star-filled text-warning me-2"></i>
                                                                    </c:when>

                                                                    <c:otherwise>
                                                                        <i class="ti ti-star text-muted me-2"></i>
                                                                    </c:otherwise>
                                                                </c:choose>

                                                                <h6 class="mb-0">
                                                                    ${task.title}
                                                                </h6>

                                                            </div>

                                                            <div class="d-flex align-items-center">

                                                                <c:if test="${not empty task.deadline}">
                                                                    <span class="badge bg-transparent-dark text-dark rounded-pill me-2">
                                                                        <i class="ti ti-calendar me-1"></i>
                                                                        ${task.deadline.toLocalDate()}
                                                                    </span>
                                                                </c:if>

                                                                <span class="badge badge-skyblue">
                                                                    ${task.status}
                                                                </span>

                                                            </div>

                                                        </div>

                                                        <c:if test="${not empty task.description}">
                                                            <p class="text-muted mt-3 mb-0">
                                                                ${task.description}
                                                            </p>
                                                        </c:if>

                                                         <div class="d-flex align-items-center mt-3 mb-2">
                                                                                                                    <i class="ti ti-user me-2"></i>
                                                                                                                    <span>${task.employeeName}</span>
                                                                                                                </div>

                                                    </div>
                                                </div>

                                            </c:if>

                                        </c:forEach>

                                    </c:if>

                                </c:forEach>

                            </c:when>

                            <c:otherwise>

                                <div class="card">
                                    <div class="card-body text-center py-5">

                                        <i class="ti ti-clipboard-off fs-36 text-muted mb-3"></i>

                                        <h5>No Tasks Found</h5>

                                        <p class="text-muted mb-0">
                                            There are no tasks for the selected priority.
                                        </p>

                                    </div>
                                </div>

                            </c:otherwise>

                        </c:choose>

                    </div>

                </div>
            </div>

            <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
                <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
                <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
            </div>
        </div>
        <!-- /Page Wrapper -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Daterangepikcer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Select2 JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

    <!-- Summernote JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>

    <!-- Bootstrap Tagsinput JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/assets/js/todo.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>



</body>
</html>

```