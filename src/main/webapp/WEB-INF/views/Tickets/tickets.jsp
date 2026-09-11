<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS Tickets</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/ticket-module.css">
</head>
<body>
<div class="main-wrapper ticket-shell">
    <div class="header">
        <div class="main-header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/tickets" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS">
                </a>
            </div>
            <a id="mobile_btn" class="mobile_btn" href="#sidebar"><span class="bar-icon"><span></span><span></span><span></span></span></a>
            <div class="header-user ms-auto d-flex align-items-center pe-3 gap-2">
                <span class="badge bg-light text-dark border">${sessionScope.roleName}</span>
                <span class="small text-muted">${sessionScope.email}</span>
            </div>
        </div>
    </div>

    <div class="sidebar" id="sidebar">
        <div class="sidebar-logo">
            <a href="${pageContext.request.contextPath}/tickets" class="logo logo-normal">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS">
            </a>
        </div>
        <div class="sidebar-menu">
            <ul>
                <li class="menu-title"><span>MAIN MENU</span></li>
                <li>
                    <c:choose>
                        <c:when test="${sessionScope.roleName eq 'Admin'}"><a href="${pageContext.request.contextPath}/admin/dashboard"><i class="ti ti-smart-home"></i><span>Dashboard</span></a></c:when>
                        <c:when test="${sessionScope.roleName eq 'Manager'}"><a href="${pageContext.request.contextPath}/manager/dashboard"><i class="ti ti-smart-home"></i><span>Dashboard</span></a></c:when>
                        <c:otherwise><a href="${pageContext.request.contextPath}/employee/dashboard"><i class="ti ti-smart-home"></i><span>Dashboard</span></a></c:otherwise>
                    </c:choose>
                </li>
                <li class="active"><a href="${pageContext.request.contextPath}/tickets"><i class="ti ti-ticket"></i><span>Tickets</span></a></li>
            </ul>
        </div>
    </div>

    <div class="page-wrapper">
        <div class="content">
            <c:if test="${not empty flashMessage}">
                <div class="alert alert-${flashType} alert-dismissible fade show" role="alert">
                    <c:out value="${flashMessage}"/>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </c:if>

            <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
                <div>
                    <h3 class="mb-1">Tickets</h3>
                    <p class="text-muted mb-0">
                        <c:choose>
                            <c:when test="${sessionScope.roleName eq 'Employee'}">Raise tickets, work on assigned tickets, and track solutions.</c:when>
                            <c:otherwise>Review, assign and track employee tickets.</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <c:if test="${sessionScope.roleName eq 'Employee'}">
                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#raiseTicketModal">
                        <i class="ti ti-circle-plus me-1"></i> Raise Ticket
                    </button>
                </c:if>
            </div>

            <div class="row g-3 mb-4 ticket-stats">
                <div class="col-xl-3 col-md-6">
                    <div class="card h-100"><div class="card-body d-flex align-items-center justify-content-between">
                        <div><span class="ticket-stat-icon open"><i class="ti ti-ticket"></i></span><p class="text-muted mb-1 mt-3">Open / Reopened</p><h3 class="mb-0">${counts.openCount}</h3></div>
                        <div class="ticket-mini-bars">▂▆▄▇▅▆</div>
                    </div></div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card h-100"><div class="card-body d-flex align-items-center justify-content-between">
                        <div><span class="ticket-stat-icon active"><i class="ti ti-progress-check"></i></span><p class="text-muted mb-1 mt-3">Assigned / In Progress</p><h3 class="mb-0">${counts.activeCount}</h3></div>
                        <div class="ticket-mini-bars">▅▂▇▄▆▃</div>
                    </div></div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card h-100"><div class="card-body d-flex align-items-center justify-content-between">
                        <div><span class="ticket-stat-icon resolved"><i class="ti ti-check"></i></span><p class="text-muted mb-1 mt-3">Resolved</p><h3 class="mb-0">${counts.resolvedCount}</h3></div>
                        <div class="ticket-mini-bars">▃▇▅▆▂▇</div>
                    </div></div>
                </div>
                <div class="col-xl-3 col-md-6">
                    <div class="card h-100"><div class="card-body d-flex align-items-center justify-content-between">
                        <div><span class="ticket-stat-icon closed"><i class="ti ti-lock-check"></i></span><p class="text-muted mb-1 mt-3">Closed</p><h3 class="mb-0">${counts.closedCount}</h3></div>
                        <div class="ticket-mini-bars">▆▃▅▇▂▆</div>
                    </div></div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-body d-flex flex-wrap justify-content-between align-items-center gap-3">
                    <h5 class="mb-0">Ticket Grid</h5>
                    <div class="d-flex flex-wrap gap-2">
                        <select id="priorityFilter" class="form-select form-select-sm ticket-filter">
                            <option value="">All Priorities</option><option>High</option><option>Medium</option><option>Low</option>
                        </select>
                        <select id="statusFilter" class="form-select form-select-sm ticket-filter">
                            <option value="">All Statuses</option><option>Open</option><option>Reopened</option><option>Assigned</option><option>In Progress</option><option>Resolved</option><option>Closed</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="row g-3" id="ticketGrid">
                <c:forEach var="ticket" items="${tickets}">
                    <div class="col-xl-3 col-lg-4 col-md-6 ticket-card-wrap" data-priority="${ticket.priority}" data-status="${ticket.status}">
                        <a class="text-decoration-none text-reset" href="${pageContext.request.contextPath}/tickets?action=view&id=${ticket.ticketId}">
                            <div class="card ticket-card h-100">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start mb-3">
                                        <span class="ticket-round-icon"><i class="ti ti-ticket"></i></span>
                                        <span class="priority-pill priority-${ticket.priority}"><c:out value="${ticket.priority}"/></span>
                                    </div>
                                    <div class="text-center mb-3">
                                        <h5 class="mb-1"><c:out value="${ticket.subject}"/></h5>
                                        <span class="ticket-number"><c:out value="${ticket.ticketNo}"/></span>
                                    </div>
                                    <div class="ticket-meta-row"><span>Raised By</span><strong><c:out value="${ticket.raisedByName}"/></strong></div>
                                    <div class="ticket-meta-row"><span>Status</span>
                                        <strong class="status-text"><c:out value="${ticket.status}"/></strong>
                                    </div>
                                    <div class="ticket-meta-row"><span>Assigned To</span><strong><c:out value="${empty ticket.assignedToName ? '-' : ticket.assignedToName}"/></strong></div>
                                    <hr>
                                    <div class="small text-muted d-flex justify-content-between"><span>Created</span><span>${ticket.createdDateDisplay}</span></div>
                                </div>
                            </div>
                        </a>
                    </div>
                </c:forEach>
            </div>

            <c:if test="${empty tickets}">
                <div class="card"><div class="card-body text-center py-5">
                    <i class="ti ti-ticket-off fs-1 text-muted"></i><h5 class="mt-3">No tickets found</h5>
                    <p class="text-muted mb-0">There are no tickets available for this account yet.</p>
                </div></div>
            </c:if>
        </div>
    </div>
