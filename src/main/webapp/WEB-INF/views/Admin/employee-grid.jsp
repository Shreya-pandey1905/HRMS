<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Smarthr Admin Template</title>

	<!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180"
          href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Color Picker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/themes/nano.min.css">

    <!-- Daterangepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Datatable -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <!-- Datetimepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Bootstrap Tagsinput -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

	<div id="global-loader" style="display: none;">
		<div class="page-loader"></div>
	</div>

	<!-- SIDEBAR -->
        <div class="sidebar" id="sidebar">

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
                        <a href="${pageContext.request.contextPath}/admin/dashboard">
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
                                  <li>
                                      <a href="${pageContext.request.contextPath}/admin/employees/grid">
                                          Employee Grid
                                      </a>
                                  </li>
                                  <li>
                                      <a href="${pageContext.request.contextPath}/admin/employees/details">
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
                                <a href="javascript:void(0);">
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


	<!-- Main Wrapper -->
	<div class="main-wrapper">

		<!-- Header -->
		<div class="header">
			<div class="main-header">

				<div class="header-left">
					<a href="index.html" class="logo">
						<img src="assets/img/logo.svg" alt="Logo">
					</a>
					<a href="index.html" class="dark-logo">
						<img src="assets/img/logo-white.svg" alt="Logo">
					</a>
				</div>

				<a id="mobile_btn" class="mobile_btn" href="#sidebar">
					<span class="bar-icon">
						<span></span>
						<span></span>
						<span></span>
					</span>
				</a>

				<div class="header-user">
					<div class="nav user-menu nav-list">

						<div class="me-auto d-flex align-items-center" id="header-search">
							<a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
								<i class="ti ti-arrow-bar-to-left"></i>
							</a>
							<!-- Search -->
							<div class="input-group input-group-flat d-inline-flex me-1">
								<span class="input-icon-addon">
									<i class="ti ti-search"></i>
								</span>
								<input type="text" class="form-control" placeholder="Search in HRMS">
								<span class="input-group-text">
									<kbd>CTRL + / </kbd>
								</span>
							</div>
							<!-- /Search -->
							<div class="dropdown crm-dropdown">
								<a href="#" class="btn btn-menubar me-1" data-bs-toggle="dropdown">
									<i class="ti ti-layout-grid"></i>
								</a>
								<div class="dropdown-menu dropdown-lg dropdown-menu-start">
									<div class="card mb-0 border-0 shadow-none">
										<div class="card-header">
											<h4>CRM</h4>
										</div>
										<div class="card-body pb-1">
											<div class="row">
												<div class="col-sm-6">
													<a href="contacts.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i class="ti ti-user-shield text-default me-2"></i>Contacts
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
													<a href="deals-grid.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i class="ti ti-heart-handshake text-default me-2"></i>Deals
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
													<a href="pipeline.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i
																class="ti ti-timeline-event-text text-default me-2"></i>Pipeline
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
												</div>
												<div class="col-sm-6">
													<a href="companies-grid.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i class="ti ti-building text-default me-2"></i>Companies
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
													<a href="leads-grid.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i class="ti ti-user-check text-default me-2"></i>Leads
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
													<a href="activity.html"
														class="d-flex align-items-center justify-content-between p-2 crm-link mb-3">
														<span class="d-flex align-items-center me-3">
															<i class="ti ti-activity text-default me-2"></i>Activities
														</span>
														<i class="ti ti-arrow-right"></i>
													</a>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<a href="profile-settings.html" class="btn btn-menubar">
								<i class="ti ti-settings-cog"></i>
							</a>
						</div>


						<div class="d-flex align-items-center">
							<div class="me-1">
								<a href="#" class="btn btn-menubar btnFullscreen">
									<i class="ti ti-maximize"></i>
								</a>
							</div>
							<div class="dropdown me-1">
								<a href="#" class="btn btn-menubar" data-bs-toggle="dropdown">
									<i class="ti ti-layout-grid-remove"></i>
								</a>
								<div class="dropdown-menu dropdown-menu-end">
									<div class="card mb-0 border-0 shadow-none">
										<div class="card-header">
											<h4>Applications</h4>
										</div>
										<div class="card-body">
											<a href="calendar.html" class="d-block pb-2">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-calendar text-gray-9"></i></span>Calendar
											</a>
											<a href="todo.html" class="d-block py-2">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-subtask text-gray-9"></i></span>To Do
											</a>
											<a href="notes.html" class="d-block py-2">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-notes text-gray-9"></i></span>Notes
											</a>
											<a href="file-manager.html" class="d-block py-2">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-folder text-gray-9"></i></span>File Manager
											</a>
											<a href="kanban-view.html" class="d-block py-2">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-layout-kanban text-gray-9"></i></span>Kanban
											</a>
											<a href="invoices.html" class="d-block py-2 pb-0">
												<span class="avatar avatar-md bg-transparent-dark me-2"><i
														class="ti ti-file-invoice text-gray-9"></i></span>Invoices
											</a>
										</div>
									</div>
								</div>
							</div>
							<div class="me-1">
								<a href="chat.html" class="btn btn-menubar position-relative">
									<i class="ti ti-brand-hipchat"></i>
									<span
										class="badge bg-info rounded-pill d-flex align-items-center justify-content-center header-badge">5</span>
								</a>
							</div>
							<div class="me-1">
								<a href="email.html" class="btn btn-menubar">
									<i class="ti ti-mail"></i>
								</a>
							</div>
							<div class="me-1 notification_item">
								<a href="#" class="btn btn-menubar position-relative me-1" id="notification_popup"
									data-bs-toggle="dropdown">
									<i class="ti ti-bell"></i>
									<span class="notification-status-dot"></span>
								</a>
								<div class="dropdown-menu dropdown-menu-end notification-dropdown p-4">
									<div
										class="d-flex align-items-center justify-content-between border-bottom p-0 pb-3 mb-3">
										<h4 class="notification-title">Notifications (2)</h4>
										<div class="d-flex align-items-center">
											<a href="#" class="text-primary fs-15 me-3 lh-1">Mark all as read</a>
											<div class="dropdown">
												<a href="javascript:void(0);" class="bg-white dropdown-toggle"
													data-bs-toggle="dropdown">
													<i class="ti ti-calendar-due me-1"></i>Today
												</a>
												<ul class="dropdown-menu mt-2 p-3">
													<li>
														<a href="javascript:void(0);" class="dropdown-item rounded-1">
															This Week
														</a>
													</li>
													<li>
														<a href="javascript:void(0);" class="dropdown-item rounded-1">
															Last Week
														</a>
													</li>
													<li>
														<a href="javascript:void(0);" class="dropdown-item rounded-1">
															Last Month
														</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
									<div class="noti-content">
										<div class="d-flex flex-column">
											<div class="border-bottom mb-3 pb-3">
												<a href="activity.html">
													<div class="d-flex">
														<span class="avatar avatar-lg me-2 flex-shrink-0">
															<img src="assets/img/profiles/avatar-27.jpg" alt="Profile">
														</span>
														<div class="flex-grow-1">
															<p class="mb-1"><span
																	class="text-dark fw-semibold">Shawn</span>
																performance in Math is below the threshold.</p>
															<span>Just Now</span>
														</div>
													</div>
												</a>
											</div>
											<div class="border-bottom mb-3 pb-3">
												<a href="activity.html" class="pb-0">
													<div class="d-flex">
														<span class="avatar avatar-lg me-2 flex-shrink-0">
															<img src="assets/img/profiles/avatar-23.jpg" alt="Profile">
														</span>
														<div class="flex-grow-1">
															<p class="mb-1"><span
																	class="text-dark fw-semibold">Sylvia</span> added
																appointment on 02:00 PM</p>
															<span>10 mins ago</span>
															<div
																class="d-flex justify-content-start align-items-center mt-1">
																<span class="btn btn-light btn-sm me-2">Deny</span>
																<span class="btn btn-primary btn-sm">Approve</span>
															</div>
														</div>
													</div>
												</a>
											</div>
											<div class="border-bottom mb-3 pb-3">
												<a href="activity.html">
													<div class="d-flex">
														<span class="avatar avatar-lg me-2 flex-shrink-0">
															<img src="assets/img/profiles/avatar-25.jpg" alt="Profile">
														</span>
														<div class="flex-grow-1">
															<p class="mb-1">New student record <span class="text-dark fw-semibold"> George</span>
																is created by <span class="text-dark fw-semibold">Teressa</span>
															</p>
															<span>2 hrs ago</span>
														</div>
													</div>
												</a>
											</div>
											<div class="border-0 mb-3 pb-0">
												<a href="activity.html">
													<div class="d-flex">
														<span class="avatar avatar-lg me-2 flex-shrink-0">
															<img src="assets/img/profiles/avatar-01.jpg" alt="Profile">
														</span>
														<div class="flex-grow-1">
															<p class="mb-1">A new teacher record for <span class="text-dark fw-semibold">Elisa</span> </p>
															<span>09:45 AM</span>
														</div>
													</div>
												</a>
											</div>
										</div>
									</div>
									<div class="d-flex p-0">
										<a href="#" class="btn btn-light w-100 me-2">Cancel</a>
										<a href="activity.html" class="btn btn-primary w-100">View All</a>
									</div>
								</div>
							</div>
							<div class="dropdown profile-dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle d-flex align-items-center" data-bs-toggle="dropdown">
									<span class="avatar avatar-sm online">
										<img src="assets/img/profiles/avatar-12.jpg" alt="Img" class="img-fluid rounded-circle">
									</span>
								</a>
								<div class="dropdown-menu shadow-none">
									<div class="card mb-0">
										<div class="card-header">
											<div class="d-flex align-items-center">
												<span class="avatar avatar-lg me-2 avatar-rounded">
													<img src="assets/img/profiles/avatar-12.jpg" alt="img">
												</span>
												<div>
													<h5 class="mb-0">Kevin Larry</h5>
													<p class="fs-12 fw-medium mb-0">warren@example.com</p>
												</div>
											</div>
										</div>
										<div class="card-body">
											<a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
												href="profile.html">
												<i class="ti ti-user-circle me-1"></i>My Profile
											</a>
											<a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
												href="bussiness-settings.html">
												<i class="ti ti-settings me-1"></i>Settings
											</a>

											<a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
												href="profile-settings.html">
												<i class="ti ti-circle-arrow-up me-1"></i>My Account
											</a>
											<a class="dropdown-item d-inline-flex align-items-center p-0 py-2"
												href="knowledgebase.html">
												<i class="ti ti-question-mark me-1"></i>Knowledge Base
											</a>
										</div>
										<div class="card-footer py-1">
											<a class="dropdown-item d-inline-flex align-items-center p-0 py-2" href="login.html"><i class="ti ti-login me-2"></i>Logout</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Mobile Menu -->
				<div class="dropdown mobile-user-menu">
					<a href="javascript:void(0);" class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
						<i class="fa fa-ellipsis-v"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-end">
						<a class="dropdown-item" href="profile.html">My Profile</a>
						<a class="dropdown-item" href="profile-settings.html">Settings</a>
						<a class="dropdown-item" href="login.html">Logout</a>
					</div>
				</div>
				<!-- /Mobile Menu -->

			</div>

		</div>
		<!-- /Header -->

		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">

			<!-- Breadcrumb -->
