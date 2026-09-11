<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<%@ page import="java.util.*" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="models.Employees.User" %>
<%@ page import="serviceImplementer.Employee.EmployeeServiceImpl" %>
<%@ page import="serviceImplementer.Projects.ProjectServiceImpl" %>
<%!
    String toProfileUrl(String contextPath, String profilePicture) {
        if (profilePicture == null) {
            return null;
        }
        String path = profilePicture.trim().replace('\\', '/');
        if (path.isEmpty()) {
            return null;
        }
        if (path.startsWith("http://") || path.startsWith("https://")) {
            return path;
        }
        while (path.startsWith("/")) {
            path = path.substring(1);
        }
        if (!path.contains("/")) {
            path = "Content/uploads/" + path;
        }
        StringBuilder url = new StringBuilder(contextPath);
        for (String part : path.split("/")) {
            if (part.isEmpty()) {
                continue;
            }
            url.append('/').append(URLEncoder.encode(part, StandardCharsets.UTF_8).replace("+", "%20"));
        }
        return url.toString();
    }

    String toJsonArray(Collection<String> values) {
        StringBuilder sb = new StringBuilder("[");
        boolean first = true;
        for (String value : values) {
            if (!first) {
                sb.append(',');
            }
            first = false;
            sb.append('"').append(value.replace("\\", "\\\\").replace("\"", "\\\"")).append('"');
        }
        sb.append(']');
        return sb.toString();
    }
