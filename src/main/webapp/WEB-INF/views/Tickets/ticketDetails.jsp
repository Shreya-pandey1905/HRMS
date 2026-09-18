<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${ticket.ticketNo} - Ticket Details</title>
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
            <div class="header-left"><a href="${pageContext.request.contextPath}/tickets" class="logo"><img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS"></a></div>
            <a id="mobile_btn" class="mobile_btn" href="#sidebar"><span class="bar-icon"><span></span><span></span><span></span></span></a>
            <div class="header-user ms-auto d-flex align-items-center pe-3 gap-2"><span class="badge bg-light text-dark border">${sessionScope.roleName}</span><span class="small text-muted">${sessionScope.email}</span></div>
        </div>
    </div>

<c:choose>

    <c:when test="${sessionScope.roleName eq 'Admin'}">
        <jsp:include page="/WEB-INF/views/Admin/adminSidebar.jsp" />
    </c:when>

    <c:when test="${sessionScope.roleName eq 'Manager'}">
        <jsp:include page="/WEB-INF/views/common/manager-sidebar.jsp" />
    </c:when>

    <c:otherwise>
        <jsp:include page="/WEB-INF/views/common/employee-sidebar.jsp" />
    </c:otherwise>

</c:choose>
    <div class="page-wrapper">
        <div class="content">
            <c:if test="${not empty flashMessage}">
                <div class="alert alert-${flashType} alert-dismissible fade show"><c:out value="${flashMessage}"/><button class="btn-close" type="button" data-bs-dismiss="alert"></button></div>
            </c:if>

            <div class="d-flex flex-wrap align-items-center justify-content-between gap-3 mb-4">
                <div><a href="${pageContext.request.contextPath}/tickets" class="text-muted text-decoration-none"><i class="ti ti-arrow-left me-1"></i>Tickets</a><h3 class="mt-2 mb-0">Ticket Details</h3></div>
                <div class="d-flex gap-2"><span class="ticket-number fs-6"><c:out value="${ticket.ticketNo}"/></span><span class="priority-pill priority-${ticket.priority}"><c:out value="${ticket.priority}"/></span></div>
            </div>

            <div class="row g-4">
                <div class="col-xl-9">
                    <div class="card mb-4">
                        <div class="card-header d-flex justify-content-between align-items-center"><div><span class="text-primary fw-semibold">Employee Support</span><h4 class="mb-0 mt-1"><c:out value="${ticket.subject}"/></h4></div><span class="status-badge"><c:out value="${ticket.status}"/></span></div>
                        <div class="card-body">
                            <div class="d-flex flex-wrap gap-3 small text-muted mb-4"><span><i class="ti ti-user me-1"></i>Raised by <strong class="text-dark"><c:out value="${ticket.raisedByName}"/></strong></span><span><i class="ti ti-clock me-1"></i>${ticket.createdDateDisplay}</span></div>
                            <h6>Problem Description</h6>
                            <div class="ticket-description mb-4"><c:out value="${ticket.description}"/></div>

                            <c:if test="${not empty resolution}">
                                <div class="resolution-box mb-4"><div class="d-flex justify-content-between gap-3 mb-2"><h6 class="mb-0"><i class="ti ti-circle-check me-1"></i>Solution / Resolution</h6><span class="small text-muted">${resolution.resolvedDateDisplay}</span></div><div class="ticket-description"><c:out value="${resolution.solution}"/></div><c:if test="${not empty resolution.resolutionNotes}"><hr><div class="small text-muted mb-1">Resolution Notes</div><div class="ticket-description"><c:out value="${resolution.resolutionNotes}"/></div></c:if><div class="small mt-3">Resolved by <strong><c:out value="${resolution.resolvedByName}"/></strong></div></div>
                            </c:if>

                            <c:if test="${not empty attachments}">
                                <h6 class="mb-3">Attachments</h6>
                                <div class="row g-2 mb-4">
                                    <c:forEach var="attachment" items="${attachments}">
                                        <div class="col-md-6"><a class="attachment-card" href="${pageContext.request.contextPath}/ticket-file?id=${attachment.attachmentId}"><span class="attachment-icon"><i class="ti ti-paperclip"></i></span><span class="flex-grow-1"><strong class="d-block"><c:out value="${attachment.fileName}"/></strong><small class="text-muted"><c:out value="${attachment.attachmentType}"/> · ${attachment.uploadedDateDisplay}</small></span><i class="ti ti-download"></i></a></div>
                                    </c:forEach>
                                </div>
                            </c:if>

                            <div class="d-flex justify-content-between align-items-center mb-3"><h6 class="mb-0">Comments / Conversation</h6><span class="badge bg-light text-dark border">${comments.size()} comments</span></div>
                            <div class="ticket-comments mb-4">
                                <c:choose>
                                    <c:when test="${empty comments}"><div class="text-muted small py-3">No comments yet.</div></c:when>
                                    <c:otherwise>
                                        <c:forEach var="comment" items="${comments}">
                                            <div class="comment-item"><div class="comment-avatar"><i class="ti ti-user"></i></div><div class="flex-grow-1"><div class="d-flex flex-wrap justify-content-between gap-2"><strong><c:out value="${comment.commentByName}"/></strong><small class="text-muted">${comment.commentDateDisplay}</small></div><div class="ticket-description mt-1"><c:out value="${comment.commentText}"/></div></div></div>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <c:if test="${ticket.status ne 'Closed'}">
                                <form method="post" action="${pageContext.request.contextPath}/tickets" class="border rounded p-3 bg-light-subtle">
                                    <input type="hidden" name="action" value="comment"><input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                    <label class="form-label">Add Comment</label><textarea name="commentText" class="form-control mb-2" rows="3" required></textarea><div class="text-end"><button type="submit" class="btn btn-outline-primary">Post Comment</button></div>
                                </form>
                            </c:if>
                        </div>
                    </div>
                </div>

                <div class="col-xl-3">
                    <div class="card mb-4"><div class="card-header"><h5 class="mb-0">Ticket Details</h5></div><div class="card-body p-0">
                        <div class="ticket-side-row"><span>Status</span><strong><c:out value="${ticket.status}"/></strong></div>
                        <div class="ticket-side-row"><span>Priority</span><strong><c:out value="${ticket.priority}"/></strong></div>
                        <div class="ticket-side-row"><span>Raised By</span><strong><c:out value="${ticket.raisedByName}"/></strong></div>
                        <div class="ticket-side-row"><span>Assigned To</span><strong><c:out value="${empty ticket.assignedToName ? '-' : ticket.assignedToName}"/></strong></div>
                        <div class="ticket-side-row"><span>Assigned By</span><strong><c:out value="${empty ticket.assignedByName ? '-' : ticket.assignedByName}"/></strong></div>
                        <div class="ticket-side-row"><span>Created</span><strong>${ticket.createdDateDisplay}</strong></div>
                        <c:if test="${not empty ticket.assignedDate}"><div class="ticket-side-row"><span>Assigned</span><strong>${ticket.assignedDateDisplay}</strong></div></c:if>
                        <c:if test="${not empty ticket.startedDate}"><div class="ticket-side-row"><span>Started</span><strong>${ticket.startedDateDisplay}</strong></div></c:if>
                        <c:if test="${not empty ticket.resolvedDate}"><div class="ticket-side-row"><span>Resolved</span><strong>${ticket.resolvedDateDisplay}</strong></div></c:if>
                        <c:if test="${not empty ticket.closedDate}"><div class="ticket-side-row"><span>Closed</span><strong>${ticket.closedDateDisplay}</strong></div></c:if>
                    </div></div>

                    <c:if test="${(sessionScope.roleName eq 'Manager' or sessionScope.roleName eq 'Admin') and (ticket.status eq 'Open' or ticket.status eq 'Reopened')}">
                        <div class="card mb-4"><div class="card-header"><h5 class="mb-0">Assign Ticket</h5></div><div class="card-body">
                            <form method="post" action="${pageContext.request.contextPath}/tickets">
                                <input type="hidden" name="action" value="assign"><input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                <div class="mb-3"><label class="form-label">Assign To</label><select name="assignedTo" class="form-select" required><option value="">Select Employee</option><c:forEach var="employee" items="${employees}"><option value="${employee.userId}"><c:out value="${employee.firstName}"/> <c:out value="${employee.lastName}"/></option></c:forEach></select></div>
                                <div class="mb-3"><label class="form-label">Assignment Comment</label><textarea name="assignmentComment" class="form-control" rows="3"></textarea></div>
                                <button type="submit" class="btn btn-primary w-100">Assign Ticket</button>
                            </form>
                        </div></div>
                    </c:if>

                    <c:if test="${sessionScope.roleName eq 'Employee' and ticket.assignedTo eq sessionScope.userId and ticket.status eq 'Assigned'}">
                        <div class="card mb-4"><div class="card-body"><form method="post" action="${pageContext.request.contextPath}/tickets"><input type="hidden" name="action" value="start"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><button class="btn btn-warning w-100" type="submit"><i class="ti ti-player-play me-1"></i>Start Work</button></form></div></div>
                    </c:if>

                    <c:if test="${sessionScope.roleName eq 'Employee' and ticket.assignedTo eq sessionScope.userId and (ticket.status eq 'Assigned' or ticket.status eq 'In Progress')}">
                        <div class="card mb-4"><div class="card-header"><h5 class="mb-0">Resolve Ticket</h5></div><div class="card-body">
                            <form method="post" action="${pageContext.request.contextPath}/tickets" enctype="multipart/form-data">
                                <input type="hidden" name="action" value="resolve"><input type="hidden" name="ticketId" value="${ticket.ticketId}">
                                <div class="mb-3"><label class="form-label">Solution <span class="text-danger">*</span></label><textarea name="solution" class="form-control" rows="5" required></textarea></div>
                                <div class="mb-3"><label class="form-label">Resolution Notes</label><textarea name="resolutionNotes" class="form-control" rows="3"></textarea></div>
                                <div class="mb-3"><label class="form-label">Resolution Attachment</label><input type="file" name="resolutionAttachment" class="form-control"></div>
                                <button class="btn btn-success w-100" type="submit"><i class="ti ti-check me-1"></i>Mark as Resolved</button>
                            </form>
                        </div></div>
                    </c:if>

                    <c:if test="${ticket.raisedBy eq sessionScope.userId and ticket.status eq 'Resolved'}">
                        <div class="card mb-4"><div class="card-header"><h5 class="mb-0">Check Solution</h5></div><div class="card-body">
                            <form method="post" action="${pageContext.request.contextPath}/tickets" class="mb-3"><input type="hidden" name="action" value="close"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><button type="submit" class="btn btn-success w-100"><i class="ti ti-lock-check me-1"></i>Close Ticket</button></form>
                            <form method="post" action="${pageContext.request.contextPath}/tickets"><input type="hidden" name="action" value="reopen"><input type="hidden" name="ticketId" value="${ticket.ticketId}"><label class="form-label">Not satisfactory?</label><textarea name="reopenReason" class="form-control mb-2" rows="3" placeholder="Reason for reopening" required></textarea><button type="submit" class="btn btn-outline-danger w-100"><i class="ti ti-refresh me-1"></i>Reopen Ticket</button></form>
                        </div></div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
