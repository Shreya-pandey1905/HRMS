<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Events - HRMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .sidebar{height:100vh!important;overflow-y:auto!important}.calendar-wrap{display:grid;grid-template-columns:minmax(0,1fr) 320px;gap:20px}.calendar-card,.event-side-card{border:1px solid #e8ebef;border-radius:10px;background:#fff}.calendar-toolbar{display:flex;align-items:center;justify-content:space-between;gap:12px;padding:16px;border-bottom:1px solid #e8ebef}.calendar-nav{display:flex;gap:7px}.calendar-nav button{border:0;background:#263445;color:#fff;border-radius:4px;padding:7px 11px}.calendar-title{font-size:24px;font-weight:700;color:#19253f;margin:0}.calendar-grid{display:grid;grid-template-columns:repeat(7,1fr)}.weekday{padding:12px 8px;text-align:center;font-weight:600;border-right:1px solid #e8ebef;border-bottom:1px solid #e8ebef}.day-cell{min-height:128px;border-right:1px solid #e8ebef;border-bottom:1px solid #e8ebef;padding:7px;overflow:hidden}.day-cell:nth-child(7n),.weekday:nth-child(7n){border-right:0}.day-number{text-align:right;color:#263445;font-size:13px;margin-bottom:7px}.other-month .day-number{color:#c2c7cc}.today-cell{background:#fff9db}.calendar-event{display:block;color:#fff!important;border-radius:4px;padding:4px 6px;margin-bottom:4px;font-size:12px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.add-event-btn{width:100%;background:#ff6b35;border-color:#ff6b35;color:#fff;font-size:17px;font-weight:600;padding:13px}.add-event-btn:hover{background:#e85b29;border-color:#e85b29;color:#fff}.upcoming{padding:14px}.upcoming-item{border:1px solid #e1e5ea;border-radius:8px;padding:14px;margin-bottom:12px}.upcoming-title{font-weight:600;color:#17213a;margin-bottom:5px}.upcoming-date{font-size:13px;color:#16a3a3}.event-dot{width:10px;height:10px;display:inline-block;border-radius:50%;margin-right:6px}.event-modal-backdrop{display:none;position:fixed;inset:0;background:rgba(0,0,0,.45);z-index:1050;align-items:center;justify-content:center;padding:20px}.event-modal-backdrop.show{display:flex}.event-modal{width:min(540px,100%);background:#fff;border-radius:10px;box-shadow:0 20px 60px rgba(0,0,0,.25)}.event-modal-header{padding:20px;border-bottom:1px solid #eee;display:flex;justify-content:space-between;align-items:center}.event-modal-body{padding:20px}.modal-close{border:0;background:transparent;font-size:25px;line-height:1}.orange-btn{background:#ff6b35;border-color:#ff6b35;color:#fff}.orange-btn:hover{background:#e85b29;border-color:#e85b29;color:#fff}@media(max-width:1100px){.calendar-wrap{grid-template-columns:1fr}.day-cell{min-height:100px}}@media(max-width:700px){.calendar-title{font-size:18px}.day-cell{min-height:80px;padding:4px}.calendar-event{font-size:10px}.weekday{font-size:12px;padding:8px 2px}}
    </style>
</head>
<body>
<div class="main-wrapper">
    <jsp:include page="adminHeader.jsp"/><jsp:include page="adminSidebar.jsp"/>
    <div class="page-wrapper"><div class="content">
        <div class="page-header"><div class="row"><div class="col-12"><h4 class="page-title">Events</h4><p class="text-muted mb-0">Company event calendar</p></div></div></div>
        <c:if test="${param.message == 'added'}"><div class="alert alert-success">Event added successfully.</div></c:if>
        <c:if test="${param.message == 'updated'}"><div class="alert alert-success">Event updated successfully.</div></c:if>
        <c:if test="${not empty error}"><div class="alert alert-danger"><c:out value="${error}"/></div></c:if>

        <div class="calendar-wrap">
            <div class="calendar-card">
                <div class="calendar-toolbar">
                    <div class="calendar-nav"><button type="button" id="prevMonth"><i class="ti ti-chevron-left"></i></button><button type="button" id="nextMonth"><i class="ti ti-chevron-right"></i></button><button type="button" id="todayBtn">today</button></div>
                    <h3 id="calendarTitle" class="calendar-title"></h3>
                    <div><span class="badge bg-dark px-3 py-2">month</span></div>
                </div>
                <div class="calendar-grid" id="calendarGrid">
                    <div class="weekday">Sun</div><div class="weekday">Mon</div><div class="weekday">Tue</div><div class="weekday">Wed</div><div class="weekday">Thu</div><div class="weekday">Fri</div><div class="weekday">Sat</div>
                </div>
            </div>

            <div>
                <button type="button" class="btn add-event-btn mb-3" id="openEventModal"><i class="ti ti-circle-plus me-1"></i>Add New Event</button>
                <div class="event-side-card"><div class="card-header bg-white"><strong>Upcoming / Active Events</strong></div><div class="upcoming">
                    <c:choose><c:when test="${not empty events}"><c:forEach var="event" items="${events}"><div class="upcoming-item"><div class="upcoming-title"><span class="event-dot" style="background:${event.color}"></span><c:out value="${event.title}"/></div><div class="upcoming-date">${event.eventDate} · <c:out value="${event.eventTypeName}"/></div></div></c:forEach></c:when><c:otherwise><p class="text-muted mb-0">No active events yet.</p></c:otherwise></c:choose>
                </div></div>
            </div>
        </div>

        <div id="calendarEventData" class="d-none">
            <c:forEach var="event" items="${events}"><span class="calendar-event-data" data-id="${event.eventId}" data-title="${fn:escapeXml(event.title)}" data-date="${event.eventDate}" data-color="${event.color}"></span></c:forEach>
        </div>
    </div></div>
</div>

<div id="eventModal" class="event-modal-backdrop ${openEventModal ? 'show' : ''}">
    <div class="event-modal">
        <div class="event-modal-header"><h4 class="mb-0">${empty editEvent ? 'Add New Event' : 'Edit Event'}</h4><button type="button" class="modal-close" id="closeEventModal">&times;</button></div>
        <div class="event-modal-body">
            <c:if test="${empty eventTypes}"><div class="alert alert-warning">Create a Master Event type first before adding events.</div></c:if>
            <form method="post" action="${pageContext.request.contextPath}/admin/events">
                <c:if test="${not empty editEvent}"><input type="hidden" name="action" value="edit"><input type="hidden" name="eventId" value="${editEvent.eventId}"></c:if>
                <div class="mb-3"><label class="form-label">Event Title</label><input type="text" name="title" class="form-control" maxlength="150" required value="${fn:escapeXml(editEvent.title)}" placeholder="Enter event title"></div>
                <div class="mb-3"><label class="form-label">Event Date</label><input type="date" name="eventDate" class="form-control" required value="${editEvent.eventDate}"></div>
                <div class="mb-3"><label class="form-label">Event Type</label><select name="eventTypeId" class="form-select" required><option value="">Select Event Type</option><c:forEach var="type" items="${eventTypes}"><option value="${type.eventTypeId}" ${not empty editEvent && editEvent.eventTypeId == type.eventTypeId ? 'selected' : ''}><c:out value="${type.eventTypeName}"/></option></c:forEach></select></div>
                <c:if test="${not empty editEvent}"><div class="mb-3"><label class="form-label">Status</label><select name="active" class="form-select"><option value="true" ${editEvent.active ? 'selected' : ''}>Active</option><option value="false" ${!editEvent.active ? 'selected' : ''}>Inactive</option></select></div></c:if>
                <button type="submit" class="btn orange-btn" ${empty eventTypes ? 'disabled' : ''}><i class="ti ti-circle-plus me-1"></i>${empty editEvent ? 'Add Event' : 'Update Event'}</button>
                <c:if test="${not empty editEvent}"><a href="${pageContext.request.contextPath}/admin/events" class="btn btn-light ms-2">Cancel</a></c:if>
            </form>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script><script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>
(function(){
    const events=Array.from(document.querySelectorAll('.calendar-event-data')).map(el=>({id:el.dataset.id,title:el.dataset.title,date:el.dataset.date,color:el.dataset.color}));
    const grid=document.getElementById('calendarGrid'),title=document.getElementById('calendarTitle');
    let cursor=new Date(); cursor=new Date(cursor.getFullYear(),cursor.getMonth(),1);
    function ymd(d){return d.getFullYear()+'-'+String(d.getMonth()+1).padStart(2,'0')+'-'+String(d.getDate()).padStart(2,'0')}
    function render(){
        grid.querySelectorAll('.day-cell').forEach(e=>e.remove());
        title.textContent=cursor.toLocaleString('en-US',{month:'long',year:'numeric'});
        const first=new Date(cursor.getFullYear(),cursor.getMonth(),1),start=new Date(first);start.setDate(first.getDate()-first.getDay());
        const today=ymd(new Date());
        for(let i=0;i<42;i++){
            const d=new Date(start);d.setDate(start.getDate()+i);const cell=document.createElement('div');cell.className='day-cell';if(d.getMonth()!==cursor.getMonth())cell.classList.add('other-month');if(ymd(d)===today)cell.classList.add('today-cell');
            const num=document.createElement('div');num.className='day-number';num.textContent=d.getDate();cell.appendChild(num);
            events.filter(e=>e.date===ymd(d)).forEach(ev=>{const a=document.createElement('a');a.className='calendar-event';a.href='${pageContext.request.contextPath}/admin/events?action=edit&id='+encodeURIComponent(ev.id);a.textContent=ev.title;a.style.background=ev.color||'#563d7c';a.title=ev.title;cell.appendChild(a);});grid.appendChild(cell);
        }
    }
    document.getElementById('prevMonth').addEventListener('click',()=>{cursor.setMonth(cursor.getMonth()-1);render()});
    document.getElementById('nextMonth').addEventListener('click',()=>{cursor.setMonth(cursor.getMonth()+1);render()});
    document.getElementById('todayBtn').addEventListener('click',()=>{const d=new Date();cursor=new Date(d.getFullYear(),d.getMonth(),1);render()});render();
    const modal=document.getElementById('eventModal');document.getElementById('openEventModal').addEventListener('click',()=>modal.classList.add('show'));document.getElementById('closeEventModal').addEventListener('click',()=>modal.classList.remove('show'));modal.addEventListener('click',e=>{if(e.target===modal)modal.classList.remove('show')});
})();
</script>
</body></html>