%>
<%
    List<User> dashEmployees = Collections.emptyList();
    try {
        dashEmployees = new EmployeeServiceImpl().getAllEmployees();
        if (dashEmployees == null) {
            dashEmployees = Collections.emptyList();
        }
    } catch (Exception ignored) {
        dashEmployees = Collections.emptyList();
    }

    int activeCount = 0;
    int inactiveCount = 0;
    Map<String, Integer> deptCounts = new LinkedHashMap<>();
    for (User emp : dashEmployees) {
        if (emp.getStatus() != null && emp.getStatus().equalsIgnoreCase("Active")) {
            activeCount++;
        } else {
            inactiveCount++;
        }
        String dept = emp.getDepartmentName();
        if (dept == null || dept.trim().isEmpty()) {
            dept = "Not Assigned";
        }
        deptCounts.put(dept, deptCounts.getOrDefault(dept, 0) + 1);
    }

    int projectCount = 0;
    try {
        projectCount = new ProjectServiceImpl().getProjectCount();
    } catch (Exception ignored) {
        projectCount = 0;
    }

    List<String> deptLabels = new ArrayList<>(deptCounts.keySet());
    List<String> deptValues = new ArrayList<>();
    for (String label : deptLabels) {
        deptValues.add(String.valueOf(deptCounts.get(label)));
    }

    request.setAttribute("dashEmployees", dashEmployees);
    request.setAttribute("dashEmployeeCount", dashEmployees.size());
    request.setAttribute("dashActiveCount", activeCount);
    request.setAttribute("dashInactiveCount", inactiveCount);
    request.setAttribute("dashProjectCount", projectCount);
    request.setAttribute("deptLabelsJson", toJsonArray(deptLabels));
    request.setAttribute("deptValuesJson", "[" + String.join(",", deptValues) + "]");
    request.setAttribute("ctxPath", request.getContextPath());
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Admin Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Admin Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">
    <title>HRMS Admin Dashboard</title>

    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

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

    <%@ include file="adminHeader.jsp" %>
    <%@ include file="adminSidebar.jsp" %>

    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Admin Dashboard</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item">Dashboard</li>
                            <li class="breadcrumb-item active" aria-current="page">Admin Dashboard</li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                    <div class="me-2 mb-2">
                        <div class="dropdown">
                            <a href="javascript:void(0);"
                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                               data-bs-toggle="dropdown">
                                <i class="ti ti-file-export me-1"></i>Export
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end p-3">
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                                    </a>
                                </li>
                                <li>
                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                        <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="input-icon mb-2 position-relative">
                        <span class="input-icon-addon">
                            <i class="ti ti-calendar text-gray-9"></i>
                        </span>
                        <input type="text" class="form-control date-range bookingrange"
                               placeholder="dd/mm/yyyy - dd/mm/yyyy">
                    </div>
                    <div class="ms-2 head-icons">
                        <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top"
                           title="Collapse" id="collapse-header">
                            <i class="ti ti-chevrons-up"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Welcome Wrap -->
            <div class="card border-0">
                <div class="card-body d-flex align-items-center justify-content-between flex-wrap pb-1">
                    <div class="d-flex align-items-center mb-3">
                        <span class="avatar avatar-xl flex-shrink-0">
                            <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-31.jpg"
                                 class="rounded-circle" alt="img">
                        </span>
                        <div class="ms-3">

                <h3 class="mb-2">
                    Welcome Back,
                    <c:choose>
                        <c:when test="${not empty sessionScope.firstName}">
                            ${sessionScope.firstName}
                        </c:when>
                        <c:otherwise>
                            Employee
                        </c:otherwise>
                    </c:choose>
                </h3>


                            <p>
                                You have
                                <span class="text-primary text-decoration-underline">0</span>
                                Pending Approvals &amp;
                                <span class="text-primary text-decoration-underline">0</span>
                                Leave Requests
                            </p>
                        </div>
                    </div>
                    <div class="d-flex align-items-center flex-wrap mb-1">
                        <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=addProject"
                           class="btn btn-secondary btn-md me-2 mb-2">
                            <i class="ti ti-square-rounded-plus me-1"></i>Add Project
                        </a>
                        <a href="javascript:void(0);" class="btn btn-primary btn-md mb-2">
                            <i class="ti ti-square-rounded-plus me-1"></i>Add Requests
                        </a>
                    </div>
                </div>
            </div>

            <div class="row">

                <!-- Widget Info -->
                <div class="col-xxl-8 d-flex">
                    <div class="row flex-fill">
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-primary mb-2">
                                        <i class="ti ti-calendar-share fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Attendance Overview</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No attendance data</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-secondary mb-2">
                                        <i class="ti ti-browser fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Project's</h6>
                                    <h3 class="mb-3">${dashProjectCount}</h3>
                                    <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails"
                                       class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-info mb-2">
                                        <i class="ti ti-users-group fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Clients</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No client data</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-pink mb-2">
                                        <i class="ti ti-checklist fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total No of Tasks</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No task summary</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-purple mb-2">
                                        <i class="ti ti-moneybag fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Earnings</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No payroll data</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-danger mb-2">
                                        <i class="ti ti-browser fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Profit This Week</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No payroll data</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-success mb-2">
                                        <i class="ti ti-users-group fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Job Applicants</h6>
                                    <h3 class="mb-3">—</h3>
                                    <span class="text-muted fs-12">No applicant data</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3 d-flex">
                            <div class="card flex-fill">
                                <div class="card-body">
                                    <span class="avatar rounded-circle bg-dark mb-2">
                                        <i class="ti ti-user-star fs-16"></i>
                                    </span>
                                    <h6 class="fs-13 fw-medium text-default mb-1">Total Employees</h6>
                                    <h3 class="mb-3">${dashEmployeeCount}</h3>
                                    <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                                       class="link-default">View All</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Employees By Department -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employees By Department</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);"
                                   class="btn btn-white border btn-sm d-inline-flex align-items-center"
                                   data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>This Week
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Last Week</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div id="emp-department-live"></div>
                            <p class="fs-13 mb-0">
                                <i class="ti ti-circle-filled me-2 fs-8 text-primary"></i>
                                Based on current employee records
                                (<span class="fw-bold">${dashEmployeeCount}</span> total)
                            </p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <!-- Employee Status -->
                <div class="col-xxl-4 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employee Status</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);"
                                   class="btn btn-white border btn-sm d-inline-flex align-items-center"
                                   data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>This Week
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="d-flex align-items-center justify-content-between mb-1">
                                <p class="fs-13 mb-3">Total Employee</p>
                                <h3 class="mb-3">${dashEmployeeCount}</h3>
                            </div>
                            <c:set var="activePct" value="${dashEmployeeCount > 0 ? (dashActiveCount * 100 / dashEmployeeCount) : 0}"/>
                            <c:set var="inactivePct" value="${dashEmployeeCount > 0 ? (dashInactiveCount * 100 / dashEmployeeCount) : 0}"/>
                            <div class="progress-stacked emp-stack mb-3">
                                <div class="progress" role="progressbar" style="width: ${activePct}%">
                                    <div class="progress-bar bg-success"></div>
                                </div>
                                <div class="progress" role="progressbar" style="width: ${inactivePct}%">
                                    <div class="progress-bar bg-danger"></div>
                                </div>
                            </div>
                            <div class="border mb-3">
                                <div class="row gx-0">
                                    <div class="col-6">
                                        <div class="p-2 flex-fill border-end">
                                            <p class="fs-13 mb-2">
                                                <i class="ti ti-square-filled text-success fs-12 me-2"></i>
                                                Active
                                            </p>
                                            <h2 class="display-1">${dashActiveCount}</h2>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="p-2 flex-fill text-end">
                                            <p class="fs-13 mb-2">
                                                <i class="ti ti-square-filled me-2 text-danger fs-12"></i>
                                                Inactive
                                            </p>
                                            <h2 class="display-1">${dashInactiveCount}</h2>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                               class="btn btn-light btn-md w-100">View All Employees</a>
                        </div>
                    </div>
                </div>

                <!-- Attendance Overview -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Attendance Overview</h5>
                            <div class="dropdown mb-2">
                                <a href="javascript:void(0);"
                                   class="btn btn-white border btn-sm d-inline-flex align-items-center"
                                   data-bs-toggle="dropdown">
                                    <i class="ti ti-calendar me-1"></i>Today
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="text-center py-5">
                                <span class="avatar avatar-lg bg-light rounded-circle mb-3">
                                    <i class="ti ti-calendar-off text-muted fs-20"></i>
                                </span>
                                <h6 class="mb-1">No attendance data</h6>
                                <p class="text-muted fs-13 mb-0">Attendance module data is not available yet.</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Clock-In/Out -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Clock-In/Out</h5>
                            <div class="d-flex align-items-center">
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);"
                                       class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center border-0 fs-13 me-2"
                                       data-bs-toggle="dropdown">
                                        All Departments
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-3">
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Finance</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Development</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Marketing</a></li>
                                    </ul>
                                </div>
                                <div class="dropdown mb-2">
                                    <a href="javascript:void(0);"
                                       class="btn btn-white border btn-sm d-inline-flex align-items-center"
                                       data-bs-toggle="dropdown">
                                        <i class="ti ti-calendar me-1"></i>Today
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-end p-3">
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Month</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">This Week</a></li>
                                        <li><a href="javascript:void(0);" class="dropdown-item rounded-1">Today</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="text-center py-5">
                                <span class="avatar avatar-lg bg-light rounded-circle mb-3">
                                    <i class="ti ti-clock-off text-muted fs-20"></i>
                                </span>
                                <h6 class="mb-1">No clock-in records</h6>
                                <p class="text-muted fs-13 mb-0">Attendance / clock-in data is not available yet.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <!-- Employees widget -->
                <div class="col-xxl-4 col-xl-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-header pb-2 d-flex align-items-center justify-content-between flex-wrap">
                            <h5 class="mb-2">Employees</h5>
                            <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                               class="btn btn-light btn-md mb-2">View All</a>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <table class="table table-nowrap mb-0">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Department</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty dashEmployees}">
                                            <c:forEach var="emp" items="${dashEmployees}" varStatus="status">
                                                <c:if test="${status.index lt 6}">
                                                    <%
                                                        User dashEmp = (User) pageContext.getAttribute("emp");
                                                        String dashImg = toProfileUrl(
                                                                (String) request.getAttribute("ctxPath"),
                                                                dashEmp != null ? dashEmp.getProfilePicture() : null
                                                        );
                                                        pageContext.setAttribute("dashProfileImg", dashImg);
                                                    %>
                                                    <tr>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${emp.userId}"
                                                                   class="avatar avatar-rounded flex-shrink-0">
                                                                    <c:choose>
                                                                        <c:when test="${not empty dashProfileImg}">
                                                                            <img src="${dashProfileImg}"
                                                                                 class="rounded-circle"
                                                                                 alt="Profile"
                                                                                 style="width:100%;height:100%;object-fit:cover;"
                                                                                 onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                                                                 class="rounded-circle"
                                                                                 alt="Profile"
                                                                                 style="width:100%;height:100%;object-fit:cover;">
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </a>
                                                                <div class="ms-2">
                                                                    <h6 class="fw-medium mb-0">
                                                                        <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${emp.userId}">
                                                                            ${emp.firstName} ${emp.lastName}
                                                                        </a>
                                                                    </h6>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty emp.departmentName}">
                                                                    ${emp.departmentName}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Not Assigned
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </c:if>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr>
                                                <td colspan="2" class="text-center text-muted py-4">
                                                    No employees found
                                                </td>
                                            </tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">HRMS</p>
            <p class="mb-0">Human Resource Management System</p>
        </div>

    </div>

</div>

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
(function () {
    var el = document.querySelector('#emp-department-live');
    if (!el || typeof ApexCharts === 'undefined') return;

    var categories = ${deptLabelsJson};
    var values = ${deptValuesJson};
    if (!categories || !categories.length) {
        categories = ['No Department'];
        values = [0];
    }

    new ApexCharts(el, {
        chart: {
            height: 220,
            type: 'bar',
            toolbar: { show: false }
        },
        colors: ['#FF6F28'],
        grid: {
            borderColor: '#E5E7EB',
            strokeDashArray: 5,
            padding: { top: -20, left: 0, right: 0, bottom: 0 }
        },
        plotOptions: {
            bar: {
                borderRadius: 5,
                horizontal: true,
                barHeight: '35%'
            }
        },
        dataLabels: { enabled: false },
        series: [{ name: 'Employees', data: values }],
        xaxis: {
            categories: categories,
            labels: {
                style: { colors: '#111827', fontSize: '13px' }
            }
        }
    }).render();
})();
</script>

</body>

</html>
