<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<div class="sidebar" id="sidebar">

    <div class="sidebar-logo">

        <a href="<%= request.getContextPath() %>/employee/dashboard"
           class="logo logo-normal">
            <img src="<%= request.getContextPath() %>/assets/img/logo.svg"
                 alt="HRMS Logo">
        </a>

        <a href="<%= request.getContextPath() %>/employee/dashboard"
           class="logo-small">
            <img src="<%= request.getContextPath() %>/assets/img/logo-small.svg"
                 alt="HRMS Logo">
        </a>

        <a href="<%= request.getContextPath() %>/employee/dashboard"
           class="dark-logo">
            <img src="<%= request.getContextPath() %>/assets/img/logo-white.svg"
                 alt="HRMS Logo">
        </a>

    </div>


    <div class="modern-profile p-3 pb-0">

        <div class="text-center rounded bg-light p-3 mb-4 user-profile">

            <div class="avatar avatar-lg online mb-3">

                <c:choose>
                    <c:when test="${not empty profileImgUrl}">
                        <img src="${profileImgUrl}"
                             alt="Profile"
                             class="img-fluid rounded-circle"
                             style="width:100%;height:100%;object-fit:cover;"
                             onerror="this.onerror=null;this.src='<%= request.getContextPath() %>/assets/img/users/user-32.jpg';">
                    </c:when>
                    <c:otherwise>
                        <img src="<%= request.getContextPath() %>/assets/img/users/user-32.jpg"
                             alt="Profile"
                             class="img-fluid rounded-circle">
                    </c:otherwise>
                </c:choose>

            </div>

            <h6 class="fs-12 fw-normal mb-1">
                ${sidebarDisplayName}
            </h6>

            <p class="fs-10 mb-0">
                ${sidebarRoleLabel}
            </p>

        </div>

    </div>


    <!-- ================= SIDEBAR MENU ================= -->

    <div class="sidebar-menu">

        <ul>

            <li class="menu-title">
                <span>MAIN MENU</span>
            </li>


            <!-- DASHBOARD -->

            <li class="${activeMenu == 'dashboard' ? 'active' : ''}">

                <a href="<%= request.getContextPath() %>/employee/dashboard">

                    <i class="ti ti-smart-home"></i>

                    <span>Employee Dashboard</span>

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

                    <i class="ti ti-file-time"></i>

                    <span>Attendance</span>

                    <span class="menu-arrow"></span>

                </a>


                <ul>

                    <li class="submenu">

                        <a href="javascript:void(0);">

                            <span>Leaves</span>

                            <span class="menu-arrow"></span>

                        </a>


                        <ul>

                            <li>

                                <a href="javascript:void(0);">

                                    <span>Apply Leaves</span>

                                </a>

                            </li>


                            <li>

                                <a href="javascript:void(0);">

                                    <span>Leave Details</span>

                                </a>

                            </li>


                            <li>

                                <a href="javascript:void(0);">

                                    <span>Employee</span>

                                </a>

                            </li>

                        </ul>

                    </li>


                    <li>

                        <a href="javascript:void(0);">

                            <span>Attendance (Employee)</span>

                        </a>

                    </li>


                    <li>

                        <a href="javascript:void(0);">

                            <span>Timesheet</span>

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

                            <span>Payslips</span>

                        </a>

                    </li>

                </ul>

            </li>


            <!-- MY TRAINING -->

            <li class="${activeMenu == 'trainings' ? 'active' : ''}">

                <a href="<%= request.getContextPath() %>/employee/trainings">

                    <i class="ti ti-school"></i>

                    <span>My Training</span>

                </a>

            </li>


            <!-- CALENDAR -->

            <li>

                <a href="javascript:void(0);">

                    <i class="ti ti-calendar-event"></i>

                    <span>Calendar</span>

                </a>

            </li>


            <!-- PERFORMANCE -->

            <li>

                <a href="javascript:void(0);">

                    <i class="ti ti-chart-line"></i>

                    <span>Performance</span>

                </a>

            </li>


            <!-- DOCUMENTS -->

            <li class="submenu ${activeMenu == 'documents' or activeMenu == 'companyLetters' or activeMenu == 'myDocuments' or activeMenu == 'uploadDocuments' ? 'active' : ''}">

                <a href="javascript:void(0);">

                    <i class="ti ti-file-text"></i>

                    <span>Documents</span>

                    <span class="menu-arrow"></span>

                </a>

                <ul>

                    <!-- COMPANY LETTERS -->

                    <li class="${activeMenu == 'companyLetters' ? 'active' : ''}">

                        <a href="<%= request.getContextPath() %>/company-letters">

                            <span>Company Letters</span>

                        </a>

                    </li>


                    <!-- MY DOCUMENTS -->

                    <li class="${activeMenu == 'myDocuments' ? 'active' : ''}">

                        <a href="<%= request.getContextPath() %>/file-uploads?action=list">

                            <span>My Documents</span>

                        </a>

                    </li>


                    <!-- UPLOAD DOCUMENTS -->

                    <li class="${activeMenu == 'uploadDocuments' ? 'active' : ''}">

                        <a href="<%= request.getContextPath() %>/file-uploads">

                            <span>Upload Documents</span>

                        </a>

                    </li>

                </ul>

            </li>


            <!-- HELP & SUPPORT -->

            <li>

                <a href="javascript:void(0);">

                    <i class="ti ti-headset"></i>

                    <span>Help &amp; Support</span>

                </a>

            </li>


            <!-- TICKETS -->

            <li class="${activeMenu == 'tickets' ? 'active' : ''}">

                <a href="<%= request.getContextPath() %>/tickets">

                    <i class="ti ti-ticket"></i>

                    <span>Tickets</span>

                </a>

            </li>


            <!-- LOGOUT -->

            <li class="mt-2">

                <a href="<%= request.getContextPath() %>/logout">

                    <i class="ti ti-logout"></i>

                    <span>Logout</span>

                </a>

            </li>


        </ul>

    </div>

</div>
