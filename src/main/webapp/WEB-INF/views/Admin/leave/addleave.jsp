<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">
    <title>Allocate Leave</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .sidebar { height: 100vh !important; overflow-y: auto !important; overflow-x: hidden !important; }
        .sidebar-menu { height: auto !important; overflow: visible !important; }
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

    <%@ include file="../adminSidebar.jsp" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Allocate Leave</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Allocate Leave</li>
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
                        <h4 class="mb-0">Allocate Leave Department Wise</h4>
                    </div>

                    <form action="${pageContext.request.contextPath}/admin/leave/allocate" method="post">
                        <div class="mb-3">
                            <label class="form-label">Select Department <span class="text-danger">*</span></label>
                            <select name="departmentId" class="form-select" required>
                                <option value="">Select Department</option>
                                <c:forEach var="department" items="${departments}">
                                    <c:choose>
                                        <c:when test="${department.status eq 'Active'}">
                                            <option value="${department.departmentId}">${department.name}</option>
                                        </c:when>
                                        <c:otherwise>
                                            <option value="${department.departmentId}" disabled>${department.name} (Inactive)</option>
                                        </c:otherwise>
                                    </c:choose>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Select Leave Type <span class="text-danger">*</span></label>
                            <select name="leaveTypeId" class="form-select" required>
                                <option value="">Select Leave Type</option>
                                <c:forEach var="leaveType" items="${leaveTypes}">
                                    <option value="${leaveType.leaveTypeId}">${leaveType.leaveType}</option>
                                </c:forEach>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Number of Leaves Allocated <span class="text-danger">*</span></label>
                            <input type="number" name="numberOfLeaves" class="form-control" min="1" step="1" required>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-primary">
                                <i class="ti ti-check me-1"></i>Allocate Leave
                            </button>
                        </div>
                    </form>
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