<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="sidebar" id="sidebar">

    <div class="sidebar-logo">

        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=dashboard"
           class="logo logo-normal">
            <img src="<%= request.getContextPath() %>/assets/img/logo.svg"
                 alt="HRMS Logo">
        </a>

        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=dashboard"
           class="logo-small">
            <img src="<%= request.getContextPath() %>/assets/img/logo-small.svg"
                 alt="HRMS Logo">
        </a>

        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=dashboard"
           class="dark-logo">
            <img src="<%= request.getContextPath() %>/assets/img/logo-white.svg"
                 alt="HRMS Logo">
        </a>

    </div>

    <div class="modern-profile p-3 pb-0">
        <div class="text-center rounded bg-light p-3 mb-4 user-profile">

            <div class="avatar avatar-lg online mb-3">
                <img src="<%= request.getContextPath() %>/assets/img/profiles/avatar-02.jpg"
                     alt="Manager Profile"
                     class="img-fluid rounded-circle">
            </div>

            <h6 class="fs-12 fw-normal mb-1">
                ${sessionScope.firstName}
            </h6>

            <p class="fs-10 mb-0">
                Manager
            </p>

        </div>
    </div>

    <div class="sidebar-menu">

        <ul>

            <li class="menu-title">
                <span>MAIN MENU</span>
            </li>

            <li>
                <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=dashboard">
                    <i class="ti ti-smart-home"></i>
                    <span>Dashboard</span>
                </a>
            </li>

            <li class="submenu">

                <a href="javascript:void(0);">
                    <i class="ti ti-briefcase"></i>
                    <span>Projects</span>
                    <span class="menu-arrow ms-2"></span>
                </a>

                <ul>

                    <li>
                        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=projectDetails">
                            <span>Project</span>
                        </a>
                    </li>

                    <li>
                        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=taskDetails">
                            <span>Tasks</span>
                        </a>
                    </li>

                    <li>
                        <a href="<%= request.getContextPath() %>/ManagerDashboardServlet?action=addTask">
                            <span>Add Task</span>
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);">
                            <span>Task Board</span>
                        </a>
                    </li>

                </ul>

            </li>

            <li class="submenu">

                <a href="javascript:void(0);">
                    <i class="ti ti-calendar-off"></i>
                    <span>Leave</span>
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
                                    <span>Leave Approval</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0);">
                                    <span>Timesheet Approval</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript:void(0);">
                                    <span>Leave Allocation</span>
                                </a>
                            </li>

                        </ul>

                    </li>

                </ul>

            </li>

            <li>
                <a href="<%= request.getContextPath() %>/tickets">
                    <i class="ti ti-ticket"></i>
                    <span>Tickets</span>
                </a>
            </li>

            <li class="mt-2">
                <a href="<%= request.getContextPath() %>/logout">
                    <i class="ti ti-logout"></i>
                    <span>Logout</span>
                </a>
            </li>

        </ul>

    </div>

</div>