<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
    <div class="my-auto mb-2">
        <h2 class="mb-1">Employee</h2>
        <nav>
            <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
                        <i class="ti ti-smart-home"></i>
                    </a>
                </li>
                <li class="breadcrumb-item">
                    Employee
                </li>
                <li class="breadcrumb-item active" aria-current="page">
                    Employee Grid
                </li>
            </ol>
        </nav>
    </div>

    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

        <!-- List / Grid Toggle -->
        <div class="me-2 mb-2">
            <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">

                <!-- Employee List -->
                <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                   class="btn btn-icon btn-sm me-1">
                    <i class="ti ti-list-tree"></i>
                </a>

                <!-- Employee Grid - Active -->
                <a href="${pageContext.request.contextPath}/admin/employees?action=grid"
                   class="btn btn-icon btn-sm active bg-primary text-white">
                    <i class="ti ti-layout-grid"></i>
                </a>

            </div>
        </div>

        <!-- Export -->
        <div class="me-2 mb-2">
            <div class="dropdown">
                <a href="javascript:void(0);"
                   class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                   data-bs-toggle="dropdown">
                    <i class="ti ti-file-export me-1"></i>Export
                </a>

                <ul class="dropdown-menu dropdown-menu-end p-3">
                    <li>
                        <a href="javascript:void(0);"
                           class="dropdown-item rounded-1">
                            <i class="ti ti-file-type-pdf me-1"></i>
                            Export as PDF
                        </a>
                    </li>

                    <li>
                        <a href="javascript:void(0);"
                           class="dropdown-item rounded-1">
                            <i class="ti ti-file-type-xls me-1"></i>
                            Export as Excel
                        </a>
                    </li>
                </ul>
            </div>
        </div>

        <!-- Add Employee -->
        <div class="mb-2">
            <a href="${pageContext.request.contextPath}/admin/employees?action=add"
               class="btn btn-primary d-flex align-items-center">
                <i class="ti ti-circle-plus me-2"></i>
                Add Employee
            </a>
        </div>

        <!-- Collapse Header -->
        <div class="head-icons ms-2">
            <a href="javascript:void(0);"
               class=""
               data-bs-toggle="tooltip"
               data-bs-placement="top"
               data-bs-original-title="Collapse"
               id="collapse-header">
                <i class="ti ti-chevrons-up"></i>
            </a>
        </div>

    </div>
