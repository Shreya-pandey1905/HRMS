<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
	<meta name="description" content="Smarthr - Bootstrap Admin Template">
	<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
	<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
	<meta name="robots" content="noindex, nofollow">
	<title>Attendance | Smarthr Admin Template</title>

	<!-- Favicon -->
	<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">

	<!-- Apple Touch Icon -->
	<link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png">

	<!-- Theme Script js -->
	<script src="assets/js/theme-script.js"></script>

	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">

	<!-- Feather CSS -->
	<link rel="stylesheet" href="assets/plugins/icons/feather/feather.css">

	<!-- Tabler Icon CSS -->
	<link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css">

	<!-- Select2 CSS -->
	<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

	<!-- Fontawesome CSS -->
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">

	<!-- Datetimepicker CSS -->
	<link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css">

	<!-- Color Picker Css -->
	<link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css">
	<link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css">

	<!-- Daterangepikcer CSS -->
	<link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css">

	<!-- Datatable CSS -->
	<link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css">

	<!-- Select2 CSS -->
	<link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css">

	<!-- Main CSS -->
	<link rel="stylesheet" href="assets/css/style.css">

</head>

<body>

	<div id="global-loader" style="display: none;">
		<div class="page-loader"></div>
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

						<!-- Horizontal Single -->
						
						<!-- /Horizontal Single -->

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

		<!-- Sidebar -->
		<div class="sidebar" id="sidebar">
			<!-- Logo -->
			<div class="sidebar-logo">
				<a href="index.html" class="logo logo-normal">
					<img src="assets/img/logo.svg" alt="Logo">
				</a>
				<a href="index.html" class="logo-small">
					<img src="assets/img/logo-small.svg" alt="Logo">
				</a>
				<a href="index.html" class="dark-logo">
					<img src="assets/img/logo-white.svg" alt="Logo">
				</a>
			</div>
			<!-- /Logo -->
			<div class="modern-profile p-3 pb-0">
				<div class="text-center rounded bg-light p-3 mb-4 user-profile">
					<div class="avatar avatar-lg online mb-3">
						<img src="assets/img/profiles/avatar-02.jpg" alt="Img" class="img-fluid rounded-circle">
					</div>
					<h6 class="fs-12 fw-normal mb-1">Adrian Herman</h6>
					<p class="fs-10">System Admin</p>
				</div>
				<div class="sidebar-nav mb-3">
					<ul class="nav nav-tabs nav-tabs-solid nav-tabs-rounded nav-justified bg-transparent"
						role="tablist">
						<li class="nav-item"><a class="nav-link active border-0" href="#">Menu</a></li>
						<li class="nav-item"><a class="nav-link border-0" href="chat.html">Chats</a></li>
						<li class="nav-item"><a class="nav-link border-0" href="email.html">Inbox</a></li>
					</ul>
				</div>
			</div>
			
			<div class="sidebar-inner slimscroll">
				<div id="sidebar-menu" class="sidebar-menu">
					<ul>
						<li class="menu-title"><span>MAIN MENU</span></li>
						<li>
						<li class="active">
                    <a href="${pageContext.request.contextPath}/admin/dashboard">
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
                            <a href="${pageContext.request.contextPath}/adminAttendance">
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
		</div>
		<!-- /Sidebar -->

		<!-- Horizontal Menu -->
		
		<!-- /Horizontal Menu -->

		<!-- Two Col Sidebar -->
	
		<!-- /Two Col Sidebar -->

		<!-- Stacked Sidebar -->
	
		<!-- /Stacked Sidebar -->

		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">Attendance Admin</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item">
									<a href="index.html"><i class="ti ti-smart-home"></i></a>
								</li>
								<li class="breadcrumb-item">
									Employee
								</li>
								<li class="breadcrumb-item active" aria-current="page">Attendance Admin</li>
							</ol>
						</nav>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="me-2 mb-2">
							<div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
								<a href="attendance-employee.html" class="btn btn-icon btn-sm  me-1"><i
										class="ti ti-brand-days-counter"></i></a>
								<a href="attendance-admin.html" class="btn btn-icon btn-sm active bg-primary text-white"><i
										class="ti ti-calendar-event"></i></a>
							</div>
						</div>
						<div class="me-2 mb-2">
							<div class="dropdown">
								<a href="javascript:void(0);"
									class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
									data-bs-toggle="dropdown">
									<i class="ti ti-file-export me-1"></i>Export
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i
												class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i
												class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
									</li>
								</ul>
							</div>
						</div>
						<div class="mb-2">
							<a href="#" class="btn btn-primary d-flex align-items-center"
								data-bs-target="#attendance_report" data-bs-toggle="modal"><i
									class="ti ti-file-analytics me-2"></i>Report</a>
						</div>
						<div class="ms-2 head-icons">
							<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
								<i class="ti ti-chevrons-up"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /Breadcrumb -->

				<div class="card border-0">
					<div class="card-body">
						<div class="row align-items-center mb-4">
							<div class="col-md-5">
								<div class="mb-3 mb-md-0">
									<h4 class="mb-1">Attendance Details Today</h4>
									<p>Data from <c:out value="${summary.totalEmployees}"/> total active employees</p>
								</div>
							</div>
							<div class="col-md-7">
								<div class="d-flex align-items-center justify-content-md-end">
									<h6>Total Absenties today</h6>
									<div class="avatar-list-stacked avatar-group-sm ms-4">
												<span class="avatar bg-danger avatar-rounded text-fixed-white fs-12">
													<c:out value="${summary.absentCount}"/>
												</span>
											</div>
										</div>
									</div>
						</div>
						<div class="border rounded">
							<div class="row gx-0">
								<div class="col-md col-sm-4 border-end">
									<div class="p-3">
										<span class="fw-medium mb-1 d-block">Present</span>
										<div class="d-flex align-items-center justify-content-between">
											<h5><c:out value="${summary.presentCount}"/></h5>
											<span class="badge badge-success d-inline-flex align-items-center">
												<i class="ti ti-arrow-wave-right-down me-1"></i>
												+1%
											</span>
										</div>
									</div>
								</div>
								<div class="col-md col-sm-4 border-end">
									<div class="p-3">
										<span class="fw-medium mb-1 d-block">Late Login</span>
										<div class="d-flex align-items-center justify-content-between">
											<h5><c:out value="${summary.lateCount}"/></h5>
											<span class="badge badge-danger d-inline-flex align-items-center">
												<i class="ti ti-arrow-wave-right-down me-1"></i>
												-1%
											</span>
										</div>
									</div>
								</div>
								<div class="col-md col-sm-4 border-end">
									<div class="p-3">
										<span class="fw-medium mb-1 d-block">Uninformed</span>
										<div class="d-flex align-items-center justify-content-between">
											<h5><c:out value="${summary.uninformedCount}" default="0"/></h5>
											<span class="badge badge-danger d-inline-flex align-items-center">
												<i class="ti ti-arrow-wave-right-down me-1"></i>
												-12%
											</span>
										</div>
									</div>
								</div>
								<div class="col-md col-sm-4 border-end">
									<div class="p-3">
										<span class="fw-medium mb-1 d-block">Permisson</span>
										<div class="d-flex align-items-center justify-content-between">
											<h5><c:out value="${summary.permissionCount}"/></h5>
											<span class="badge badge-success d-inline-flex align-items-center">
												<i class="ti ti-arrow-wave-right-down me-1"></i>
												+1%
											</span>
										</div>
									</div>
								</div>
								<div class="col-md col-sm-4">
									<div class="p-3">
										<span class="fw-medium mb-1 d-block">Absent</span>
										<div class="d-flex align-items-center justify-content-between">
											<h5><c:out value="${summary.absentCount}"/></h5>
											<span class="badge badge-danger d-inline-flex align-items-center">
												<i class="ti ti-arrow-wave-right-down me-1"></i>
												-19%
											</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="card">
					<div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
						<h5>Admin Attendance</h5>
						<form method="get" action="${pageContext.request.contextPath}/adminAttendance" class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
							<div class="me-3">
								<div class="input-icon-end position-relative">
									<input type="text" id="attendanceDateRange" class="form-control date-range bookingrange" value="${selectedDateRange}" placeholder="dd/mm/yyyy - dd/mm/yyyy" autocomplete="off">
									<input type="hidden" name="fromDate" id="fromDate" value="${selectedFromDate}">
									<input type="hidden" name="toDate" id="toDate" value="${selectedToDate}">
									<span class="input-icon-addon"><i class="ti ti-chevron-down"></i></span>
								</div>
							</div>
							<div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									<c:choose><c:when test="${not empty selectedDepartmentId}"><c:forEach var="department" items="${departments}"><c:if test="${department.departmentId.toString() == selectedDepartmentId}"><c:out value="${department.name}"/></c:if></c:forEach></c:when><c:otherwise>Department</c:otherwise></c:choose>
								</a>
								<ul class="dropdown-menu dropdown-menu-end p-3">
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&status=${selectedStatus}&sort=${selectedSort}" class="dropdown-item rounded-1">All Departments</a></li>
									<c:forEach var="department" items="${departments}">
										<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${department.departmentId}&status=${selectedStatus}&sort=${selectedSort}" class="dropdown-item rounded-1"><c:out value="${department.name}"/></a></li>
									</c:forEach>
								</ul>
							</div>
							<div class="dropdown me-3">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									<c:choose><c:when test="${empty selectedStatus}">Select Status</c:when><c:otherwise><c:out value="${selectedStatus}"/></c:otherwise></c:choose>
								</a>
								<ul class="dropdown-menu dropdown-menu-end p-3">
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&sort=${selectedSort}" class="dropdown-item rounded-1">All Status</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=Present&sort=${selectedSort}" class="dropdown-item rounded-1">Present</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=Absent&sort=${selectedSort}" class="dropdown-item rounded-1">Absent</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=Permission&sort=${selectedSort}" class="dropdown-item rounded-1">Permission</a></li>
								</ul>
							</div>
							<div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									Sort By : <c:choose><c:when test="${selectedSort == 'nameasc'}">Ascending</c:when><c:when test="${selectedSort == 'namedesc'}">Descending</c:when><c:when test="${selectedSort == 'lastmonth'}">Last Month</c:when><c:when test="${selectedSort == 'last7days'}">Last 7 Days</c:when><c:otherwise>Recently Added</c:otherwise></c:choose>
								</a>
								<ul class="dropdown-menu dropdown-menu-end p-3">
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=${selectedStatus}&sort=recent" class="dropdown-item rounded-1">Recently Added</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=${selectedStatus}&sort=nameAsc" class="dropdown-item rounded-1">Ascending</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?fromDate=${selectedFromDate}&toDate=${selectedToDate}&departmentId=${selectedDepartmentId}&status=${selectedStatus}&sort=nameDesc" class="dropdown-item rounded-1">Descending</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?departmentId=${selectedDepartmentId}&status=${selectedStatus}&sort=lastmonth" class="dropdown-item rounded-1">Last Month</a></li>
									<li><a href="${pageContext.request.contextPath}/adminAttendance?departmentId=${selectedDepartmentId}&status=${selectedStatus}&sort=last7days" class="dropdown-item rounded-1">Last 7 Days</a></li>
								</ul>
							</div>
						</form>
						<div class="custom-datatable-filter table-responsive w-100" style="width: 100% !important;">
							<table class="table datatable w-100" style="width: 100% !important; min-width: 100% !important; table-layout: auto;">
								<thead class="thead-light">
									<tr>
										<th class="no-sort">
											<div class="form-check form-check-md">
												<input class="form-check-input" type="checkbox" id="select-all">
											</div>
										</th>
										<th>Employee</th>
										<th>Status</th>
										<th>Check In</th>
										<th>Check Out</th>
										<th>Break</th>
										<th>Late</th>
										<th>Production Hours</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="empty attendanceRecords">
										<tr><td colspan="9" class="text-center py-4">No attendance records found for the selected filters.</td></tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="record" items="${attendanceRecords}">
											<tr>
												<td><div class="form-check form-check-md"><input class="form-check-input" type="checkbox" value="${record.userId}"></div></td>
												<td>
													<div class="d-flex align-items-center file-name-icon">
														<a href="javascript:void(0);" class="avatar avatar-md border avatar-rounded"><img src="${empty record.profilePicture ? 'assets/img/users/user-02.jpg' : record.profilePicture}" class="img-fluid" alt="img"></a>
														<div class="ms-2"><h6 class="fw-medium mb-0"><c:out value="${record.fullName}"/></h6><span class="fs-12 fw-normal"><c:out value="${record.departmentName}" default="-"/></span><span class="d-block fs-11 text-muted"><c:out value="${record.dateLabel}"/></span></div>
													</div>
												</td>
												<td><span class="badge ${record.statusBadgeClass} d-inline-flex align-items-center"><i class="ti ti-point-filled me-1"></i><c:out value="${record.statusLabel}"/></span></td>
												<td><c:out value="${record.checkInLabel}"/></td>
												<td><c:out value="${record.checkOutLabel}"/></td>
												<td><c:out value="${record.breakLabel}"/></td>
												<td><c:out value="${record.lateLabel}"/></td>
												<td><span class="badge ${record.productionBadgeClass} d-inline-flex align-items-center"><i class="ti ti-clock-hour-11 me-1"></i><c:out value="${record.productionHoursLabel}"/></span></td>
												<td><div class="action-icon d-inline-flex"><a href="javascript:void(0);" class="me-2" data-bs-toggle="modal" data-bs-target="#edit_attendance" data-user-id="${record.userId}" data-attendance-id="${record.attendanceId}" data-date="${record.date != null ? record.date.toLocalDate() : ''}" data-check-in="${record.checkIn != null ? record.checkIn.toLocalTime() : ''}" data-check-out="${record.checkOut != null ? record.checkOut.toLocalTime() : ''}" data-break-hours="${record.breakHours}" data-late="${record.late}" data-production-hours="${record.productionHours}" data-status="${record.statusLabel}" title="Edit"><i class="ti ti-edit"></i></a></div></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose></tbody>
							</table>
						</div>
					</div>
				</div>

			</div>

			<div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">
				<p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
				<p>Designed &amp; Developed By <a href="javascript:void(0);" class="text-primary">Dreams</a></p>
			</div>

		</div>
		<!-- /Page Wrapper -->

		<!-- Edit Attendance -->
		<div class="modal fade" id="edit_attendance">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Edit Attendance</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<form method="post" action="${pageContext.request.contextPath}/adminAttendance" id="editAttendanceForm">
						<div class="modal-body pb-0">
							<input type="hidden" name="attendanceId" id="attendanceId">
							<div class="row">
								<div class="col-md-12">
									<div class="mb-3">
										<label class="form-label">Date</label>
										<input type="date" class="form-control" name="date" id="attendanceDate" required>
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label class="form-label">Check In</label>
										<input type="time" class="form-control" name="checkIn" id="attendanceCheckIn">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label class="form-label">Check Out</label>
										<input type="time" class="form-control" name="checkOut" id="attendanceCheckOut">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label class="form-label">Break Hours</label>
										<input type="number" step="0.01" min="0" class="form-control" name="breakHours" id="attendanceBreakHours">
									</div>
								</div>
								<div class="col-md-6">
									<div class="mb-3">
										<label class="form-label">Late (Min)</label>
										<input type="number" min="0" class="form-control" name="late" id="attendanceLate">
									</div>
								</div>
								<div class="col-md-12">
									<div class="mb-3">
										<label class="form-label">Production Hours</label>
										<input type="number" step="0.01" min="0" class="form-control" name="productionHours" id="attendanceProductionHours">
									</div>
								</div>
								<div class="col-md-12">
									<div class="mb-3 ">
										<label class="form-label">Status</label>
										<select class="select" name="status" id="attendanceStatus">
											<option value="">Select</option>
											<option value="Present">Present</option>
											<option value="Absent">Absent</option>
											<option value="Permission">Permission</option>
										</select>
									</div>
								</div>
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-light me-2" data-bs-dismiss="modal">Cancel</button>
							<button type="submit" class="btn btn-primary">Save Changes</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!-- /Edit Attendance -->

		<!-- Attendance Report -->
		<div class="modal fade" id="attendance_report">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Attendance</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal"
							aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<div class="modal-body">
						<div class="card shadow-none bg-transparent-light">
							<div class="card-body pb-1">
								<div class="row align-items-center">
									<div class="col-lg-4">
										<div class="d-flex align-items-center mb-3">
											<span class="avatar avatar-sm avatar-rounded flex-shrink-0 me-2">
												<img src="assets/img/profiles/avatar-02.jpg" alt="Img">
											</span>
											<div>
												<h6 class="fw-medium">Anthony Lewis</h6>
												<span>UI/UX Team</span>
											</div>
										</div>
									</div>
									<div class="col-lg-8">
										<div class="row">
											<div class="col-sm-3">
												<div class="mb-3 text-sm-end">
													<span>Date</span>
													<p class="text-gray-9 fw-medium"><c:out value="${selectedDateRange}"/></p>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="mb-3 text-sm-end">
													<span>Punch in at</span>
													<p class="text-gray-9 fw-medium">-</p>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="mb-3 text-sm-end">
													<span>Punch out at</span>
													<p class="text-gray-9 fw-medium">-</p>
												</div>
											</div>
											<div class="col-sm-3">
												<div class="mb-3 text-sm-end">
													<span>Status</span>
													<p class="text-gray-9 fw-medium">Filtered Records</p>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card shadow-none border mb-0">
							<div class="card-body">
								<div class="row">
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i
													class="ti ti-point-filled text-dark-transparent me-1"></i>Total
												Working hours</p>
											<h3><c:out value="${summary.presentCount}"/> Present</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i
													class="ti ti-point-filled text-success me-1"></i>Productive Hours
											</p>
											<h3><c:out value="${summary.lateCount}"/> Late</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i
													class="ti ti-point-filled text-warning me-1"></i>Break hours</p>
											<h3><c:out value="${summary.absentCount}"/> Absent</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i
													class="ti ti-point-filled text-info me-1"></i>Overtime</p>
											<h3><c:out value="${summary.permissionCount}"/> Permission</h3>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8 mx-auto">
										<div class="alert alert-light mb-3">Use the table filters to view the actual attendance records.</div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar"
												style="width: 5%;"></div>
											<div class="progress-bar bg-success rounded me-2" role="progressbar"
												style="width: 28%;"></div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar"
												style="width: 17%;"></div>
											<div class="progress-bar bg-success rounded me-2" role="progressbar"
												style="width: 22%;"></div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar"
												style="width: 5%;"></div>
											<div class="progress-bar bg-info rounded me-2" role="progressbar"
												style="width: 3%;"></div>
											<div class="progress-bar bg-info rounded" role="progressbar"
												style="width: 2%;"></div>
										</div>

									</div>
									<div class="col-md-12"><div class="text-center text-muted">Showing <c:out value="${selectedDateRange}"/></div></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /Attendance Report -->

	</div>
	<!-- /Main Wrapper -->

	<!-- jQuery -->
	<script src="assets/js/jquery-3.7.1.min.js"></script>

	<!-- Bootstrap Core JS -->
	<script src="assets/js/bootstrap.bundle.min.js"></script>

	<!-- Feather Icon JS -->
	<script src="assets/js/feather.min.js"></script>

	<!-- Slimscroll JS -->
	<script src="assets/js/jquery.slimscroll.min.js"></script>

	<!-- Color Picker JS -->
	<script src="assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

	<!-- Datatable JS -->
	<script src="assets/js/jquery.dataTables.min.js"></script>
	<script src="assets/js/dataTables.bootstrap5.min.js"></script>

	<!-- Daterangepikcer JS -->
	<script src="assets/js/moment.js"></script>
	<script src="assets/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="assets/js/bootstrap-datetimepicker.min.js"></script>

	<!-- Select2 JS -->
	<script src="assets/plugins/select2/js/select2.min.js"></script>

	<!-- Chart JS -->
	<script src="assets/plugins/apexchart/apexcharts.min.js"></script>
	<script src="assets/plugins/apexchart/chart-data.js"></script>

	<!-- Custom JS -->
	<script src="assets/js/theme-colorpicker.js"></script>
	<script src="assets/js/script.js"></script>

