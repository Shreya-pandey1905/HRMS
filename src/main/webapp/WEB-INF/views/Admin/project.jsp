<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<style>
    .card-body.p-0 {
        width: 100%;
    }

    .custom-datatable-filter {
        width: 100%;
    }

    .custom-datatable-filter .table {
        width: 100% !important;
        margin-left: 0 !important;
    }
</style>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="Smarthr - Bootstrap Admin Template">
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template">
    <meta name="robots" content="noindex, nofollow">
    <title>HRMS - Projects</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

    <!-- Theme Script js -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

     <!-- Color Picker Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Summernote CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Bootstrap Tagsinput CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

    <!-- Main CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<c:if test="${not empty sessionScope.successMessage}">
    <div id="successAlert"
         class="alert alert-success alert-dismissible fade show"
         role="alert"
         style="position: fixed; top: 70px; right: 20px; z-index: 9999; min-width: 300px; background-color: #198754; color: white; border: none;">
        <i class="ti ti-circle-check me-2"></i>
        <strong>Success!</strong> ${sessionScope.successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
    <% session.removeAttribute("successMessage"); %>
</c:if>


    <div id="global-loader" style="display: none;">
       <div class="page-loader"></div>
    </div>

    <!-- Main Wrapper -->
    <div class="main-wrapper">

       <!-- HEADER -->
    <div class="header">
        <div class="main-header">

            <div class="header-left">
                <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"
                   class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">
                </a>

                <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"
                   class="dark-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">
                </a>
            </div>

            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">
                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">
                            <i class="ti ti-arrow-bar-to-left"></i>
                        </a>

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

                        <a href="javascript:void(0);"
                           class="btn btn-menubar">
                            <i class="ti ti-settings-cog"></i>
                        </a>

                    </div>

                </div>
            </div>

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

    <!-- SIDEBAR -->
    <div class="sidebar" id="sidebar">

        <div class="sidebar-logo">

            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"
               class="logo logo-normal">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"
               class="logo-small">
                <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                     alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"
               class="dark-logo">
                <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                     alt="HRMS Logo">
            </a>

        </div>

        <!-- ADMIN PROFILE -->
        <div class="modern-profile p-3 pb-0">

            <div class="text-center rounded bg-light p-3 mb-4 user-profile">

                <div class="avatar avatar-lg online mb-3">
                    <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg"
                         alt="Admin Profile"
                         class="img-fluid rounded-circle">
                </div>

                <h6 class="fs-12 fw-normal mb-1">
                    Admin
                </h6>

                <p class="fs-10 mb-0">
                    Administrator
                </p>

            </div>

        </div>

        <!-- SIDEBAR MENU -->
        <div class="sidebar-menu">

            <ul>

                <li class="menu-title">
                    <span>MAIN MENU</span>
                </li>

                <!-- DASHBOARD -->
                <li class="active">
                    <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard">
                        <i class="ti ti-smart-home"></i>
                        <span>Dashboard</span>
                    </a>
                </li>

                <!-- EMPLOYEES -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-users"></i>
                        <span>Employees</span>
                    </a>
                </li>

                <!-- ATTENDANCE -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-calendar-check"></i>
                        <span>Attendance</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Leaves</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Attendance (Admin)</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Timesheet</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- EVENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-calendar-event"></i>
                        <span>Events</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Master Event</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Event List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PAYROLL -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-cash"></i>
                        <span>Payroll</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Add Employee Salary</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Payroll</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Employee Salary List</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Payslips Monthly</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Transaction History</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- TRAINING -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-school"></i>
                        <span>Training</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Trainer List</span>
                            </a>
                        </li>

                        <li class="submenu">

                            <a href="javascript:void(0);">
                                <span>Trainers</span>
                                <span class="menu-arrow"></span>
                            </a>

                            <ul>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Trainer Type</span>
                                    </a>
                                </li>

                            </ul>

                        </li>

                    </ul>

                </li>

                <!-- DOCUMENTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-file-description"></i>
                        <span>Documents</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li class="submenu">

                            <a href="javascript:void(0);">
                                <span>Upload Documents</span>
                                <span class="menu-arrow"></span>
                            </a>

                            <ul>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Upload Document</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="javascript:void(0);">
                                        <span>Document List</span>
                                    </a>
                                </li>

                            </ul>

                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Generate Letter</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- MASTER DOCUMENT -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-files"></i>
                        <span>Master Document</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Master Document List</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PERFORMANCE & GOAL -->
                <li>

                    <a href="javascript:void(0);">
                        <i class="ti ti-chart-line"></i>
                        <span>Performance &amp; Goal</span>
                    </a>

                </li>

                <!-- PROJECTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-briefcase"></i>
                        <span>Projects</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                           <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails">
                               <span>Project</span>
                           </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Tasks</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Board</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- REPORTS -->
                <li class="submenu">

                    <a href="javascript:void(0);">
                        <i class="ti ti-report-analytics"></i>
                        <span>Reports</span>
                        <span class="menu-arrow"></span>
                    </a>

                    <ul>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Employee Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Attendance Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Leave Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Payslip Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Task Report</span>
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);">
                                <span>Daily Report</span>
                            </a>
                        </li>

                    </ul>

                </li>

                <!-- PROMOTIONS -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-trending-up"></i>
                        <span>Promotions</span>
                    </a>
                </li>

                <!-- RESIGNATION -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-logout-2"></i>
                        <span>Resignation</span>
                    </a>
                </li>

                <!-- TERMINATION -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-user-x"></i>
                        <span>Termination</span>
                    </a>
                </li>

                <!-- HELP & SUPPORT -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-headset"></i>
                        <span>Help &amp; Supports</span>
                    </a>
                </li>

                <!-- TICKETS -->
                <li>
                    <a href="javascript:void(0);">
                        <i class="ti ti-ticket"></i>
                        <span>Tickets</span>
                    </a>
                </li>

                <!-- LOGOUT -->
                <li class="mt-2">
                    <a href="javascript:void(0);">
                        <i class="ti ti-logout"></i>
                        <span>Logout</span>
                    </a>
                </li>

            </ul>

        </div>

    </div>

    <!-- Page Wrapper -->
       <div class="page-wrapper">
          <div class="content">

             <!-- Breadcrumb -->
             <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                   <h2 class="mb-1">Projects</h2>
                   <nav>
                      <ol class="breadcrumb mb-0">
                         <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=dashboard"><i class="ti ti-smart-home"></i></a>
                         </li>
                         <li class="breadcrumb-item">
                            Admin
                         </li>
                         <li class="breadcrumb-item active" aria-current="page">Projects</li>
                      </ol>
                   </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                   <div class="me-2 mb-2">
                      <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
                         <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails" class="btn btn-icon btn-sm active bg-primary text-white me-1"><i class="ti ti-list-tree"></i></a>
                         <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails" class="btn btn-icon btn-sm"><i class="ti ti-layout-grid"></i></a>
                      </div>
                   </div>
                   <div class="me-2 mb-2">
                       <div class="dropdown">

                           <a href="javascript:void(0);"
                              class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                              data-bs-toggle="dropdown">

                               <i class="ti ti-file-export me-1"></i>
                               Export

                           </a>

                           <ul class="dropdown-menu dropdown-menu-end p-3">

                               <li>
                                   <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=exportProjects&sort=${sort}"
                                      class="dropdown-item rounded-1">

                                       <i class="ti ti-file-type-pdf me-1"></i>
                                       Export as PDF

                                   </a>
                               </li>

                           </ul>

                       </div>
                   </div>
                   <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=addProject"
                      class="btn btn-primary d-flex align-items-center">
                       <i class="ti ti-circle-plus me-2"></i>
                       Add Project
                   </a>
                   <div class="ms-2 head-icons">
                      <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                         <i class="ti ti-chevrons-up"></i>
                      </a>
                   </div>
                </div>
             </div>
             <!-- /Breadcrumb -->

             <!-- Project list -->
             <div class="card">
                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                   <h5>Project List</h5>
                   <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                       <!-- All -->
                       <div class="dropdown me-3">

                           <a href="javascript:void(0);"
                              class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                              data-bs-toggle="dropdown">
                               All
                           </a>

                           <ul class="dropdown-menu dropdown-menu-end p-3">
                               <li>
                                   <a href="javascript:void(0);"
                                      class="dropdown-item rounded-1">
                                       All
                                   </a>
                               </li>
                           </ul>

                       </div>


                       <!-- Sort -->
                       <div class="dropdown">

                           <a href="javascript:void(0);"
                              class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                              data-bs-toggle="dropdown">
                               Sort By
                           </a>

                           <ul class="dropdown-menu dropdown-menu-end p-3">

                               <li>
                                   <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails&sort=asc"
                                      class="dropdown-item rounded-1">
                                       Ascending
                                   </a>
                               </li>

                               <li>
                                   <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails&sort=desc"
                                      class="dropdown-item rounded-1">
                                       Descending
                                   </a>
                               </li>

                           </ul>

                       </div>

                   </div>
                <div class="card-body p-0">
                   <div class="custom-datatable-filter table-responsive">
                      <table class="table">
                         <thead class="thead-light">
                            <tr>

                               <th>Project ID</th>
                               <th>Project Name</th>
                               <th>Team</th>
                               <th>Deadline</th>
                               <th>Priority</th>
                               <th>Status</th>
                               <th>Action</th>
                            </tr>
                         </thead>
                         <tbody>

                             <c:forEach var="project" items="${projects}">

                                 <tr>



                                     <!-- Project ID -->
                                     <td>
                                         ${project.projectId}
                                     </td>

                                     <!-- Project Name -->
                                    <td>
                                        <span class="fw-medium">
                                            ${project.projectName}
                                        </span>
                                    </td>



                                     <!-- Team -->
                                     <td>
                                         ${project.teamMembers}
                                     </td>

                                     <!-- Deadline -->
                                     <td>
                                         ${project.endDate}
                                     </td>

                                     <!-- Priority -->
                                     <td>

                                         <c:choose>

                                             <c:when test="${project.priority eq 'High'}">
                                                 <span class="badge badge-danger">
                                                     High
                                                 </span>
                                             </c:when>

                                             <c:when test="${project.priority eq 'Medium'}">
                                                 <span class="badge badge-warning">
                                                     Medium
                                                 </span>
                                             </c:when>

                                             <c:when test="${project.priority eq 'Low'}">
                                                 <span class="badge badge-success">
                                                     Low
                                                 </span>
                                             </c:when>

                                             <c:otherwise>
                                                 <span class="badge badge-secondary">
                                                     ${project.priority}
                                                 </span>
                                             </c:otherwise>

                                         </c:choose>

                                     </td>

                                     <!-- Status -->
                                     <td>

                                         <c:choose>

                                             <c:when test="${project.status eq 'Active'}">
                                                 <span class="badge badge-success">
                                                     Active
                                                 </span>
                                             </c:when>

                                             <c:when test="${project.status eq 'Inactive'}">
                                                 <span class="badge badge-danger">
                                                     Inactive
                                                 </span>
                                             </c:when>

                                             <c:otherwise>
                                                 <span class="badge badge-secondary">
                                                     ${project.status}
                                                 </span>
                                             </c:otherwise>

                                         </c:choose>

                                     </td>

                                     <!-- Action -->
                                     <td>
                                         <div class="action-icon d-inline-flex">

                                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=editProject&projectId=${project.projectId}"
                                               class="me-2"
                                               title="Edit">
                                                <i class="ti ti-edit"></i>
                                            </a>

                                        <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=deleteProject&projectId=${project.projectId}"
                                           title="Delete"
                                           onclick="return confirm('Are you sure you want to delete this project?');">
                                            <i class="ti ti-trash"></i>
                                        </a>

                                         </div>
                                     </td>

                                 </tr>

                             </c:forEach>

                             <c:if test="${empty projects}">
                                 <tr>
                                     <td colspan="8" class="text-center">
                                         No projects found
                                     </td>
                                 </tr>
                             </c:if>

                         </tbody>
                      </table>

                      <div class="row align-items-center mt-3">

                          <!-- Showing count -->
                          <div class="col-sm-6">
                              <div class="dataTables_info">
                                  Showing
                                  ${((currentPage - 1) * pageSize) + 1}
                                  to
                                  ${currentPage * pageSize > totalProjects ? totalProjects : currentPage * pageSize}
                                  of
                                  ${totalProjects}
                                  projects
                              </div>
                          </div>

                          <!-- Pagination -->
                          <div class="col-sm-6">
                              <div class="d-flex justify-content-end">

                                  <ul class="pagination mb-0">

                                      <!-- Previous -->
                                      <c:choose>

                                          <c:when test="${currentPage > 1}">
                                              <li class="page-item">
                                                  <a class="page-link"
                                                     href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails&page=${currentPage - 1}">
                                                      Previous
                                                  </a>
                                              </li>
                                          </c:when>

                                          <c:otherwise>
                                              <li class="page-item disabled">
                                                  <span class="page-link">Previous</span>
                                              </li>
                                          </c:otherwise>

                                      </c:choose>


                                      <!-- Page Numbers -->
                                      <c:forEach begin="1"
                                                 end="${totalPages}"
                                                 var="pageNumber">

                                          <li class="page-item ${pageNumber == currentPage ? 'active' : ''}">

                                              <a class="page-link"
                                                 href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails&page=${pageNumber}">
                                                  ${pageNumber}
                                              </a>

                                          </li>

                                      </c:forEach>


                                      <!-- Next -->
                                      <c:choose>

                                          <c:when test="${currentPage < totalPages}">
                                              <li class="page-item">
                                                  <a class="page-link"
                                                     href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails&page=${currentPage + 1}">
                                                      Next
                                                  </a>
                                              </li>
                                          </c:when>

                                          <c:otherwise>
                                              <li class="page-item disabled">
                                                  <span class="page-link">Next</span>
                                              </li>
                                          </c:otherwise>

                                      </c:choose>

                                  </ul>

                              </div>
                          </div>

                      </div>
                   </div>
                </div>
             </div>
             <!-- / Project list  -->

          </div>
          <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
             <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
             <p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
          </div>
       </div>
       <!-- /Page Wrapper -->