</div>
<!-- /Breadcrumb -->

				<div class="row">

				<!-- Calculate Employee Statistics -->
<c:set var="totalEmployees" value="0"/>
<c:set var="activeEmployees" value="0"/>
<c:set var="inactiveEmployees" value="0"/>

<c:forEach var="employee" items="${employees}">
    <c:set var="totalEmployees" value="${totalEmployees + 1}"/>

    <c:if test="${employee.status == 'Active'}">
        <c:set var="activeEmployees" value="${activeEmployees + 1}"/>
    </c:if>

    <c:if test="${employee.status == 'Inactive'}">
        <c:set var="inactiveEmployees" value="${inactiveEmployees + 1}"/>
    </c:if>
</c:forEach>


<!-- Total Employee -->
<div class="col-lg-3 col-md-6 d-flex">
    <div class="card flex-fill">
        <div class="card-body d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center overflow-hidden">
                <div>
                    <span class="avatar avatar-lg bg-dark rounded-circle">
                        <i class="ti ti-users"></i>
                    </span>
                </div>

                <div class="ms-2 overflow-hidden">
                    <p class="fs-12 fw-medium mb-1 text-truncate">
                        Total Employee
                    </p>
                    <h4>${totalEmployees}</h4>
                </div>
            </div>

            <div>
                <span class="badge badge-soft-purple badge-sm fw-normal">
                    <i class="ti ti-arrow-wave-right-down"></i>
                    Total
                </span>
            </div>
        </div>
    </div>
