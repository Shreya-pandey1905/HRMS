<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">
    <title>Department Leave Details</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .sidebar { height: 100vh !important; overflow-y: auto !important; overflow-x: hidden !important; }
        .sidebar-menu { height: auto !important; overflow: visible !important; }
        .dataTables_wrapper .dataTables_filter { float: right; }
        .dataTables_wrapper .dataTables_length { float: left; }
    </style>
</head>
<body>
<div id="global-loader"><div class="page-loader"></div></div>

<div class="main-wrapper">
    <div class="header">
        <div class="main-header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS Logo">
                </a>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="dark-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="HRMS Logo">
                </a>
            </div>

            <a id="mobile_btn" class="mobile_btn" href="#sidebar">
                <span class="bar-icon"><span></span><span></span><span></span></span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">
                    <div class="me-auto d-flex align-items-center" id="header-search">
                        <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                            <i class="ti ti-arrow-bar-to-left"></i>
                        </a>
                        <div class="input-group input-group-flat d-inline-flex me-1">
                            <span class="input-icon-addon"><i class="ti ti-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search in HRMS">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../admin-sidebar.jspf" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Department Leave Details</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Department Leave Details</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <c:if test="${not empty leaveSuccess}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">${leaveSuccess}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            </c:if>
            <c:if test="${not empty leaveError}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">${leaveError}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            </c:if>

            <div class="card">
                <div class="card-body">
                    <div class="border-bottom pb-3 mb-3">
                        <h4 class="mb-0">Department Leave Details</h4>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-hover" id="departmentLeaveTable">
                            <thead class="thead-light">
                            <tr>
                                <th>Department Name</th>
                                <th>Leave Type</th>
                                <th>No. of Leaves</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="leave" items="${departmentLeaves}">
                                <tr>
                                    <td class="text-dark">${leave.departmentName}</td>
                                    <td>${leave.leaveTypeName}</td>
                                    <td>${leave.leavesCount}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${leave.status == 'Active'}">
                                                <span class="badge badge-success">
                                                    <i class="ti ti-point-filled"></i>Active
                                                </span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="badge badge-danger">
                                                    <i class="ti ti-point-filled"></i>Inactive
                                                </span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/leave/department/delete" method="post" onsubmit="return confirm('Are you sure you want to delete this leave allocation?');">
                                            <input type="hidden" name="id" value="${leave.departmentLeavesId}">
                                            <button type="submit" class="btn btn-sm btn-icon btn-danger" title="Delete">
                                                <i class="ti ti-trash"></i>
                                            </button>
                                        </form>
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

<script src="assets/js/jquery-3.7.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/script.js"></script>
</body>
</html>