<!-- Add Project -->
<div class="modal fade" id="add_project" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg">
       <div class="modal-content">
          <div class="modal-header header-border align-items-center justify-content-between">
             <div class="d-flex align-items-center">
                <h5 class="modal-title me-2">Add Project </h5>
                <p class="text-dark">Project ID : PRO-0004</p>
             </div>
             <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                <i class="ti ti-x"></i>
             </button>
          </div>
          <div class="add-info-fieldset ">
             <div class="contact-grids-tab p-3 pb-0">
                <ul class="nav nav-underline" id="myTab" role="tablist">
                   <li class="nav-item" role="presentation">
                      <button class="nav-link active" id="basic-tab" data-bs-toggle="tab" data-bs-target="#basic-info" type="button" role="tab" aria-selected="true">Basic Information</button>
                     </li>
                     <li class="nav-item" role="presentation">
                      <button class="nav-link" id="member-tab" data-bs-toggle="tab" data-bs-target="#member" type="button" role="tab" aria-selected="false">Members</button>
                     </li>
                </ul>
             </div>
                <div class="tab-content" id="myTabContent">
                   <div class="tab-pane fade show active" id="basic-info" role="tabpanel" aria-labelledby="basic-tab" tabindex="0">
                <form action="projects.html">
                   <div class="modal-body">
                      <div class="row">
                         <div class="col-md-12">
                            <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">
                               <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
                                  <i class="ti ti-photo text-gray-2 fs-16"></i>
                               </div>
                               <div class="profile-upload">
                                  <div class="mb-2">
                                     <h6 class="mb-1">Upload Project Logo</h6>
                                     <p class="fs-12">Image should be below 4 mb</p>
                                  </div>
                                  <div class="profile-uploader d-flex align-items-center">
                                     <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                        Upload
                                        <input type="file" class="form-control image-sign" multiple="">
                                     </div>
                                     <a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
                                  </div>

                               </div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Project Name</label>
                               <input type="text" class="form-control">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Client</label>
                               <select class="select">
                                  <option>Select</option>
                                  <option>Anthony Lewis</option>
                                  <option>Brian Villalobos</option>
                               </select>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="row">
                               <div class="col-md-6">
                                  <div class="mb-3">
                                     <label class="form-label">Start Date</label>
                                     <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                        <span class="input-icon-addon">
                                           <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                     </div>
                                  </div>
                               </div>
                               <div class="col-md-6">
                                  <div class="mb-3">
                                     <label class="form-label">End Date</label>
                                     <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                        <span class="input-icon-addon">
                                           <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                     </div>
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Priority</label>
                                     <select class="select">
                                        <option>Select</option>
                                        <option>High</option>
                                        <option>Medium</option>
                                        <option>Low</option>
                                     </select>
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Project Value</label>
                                     <input type="text" class="form-control" value="$">
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Price Type</label>
                                     <input type="text" class="form-control" value="">
                                  </div>
                               </div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Description</label>
                               <div class="summernote"></div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="input-block mb-0">
                               <label class="form-label">Upload Files</label>
                               <input class="form-control" type="file">
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="modal-footer">
                      <div class="d-flex align-items-center justify-content-end">
                         <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                         <button class="btn btn-primary" type="submit">Save</button>
                      </div>
                   </div>
                </form>
                </div>
                <div class="tab-pane fade" id="member" role="tabpanel" aria-labelledby="member-tab" tabindex="0">
                <form action="projects.html">
                   <div class="modal-body">
                      <div class="row">
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Team Members</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Jerald,Andrew,Philip,Davis">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Team Leader</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Hendry,James">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Project Manager</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Dwight">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div>
                               <label class="form-label">Tags</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab,Promotion,Rated">
                            </div>
                         </div>

                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Status</label>
                               <select class="select">
                                  <option>Select</option>
                                  <option>Active</option>
                                  <option>Inactive</option>
                               </select>
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="modal-footer">
                      <div class="d-flex align-items-center justify-content-end">
                         <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                         <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#success_modal">Save</button>
                      </div>
                   </div>
                </form>
             </div>
          </div>
       </div>
    </div>
    </div>
