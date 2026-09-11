<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<div class="header">
    <div class="main-header">

        <div class="header-left">

            <a href="${pageContext.request.contextPath}/admin/dashboard"
               class="logo">
                <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                     alt="HRMS Logo">
            </a>

            <a href="${pageContext.request.contextPath}/admin/dashboard"
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

            <div class="d-flex align-items-center">

                <div class="me-1">
                    <a href="#" class="btn btn-menubar btnFullscreen">
                        <i class="ti ti-maximize"></i>
                    </a>
                </div>

                <div class="me-1">
                    <a href="javascript:void(0);" class="btn btn-menubar position-relative">
                        <i class="ti ti-brand-hipchat"></i>
                    </a>
                </div>

                <div class="me-1">
                    <a href="javascript:void(0);" class="btn btn-menubar">
                        <i class="ti ti-mail"></i>
                    </a>
                </div>

                <div class="me-1">
                    <a href="javascript:void(0);" class="btn btn-menubar position-relative" data-bs-toggle="dropdown">
                        <i class="ti ti-bell"></i>
                        <span class="notification-status-dot"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end notification-dropdown p-4">
                        <h4 class="notification-title mb-2">Notifications</h4>
                        <p class="text-muted mb-0">No new notifications</p>
                    </div>
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