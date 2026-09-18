<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Master Events - HRMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .sidebar{height:100vh!important;overflow-y:auto!important}.event-card{border:1px solid #e9ecef;border-radius:10px}.event-heading{font-size:20px;font-weight:600;color:#1f2d5a}.event-btn{background:#ff6b35;border-color:#ff6b35;color:#fff}.event-btn:hover{background:#e85b29;border-color:#e85b29;color:#fff}.color-sample{width:34px;height:34px;border-radius:5px;display:inline-block;border:1px solid rgba(0,0,0,.08)}.event-table th{background:#eef0f3;white-space:nowrap}.color-input{width:56px;height:42px;padding:3px;border:1px solid #dfe3e8;border-radius:6px}.delete-btn{border:0;background:transparent;color:#52677d;font-size:18px}
    </style>
</head>
<body>
<div class="main-wrapper">
     <%@ include file="adminHeader.jsp" %>
     <%@ include file="adminSidebar.jsp" %>
    <div class="page-wrapper"><div class="content">
        <div class="page-header"><div class="row align-items-center"><div class="col-sm-12">
            <h4 class="page-title">Master Events</h4><p class="text-muted mb-0">Create event types and assign their calendar colors</p>
        </div></div></div>

        <c:if test="${param.message == 'added'}"><div class="alert alert-success">Event type added successfully.</div></c:if>
        <c:if test="${param.message == 'deleted'}"><div class="alert alert-success">Event type deleted successfully.</div></c:if>
        <c:if test="${param.message == 'inuse'}"><div class="alert alert-warning">This event type is already used by an event, so it cannot be deleted.</div></c:if>
        <c:if test="${not empty error}"><div class="alert alert-danger"><c:out value="${error}"/></div></c:if>

        <div class="row g-4">
            <div class="col-lg-6"><div class="card event-card"><div class="card-header bg-white"><h5 class="event-heading mb-0">Add Event Type</h5></div><div class="card-body">
                <form method="post" action="${pageContext.request.contextPath}/admin/event-types">
                    <div class="mb-3"><label class="form-label">Event Type Name</label><input type="text" name="eventTypeName" class="form-control" maxlength="100" required placeholder="e.g. Holiday, Birthday"></div>
                    <div class="mb-3"><label class="form-label d-block">Color</label><input type="color" name="color" value="#563d7c" class="color-input" required><div class="text-muted small mt-1">Choose a color for this event type</div></div>
                    <button type="submit" class="btn event-btn"><i class="ti ti-circle-plus me-1"></i>Add Event Type</button>
                </form>
            </div></div></div>

            <div class="col-lg-6"><div class="card event-card"><div class="card-header bg-white"><h5 class="event-heading mb-0">Existing Event Types</h5></div><div class="card-body">
                <div class="table-responsive"><table class="table event-table align-middle mb-0"><thead><tr><th>Name</th><th>Color</th><th>Sample</th><th>Action</th></tr></thead><tbody>
                <c:choose><c:when test="${not empty eventTypes}"><c:forEach var="type" items="${eventTypes}"><tr>
                    <td><c:out value="${type.eventTypeName}"/></td><td><c:out value="${type.color}"/></td><td><span class="color-sample" style="background:${type.color}"></span></td>
                    <td><form method="post" action="${pageContext.request.contextPath}/admin/event-types" class="d-inline"><input type="hidden" name="action" value="delete"><input type="hidden" name="eventTypeId" value="${type.eventTypeId}"><button type="submit" class="delete-btn" title="Delete" onclick="return confirm('Delete this event type?');"><i class="ti ti-trash"></i></button></form></td>
                </tr></c:forEach></c:when><c:otherwise><tr><td colspan="4" class="text-center text-muted py-4">No event types yet.</td></tr></c:otherwise></c:choose>
                </tbody></table></div>
            </div></div></div>
        </div>
    </div></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
</body>
</html>
