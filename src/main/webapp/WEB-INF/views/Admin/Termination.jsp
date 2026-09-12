<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Termination - HRMS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
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

        .termination-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #fff;
        }

        .termination-title {
            font-size: 20px;
            font-weight: 600;
            color: #1f2d5a;
        }

        .termination-table th {
            background: #eef0f3;
            font-weight: 600;
            white-space: nowrap;
        }

        .termination-table td {
            vertical-align: middle;
        }

        .employee-name {
            font-weight: 600;
            color: #1f2d5a;
        }

        .employee-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #d9d9d9;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: #fff;
            font-size: 12px;
        }

        .add-termination-btn {
            background: #ff6b35;
            border-color: #ff6b35;
            color: #fff;
        }

        .add-termination-btn:hover {
            background: #e85b29;
            border-color: #e85b29;
            color: #fff;
        }

        .action-btn {
            border: none;
            background: transparent;
            font-size: 17px;
            margin-right: 8px;
        }

        .edit-btn,
        .delete-btn {
            color: #52677d;
        }
    </style>
</head>

<body>
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
                            <span class="input-group-text"><kbd>CTRL + /</kbd></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="adminSidebar.jsp"/>

    <div class="page-wrapper">
        <div class="content">

            <div class="page-header">
                <div class="row align-items-center">
                    <div class="col-sm-8">
                        <h4 class="page-title">Termination</h4>
                    </div>

                    <div class="col-sm-4 text-sm-end mt-3 mt-sm-0">
                        <a href="${pageContext.request.contextPath}/termination?action=add"
                           class="btn add-termination-btn">
                            <i class="ti ti-circle-plus me-1"></i>
                            Add Termination
                        </a>
                    </div>
                </div>
            </div>

            <div class="card termination-card">
                <div class="card-body">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="termination-title mb-0">Termination List</h5>

                        <input type="text"
                               id="terminationSearch"
                               class="form-control"
                               placeholder="Search"
                               style="width: 220px;">
                    </div>

                    <div class="table-responsive">
                        <table class="table termination-table mb-0" id="terminationTable">
                            <thead>
                            <tr>
                                <th style="width: 40px;"><input type="checkbox"></th>
                                <th>Resigning Employee</th>
                                <th>Department</th>
                                <th>Termination Type</th>
                                <th>Notice Date</th>
                                <th>Reason</th>
                                <th>Resignation Date</th>
                                <th>Action</th>
                            </tr>
                            </thead>

                            <tbody>
                            <c:choose>
                                <c:when test="${not empty terminations}">
                                    <c:forEach var="termination" items="${terminations}">
                                        <tr>
                                            <td>
                                                <input type="checkbox" value="${termination.terminationId}">
                                            </td>

                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <div class="employee-avatar">
                                                        ${termination.firstName.substring(0,1)}
                                                    </div>

                                                    <span class="employee-name">
                                                        ${termination.firstName} ${termination.lastName}
                                                    </span>
                                                </div>
                                            </td>

                                            <td>${termination.department}</td>
                                            <td>${termination.terminationType}</td>
                                            <td>${termination.noticeDateFormatted}</td>
                                            <td>${termination.reason}</td>
                                            <td>${termination.resignDateFormatted}</td>

                                            <td>
                                                <a href="${pageContext.request.contextPath}/termination?action=edit&id=${termination.terminationId}"
                                                   class="action-btn edit-btn"
                                                   title="Edit">
                                                    <i class="ti ti-edit"></i>
                                                </a>

                                                <form action="${pageContext.request.contextPath}/termination"
                                                      method="post"
                                                      style="display: inline;">
                                                    <input type="hidden" name="action" value="delete">
                                                    <input type="hidden" name="terminationId" value="${termination.terminationId}">

                                                    <button type="submit"
                                                            class="action-btn delete-btn"
                                                            title="Delete"
                                                            onclick="return confirm('Are you sure you want to delete this termination?');">
                                                        <i class="ti ti-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>

                                <c:otherwise>
                                    <tr>
                                        <td colspan="8" class="text-center py-4 text-muted">
                                            No termination records found.
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

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>
    document.getElementById('terminationSearch').addEventListener('keyup', function () {
        const value = this.value.toLowerCase();
        document.querySelectorAll('#terminationTable tbody tr').forEach(function (row) {
            row.style.display = row.innerText.toLowerCase().includes(value) ? '' : 'none';
        });
    });
</script>

</body>
</html>
