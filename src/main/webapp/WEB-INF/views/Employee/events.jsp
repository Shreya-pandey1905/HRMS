<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><title>Event Calendar - HRMS</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <style>
        .sidebar{height:100vh!important;overflow-y:auto!important}.calendar-wrap{display:grid;grid-template-columns:minmax(0,1fr) 300px;gap:20px}.calendar-card,.side-card{border:1px solid #e8ebef;border-radius:10px;background:#fff}.calendar-toolbar{display:flex;align-items:center;justify-content:space-between;gap:12px;padding:16px;border-bottom:1px solid #e8ebef}.calendar-nav{display:flex;gap:7px}.calendar-nav button{border:0;background:#263445;color:#fff;border-radius:4px;padding:7px 11px}.calendar-title{font-size:24px;font-weight:700;color:#19253f;margin:0}.calendar-grid{display:grid;grid-template-columns:repeat(7,1fr)}.weekday{padding:12px 8px;text-align:center;font-weight:600;border-right:1px solid #e8ebef;border-bottom:1px solid #e8ebef}.day-cell{min-height:128px;border-right:1px solid #e8ebef;border-bottom:1px solid #e8ebef;padding:7px;overflow:hidden}.day-cell:nth-child(7n),.weekday:nth-child(7n){border-right:0}.day-number{text-align:right;color:#263445;font-size:13px;margin-bottom:7px}.other-month .day-number{color:#c2c7cc}.today-cell{background:#fff9db}.calendar-event{display:block;color:#fff;border-radius:4px;padding:4px 6px;margin-bottom:4px;font-size:12px;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}.upcoming{padding:14px}.upcoming-item{border:1px solid #e1e5ea;border-radius:8px;padding:14px;margin-bottom:12px}.upcoming-title{font-weight:600;color:#17213a;margin-bottom:5px}.upcoming-date{font-size:13px;color:#16a3a3}.event-dot{width:10px;height:10px;display:inline-block;border-radius:50%;margin-right:6px}@media(max-width:1000px){.calendar-wrap{grid-template-columns:1fr}.day-cell{min-height:100px}}@media(max-width:700px){.calendar-title{font-size:18px}.day-cell{min-height:80px;padding:4px}.calendar-event{font-size:10px}.weekday{font-size:12px;padding:8px 2px}}
    </style>
</head>
<body><div class="main-wrapper">
    <div class="header"><div class="main-header"><div class="header-left"><a href="${pageContext.request.contextPath}/employee/dashboard" class="logo"><img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS Logo"></a><a href="${pageContext.request.contextPath}/employee/dashboard" class="dark-logo"><img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="HRMS Logo"></a></div><a id="mobile_btn" class="mobile_btn" href="#sidebar"><span class="bar-icon"><span></span><span></span><span></span></span></a><div class="header-user"><div class="nav user-menu nav-list"><div class="me-auto d-flex align-items-center" id="header-search"><a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1"><i class="ti ti-arrow-bar-to-left"></i></a><div class="input-group input-group-flat d-inline-flex me-1"><span class="input-icon-addon"><i class="ti ti-search"></i></span><input type="text" class="form-control" placeholder="Search in HRMS"><span class="input-group-text"><kbd>CTRL + /</kbd></span></div></div></div></div></div></div>

    <!-- Sidebar -->
    <jsp:include page="/WEB-INF/views/common/employee-sidebar.jsp" />
    <div class="page-wrapper"><div class="content">
        <div class="page-header"><div class="row"><div class="col-12"><h4 class="page-title">Event Calendar</h4><p class="text-muted mb-0">View company holidays, birthdays and other events</p></div></div></div>
        <div class="calendar-wrap"><div class="calendar-card"><div class="calendar-toolbar"><div class="calendar-nav"><button id="prevMonth" type="button"><i class="ti ti-chevron-left"></i></button><button id="nextMonth" type="button"><i class="ti ti-chevron-right"></i></button><button id="todayBtn" type="button">today</button></div><h3 id="calendarTitle" class="calendar-title"></h3><span class="badge bg-dark px-3 py-2">month</span></div><div class="calendar-grid" id="calendarGrid"><div class="weekday">Sun</div><div class="weekday">Mon</div><div class="weekday">Tue</div><div class="weekday">Wed</div><div class="weekday">Thu</div><div class="weekday">Fri</div><div class="weekday">Sat</div></div></div>
            <div class="side-card"><div class="card-header bg-white"><strong>Company Events</strong></div><div class="upcoming"><c:choose><c:when test="${not empty events}"><c:forEach var="event" items="${events}"><div class="upcoming-item"><div class="upcoming-title"><span class="event-dot" style="background:${event.color}"></span><c:out value="${event.title}"/></div><div class="upcoming-date">${event.eventDate} · <c:out value="${event.eventTypeName}"/></div></div></c:forEach></c:when><c:otherwise><p class="text-muted mb-0">No active events available.</p></c:otherwise></c:choose></div></div>
        </div>
        <div class="d-none"><c:forEach var="event" items="${events}"><span class="calendar-event-data" data-title="${fn:escapeXml(event.title)}" data-date="${event.eventDate}" data-color="${event.color}"></span></c:forEach></div>
    </div></div>
</div>
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>(function(){const events=Array.from(document.querySelectorAll('.calendar-event-data')).map(el=>({title:el.dataset.title,date:el.dataset.date,color:el.dataset.color}));const grid=document.getElementById('calendarGrid'),title=document.getElementById('calendarTitle');let cursor=new Date();cursor=new Date(cursor.getFullYear(),cursor.getMonth(),1);function ymd(d){return d.getFullYear()+'-'+String(d.getMonth()+1).padStart(2,'0')+'-'+String(d.getDate()).padStart(2,'0')}function render(){grid.querySelectorAll('.day-cell').forEach(e=>e.remove());title.textContent=cursor.toLocaleString('en-US',{month:'long',year:'numeric'});const first=new Date(cursor.getFullYear(),cursor.getMonth(),1),start=new Date(first);start.setDate(first.getDate()-first.getDay());const today=ymd(new Date());for(let i=0;i<42;i++){const d=new Date(start);d.setDate(start.getDate()+i);const cell=document.createElement('div');cell.className='day-cell';if(d.getMonth()!==cursor.getMonth())cell.classList.add('other-month');if(ymd(d)===today)cell.classList.add('today-cell');const num=document.createElement('div');num.className='day-number';num.textContent=d.getDate();cell.appendChild(num);events.filter(e=>e.date===ymd(d)).forEach(ev=>{const span=document.createElement('span');span.className='calendar-event';span.textContent=ev.title;span.style.background=ev.color||'#563d7c';span.title=ev.title;cell.appendChild(span)});grid.appendChild(cell)}}document.getElementById('prevMonth').addEventListener('click',()=>{cursor.setMonth(cursor.getMonth()-1);render()});document.getElementById('nextMonth').addEventListener('click',()=>{cursor.setMonth(cursor.getMonth()+1);render()});document.getElementById('todayBtn').addEventListener('click',()=>{const d=new Date();cursor=new Date(d.getFullYear(),d.getMonth(),1);render()});render()})();</script>
</body></html>