</div>
<!-- /Add Project -->

<!-- Edit Project -->
<div class="modal fade" id="edit_project" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-lg">
       <div class="modal-content">
          <div class="modal-header header-border align-items-center justify-content-between">
             <div class="d-flex align-items-center">
                <h5 class="modal-title me-2">Edit Project </h5>
                <p class="text-dark">Project ID : PRO-0004</p>
             </div>
             <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                <i class="ti ti-x"></i>
             </button>
          </div>
          <div class="add-info-fieldset ">
             <div class="contact-grids-tab p-3 pb-0">
                <ul class="nav nav-underline" id="myTab1" role="tablist">
                   <li class="nav-item" role="presentation">
                      <button class="nav-link active" id="basic-tab1" data-bs-toggle="tab" data-bs-target="#basic-info1" type="button" role="tab" aria-selected="true">Basic Information</button>
                     </li>
                     <li class="nav-item" role="presentation">
                      <button class="nav-link" id="member-tab1" data-bs-toggle="tab" data-bs-target="#member1" type="button" role="tab" aria-selected="false">Members</button>
                     </li>
                </ul>
             </div>
                <div class="tab-content" id="myTabContent1">
                   <div class="tab-pane fade show active" id="basic-info1" role="tabpanel" aria-labelledby="basic-tab1" tabindex="0">
                <form action="projects.html">
                   <div class="modal-body">
                      <div class="row">
                         <div class="col-md-12">
                            <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">
                               <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">
                                  <i class="ti ti-photo text-gray-2 fs-16"></i>
                               </div>
                               <div class="profile-upload">
                                  <div class="mb-2">
                                     <h6 class="mb-1">Upload Project Logo</h6>
                                     <p class="fs-12">Image should be below 4 mb</p>
                                  </div>
                                  <div class="profile-uploader d-flex align-items-center">
                                     <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                        Upload
                                        <input type="file" class="form-control image-sign" multiple="">
                                     </div>
                                     <a href="javascript:void(0);" class="btn btn-light btn-sm">Cancel</a>
                                  </div>

                               </div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Project Name</label>
                               <input type="text" class="form-control" value="Office Management">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Client</label>
                               <select class="select">
                                  <option>Select</option>
                                  <option selected>Anthony Lewis</option>
                                  <option>Brian Villalobos</option>
                               </select>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="row">
                               <div class="col-md-6">
                                  <div class="mb-3">
                                     <label class="form-label">Start Date</label>
                                     <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                        <span class="input-icon-addon">
                                           <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                     </div>
                                  </div>
                               </div>
                               <div class="col-md-6">
                                  <div class="mb-3">
                                     <label class="form-label">End Date</label>
                                     <div class="input-icon-end position-relative">
                                        <input type="text" class="form-control datetimepicker" placeholder="dd/mm/yyyy" value="02-05-2024">
                                        <span class="input-icon-addon">
                                           <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                     </div>
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Priority</label>
                                     <select class="select">
                                        <option>Select</option>
                                        <option>High</option>
                                        <option>Medium</option>
                                        <option>Low</option>
                                     </select>
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Project Value</label>
                                     <input type="text" class="form-control" value="$">
                                  </div>
                               </div>
                               <div class="col-md-4">
                                  <div class="mb-3">
                                     <label class="form-label">Price Type</label>
                                     <input type="text" class="form-control" value="">
                                  </div>
                               </div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Description</label>
                               <div class="summernote"></div>
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="input-block mb-0">
                               <label class="form-label">Upload Files</label>
                               <input class="form-control" type="file">
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="modal-footer">
                      <div class="d-flex align-items-center justify-content-end">
                         <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                         <button class="btn btn-primary" type="submit">Save</button>
                      </div>
                   </div>
                </form>
                </div>
                <div class="tab-pane fade" id="member1" role="tabpanel" aria-labelledby="member-tab1" tabindex="0">
                <form action="projects.html">
                   <div class="modal-body">
                      <div class="row">
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Team Members</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Jerald,Andrew,Philip,Davis">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Team Leader</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Hendry,James">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label me-2">Project Manager</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Dwight">
                            </div>
                         </div>
                         <div class="col-md-12">
                            <div>
                               <label class="form-label">Tags</label>
                               <input class="input-tags form-control" placeholder="Add new" type="text" data-role="tagsinput"  name="Label" value="Collab,Promotion,Rated">
                            </div>
                         </div>

                         <div class="col-md-12">
                            <div class="mb-3">
                               <label class="form-label">Status</label>
                               <select class="select">
                                  <option>Select</option>
                                  <option selected>Active</option>
                                  <option>Inactive</option>
                               </select>
                            </div>
                         </div>
                      </div>
                   </div>
                   <div class="modal-footer">
                      <div class="d-flex align-items-center justify-content-end">
                         <button type="button" class="btn btn-outline-light border me-2" data-bs-dismiss="modal">Cancel</button>
                         <button class="btn btn-primary" type="button" data-bs-toggle="modal" data-bs-target="#success_modal">Save</button>
                      </div>
                   </div>
                </form>
             </div>
          </div>
       </div>
    </div>
    </div>