</div>

<c:if test="${sessionScope.roleName eq 'Employee'}">
<div class="modal fade" id="raiseTicketModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header"><h5 class="modal-title">Raise Ticket</h5><button type="button" class="btn-close" data-bs-dismiss="modal"></button></div>
            <form method="post" action="${pageContext.request.contextPath}/tickets" enctype="multipart/form-data">
                <input type="hidden" name="action" value="create">
                <div class="modal-body">
                    <div class="mb-3"><label class="form-label">Subject <span class="text-danger">*</span></label><input type="text" name="subject" maxlength="200" class="form-control" required></div>
                    <div class="mb-3"><label class="form-label">Description <span class="text-danger">*</span></label><textarea name="description" rows="5" class="form-control" required></textarea></div>
                    <div class="row">
                        <div class="col-md-6 mb-3"><label class="form-label">Priority <span class="text-danger">*</span></label><select name="priority" class="form-select" required><option value="">Select Priority</option><option>Low</option><option>Medium</option><option>High</option></select></div>
                        <div class="col-md-6 mb-3"><label class="form-label">Attachment</label><input type="file" name="attachment" class="form-control"><div class="form-text">Maximum 10 MB.</div></div>
                    </div>
                    <div class="alert alert-light border mb-0"><i class="ti ti-info-circle me-1"></i> Ticket number, sender, status and created date are generated automatically.</div>
                </div>
                <div class="modal-footer"><button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button><button type="submit" class="btn btn-primary">Submit Ticket</button></div>
            </form>
        </div>
    </div>
</div>
</c:if>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>
(function () {
    const priority = document.getElementById('priorityFilter');
    const status = document.getElementById('statusFilter');
    function applyFilters() {
        document.querySelectorAll('.ticket-card-wrap').forEach(function (card) {
            const pOk = !priority.value || card.dataset.priority === priority.value;
            const sOk = !status.value || card.dataset.status === status.value;
            card.style.display = pOk && sOk ? '' : 'none';
        });
    }
    priority.addEventListener('change', applyFilters);
    status.addEventListener('change', applyFilters);
})();
</script>
</body>
</html>
