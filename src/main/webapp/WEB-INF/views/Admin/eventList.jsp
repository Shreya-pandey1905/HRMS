<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Events List - HRMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

<style>
    .event-card{border:1px solid #e9ecef;border-radius:10px}
    .event-table th{background:#eef0f3;white-space:nowrap}
    .add-btn{background:#ff6b35;border-color:#ff6b35;color:#fff}
    .add-btn:hover{background:#e85b29;border-color:#e85b29;color:#fff}
    .status-active{background:#16c784;color:#fff}
    .status-inactive{background:#e53935;color:#fff}
    .status-pill{display:inline-flex;align-items:center;gap:6px;padding:5px 10px;border-radius:5px;font-size:12px;font-weight:600}
    .type-dot{width:12px;height:12px;border-radius:3px;display:inline-block;margin-right:6px}
    .action-btn{border:0;background:transparent;color:#52677d;font-size:18px;margin-right:8px}
</style>
</head>
<body><div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>
    <%@ include file="adminSidebar.jsp" %>
    <div class="page-wrapper"><div class="content">
        <div class="page-header"><div class="row align-items-center"><div class="col-sm-8"><h4 class="page-title">Events List</h4><p class="text-muted mb-0">View, edit and delete company events</p></div><div class="col-sm-4 text-sm-end mt-3 mt-sm-0"><a href="${pageContext.request.contextPath}/admin/events?action=add" class="btn add-btn"><i class="ti ti-circle-plus me-1"></i>Add Event</a></div></div></div>
        <c:if test="${param.message == 'deleted'}"><div class="alert alert-success">Event deleted successfully.</div></c:if>
        <div class="card event-card"><div class="card-body">
            <div class="d-flex justify-content-between align-items-center mb-4"><h5 class="mb-0">Event Details</h5><input id="eventSearch" type="text" class="form-control" placeholder="Search" style="max-width:220px"></div>
            <div class="table-responsive"><table id="eventTable" class="table event-table align-middle mb-0"><thead><tr><th>ID</th><th>Title</th><th>Event Type</th><th>Date</th><th>Status</th><th>Action</th></tr></thead><tbody>
            <c:choose><c:when test="${not empty events}"><c:forEach var="event" items="${events}"><tr>
                <td>${event.eventId}</td><td><strong><c:out value="${event.title}"/></strong></td><td><span class="type-dot" style="background:${event.color}"></span><c:out value="${event.eventTypeName}"/></td><td>${event.eventDate}</td>
                <td><c:choose><c:when test="${event.active}"><span class="status-pill status-active">• Active</span></c:when><c:otherwise><span class="status-pill status-inactive">• Inactive</span></c:otherwise></c:choose></td>
                <td><a class="action-btn" title="Edit" href="${pageContext.request.contextPath}/admin/events?action=edit&id=${event.eventId}"><i class="ti ti-edit"></i></a><form class="d-inline" method="post" action="${pageContext.request.contextPath}/admin/events/list"><input type="hidden" name="action" value="delete"><input type="hidden" name="eventId" value="${event.eventId}"><button class="action-btn" title="Delete" type="submit" onclick="return confirm('Delete this event?');"><i class="ti ti-trash"></i></button></form></td>
            </tr></c:forEach></c:when><c:otherwise><tr><td colspan="6" class="text-center py-4 text-muted">No events found.</td></tr></c:otherwise></c:choose>
            </tbody></table></div>
        </div></div>
    </div></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>document.addEventListener('DOMContentLoaded',function(){const input=document.getElementById('eventSearch'),rows=document.querySelectorAll('#eventTable tbody tr');input.addEventListener('input',function(){const q=this.value.toLowerCase();rows.forEach(r=>r.style.display=r.textContent.toLowerCase().includes(q)?'':'none');});});</script>
</body></html>