</div>
<!-- /Total Employee -->


<!-- Active -->
<div class="col-lg-3 col-md-6 d-flex">
    <div class="card flex-fill">
        <div class="card-body d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center overflow-hidden">
                <div>
                    <span class="avatar avatar-lg bg-success rounded-circle">
                        <i class="ti ti-user-share"></i>
                    </span>
                </div>

                <div class="ms-2 overflow-hidden">
                    <p class="fs-12 fw-medium mb-1 text-truncate">
                        Active
                    </p>
                    <h4>${activeEmployees}</h4>
                </div>
            </div>

            <div>
                <span class="badge badge-soft-primary badge-sm fw-normal">
                    <i class="ti ti-user-check"></i>
                    Active
                </span>
            </div>
        </div>
    </div>
</div>
<!-- /Active -->


<!-- Inactive -->
<div class="col-lg-3 col-md-6 d-flex">
    <div class="card flex-fill">
        <div class="card-body d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center overflow-hidden">
                <div>
                    <span class="avatar avatar-lg bg-danger rounded-circle">
                        <i class="ti ti-user-pause"></i>
                    </span>
                </div>

                <div class="ms-2 overflow-hidden">
                    <p class="fs-12 fw-medium mb-1 text-truncate">
                        InActive
                    </p>
                    <h4>${inactiveEmployees}</h4>
                </div>
            </div>

            <div>
                <span class="badge badge-soft-dark badge-sm fw-normal">
                    <i class="ti ti-user-off"></i>
                    Inactive
                </span>
            </div>
        </div>
    </div>
