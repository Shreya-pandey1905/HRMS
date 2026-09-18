<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %>
<!-- Breadcrumb -->
<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
    <div class="my-auto mb-2">
        <h2 class="mb-1">${dashTitle}</h2>
        <nav>
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                    <a href="${homeUrl}">
                       <i class="ti ti-smart-home"></i>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item">Dashboard</li>
                                    <li class="breadcrumb-item active" aria-current="page">${dashTitle}</li>
                                </ol>
                            </nav>
                             </div>
                                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                                    <div class="me-2 mb-2">
                                        <div class="dropdown">
                                            <a href="javascript:void(0);"
                                               class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                               data-bs-toggle="dropdown">
                                                <i class="ti ti-file-export me-1"></i>Export
                                            </a>

                                              <ul class="dropdown-menu dropdown-menu-end p-3">
                                                                <li>
                                                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                                                        <i class="ti ti-file-type-pdf me-1"></i>Export as PDF
                                                                    </a>
                                                                </li>
                                                                <li>
                                                                    <a href="javascript:void(0);" class="dropdown-item rounded-1">
                                                                        <i class="ti ti-file-type-xls me-1"></i>Export as Excel
                                                                    </a>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="mb-2">
                                                        <div class="input-icon position-relative">
                                                            <span class="input-icon-addon">
                                                                <i class="ti ti-calendar text-gray-9"></i>
                                                            </span>

                                                              <input type="text" class="form-control date-range bookingrange"
                                                                                   placeholder="dd/mm/yyyy - dd/mm/yyyy">
                                                                        </div>
                                                                    </div>
                                                                    <div class="ms-2 head-icons">
                                                                        <a href="javascript:void(0);" data-bs-toggle="tooltip" data-bs-placement="top"
                                                                           title="Collapse" id="collapse-header">
                                                                            <i class="ti ti-chevrons-up"></i>
                                                                        </a>
                                                                    </div>
                                                                </div>
                                                            </div>
