
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Manager Leave Approval">

    <meta name="keywords"
          content="HRMS, Human Resource Management System, Manager Leave Approval">

    <meta name="author" content="HRMS Team">

    <meta name="robots" content="noindex, nofollow">

    <title>Leave Approval | HRMS Manager</title>


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

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

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


    <!-- ========================================================= -->
    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/manager-sidebar.jsp" />
    <!-- PAGE WRAPPER -->
    <div class="page-wrapper">
        <div class="content">

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Leave Approval</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/manager/dashboard"><i class="ti ti-smart-home"></i></a>
                            </li>
                            <li class="breadcrumb-item">Leave</li>
                            <li class="breadcrumb-item active" aria-current="page">Leave Approval</li>
                        </ol>
                    </nav>
                </div>
            </div>

            <c:if test="${not empty leaveSuccess}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="ti ti-check me-2"></i><c:out value="${leaveSuccess}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>
            <c:if test="${not empty leaveError}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="ti ti-alert-circle me-2"></i><c:out value="${leaveError}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                </div>
            </c:if>

            <div class="row">
                <div class="col-xl-4 col-sm-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <span class="avatar avatar-md bg-warning mb-3"><i class="ti ti-clock fs-16"></i></span>
                            <h2 class="mb-1"><c:out value="${pendingCount}"/></h2>
                            <p class="mb-0">Pending Requests</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <span class="avatar avatar-md bg-success mb-3"><i class="ti ti-circle-check fs-16"></i></span>
                            <h2 class="mb-1"><c:out value="${approvedCount}"/></h2>
                            <p class="mb-0">Approved Requests</p>
                        </div>
                    </div>
                </div>
                <div class="col-xl-4 col-sm-6 d-flex">
                    <div class="card flex-fill">
                        <div class="card-body">
                            <span class="avatar avatar-md bg-danger mb-3"><i class="ti ti-circle-x fs-16"></i></span>
                            <h2 class="mb-1"><c:out value="${rejectedCount}"/></h2>
                            <p class="mb-0">Rejected Requests</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                        <h5 class="mb-0">Leave List</h5>
                        <form method="get" action="${pageContext.request.contextPath}/manager/leave" class="d-flex align-items-center flex-wrap gap-2">

                            <!-- Values preserved when a toolbar filter is selected -->
                            <input type="hidden" name="fromDate" value="${selectedFromDate}">
                            <input type="hidden" name="toDate" value="${selectedToDate}">
                            <input type="hidden" name="employeeId" value="${selectedEmployeeId}">
                            <input type="hidden" name="status" value="${selectedStatus}">
                            <input type="hidden" name="search" value="${selectedSearch}">
                            <input type="hidden" name="sort" id="toolbarSort" value="${selectedSort}">

                            <!-- Leave Type -->
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <c:choose>
                                        <c:when test="${empty selectedLeaveTypeId}">All Leave Types</c:when>
                                        <c:otherwise>
                                            <c:forEach var="type" items="${managerLeaveTypes}">
                                                <c:if test="${type.leaveTypeId.toString() == selectedLeaveTypeId}"><c:out value="${type.leaveType}"/></c:if>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><button type="submit" class="dropdown-item rounded-1" name="leaveTypeId" value="">All Leave Types</button></li>
                                    <c:forEach var="type" items="${managerLeaveTypes}">
                                        <li><button type="submit" class="dropdown-item rounded-1" name="leaveTypeId" value="${type.leaveTypeId}"><c:out value="${type.leaveType}"/></button></li>
                                    </c:forEach>
                                </ul>
                            </div>

                            <!-- Filters -->
                            <div class="dropdown">
                                <button type="button" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown" data-bs-auto-close="outside">
                                    Filters
                                </button>
                                <div class="dropdown-menu dropdown-menu-end p-3" style="min-width: 330px;">
                                    <div class="mb-3">
                                        <label class="form-label">Employee</label>
                                        <select class="form-select" name="employeeId">
                                            <option value="">All Employees</option>
                                            <c:forEach var="employee" items="${managerEmployees}">
                                                <option value="${employee.userId}" <c:if test="${employee.userId.toString() == selectedEmployeeId}">selected</c:if>>
                                                    <c:out value="${employee.employeeName}"/>
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Status</label>
                                        <select class="form-select" name="status">
                                            <option value="">All Status</option>
                                            <option value="New" <c:if test="${selectedStatus == 'New'}">selected</c:if>>New</option>
                                            <option value="Pending" <c:if test="${selectedStatus == 'Pending'}">selected</c:if>>Pending</option>
                                            <option value="Approved" <c:if test="${selectedStatus == 'Approved'}">selected</c:if>>Approved</option>
                                            <option value="Rejected" <c:if test="${selectedStatus == 'Rejected'}">selected</c:if>>Rejected</option>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="col-6 mb-3">
                                            <label class="form-label">From Date</label>
                                            <input type="date" class="form-control" name="fromDate" value="${selectedFromDate}">
                                        </div>
                                        <div class="col-6 mb-3">
                                            <label class="form-label">To Date</label>
                                            <input type="date" class="form-control" name="toDate" value="${selectedToDate}">
                                        </div>
                                    </div>
                                    <input type="hidden" name="leaveTypeId" value="${selectedLeaveTypeId}">
                                    <div class="d-flex justify-content-end gap-2">
                                        <a class="btn btn-light" href="${pageContext.request.contextPath}/manager/leave">Clear</a>
                                        <button type="submit" class="btn btn-primary">Apply</button>
                                    </div>
                                </div>
                            </div>

                            <!-- Sort -->
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <c:choose>
                                        <c:when test="${selectedSort == 'asc'}">Ascending</c:when>
                                        <c:when test="${selectedSort == 'desc'}">Descending</c:when>
                                        <c:otherwise>Recently Added</c:otherwise>
                                    </c:choose>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><button type="button" class="dropdown-item rounded-1 sort-option" data-sort="recent">Recently Added</button></li>
                                    <li><button type="button" class="dropdown-item rounded-1 sort-option" data-sort="asc">Ascending</button></li>
                                    <li><button type="button" class="dropdown-item rounded-1 sort-option" data-sort="desc">Descending</button></li>
                                </ul>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="card-body">
                    <div class="custom-datatable-filter table-responsive w-100">
                        <table id="managerLeaveTable" class="table w-100">
                            <thead class="thead-light">
                                <tr>
                                    <th>Leave ID</th>
                                    <th>Leave Type</th>
                                    <th>Employee</th>
                                    <th>Approved By</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Reason</th>
                                    <th>No. of Days</th>
                                    <th>Status</th>
                                    <th class="no-sort">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty leaveRecords}">
                                        <tr><td colspan="10" class="text-center py-4">No leave requests found for the selected filters.</td></tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="record" items="${leaveRecords}">
                                            <tr>
                                                <td><c:out value="${record.leaveRequestId}"/></td>
                                                <td><c:out value="${record.leaveType}"/></td>
                                                <td>
                                                    <div class="d-flex flex-column">
                                                        <span class="fw-medium"><c:out value="${record.employeeName}"/></span>
                                                        <span class="fs-11 text-muted"><c:out value="${record.employeeEmail}"/></span>
                                                    </div>
                                                </td>
                                                <td><c:out value="${empty record.approvedBy ? '-' : record.approvedBy}"/></td>
                                                <td data-order="${record.startDate}"><c:out value="${record.startDateLabel}"/></td>
                                                <td data-order="${record.endDate}"><c:out value="${record.endDateLabel}"/></td>
                                                <td class="reason-cell" title="${record.reason}"><c:out value="${empty record.reason ? '-' : record.reason}"/></td>
                                                <td><c:out value="${record.numberOfDays}"/></td>
                                                <td>
                                                    <span class="badge ${record.statusBadgeClass} d-inline-flex align-items-center">
                                                        <i class="ti ti-point-filled me-1"></i><c:out value="${record.statusLabel}"/>
                                                    </span>
                                                </td>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${record.actionable}">
                                                            <div class="d-flex align-items-center gap-1">
                                                                <form method="post" action="${pageContext.request.contextPath}/manager/leave" class="d-inline">
                                                                    <input type="hidden" name="leaveRequestId" value="${record.leaveRequestId}">
                                                                    <input type="hidden" name="action" value="approve">
                                                                    <input type="hidden" name="fromDate" value="${selectedFromDate}">
                                                                    <input type="hidden" name="toDate" value="${selectedToDate}">
                                                                    <input type="hidden" name="leaveTypeId" value="${selectedLeaveTypeId}">
                                                                    <input type="hidden" name="employeeId" value="${selectedEmployeeId}">
                                                                    <input type="hidden" name="status" value="${selectedStatus}">
                                                                    <input type="hidden" name="sort" value="${selectedSort}">
                                                                    <input type="hidden" name="search" value="${selectedSearch}">
                                                                    <button type="submit" class="btn btn-sm btn-success" onclick="return confirm('Approve this leave request? The employee leave balance will be reduced by ${record.numberOfDays} day(s).');">Approve</button>
                                                                </form>
                                                                <form method="post" action="${pageContext.request.contextPath}/manager/leave" class="d-inline">
                                                                    <input type="hidden" name="leaveRequestId" value="${record.leaveRequestId}">
                                                                    <input type="hidden" name="action" value="reject">
                                                                    <input type="hidden" name="fromDate" value="${selectedFromDate}">
                                                                    <input type="hidden" name="toDate" value="${selectedToDate}">
                                                                    <input type="hidden" name="leaveTypeId" value="${selectedLeaveTypeId}">
                                                                    <input type="hidden" name="employeeId" value="${selectedEmployeeId}">
                                                                    <input type="hidden" name="status" value="${selectedStatus}">
                                                                    <input type="hidden" name="sort" value="${selectedSort}">
                                                                    <input type="hidden" name="search" value="${selectedSearch}">
                                                                    <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Reject this leave request?');">Reject</button>
                                                                </form>
                                                            </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="text-muted fs-12">Processed</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
            <p class="mb-0">HRMS</p>
            <p class="mb-0">Human Resource Management System</p>
        </div>
    </div>

    <style>
        .custom-datatable-filter.table-responsive,
        .custom-datatable-filter.table-responsive .datatable,
        .custom-datatable-filter.table-responsive .table {
            width: 100% !important;
            max-width: 100% !important;
        }
        .reason-cell { max-width: 180px; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
        .card-header form { margin-bottom: 0; }
    </style>

    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script>
        $(function () {
            var table = $('#managerLeaveTable').DataTable({
                pageLength: 10,
                lengthMenu: [[10, 25, 50, 100], [10, 25, 50, 100]],
                order: [[${selectedSort == 'asc' || selectedSort == 'desc' ? 4 : 0}, '${selectedSort == 'asc' ? 'asc' : 'desc'}']],
                columnDefs: [{ targets: 9, orderable: false }],
                language: { emptyTable: 'No leave requests found for the selected filters.' }
            });
            $('.sort-option').on('click', function () {
                $('#toolbarSort').val($(this).data('sort'));
                $(this).closest('form').trigger('submit');
            });
            var initialSearch = '${fn:escapeXml(selectedSearch)}';
            if (initialSearch) table.search(initialSearch).draw();
        });
    </script>

</body>
</html>