</div>
<!-- /Inactive -->
<!-- New Joiners -->
<div class="col-lg-3 col-md-6 d-flex">
    <div class="card flex-fill">
        <div class="card-body d-flex align-items-center justify-content-between">
            <div class="d-flex align-items-center overflow-hidden">
                <div>
                    <span class="avatar avatar-lg bg-info rounded-circle">
                        <i class="ti ti-user-plus"></i>
                    </span>
                </div>

                <div class="ms-2 overflow-hidden">
                    <p class="fs-12 fw-medium mb-1 text-truncate">
                        New Joiners
                    </p>
                    <h4>0</h4>
                </div>
            </div>

            <div>
                <span class="badge badge-soft-secondary badge-sm fw-normal">
                    <i class="ti ti-user-plus"></i>
                    New
                </span>
            </div>
        </div>
    </div>
</div>
<!-- /New Joiners -->

</div>


<!-- Employees Grid Header -->
<div class="card">
    <div class="card-body p-3">
        <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-3">

            <h5>Employees Grid</h5>

            <div class="d-flex align-items-center flex-wrap row-gap-3">

                <!-- Designation Filter -->
                <div class="dropdown me-3">
                    <a href="javascript:void(0);"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">
                        Designation
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end p-3">

                        <li>
                            <a href="${pageContext.request.contextPath}/admin/employees?action=grid"
                               class="dropdown-item rounded-1">
                                All
                            </a>
                        </li>

                        <c:set var="designationList" value="${employees}"/>

                        <c:forEach var="employee" items="${designationList}">
                            <c:if test="${not empty employee.designationName}">
                                <li>
                                    <a href="javascript:void(0);"
                                       class="dropdown-item rounded-1">
                                        ${employee.designationName}
                                    </a>
                                </li>
                            </c:if>
                        </c:forEach>

                    </ul>
                </div>


                <!-- Sort -->
                <div class="dropdown">
                    <a href="javascript:void(0);"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">
                        Sort By : Last 7 Days
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end p-3">
                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item rounded-1">
                                Last 7 Days
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item rounded-1">
                                Ascending
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item rounded-1">
                                Descending
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>


