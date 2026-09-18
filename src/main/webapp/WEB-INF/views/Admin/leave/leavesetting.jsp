<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">
    <title>Leave Settings</title>
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <style>
        .sidebar { height: 100vh !important; overflow-y: auto !important; overflow-x: hidden !important; }
        .sidebar-menu { height: auto !important; overflow: visible !important; }
        .leave-setting-card .form-switch .form-check-input { cursor: pointer; }
    </style>
</head>
<body>
<div id="global-loader"><div class="page-loader"></div></div>
<div class="main-wrapper">
    <div class="header">
        <div class="main-header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo"><img src="assets/img/logo.svg" alt="HRMS Logo"></a>
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="dark-logo"><img src="assets/img/logo-white.svg" alt="HRMS Logo"></a>
            </div>
            <a id="mobile_btn" class="mobile_btn" href="#sidebar"><span class="bar-icon"><span></span><span></span><span></span></span></a>
            <div class="header-user">
                <div class="nav user-menu nav-list">
                    <div class="me-auto d-flex align-items-center" id="header-search">
                        <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1"><i class="ti ti-arrow-bar-to-left"></i></a>
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
                    <h2 class="mb-1">Leave Settings</h2>
                    <nav><ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="ti ti-smart-home"></i></a></li>
                        <li class="breadcrumb-item active">Leave Settings</li>
                    </ol></nav>
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
                    <div class="d-flex align-items-center justify-content-between border-bottom pb-3 mb-3">
                        <div>
                            <h4 class="mb-1">Leave Type Status</h4>
                            <p class="text-muted mb-0">Activate a leave type to make it available across leave features.</p>
                        </div>
                    </div>

                    <c:choose>
                        <c:when test="${empty leaveSettings}">
                            <div class="text-center text-muted py-5">No leave types are configured yet. Add a leave type first.</div>
                        </c:when>
                        <c:otherwise>
                            <div class="row">
                                <c:forEach var="setting" items="${leaveSettings}">
                                    <div class="col-xl-4 col-md-6 mb-3">
                                        <div class="card border leave-setting-card h-100 mb-0">
                                            <div class="card-body">
                                                <div class="d-flex align-items-center justify-content-between">
                                                    <div class="d-flex align-items-center">
                                                        <form action="${pageContext.request.contextPath}/admin/leave/settings/update" method="post" class="setting-toggle-form me-2">
                                                            <input type="hidden" name="leaveTypeId" value="${setting.leaveTypeId}">
                                                            <input type="hidden" name="active" value="${setting.active ? '1' : '0'}" class="active-value">
                                                            <input class="form-check-input setting-toggle" type="checkbox" ${setting.active ? 'checked' : ''} title="Enable/disable leave type">
                                                        </form>
                                                        <h6 class="mb-0">${setting.leaveType}</h6>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="assets/js/jquery-3.7.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/script.js"></script>
<script>
$(function () {
    $('.setting-toggle').on('change', function () {
        const form = $(this).closest('form');
        form.find('.active-value').val(this.checked ? '1' : '0');
        form.submit();
    });

});
</script>
</body>
</html>
