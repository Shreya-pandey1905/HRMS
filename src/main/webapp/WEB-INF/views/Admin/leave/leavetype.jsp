
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <base href="${pageContext.request.contextPath}/">
    <title>Leave Type</title>
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
                    <h2 class="mb-1">Leave Type</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">Leave Type</li>
                        </ol>
                    </nav>
                </div>
                <button type="button" class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#add_leaves">
                    <i class="ti ti-circle-plus me-2"></i>Add Leave Type
                </button>
            </div>

            <c:if test="${not empty leaveSuccess}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">${leaveSuccess}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            </c:if>
            <c:if test="${not empty leaveError}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">${leaveError}<button type="button" class="btn-close" data-bs-dismiss="alert"></button></div>
            </c:if>

            <div class="card">
                <div class="card-body">
                    <div class="border-bottom d-flex align-items-center justify-content-between pb-3 mb-3">
                        <h4 class="mb-0">Leave Type List</h4>
                        <div class="input-group" style="width:300px;">
                            <span class="input-group-text"><i class="ti ti-search"></i></span>
                            <input type="text" id="leaveTypeSearch" class="form-control" placeholder="Search Leave Type">
                            <button type="button" class="btn btn-primary" id="searchLeaveTypeBtn">Search</button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table" id="leaveTypeTable">
                            <thead class="thead-light">
                            <tr>
                                <th class="no-sort">
                                    <div class="form-check form-check-md">
                                        <input class="form-check-input" type="checkbox" id="select-all">
                                    </div>
                                </th>
                                <th>Leave Type</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            </thead>
                            <tbody id="leaveTypeTableBody">
                            <c:forEach var="leaveType" items="${leaveTypes}">
                                <tr>
                                    <td><input class="form-check-input" type="checkbox"></td>
                                    <td class="text-dark leave-type-name">${leaveType.leaveType}</td>
                                    <td>
                                        <span class="badge ${leaveType.active ? 'badge-success' : 'badge-danger'}">
                                            <i class="ti ti-point-filled"></i>${leaveType.active ? 'Active' : 'Inactive'}
                                        </span>
                                    </td>
                                    <td>
                                        <form action="${pageContext.request.contextPath}/admin/leave/type/delete" method="post" class="delete-leave-form">
                                            <input type="hidden" name="id" value="${leaveType.leaveTypeId}">
                                            <button type="submit" class="btn btn-sm btn-danger" title="Delete">
                                                <i class="ti ti-trash"></i>
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr id="noLeaveTypeResult" style="display:none;">
                                <td colspan="4" class="text-center text-muted py-4">No leave type found.</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add_leaves" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-md">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Add Leave Type</h4>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="${pageContext.request.contextPath}/admin/leave/type" method="post">
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Leave Type <span class="text-danger">*</span></label>
                        <input type="text" name="leaveType" class="form-control" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary">Add Leave</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="assets/js/jquery-3.7.1.min.js"></script>
<script src="assets/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/feather.min.js"></script>
<script src="assets/js/script.js"></script>
<script>
$(document).ready(function() {
    function searchLeaveTypes() {
        var searchValue = $('#leaveTypeSearch').val().trim().toLowerCase();
        var visibleRows = 0;
        $('#leaveTypeTableBody tr').each(function() {
            if ($(this).attr('id') === 'noLeaveTypeResult') return;
            var leaveTypeName = $(this).find('.leave-type-name').text().trim().toLowerCase();
            if (leaveTypeName.indexOf(searchValue) !== -1) {
                $(this).show();
                visibleRows++;
            } else {
                $(this).hide();
            }
        });
        $('#noLeaveTypeResult').toggle(visibleRows === 0);
    }

    $('#searchLeaveTypeBtn').on('click', searchLeaveTypes);

    $('#leaveTypeSearch').on('keypress', function(e) {
        if (e.which === 13) {
            e.preventDefault();
            searchLeaveTypes();
        }
    });

    $('#leaveTypeSearch').on('keyup', searchLeaveTypes);

    $('.delete-leave-form').on('submit', function(e) {
        if (!confirm('Are you sure you want to delete this leave type?')) {
            e.preventDefault();
        }
    });

    $('#select-all').on('change', function() {
        $('.form-check-input').not('#select-all').prop('checked', this.checked);
    });
});
</script>
</body>

