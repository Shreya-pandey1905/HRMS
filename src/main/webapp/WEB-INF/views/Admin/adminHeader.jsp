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

            <div class="nav user-menu nav-list d-flex align-items-center w-100">

                <div id="header-search" class="d-flex align-items-center flex-grow-1">

                    <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                        <i class="ti ti-arrow-bar-to-left"></i>
                    </a>

                    <div class="input-group input-group-flat d-inline-flex me-1 flex-grow-1">
                        <span class="input-icon-addon"><i class="ti ti-search"></i></span>
                        <input type="text" class="form-control" placeholder="Search in HRMS">
                        <span class="input-group-text"><kbd>CTRL + /</kbd></span>
                    </div>

                    <a href="javascript:void(0);" class="btn btn-menubar ms-2 me-3">
                        <i class="ti ti-settings-cog"></i>
                    </a>

                    <!-- Profile icon (rightmost) -->
                    <div class="ms-auto">
                        <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${sessionScope.userId}" title="My Profile" class="header-avatar d-inline-flex align-items-center text-decoration-none">
                            <img src="${pageContext.request.contextPath}/assets/img/profiles/avatar-02.jpg" alt="Profile" style="width:42px;height:42px;object-fit:cover;border-radius:50%;border:2px solid #fff;box-shadow:0 4px 10px rgba(0,0,0,0.12);transition:transform .12s ease-in-out;">
                        </a>
                    </div>

                </div>

            </div>

            <style>
                .header-avatar:hover img{ transform: scale(1.06); }
                .main-header{ position: relative; }
                /* ensure search input doesn't overflow */
                #header-search .input-group .form-control{ min-width:220px; }
            </style>

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

             <a href="${pageContext.request.contextPath}/logout">
                 <i class="ti ti-logout"></i>
                 <span>Logout</span>
             </a>

            </div>

        </div>

    </div>
</div>