<!-- Employees Grid -->
<div class="row">

    <c:forEach var="employee" items="${employees}">

        <div class="col-xl-3 col-lg-4 col-md-6">

            <div class="card">

                <div class="card-body">

                    <!-- Top Section -->
                    <div class="d-flex justify-content-between align-items-start mb-2">

                        <!-- Checkbox -->
                        <div class="form-check form-check-md">
                            <input class="form-check-input"
                                   type="checkbox"
                                   value="${employee.userId}">
                        </div>


                        <!-- Profile Image -->
                        <div>

                            <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}"
                               class="avatar avatar-xl avatar-rounded online border p-1 border-primary rounded-circle">

                                <c:choose>

                                    <c:when test="${not empty employee.profilePicture}">
                                        <img src="${pageContext.request.contextPath}/${employee.profilePicture}"
                                             class="img-fluid h-auto w-auto"
                                             alt="Profile">
                                    </c:when>

                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                             class="img-fluid h-auto w-auto"
                                             alt="Profile">
                                    </c:otherwise>

                                </c:choose>

                            </a>

                        </div>


                        <!-- Actions -->
                        <div class="dropdown">

                            <button class="btn btn-icon btn-sm rounded-circle"
                                    type="button"
                                    data-bs-toggle="dropdown"
                                    aria-expanded="false">

                                <i class="ti ti-dots-vertical"></i>

                            </button>

                            <ul class="dropdown-menu dropdown-menu-end p-3">

                                <!-- View -->
                                <li>
                                    <a class="dropdown-item rounded-1"
                                       href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}">
                                        <i class="ti ti-eye me-1"></i>
                                        View
                                    </a>
                                </li>

                                <!-- Edit -->
                                <li>
                                    <a class="dropdown-item rounded-1"
                                       href="${pageContext.request.contextPath}/admin/employees?action=edit&id=${employee.userId}">
                                        <i class="ti ti-edit me-1"></i>
                                        Edit
                                    </a>
                                </li>

                                <!-- Delete -->
                                <li>
                                    <a class="dropdown-item rounded-1"
                                       href="${pageContext.request.contextPath}/admin/employees?action=delete&id=${employee.userId}"
                                       onclick="return confirm('Are you sure you want to delete this employee?');">
                                        <i class="ti ti-trash me-1"></i>
                                        Delete
                                    </a>
                                </li>

                            </ul>

                        </div>

                    </div>


                    <!-- Employee Name & Designation -->
                    <div class="text-center mb-3">

                        <h6 class="mb-1">

                            <a href="${pageContext.request.contextPath}/admin/employees?action=view&id=${employee.userId}">
                                ${employee.firstName} ${employee.lastName}
                            </a>

                        </h6>


                        <c:choose>

                            <c:when test="${not empty employee.designationName}">
                                <span class="badge badge-purple-transparent fs-10 fw-medium">
                                    ${employee.designationName}
                                </span>
                            </c:when>

                            <c:otherwise>
                                <span class="badge badge-secondary-transparent fs-10 fw-medium">
                                    No Designation
                                </span>
                            </c:otherwise>

                        </c:choose>

                    </div>


                    <!-- Employee Statistics -->
                    <div class="row text-center">

                        <!-- Projects -->
                        <div class="col-4">
                            <div class="mb-3">

                                <span class="fs-12">
                                    Projects
                                </span>

                                <h6 class="fw-medium">
                                    0
                                </h6>

                            </div>
                        </div>


                        <!-- Done -->
                        <div class="col-4">
                            <div class="mb-3">

                                <span class="fs-12">
                                    Done
                                </span>

                                <h6 class="fw-medium">
                                    0
                                </h6>

                            </div>
                        </div>


                        <!-- Progress -->
                        <div class="col-4">
                            <div class="mb-3">

                                <span class="fs-12">
                                    Progress
                                </span>

                                <h6 class="fw-medium">
                                    0
                                </h6>

                            </div>
                        </div>

                    </div>


                    <!-- Productivity -->
                    <p class="mb-2 text-center">
                        Productivity :
                        <span class="text-purple">
                            0%
                        </span>
                    </p>


                    <!-- Productivity Progress -->
                    <div class="progress progress-xs mb-2">

                        <div class="progress-bar bg-purple"
                             role="progressbar"
                             style="width: 0%">
                        </div>

                    </div>

                </div>

            </div>

        </div>

    </c:forEach>


    <!-- No Employees -->
    <c:if test="${empty employees}">

        <div class="col-md-12">

            <div class="text-center py-5">

                <i class="ti ti-users fs-48 text-muted"></i>

                <h5 class="mt-3">
                    No Employees Found
                </h5>

                <p class="text-muted">
                    There are currently no employees available.
                </p>

            </div>

        </div>

    </c:if>


    <!-- Load More -->
    <div class="col-md-12">

        <div class="text-center mb-4">

            <a href="javascript:void(0);"
               class="btn btn-primary">

                <i class="ti ti-loader-3 me-1"></i>
                Load More

            </a>

        </div>

    </div>

</div>
<!-- /Employees Grid -->

			</div>
			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>
		</div>
		<!-- /Page Wrapper -->




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

<!-- Daterangepicker JS -->
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<!-- Select2 JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<!-- Chart JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<!-- Bootstrap Tagsinput JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<!-- Custom JS -->
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>

</html>