</div>
<!-- /Edit Project -->

<!-- Add Project Success -->
<div class="modal fade" id="success_modal" role="dialog">
    <div class="modal-dialog modal-dialog-centered modal-sm">
       <div class="modal-content">
          <div class="modal-body">
             <div class="text-center p-3">
                <span class="avatar avatar-lg avatar-rounded bg-success mb-3"><i class="ti ti-check fs-24"></i></span>
                <h5 class="mb-2">Project  Added Successfully</h5>
                <p class="mb-3">Stephan Peralt has been added with Client ID : <span class="text-primary">#pro - 0004</span>
                </p>
                <div>
                   <div class="row g-2">
                      <div class="col-6">
                         <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails" class="btn btn-dark w-100">Back to List</a>
                      </div>
                      <div class="col-6">
                         <a href="javascript:void(0);" class="btn btn-primary w-100">Detail Page</a>
                      </div>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>
</div>
<!-- /Add Project Success -->

<!-- Delete Modal -->
<div class="modal fade" id="delete_modal">
    <div class="modal-dialog modal-dialog-centered">
       <div class="modal-content">
          <div class="modal-body text-center">
             <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">
                <i class="ti ti-trash-x fs-36"></i>
             </span>
             <h4 class="mb-1">Confirm Delete</h4>
             <p class="mb-3">You want to delete all the marked items, this cant be undone once you delete.</p>
             <div class="d-flex justify-content-center">
                <a href="javascript:void(0);" class="btn btn-light me-3" data-bs-dismiss="modal">Cancel</a>
                <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=projectDetails" class="btn btn-danger">Yes, Delete</a>
             </div>
          </div>
       </div>
    </div>
</div>
<!-- /Delete Modal -->

    </div>
    <!-- /Main Wrapper -->

    <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Daterangepikcer JS -->
    <script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
    <script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Select2 JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

    <!-- Summernote JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/summernote/summernote-lite.min.js"></script>

    <!-- Bootstrap Tagsinput JS -->
    <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
    <script>
        setTimeout(function () {
            const alert = document.getElementById("successAlert");

            if (alert) {
                alert.classList.remove("show");

                setTimeout(function () {
                    alert.remove();
                }, 300);
            }
        }, 3000);
    </script>

</body>

</html>
