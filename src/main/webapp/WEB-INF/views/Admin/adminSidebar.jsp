<%@ page language="java" %>
<div class="sidebar" id="sidebar">

    <!-- SIDEBAR LOGO -->
    <div class="sidebar-logo">

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="logo logo-normal">
            <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                 alt="HRMS Logo">
        </a>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="logo-small">
            <img src="${pageContext.request.contextPath}/assets/img/logo-small.svg"
                 alt="HRMS Logo">
        </a>

        <a href="${pageContext.request.contextPath}/admin/dashboard"
           class="dark-logo">
            <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                 alt="HRMS Logo">
        </a>
        <a href="${pageContext.request.contextPath}/trainers/add"></a>

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
            <li>

                <a href="${pageContext.request.contextPath}/Admin/dashboard">

                    <i class="ti ti-smart-home"></i>

                    <span>Dashboard</span>

                </a>

            </li>

      <!-- EMPLOYEES -->
           <li class="submenu">

               <a href="javascript:void(0);">
                   <i class="ti ti-users"></i>
                   <span>Employees</span>
                   <span class="menu-arrow"></span>
               </a>

               <ul>

                   <li>
                       <a href="${pageContext.request.contextPath}/admin/departments">
                           Add Department
                       </a>
                   </li>

                   <li>
                       <a href="${pageContext.request.contextPath}/admin/roles">
                           Add Role
                       </a>
                   </li>

                   <li>
                       <a href="${pageContext.request.contextPath}/admin/designations">
                           Add Designation
                       </a>
                   </li>

                   <li>
                       <a href="${pageContext.request.contextPath}/admin/employees">
                           Employee List
                       </a>
                   </li>

                 <li>    <a href="${pageContext.request.contextPath}/admin/employees?action=grid">
                                                         Employee Grid
                                                    </a>
                                           </li>
<li>
    <a href="${pageContext.request.contextPath}/employee/details">
        Employee Details
    </a>
</li>

               </ul>

           </li>

           <!-- ATTENDANCE -->
           <li class="submenu">
               <a href="javascript:void(0);">
                   <i class="ti ti-calendar-check"></i>
                   <span>Attendance</span>
                   <span class="menu-arrow"></span>
               </a>

               <ul>
                   <!-- LEAVES -->
                   <li class="submenu">
                       <a href="javascript:void(0);">
                           <span>Leaves</span>
                           <span class="menu-arrow"></span>
                       </a>

                       <ul>
                           <li>
                               <a href="${pageContext.request.contextPath}/admin/leave/add">
                                   <span>Add Leave</span>
                               </a>
                           </li>

                           <li>
                               <a href="${pageContext.request.contextPath}/admin/leave/type">
                                   <span>Leave Type</span>
                               </a>
                           </li>

                           <li>
                               <a href="${pageContext.request.contextPath}/admin/leave/settings">
                                   <span>Leave Setting</span>
                               </a>
                           </li>

                           <li>
                               <a href="${pageContext.request.contextPath}/admin/leave/department-details">
                                   <span>Department Details</span>
                               </a>
                           </li>
                       </ul>
                   </li>

                   <!-- ATTENDANCE ADMIN -->
                   <li>
                       <a href="${pageContext.request.contextPath}/adminAttendance">
                           <span>Attendance (Admin)</span>
                       </a>
                   </li>

                   <!-- TIMESHEET -->
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
                        <a href="${pageContext.request.contextPath}/admin/events">
                            <span>Add Event</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/event-types">
                            <span>Add Master Event</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/admin/events/list">
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
                        <a href="${pageContext.request.contextPath}/trainers">
                            <span>Trainers</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/trainings">
                            <span>Training</span>
                        </a>
                    </li>

                    <li>
                        <a href="${pageContext.request.contextPath}/training-type">
                            <span>Training Type</span>
                        </a>
                    </li>

                </ul>

            </li>


            <!-- ================= MASTER DOCUMENTS ================= -->

            <li class="submenu">

                <a href="javascript:void(0);">

                    <i class="ti ti-files"></i>

                    <span>Master Documents</span>

                    <span class="menu-arrow"></span>

                </a>

                <ul>

                    <!-- ADD ADMIN DOCUMENT NAME -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin-document-names?action=add">
                            <span>Add Admin Document Name</span>
                        </a>
                    </li>

                    <!-- ADD EMPLOYEE DOCUMENT NAME -->
                    <li>
                        <a href="${pageContext.request.contextPath}/employee-document-names?action=add">
                            <span>Add Employee Document Name</span>
                        </a>
                    </li>

                    <!-- ADMIN DOCUMENT LIST -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin-document-names">
                            <span>Admin Document List</span>
                        </a>
                    </li>

                    <!-- EMPLOYEE DOCUMENT LIST -->
                    <li>
                        <a href="${pageContext.request.contextPath}/employee-document-names">
                            <span>Employee Document List</span>
                        </a>
                    </li>

                </ul>

            </li>


            <!-- ================= DOCUMENTS ================= -->

            <li class="submenu">

                <a href="javascript:void(0);">

                    <i class="ti ti-file-description"></i>

                    <span>Documents</span>

                    <span class="menu-arrow"></span>

                </a>

                <ul>

                    <!-- ADMIN DOCUMENT LIST -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin-documents">
                            <span>Admin Documents</span>
                        </a>
                    </li>

                    <!-- ADMIN FILE UPLOAD -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin-documents?action=upload">
                            <span>Admin File Upload</span>
                        </a>
                    </li>

                    <!-- GENERATED LETTER -->
                    <li>
                        <a href="${pageContext.request.contextPath}/generated-letter">
                            <span>Generated Letter</span>
                        </a>
                    </li>

                    <!-- EMPLOYEE DOCUMENTS -->
                    <li>
                        <a href="${pageContext.request.contextPath}/admin-employee-documents">
                            <span>Employee Documents</span>
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
                                        <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails">
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

                            <a href="${pageContext.request.contextPath}/promotion">
                                <i class="ti ti-trending-up"></i>
                                <span>Promotions</span>
                            </a>

                        </li>


                        <!-- RESIGNATION -->

                        <li>

                            <a href="${pageContext.request.contextPath}/resignation">

                                <i class="ti ti-logout-2"></i>

                                <span>Resignation</span>

                            </a>

                        </li>


                        <!-- TERMINATION -->

                        <li>

                            <a href="${pageContext.request.contextPath}/termination">


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

                            <a href="${pageContext.request.contextPath}/tickets">

                                <i class="ti ti-ticket"></i>

                                <span>Tickets</span>

                            </a>

                        </li>


                            <!-- LOGOUT -->
                            <li class="mt-2">

                            <a href="${pageContext.request.contextPath}/logout">
                                <i class="ti ti-logout"></i>
                                <span>Logout</span>
                            </a>

                            </li>

        </ul>

    </div>

</div>