<!-- Optional leave notice (no leave module wired) -->
<div class="alert alert-success alert-dismissible fade show mb-3" role="alert">
    Leave notifications will appear here when the leave module is available.
    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<div class="row">


    <!-- Profile card -->
    <div class="col-xl-4 d-flex">
        <div class="card position-relative flex-fill">
            <div class="card-header bg-dark">
                <div class="d-flex align-items-center">
                    <span class="avatar avatar-xl avatar-rounded border border-white border-2 flex-shrink-0">
                        <c:choose>
                            <c:when test="${not empty profileImgUrl}">
                                <img src="${profileImgUrl}" alt="Profile"
                                     style="width:100%;height:100%;object-fit:cover;"
                                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                     alt="Profile" style="width:100%;height:100%;object-fit:cover;">
                            </c:otherwise>
                        </c:choose>
                    </span>

                      <div class="text-white ms-3">
                                            <h5 class="mb-1 text-white">
                                                <c:choose>
                                                    <c:when test="${not empty currentUser}">
                                                        ${currentUser.firstName} ${currentUser.lastName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${sessionScope.firstName}
                                                    </c:otherwise>
                                                </c:choose>
                                            </h5>
                                            <p class="mb-0 text-white-50 fs-13">
                                                <c:choose>
                                                    <c:when test="${not empty currentUser.designationName}">
                                                        ${currentUser.designationName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${sessionScope.roleName}
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>

                                      <a href="javascript:void(0);"
                                                       class="btn btn-icon btn-sm text-white position-absolute"
                                                       style="top:12px;right:12px;" title="Edit">
                                                        <i class="ti ti-edit"></i>
                                                    </a>
                                                </div>
                                                <div class="card-body">
                                                    <div class="mb-3">
                                                        <span class="d-block mb-1 fs-13 text-gray-5">
                                                            <i class="ti ti-phone me-1"></i>Phone Number
                                                        </span>
                                                          <h6 class="fw-medium">
                                                                                <c:choose>
                                                                                    <c:when test="${not empty currentUser.phoneNumber}">
                                                                                        ${currentUser.phoneNumber}
                                                                                    </c:when>
                                                                                    <c:otherwise>—</c:otherwise>
                                                                                </c:choose>
                                                                            </h6>
                                                                        </div>
                                                                        <div class="mb-3">
                                                                            <span class="d-block mb-1 fs-13 text-gray-5">
                                                                                <i class="ti ti-mail me-1"></i>Email Address
                                                                            </span>

                                                                              <h6 class="fw-medium">
                                                                                                    <c:choose>
                                                                                                        <c:when test="${not empty currentUser.email}">
                                                                                                            ${currentUser.email}
                                                                                                        </c:when>
                                                                                                        <c:otherwise>
                                                                                                            ${sessionScope.email}
                                                                                                        </c:otherwise>
                                                                                                    </c:choose>
                                                                                                </h6>
                                                                                            </div>
                                                                                            <div class="mb-3">
                                                                                                <span class="d-block mb-1 fs-13 text-gray-5">
                                                                                                    <i class="ti ti-building me-1"></i>Report Office
                                                                                                </span>

                                                                                                 <h6 class="fw-medium">
                                                                                                                        <c:choose>
                                                                                                                            <c:when test="${not empty currentUser.departmentName}">
                                                                                                                                ${currentUser.departmentName}
                                                                                                                            </c:when>
                                                                                                                            <c:otherwise>Not Assigned</c:otherwise>
                                                                                                                        </c:choose>
                                                                                                                    </h6>
                                                                                                                </div>
                                                                                                                <div class="mb-0">
                                                                                                                    <span class="d-block mb-1 fs-13 text-gray-5">
                                                                                                                        <i class="ti ti-calendar me-1"></i>Joined on
                                                                                                                    </span>

                                                                                                                       <h6 class="fw-medium mb-0">
                                                                                                                                            <c:choose>
                                                                                                                                                <c:when test="${not empty joinedOnDisplay}">
                                                                                                                                                    ${joinedOnDisplay}
                                                                                                                                                </c:when>
                                                                                                                                                <c:otherwise>—</c:otherwise>
                                                                                                                                            </c:choose>
                                                                                                                                        </h6>
                                                                                                                                    </div>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>

 <!-- Leave chart (no leave service) -->
    <div class="col-xl-4 d-flex">
        <div class="card flex-fill">
            <div class="card-header">
                <h5 class="mb-0">Leave Details</h5>
            </div>
            <div class="card-body d-flex flex-column">
                <div class="flex-fill d-flex align-items-center justify-content-center text-center text-muted py-4">
                    <div>
                        <i class="ti ti-calendar-off fs-32 mb-2 d-block"></i>
                        <p class="mb-0 fs-13">No leave chart data available</p>
                    </div>
                </div>
                <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-2 mt-3">
                    <p class="f-13 mb-0"><i class="ti ti-circle-filled text-dark me-1"></i>0 on time</p>
                    <p class="f-13 mb-0"><i class="ti ti-circle-filled text-success me-1"></i>0 Late</p>
                    <p class="f-13 mb-0"><i class="ti ti-circle-filled text-danger me-1"></i>0 Absent</p>
                    <p class="f-13 mb-0"><i class="ti ti-circle-filled text-warning me-1"></i>0 Sick Leave</p>
                </div>
                </div>
                        </div>
                    </div>

 <!-- Leave stats (no leave service) -->
     <div class="col-xl-4 d-flex">
         <div class="card flex-fill">
             <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-2">
                 <h5 class="mb-0">Leave Details</h5>
                 <div class="d-flex align-items-center">
                     <div class="dropdown me-2">
                         <a href="javascript:void(0);"
                            class="dropdown-toggle btn btn-white btn-sm d-inline-flex align-items-center"
                            data-bs-toggle="dropdown">
                             2026
                         </a>
                         <ul class="dropdown-menu dropdown-menu-end p-3">
                             <li><a href="javascript:void(0);" class="dropdown-item rounded-1">2026</a></li>
                             <li><a href="javascript:void(0);" class="dropdown-item rounded-1">2025</a></li>
                         </ul>
                     </div>


                   <a href="javascript:void(0);" class="btn btn-icon btn-sm btn-light" title="Settings">
                                          <i class="ti ti-settings text-gray-6"></i>
                                      </a>
                                  </div>
                              </div>
                              <div class="card-body">
                                  <div class="row g-2">
                                      <div class="col-sm-6">
                                          <div class="p-3 border rounded text-center">
                                              <p class="fs-13 mb-1">Total Leaves</p>
                                              <h5 class="mb-0">—</h5>
                                          </div>
                                      </div>


                                          <div class="col-sm-6">
                                                              <div class="p-3 border rounded text-center">
                                                                  <p class="fs-13 mb-1">Taken</p>
                                                                  <h5 class="mb-0">—</h5>
                                                              </div>
                                                          </div>
                                                          <div class="col-sm-6">
                                                              <div class="p-3 border rounded text-center">
                                                                  <p class="fs-13 mb-1">Absent</p>
                                                                  <h5 class="mb-0">—</h5>
                                                              </div>
                                                          </div>
                                                          <div class="col-sm-6">
                                                              <div class="p-3 border rounded text-center">
                                                                  <p class="fs-13 mb-1">Sick Leave</p>
                                                                  <h5 class="mb-0">—</h5>
                                                              </div>
                                                          </div>
 <div class="col-sm-6">
                        <div class="p-3 border rounded text-center">
                            <p class="fs-13 mb-1">Worked Days</p>
                            <h5 class="mb-0">—</h5>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="p-3 border rounded text-center">
                            <p class="fs-13 mb-1">Loss of Pay</p>
                            <h5 class="mb-0">—</h5>
                        </div>
                    </div>
                </div>
                <a href="javascript:void(0);" class="btn btn-dark w-100 mt-3">Apply Leave</a>
                <p class="fs-12 text-muted text-center mt-2 mb-0">Leave module data is not available yet.</p>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <!-- Greeting / attendance card -->
    <div class="col-xl-6 d-flex">
        <div class="card flex-fill">
            <div class="card-body">
                <div class="d-flex align-items-start justify-content-between flex-wrap row-gap-2 mb-3">
                    <div>


                     <h4 class="mb-1">${greetingText},
                                                <c:choose>
                                                    <c:when test="${not empty currentUser}">
                                                        ${currentUser.firstName}
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${sessionScope.firstName}
                                                    </c:otherwise>
                                                </c:choose>
                                            </h4>

                  <p class="fs-13 mb-0 text-gray-5">
                                             ${currentTimeDisplay}
                                             <c:if test="${empty attendanceDateDisplay}">
                                                 , No attendance date available
                                             </c:if>
                                             <c:if test="${not empty attendanceDateDisplay}">
                                                 , ${attendanceDateDisplay}
                                             </c:if>
                                         </p>
                                     </div>
                                     <span class="avatar avatar-lg avatar-rounded">
                                         <c:choose>
                                             <c:when test="${not empty profileImgUrl}">
                                                 <img src="${profileImgUrl}" alt="Profile"
                                                      style="width:100%;height:100%;object-fit:cover;"
                                                      onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                                             </c:when>
                                             <c:otherwise>


               <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                                    alt="Profile" style="width:100%;height:100%;object-fit:cover;">
                                           </c:otherwise>
                                       </c:choose>
                                   </span>
                               </div>
                               <div class="border rounded p-3 bg-light">
                                   <p class="fs-13 mb-0 text-muted">
                                       <i class="ti ti-clock me-1"></i>
                                       Attendance / clock-in details are not available yet.
                                   </p>
                               </div>
                           </div>
                       </div>
                   </div>



                   <!-- Hours cards -->
                       <div class="col-xl-2 col-md-4 d-flex">
                           <div class="card flex-fill">
                               <div class="card-body">
                                   <span class="avatar avatar-sm bg-primary mb-2">
                                       <i class="ti ti-clock-hour-4 fs-16"></i>
                                   </span>
                                   <h5 class="mb-1">— / 9</h5>
                                   <p class="fs-13 mb-0">Total Hours Today</p>
                                   <span class="fs-12 text-muted">No attendance data</span>
                               </div>
                           </div>
                       </div>


                       <div class="col-xl-2 col-md-4 d-flex">
                               <div class="card flex-fill">
                                   <div class="card-body">
                                       <span class="avatar avatar-sm bg-dark mb-2">
                                           <i class="ti ti-clock-hour-4 fs-16"></i>
                                       </span>
                                       <h5 class="mb-1">— / 40</h5>
                                       <p class="fs-13 mb-0">Total Hours Week</p>
                                       <span class="fs-12 text-muted">No attendance data</span>
                                   </div>
                               </div>
                           </div>

                           <div class="col-xl-2 col-md-4 d-flex">
                                   <div class="card flex-fill">
                                       <div class="card-body">
                                           <span class="avatar avatar-sm bg-info mb-2">
                                               <i class="ti ti-clock-hour-4 fs-16"></i>
                                           </span>
                                           <h5 class="mb-1">— / 98</h5>
                                           <p class="fs-13 mb-0">Total Hours Month</p>
                                           <span class="fs-12 text-muted">No attendance data</span>
                                       </div>
                                   </div>
                               </div>
                           </div>