<script>
$(function () {
    var $range = $('#attendanceDateRange');
    if ($range.length && $.fn.daterangepicker) {
        $range.daterangepicker({
            autoUpdateInput: true,
            locale: { format: 'DD/MM/YYYY', cancelLabel: 'Clear' },
            startDate: moment($('#fromDate').val(), 'YYYY-MM-DD'),
            endDate: moment($('#toDate').val(), 'YYYY-MM-DD')
        });
        $range.on('apply.daterangepicker', function (ev, picker) {
            $('#fromDate').val(picker.startDate.format('YYYY-MM-DD'));
            $('#toDate').val(picker.endDate.format('YYYY-MM-DD'));
            $(this).closest('form').submit();
        });
        $range.on('cancel.daterangepicker', function () {
            $('#fromDate').val(''); $('#toDate').val('');
            $(this).val(''); $(this).closest('form').submit();
        });
    }

    $('#edit_attendance').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget);
        var $modal = $(this);

        $modal.find('#attendanceId').val(button.data('attendanceId') || '');
        $modal.find('#attendanceDate').val(button.data('date') || '');
        $modal.find('#attendanceCheckIn').val(button.data('checkIn') || '');
        $modal.find('#attendanceCheckOut').val(button.data('checkOut') || '');
        $modal.find('#attendanceBreakHours').val(button.data('breakHours') || '');
        $modal.find('#attendanceLate').val(button.data('late') || '');
        $modal.find('#attendanceProductionHours').val(button.data('productionHours') || '');
        $modal.find('#attendanceStatus').val(button.data('status') || '').trigger('change');
    });
});
</script>

<style>
    .custom-datatable-filter.table-responsive,
    .custom-datatable-filter.table-responsive .datatable,
    .custom-datatable-filter.table-responsive .table {
        width: 100% !important;
        max-width: 100% !important;
        min-width: 100% !important;
    }
</style>

</body>

</html>