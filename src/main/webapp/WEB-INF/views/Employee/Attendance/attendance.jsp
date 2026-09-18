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
	<base href="${pageContext.request.contextPath}/">
	<title>Smarthr Admin Template</title>

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
						<div class="sidebar sidebar-horizontal" id="horizontal-single">
							<div class="sidebar-menu">
								<div class="main-menu">
									<ul class="nav-menu">
										<li class="menu-title">
											<span>Main</span>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-smart-home"></i><span>Dashboard</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li><a href="index.html">Admin Dashboard</a></li>
												<li><a href="employee-dashboard.html">Employee Dashboard</a></li>
												<li><a href="deals-dashboard.html">Deals Dashboard</a></li>
												<li><a href="leads-dashboard.html">Leads Dashboard</a></li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-user-star"></i><span>Super Admin</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li><a href="dashboard.html">Dashboard</a></li>
												<li><a href="companies.html">Companies</a></li>
												<li><a href="subscription.html">Subscriptions</a></li>
												<li><a href="packages.html">Packages</a></li>
												<li><a href="domain.html">Domain</a></li>
												<li><a href="purchase-transaction.html">Purchase Transaction</a></li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-layout-grid-add"></i><span>Applications</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li><a href="chat.html">Chat</a></li>
												<li class="submenu submenu-two">
													<a href="call.html">Calls<span
															class="menu-arrow inside-submenu"></span></a>
													<ul>
														<li><a href="voice-call.html">Voice Call</a></li>
														<li><a href="video-call.html">Video Call</a></li>
														<li><a href="outgoing-call.html">Outgoing Call</a></li>
														<li><a href="incoming-call.html">Incoming Call</a></li>
														<li><a href="call-history.html">Call History</a></li>
													</ul>
												</li>
												<li><a href="calendar.html">Calendar</a></li>
												<li><a href="email.html">Email</a></li>
												<li><a href="todo.html">To Do</a></li>
												<li><a href="notes.html">Notes</a></li>
												<li><a href="social-feed.html">Social Feed</a></li>
												<li><a href="file-manager.html">File Manager</a></li>
												<li><a href="kanban-view.html">Kanban</a></li>
												<li><a href="invoices.html">Invoices</a></li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-layout-board-split"></i><span>Layouts</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li>
													<a href="layout-horizontal.html">
														<span>Horizontal</span>
													</a>
												</li>
												<li>
													<a href="layout-detached.html">
														<span>Detached</span>
													</a>
												</li>
												<li>
													<a href="layout-modern.html">
														<span>Modern</span>
													</a>
												</li>
												<li>
													<a href="layout-two-column.html">
														<span>Two Column </span>
													</a>
												</li>
												<li>
													<a href="layout-hovered.html">
														<span>Hovered</span>
													</a>
												</li>
												<li>
													<a href="layout-box.html">
														<span>Boxed</span>
													</a>
												</li>
												<li>
													<a href="layout-horizontal-single.html">
														<span>Horizontal Single</span>
													</a>
												</li>
												<li>
													<a href="layout-horizontal-overlay.html">
														<span>Horizontal Overlay</span>
													</a>
												</li>
												<li>
													<a href="layout-horizontal-box.html">
														<span>Horizontal Box</span>
													</a>
												</li>
												<li>
													<a href="layout-horizontal-sidemenu.html">
														<span>Menu Aside</span>
													</a>
												</li>
												<li>
													<a href="layout-vertical-transparent.html">
														<span>Transparent</span>
													</a>
												</li>
												<li>
													<a href="layout-without-header.html">
														<span>Without Header</span>
													</a>
												</li>
												<li>
													<a href="layout-rtl.html">
														<span>RTL</span>
													</a>
												</li>
												<li>
													<a href="layout-dark.html">
														<span>Dark</span>
													</a>
												</li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#" class="active" >
												<i class="ti ti-user-star"></i><span>Projects</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li>
													<a href="clients-grid.html"><span>Clients</span>
													</a>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Projects</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="projects-grid.html">Projects</a></li>
														<li><a href="tasks.html">Tasks</a></li>
														<li><a href="task-board.html">Task Board</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="call.html">Crm<span class="menu-arrow"></span></a>
													<ul>
														<li><a href="contacts-grid.html" ><span>Contacts</span></a></li>
														<li><a href="companies-grid.html"><span>Companies</span></a>
														</li>
														<li><a href="deals-grid.html"><span>Deals</span></a></li>
														<li><a href="leads-grid.html"><span>Leads</span></a></li>
														<li><a href="pipeline.html"><span>Pipeline</span></a></li>
														<li><a href="analytics.html"><span>Analytics</span></a></li>
														<li><a href="activity.html"><span>Activities</span></a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Employees</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="employees.html">Employee Lists</a></li>
														<li><a href="employees-grid.html">Employee Grid</a></li>
														<li><a href="employee-details.html">Employee Details</a></li>
														<li><a href="departments.html">Departments</a></li>
														<li><a href="designations.html">Designations</a></li>
														<li><a href="policy.html">Policies</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Tickets</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="tickets.html">Tickets</a></li>
														<li><a href="ticket-details.html">Ticket Details</a></li>
													</ul>
												</li>
												<li><a href="holidays.html"><span>Holidays</span></a></li>
												<li class="submenu">
													<a href="javascript:void(0);" class="active  subdrop"><span>Attendance</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li class="submenu">
															<a href="javascript:void(0);">Leaves<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="leaves.html">Leaves (Admin)</a></li>
																<li><a href="leaves-employee.html">Leave (Employee)</a>
																</li>
																<li><a href="leave-settings.html">Leave Settings</a>
																</li>
															</ul>
														</li>
														<li><a href="attendance-admin.html">Attendance (Admin)</a></li>
														<li><a href="${pageContext.request.contextPath}/attendance" class="active">Attendance (Employee)</a>
														</li>
														<li><a href="timesheets.html">Timesheets</a></li>
														<li><a href="schedule-timing.html">Shift & Schedule</a></li>
														<li><a href="overtime.html">Overtime</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Performance</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="performance-indicator.html">Performance
																Indicator</a></li>
														<li><a href="performance-review.html">Performance Review</a>
														</li>
														<li><a href="performance-appraisal.html">Performance
																Appraisal</a></li>
														<li><a href="goal-tracking.html">Goal List</a></li>
														<li><a href="goal-type.html">Goal Type</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Training</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="training.html">Training List</a></li>
														<li><a href="trainers.html">Trainers</a></li>
														<li><a href="training-type.html">Training Type</a></li>
													</ul>
												</li>
												<li><a href="promotion.html"><span>Promotion</span></a></li>
												<li><a href="resignation.html"><span>Resignation</span></a></li>
												<li><a href="termination.html"><span>Termination</span></a></li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-user-star"></i><span>Administration</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Sales</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="estimates.html">Estimates</a></li>
														<li><a href="invoices.html">Invoices</a></li>
														<li><a href="payments.html">Payments</a></li>
														<li><a href="expenses.html">Expenses</a></li>
														<li><a href="provident-fund.html">Provident Fund</a></li>
														<li><a href="taxes.html">Taxes</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Accounting</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="categories.html">Categories</a></li>
														<li><a href="budgets.html">Budgets</a></li>
														<li><a href="budget-expenses.html">Budget Expenses</a></li>
														<li><a href="budget-revenues.html">Budget Revenues</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Payroll</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="employee-salary.html">Employee Salary</a></li>
														<li><a href="payslip.html">Payslip</a></li>
														<li><a href="payroll.html">Payroll Items</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Assets</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="assets.html">Assets</a></li>
														<li><a href="asset-categories.html">Asset Categories</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Help & Supports</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="knowledgebase.html">Knowledge Base</a></li>
														<li><a href="activity.html">Activities</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>User Management</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="users.html">Users</a></li>
														<li><a href="roles-permissions.html">Roles & Permissions</a>
														</li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Reports</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li><a href="expenses-report.html">Expense Report</a></li>
														<li><a href="invoice-report.html">Invoice Report</a></li>
														<li><a href="payment-report.html">Payment Report</a></li>
														<li><a href="project-report.html">Project Report</a></li>
														<li><a href="task-report.html">Task Report</a></li>
														<li><a href="user-report.html">User Report</a></li>
														<li><a href="employee-report.html">Employee Report</a></li>
														<li><a href="payslip-report.html">Payslip Report</a></li>
														<li><a href="attendance-report.html">Attendance Report</a></li>
														<li><a href="leave-report.html">Leave Report</a></li>
														<li><a href="daily-report.html">Daily Report</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Settings</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li class="submenu">
															<a href="javascript:void(0);">General Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="profile-settings.html">Profile</a></li>
																<li><a href="security-settings.html">Security</a></li>
																<li><a
																		href="notification-settings.html">Notifications</a>
																</li>
																<li><a href="connected-apps.html">Connected Apps</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Website Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="bussiness-settings.html">Business
																		Settings</a></li>
																<li><a href="seo-settings.html">SEO Settings</a></li>
																<li><a
																		href="localization-settings.html">Localization</a>
																</li>
																<li><a href="prefixes.html">Prefixes</a></li>
																<li><a href="preferences.html">Preferences</a></li>
																<li><a href="performance-appraisal.html">Appearance</a>
																</li>
																<li><a href="language.html">Language</a></li>
																<li><a
																		href="authentication-settings.html">Authentication</a>
																</li>
																<li><a href="ai-settings.html">AI Settings</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">App Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="salary-settings.html">Salary Settings</a>
																</li>
																<li><a href="approval-settings.html">Approval
																		Settings</a></li>
																<li><a href="invoice-settings.html">Invoice Settings</a>
																</li>
																<li><a href="leave-type.html">Leave Type</a></li>
																<li><a href="custom-fields.html">Custom Fields</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">System Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="email-settings.html">Email Settings</a>
																</li>
																<li><a href="email-template.html">Email Templates</a>
																</li>
																<li><a href="sms-settings.html">SMS Settings</a></li>
																<li><a href="sms-template.html">SMS Templates</a></li>
																<li><a href="otp-settings.html">OTP</a></li>
																<li><a href="gdpr.html">GDPR Cookies</a></li>
																<li><a href="maintenance-mode.html">Maintenance Mode</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Financial Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="payment-gateways.html">Payment Gateways</a>
																</li>
																<li><a href="tax-rates.html">Tax Rate</a></li>
																<li><a href="currencies.html">Currencies</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Other Settings<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="custom-css.html">Custom CSS</a></li>
																<li><a href="custom-js.html">Custom JS</a></li>
																<li><a href="cronjob.html">Cronjob</a></li>
																<li><a href="storage-settings.html">Storage</a></li>
																<li><a href="ban-ip-address.html">Ban IP Address</a>
																</li>
																<li><a href="backup.html">Backup</a></li>
																<li><a href="clear-cache.html">Clear Cache</a></li>
															</ul>
														</li>
													</ul>
												</li>
											</ul>
										</li>
										<li class="submenu">
											<a href="#">
												<i class="ti ti-page-break"></i><span>Pages</span>
												<span class="menu-arrow"></span>
											</a>
											<ul>
												<li><a href="starter.html"><span>Starter</span></a></li>
												<li><a href="profile.html"><span>Profile</span></a></li>
												<li><a href="gallery.html"><span>Gallery</span></a></li>
												<li><a href="search-result.html"><span>Search Results</span></a></li>
												<li><a href="timeline.html"><span>Timeline</span></a></li>
												<li><a href="pricing.html"><span>Pricing</span></a></li>
												<li><a href="coming-soon.html"><span>Coming Soon</span></a></li>
												<li><a href="under-maintenance.html"><span>Under Maintenance</span></a>
												</li>
												<li><a href="under-construction.html"><span>Under
															Construction</span></a></li>
												<li><a href="api-keys.html"><span>API Keys</span></a></li>
												<li><a href="privacy-policy.html"><span>Privacy Policy</span></a></li>
												<li><a href="terms-condition.html"><span>Terms & Conditions</span></a>
												</li>
												<li class="submenu">
													<a href="#"><span>Content</span> <span
															class="menu-arrow"></span></a>
													<ul>
														<li><a href="pages.html">Pages</a></li>
														<li class="submenu">
															<a href="javascript:void(0);">Blogs<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="blogs.html">All Blogs</a></li>
																<li><a href="blog-categories.html">Categories</a></li>
																<li><a href="blog-comments.html">Comments</a></li>
																<li><a href="blog-tags.html">Tags</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Locations<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="countries.html">Countries</a></li>
																<li><a href="states.html">States</a></li>
																<li><a href="cities.html">Cities</a></li>
															</ul>
														</li>
														<li><a href="testimonials.html">Testimonials</a></li>
														<li><a href="faq.html">FAQ’S</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="#">
														<span>Authentication</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li class="submenu">
															<a href="javascript:void(0);" class="">Login<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="login.html">Cover</a></li>
																<li><a href="login-2.html">Illustration</a></li>
																<li><a href="login-3.html">Basic</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);" class="">Register<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="register.html">Cover</a></li>
																<li><a href="register-2.html">Illustration</a></li>
																<li><a href="register-3.html">Basic</a></li>
															</ul>
														</li>
														<li class="submenu"><a href="javascript:void(0);">Forgot
																Password<span class="menu-arrow"></span></a>
															<ul>
																<li><a href="forgot-password.html">Cover</a></li>
																<li><a href="forgot-password-2.html">Illustration</a>
																</li>
																<li><a href="forgot-password-3.html">Basic</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Reset Password<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="reset-password.html">Cover</a></li>
																<li><a href="reset-password-2.html">Illustration</a>
																</li>
																<li><a href="reset-password-3.html">Basic</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">Email Verification<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="email-verification.html">Cover</a></li>
																<li><a href="email-verification-2.html">Illustration</a>
																</li>
																<li><a href="email-verification-3.html">Basic</a></li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">2 Step Verification<span
																	class="menu-arrow"></span></a>
															<ul>
																<li><a href="two-step-verification.html">Cover</a></li>
																<li><a
																		href="two-step-verification-2.html">Illustration</a>
																</li>
																<li><a href="two-step-verification-3.html">Basic</a>
																</li>
															</ul>
														</li>
														<li><a href="lock-screen.html">Lock Screen</a></li>
														<li><a href="error-404.html">404 Error</a></li>
														<li><a href="error-500.html">500 Error</a></li>
													</ul>
												</li>
												<li class="submenu">
													<a href="#">
														<span>UI Interface</span>
														<span class="menu-arrow"></span>
													</a>
													<ul>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-hierarchy-2"></i>
																<span>Base UI</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="ui-alerts.html">Alerts</a>
																</li>
																<li>
																	<a href="ui-accordion.html">Accordion</a>
																</li>
																<li>
																	<a href="ui-avatar.html">Avatar</a>
																</li>
																<li>
																	<a href="ui-badges.html">Badges</a>
																</li>
																<li>
																	<a href="ui-borders.html">Border</a>
																</li>
																<li>
																	<a href="ui-buttons.html">Buttons</a>
																</li>
																<li>
																	<a href="ui-buttons-group.html">Button Group</a>
																</li>
																<li>
																	<a href="ui-breadcrumb.html">Breadcrumb</a>
																</li>
																<li>
																	<a href="ui-cards.html">Card</a>
																</li>
																<li>
																	<a href="ui-carousel.html">Carousel</a>
																</li>
																<li>
																	<a href="ui-colors.html">Colors</a>
																</li>
																<li>
																	<a href="ui-dropdowns.html">Dropdowns</a>
																</li>
																<li>
																	<a href="ui-grid.html">Grid</a>
																</li>
																<li>
																	<a href="ui-images.html">Images</a>
																</li>
																<li>
																	<a href="ui-lightbox.html">Lightbox</a>
																</li>
																<li>
																	<a href="ui-media.html">Media</a>
																</li>
																<li>
																	<a href="ui-modals.html">Modals</a>
																</li>
																<li>
																	<a href="ui-offcanvas.html">Offcanvas</a>
																</li>
																<li>
																	<a href="ui-pagination.html">Pagination</a>
																</li>
																<li>
																	<a href="ui-popovers.html">Popovers</a>
																</li>
																<li>
																	<a href="ui-progress.html">Progress</a>
																</li>
																<li>
																	<a href="ui-placeholders.html">Placeholders</a>
																</li>
																<li>
																	<a href="ui-spinner.html">Spinner</a>
																</li>
																<li>
																	<a href="ui-sweetalerts.html">Sweet Alerts</a>
																</li>
																<li>
																	<a href="ui-nav-tabs.html">Tabs</a>
																</li>
																<li>
																	<a href="ui-toasts.html">Toasts</a>
																</li>
																<li>
																	<a href="ui-tooltips.html">Tooltips</a>
																</li>
																<li>
																	<a href="ui-typography.html">Typography</a>
																</li>
																<li>
																	<a href="ui-video.html">Video</a>
																</li>
																<li>
																	<a href="ui-sortable.html">Sortable</a>
																</li>
																<li>
																	<a href="ui-swiperjs.html">Swiperjs</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-hierarchy-3"></i>
																<span>Advanced UI</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="ui-ribbon.html">Ribbon</a>
																</li>
																<li>
																	<a href="ui-clipboard.html">Clipboard</a>
																</li>
																<li>
																	<a href="ui-drag-drop.html">Drag & Drop</a>
																</li>
																<li>
																	<a href="ui-rangeslider.html">Range Slider</a>
																</li>
																<li>
																	<a href="ui-rating.html">Rating</a>
																</li>
																<li>
																	<a href="ui-text-editor.html">Text Editor</a>
																</li>
																<li>
																	<a href="ui-counter.html">Counter</a>
																</li>
																<li>
																	<a href="ui-scrollbar.html">Scrollbar</a>
																</li>
																<li>
																	<a href="ui-stickynote.html">Sticky Note</a>
																</li>
																<li>
																	<a href="ui-timeline.html">Timeline</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-input-search"></i>
																<span>Forms</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li class="submenu submenu-two">
																	<a href="javascript:void(0);">Form Elements <span
																			class="menu-arrow inside-submenu"></span>
																	</a>
																	<ul>
																		<li>
																			<a href="form-basic-inputs.html">Basic
																				Inputs</a>
																		</li>
																		<li>
																			<a href="form-checkbox-radios.html">Checkbox
																				& Radios</a>
																		</li>
																		<li>
																			<a href="form-input-groups.html">Input
																				Groups</a>
																		</li>
																		<li>
																			<a href="form-grid-gutters.html">Grid &
																				Gutters</a>
																		</li>
																		<li>
																			<a href="form-select.html">Form Select</a>
																		</li>
																		<li>
																			<a href="form-mask.html">Input Masks</a>
																		</li>
																		<li>
																			<a href="form-fileupload.html">File
																				Uploads</a>
																		</li>
																	</ul>
																</li>
																<li class="submenu submenu-two">
																	<a href="javascript:void(0);">Layouts <span
																			class="menu-arrow inside-submenu"></span>
																	</a>
																	<ul>
																		<li>
																			<a href="form-horizontal.html">Horizontal
																				Form</a>
																		</li>
																		<li>
																			<a href="form-vertical.html">Vertical
																				Form</a>
																		</li>
																		<li>
																			<a href="form-floating-labels.html">Floating
																				Labels</a>
																		</li>
																	</ul>
																</li>
																<li>
																	<a href="form-validation.html">Form Validation</a>
																</li>

																<li>
																	<a href="form-select2.html">Select2</a>
																</li>
																<li>
																	<a href="form-wizard.html">Form Wizard</a>
																</li>
																<li>
																	<a href="form-pickers.html">Form Pickers</a>
																</li>

															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-table-plus"></i>
																<span>Tables</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="tables-basic.html">Basic Tables </a>
																</li>
																<li>
																	<a href="data-tables.html">Data Table </a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-chart-line"></i>
																<span>Charts</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="chart-apex.html">Apex Charts</a>
																</li>
																<li>
																	<a href="chart-c3.html">Chart C3</a>
																</li>
																<li>
																	<a href="chart-js.html">Chart Js</a>
																</li>
																<li>
																	<a href="chart-morris.html">Morris Charts</a>
																</li>
																<li>
																	<a href="chart-flot.html">Flot Charts</a>
																</li>
																<li>
																	<a href="chart-peity.html">Peity Charts</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-icons"></i>
																<span>Icons</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="icon-fontawesome.html">Fontawesome
																		Icons</a>
																</li>
																<li>
																	<a href="icon-tabler.html">Tabler Icons</a>
																</li>
																<li>
																	<a href="icon-bootstrap.html">Bootstrap Icons</a>
																</li>
																<li>
																	<a href="icon-remix.html">Remix Icons</a>
																</li>
																<li>
																	<a href="icon-feather.html">Feather Icons</a>
																</li>
																<li>
																	<a href="icon-ionic.html">Ionic Icons</a>
																</li>
																<li>
																	<a href="icon-material.html">Material Icons</a>
																</li>
																<li>
																	<a href="icon-pe7.html">Pe7 Icons</a>
																</li>
																<li>
																	<a href="icon-simpleline.html">Simpleline Icons</a>
																</li>
																<li>
																	<a href="icon-themify.html">Themify Icons</a>
																</li>
																<li>
																	<a href="icon-weather.html">Weather Icons</a>
																</li>
																<li>
																	<a href="icon-typicon.html">Typicon Icons</a>
																</li>
																<li>
																	<a href="icon-flag.html">Flag Icons</a>
																</li>
															</ul>
														</li>
														<li class="submenu">
															<a href="javascript:void(0);">
																<i class="ti ti-table-plus"></i>
																<span>Maps</span>
																<span class="menu-arrow"></span>
															</a>
															<ul>
																<li>
																	<a href="maps-vector.html">Vector</a>
																</li>
																<li>
																	<a href="maps-leaflet.html">Leaflet</a>
																</li>
															</ul>
														</li>
													</ul>
												</li>
												<li><a href="#">Documentation</a></li>
												<li><a href="#">Change Log</a></li>
												<li class="submenu">
													<a href="javascript:void(0);"><span>Multi Level</span><span
															class="menu-arrow"></span></a>
													<ul>
														<li><a href="javascript:void(0);">Multilevel 1</a></li>
														<li class="submenu submenu-two">
															<a href="javascript:void(0);">Multilevel 2<span
																	class="menu-arrow inside-submenu"></span></a>
															<ul>
																<li><a href="javascript:void(0);">Multilevel 2.1</a>
																</li>
																<li class="submenu submenu-two submenu-three">
																	<a href="javascript:void(0);">Multilevel 2.2<span
																			class="menu-arrow inside-submenu inside-submenu-two"></span></a>
																	<ul>
																		<li><a href="javascript:void(0);">Multilevel
																				2.2.1</a></li>
																		<li><a href="javascript:void(0);">Multilevel
																				2.2.2</a></li>
																	</ul>
																</li>
															</ul>
														</li>
														<li><a href="javascript:void(0);">Multilevel 3</a></li>
													</ul>
												</li>
											</ul>
										</li>
									</ul>
								</div>
							</div>
						</div>
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
				
				<!-- /Mobile Menu -->

			</div>

		</div>
		<!-- /Header -->

		<!-- Sidebar -->
		<jsp:include page="/WEB-INF/views/common/employee-sidebar.jsp" />
		<!-- Page Wrapper -->
		<div class="page-wrapper">
			<div class="content">

				<!-- Breadcrumb -->
				<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
					<div class="my-auto mb-2">
						<h2 class="mb-1">Employee Attendance</h2>
						<nav>
							<ol class="breadcrumb mb-0">
								<li class="breadcrumb-item">
									<a href="index.html"><i class="ti ti-smart-home"></i></a>
								</li>
								<li class="breadcrumb-item">
									Employee
								</li>
								<li class="breadcrumb-item active" aria-current="page">Employee Attendance</li>
							</ol>
						</nav>
					</div>
					<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
						<div class="me-2 mb-2">
							<div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
								<a href="attendance-admin.html" class="btn btn-icon btn-sm active bg-primary text-white me-1"><i class="ti ti-brand-days-counter"></i></a>
								<a href="attendance-admin.html" class="btn btn-icon btn-sm"><i class="ti ti-calendar-event"></i></a>
							</div>
						</div>
						<div class="me-2 mb-2">
							<div class="dropdown">
								<a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
									<i class="ti ti-file-export me-1"></i>Export
								</a>
								<ul class="dropdown-menu  dropdown-menu-end p-3">
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
									</li>
									<li>
										<a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
									</li>
								</ul>
							</div>
						</div>
						<div class="mb-2">
							<a href="#" class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#attendance_report"><i class="ti ti-file-analytics me-2"></i>Report</a>
						</div>
						<div class="ms-2 head-icons">
							<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
								<i class="ti ti-chevrons-up"></i>
							</a>
						</div>
					</div>
				</div>
				<!-- /Breadcrumb -->

                <c:if test="${not empty attendanceSuccess}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        ${attendanceSuccess}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>
                <c:if test="${not empty attendanceError}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        ${attendanceError}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-xl-3 col-lg-4 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body">
                                <div class="mb-3 text-center">
                                    <h6 class="fw-medium text-gray-5 mb-2">Good Morning, ${employeeGreeting}</h6>
                                    <h4>${todayLabel}</h4>
                                </div>
                                <div class="attendance-circle-progress mx-auto mb-3" data-value="${totalWorkingProgress}">
                                    <span class="progress-left">
                                        <span class="progress-bar border-success"></span>
                                    </span>
                                    <span class="progress-right">
                                        <span class="progress-bar border-success"></span>
                                    </span>
                                    <div class="avatar avatar-xxl avatar-rounded">
                                        <img src="assets/img/profiles/avatar-27.jpg" alt="Img">
                                    </div>
                                </div>
                                <div class="text-center">
                                    <div class="badge badge-md badge-primary mb-3">
                                        Production : ${todayProductionHours}
                                    </div>
                                    <h6 class="fw-medium d-flex align-items-center justify-content-center mb-3">
                                        <i class="ti ti-fingerprint text-primary me-1"></i>
                                        <c:choose>
                                            <c:when test="${attendanceState == 'PUNCH_IN'}">Ready to check in</c:when>
                                            <c:when test="${attendanceState == 'LUNCH_IN'}">Check In at ${punchInLabel}</c:when>
                                            <c:when test="${attendanceState == 'LUNCH_OUT'}">Lunch In at ${lunchInLabel}</c:when>
                                            <c:when test="${attendanceState == 'CHECK_OUT'}">Lunch Out at ${lunchOutLabel}</c:when>
                                            <c:otherwise>Checked Out at ${checkoutLabel}</c:otherwise>
                                        </c:choose>
                                    </h6>

                                    <c:choose>
                                        <c:when test="${attendanceState == 'PUNCH_IN'}">
                                            <form method="post" action="${pageContext.request.contextPath}/attendance">
                                                <input type="hidden" name="action" value="punchIn">
                                                <button type="submit" class="btn btn-dark w-100">Check In</button>
                                            </form>
                                        </c:when>
                                        <c:when test="${attendanceState == 'LUNCH_IN'}">
                                            <form method="post" action="${pageContext.request.contextPath}/attendance">
                                                <input type="hidden" name="action" value="lunchIn">
                                                <button type="submit" class="btn btn-dark w-100">Lunch In</button>
                                            </form>
                                        </c:when>
                                        <c:when test="${attendanceState == 'LUNCH_OUT'}">
                                            <form method="post" action="${pageContext.request.contextPath}/attendance">
                                                <input type="hidden" name="action" value="lunchOut">
                                                <button type="submit" class="btn btn-dark w-100">Lunch Out</button>
                                            </form>
                                        </c:when>
                                        <c:when test="${attendanceState == 'CHECK_OUT'}">
                                            <form method="post" action="${pageContext.request.contextPath}/attendance">
                                                <input type="hidden" name="action" value="checkout">
                                                <button type="submit" class="btn btn-dark w-100">Check Out</button>
                                            </form>
                                        </c:when>
                                        <c:otherwise>
                                            <button type="button" class="btn btn-success w-100" disabled>Attendance Completed</button>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-xl-9 col-lg-8 d-flex">
                        <div class="row flex-fill">
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="border-bottom mb-2 pb-2">
                                            <span class="avatar avatar-sm bg-primary mb-2"><i class="ti ti-clock-stop"></i></span>
                                            <h2 class="mb-2">${todayHours} / <span class="fs-20 text-gray-5">9</span></h2>
                                            <p class="fw-medium text-truncate">Total Hours Today</p>
                                        </div>
                                        <div><p class="d-flex align-items-center fs-13 mb-0">
                                            <span class="avatar avatar-xs rounded-circle bg-success flex-shrink-0 me-2"><i class="ti ti-clock fs-12"></i></span>
                                            <span>${totalWorkingProgress}% of target</span>
                                        </p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="border-bottom mb-2 pb-2">
                                            <span class="avatar avatar-sm bg-dark mb-2"><i class="ti ti-clock-up"></i></span>
                                            <h2 class="mb-2">${weekHours} / <span class="fs-20 text-gray-5">40</span></h2>
                                            <p class="fw-medium text-truncate">Total Hours Week</p>
                                        </div>
                                        <div><p class="d-flex align-items-center fs-13 mb-0">
                                            <span class="avatar avatar-xs rounded-circle bg-success flex-shrink-0 me-2"><i class="ti ti-calendar-week fs-12"></i></span>
                                            <span>Current week</span>
                                        </p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="border-bottom mb-2 pb-2">
                                            <span class="avatar avatar-sm bg-info mb-2"><i class="ti ti-calendar-up"></i></span>
                                            <h2 class="mb-2">${monthHours}</h2>
                                            <p class="fw-medium text-truncate">Total Hours Month</p>
                                        </div>
                                        <div><p class="d-flex align-items-center fs-13 mb-0">
                                            <span class="avatar avatar-xs rounded-circle bg-info flex-shrink-0 me-2"><i class="ti ti-calendar fs-12"></i></span>
                                            <span>Current month</span>
                                        </p></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="border-bottom mb-2 pb-2">
                                            <span class="avatar avatar-sm bg-pink mb-2"><i class="ti ti-calendar-star"></i></span>
                                            <h2 class="mb-2">${overtimeMonth}</h2>
                                            <p class="fw-medium text-truncate">Overtime this Month</p>
                                        </div>
                                        <div><p class="d-flex align-items-center fs-13 mb-0">
                                            <span class="avatar avatar-xs rounded-circle bg-warning flex-shrink-0 me-2"><i class="ti ti-clock fs-12"></i></span>
                                            <span>${todayOvertimeHours} today</span>
                                        </p></div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-xl-3"><div class="mb-3">
                                                <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-dark-transparent me-1"></i>Total Working hours</p>
                                                <h3>${todayHours}</h3>
                                            </div></div>
                                            <div class="col-xl-3"><div class="mb-3">
                                                <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-success me-1"></i>Productive Hours</p>
                                                <h3>${todayProductionHours}</h3>
                                            </div></div>
                                            <div class="col-xl-3"><div class="mb-3">
                                                <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-warning me-1"></i>Break hours</p>
                                                <h3>${todayBreakHours}</h3>
                                            </div></div>
                                            <div class="col-xl-3"><div class="mb-3">
                                                <p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-info me-1"></i>Overtime</p>
                                                <h3>${todayOvertimeHours}</h3>
                                            </div></div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="progress bg-transparent-dark mb-3" style="height: 24px;">
                                                    <div class="progress-bar bg-success rounded" role="progressbar" style="width: ${productiveProgress}%;" title="Production"></div>
                                                    <div class="progress-bar bg-warning rounded" role="progressbar" style="width: ${breakProgress}%;" title="Break"></div>
                                                    <div class="progress-bar bg-info rounded" role="progressbar" style="width: ${todayOvertimeHours == '0h 0m' ? 0 : 1}%;" title="Overtime"></div>
                                                </div>
                                            </div>
                                            <div class="co-md-12">
                                                <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-2">
                                                    <span class="fs-10">06:00</span><span class="fs-10">07:00</span><span class="fs-10">08:00</span>
                                                    <span class="fs-10">09:00</span><span class="fs-10">10:00</span><span class="fs-10">11:00</span>
                                                    <span class="fs-10">12:00</span><span class="fs-10">01:00</span><span class="fs-10">02:00</span>
                                                    <span class="fs-10">03:00</span><span class="fs-10">04:00</span><span class="fs-10">05:00</span>
                                                    <span class="fs-10">06:00</span><span class="fs-10">07:00</span><span class="fs-10">08:00</span>
                                                    <span class="fs-10">09:00</span><span class="fs-10">10:00</span><span class="fs-10">11:00</span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                        <h5>Employee Attendance</h5>
                        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">
                            <form id="attendanceFilterForm" method="get" action="${pageContext.request.contextPath}/attendance" class="d-flex align-items-center flex-wrap row-gap-3">
                                <input type="hidden" id="attendanceFromDate" name="fromDate" value="${selectedFromDate}">
                                <input type="hidden" id="attendanceToDate" name="toDate" value="${selectedToDate}">
                                <input type="hidden" id="attendanceStatus" name="status" value="${selectedStatus}">
                                <input type="hidden" id="attendanceSort" name="sort" value="${selectedSort}">
                                <div class="me-3">
                                    <div class="input-icon-end position-relative">
                                        <input type="text" id="attendanceDateRange" class="form-control date-range bookingrange" placeholder="dd/mm/yyyy - dd/mm/yyyy" value="${selectedDateRange}" autocomplete="off">
                                        <span class="input-icon-addon"><i class="ti ti-chevron-down"></i></span>
                                    </div>
                                </div>
                                <div class="dropdown me-3">
                                <a id="statusFilterButton" href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown"><c:choose><c:when test="${not empty selectedStatus}">Status : ${selectedStatus}</c:when><c:otherwise>Select Status</c:otherwise></c:choose></a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-filter" data-status="">All Status</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-filter" data-status="Present">Present</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-status-filter" data-status="Absent">Absent</a></li>
                                </ul>
                            </div>
                            <div class="dropdown">
                                <a id="sortFilterButton" href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : <c:choose><c:when test="${selectedSort == 'oldest'}">Oldest</c:when><c:when test="${selectedSort == 'present'}">Present First</c:when><c:when test="${selectedSort == 'absent'}">Absent First</c:when><c:otherwise>Newest</c:otherwise></c:choose></a>
                                <ul class="dropdown-menu dropdown-menu-end p-3">
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-filter" data-sort="newest">Newest</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-filter" data-sort="oldest">Oldest</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-filter" data-sort="present">Present First</a></li>
                                    <li><a href="javascript:void(0);" class="dropdown-item rounded-1 attendance-sort-filter" data-sort="absent">Absent First</a></li>
                                </ul>
                            </div>
                            </form>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="custom-datatable-filter table-responsive">
                            <table id="attendanceTable" class="table">
                                <thead class="thead-light">
                                    <tr>
                                        <th>Date</th>
                                        <th>Check In</th>
                                        <th>Status</th>
                                        <th>Check Out</th>
                                        <th>Break</th>
                                        <th>Late</th>
                                        <th>Overtime</th>
                                        <th>Production Hours</th>
                                    </tr>
                                </thead>
                                <tbody id="attendanceTableBody">
                                    <c:forEach var="a" items="${attendanceList}">
                                        <tr data-date="${a.date}" data-status="${a.status}">
                                            <td>${a.dateLabel}</td>
                                            <td>${a.checkInLabel}</td>
                                            <td>
                                                <c:choose>
                                                    <c:when test="${a.status eq 'Present'}">
                                                        <span class="badge badge-success-transparent d-inline-flex align-items-center"><i class="ti ti-point-filled me-1"></i>${a.status}</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span class="badge badge-danger-transparent d-inline-flex align-items-center"><i class="ti ti-point-filled me-1"></i>${a.status}</span>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td>${a.checkOutLabel}</td>
                                            <td>${a.breakHoursLabel}</td>
                                            <td><c:choose><c:when test="${a.late > 0}">${a.late} Min</c:when><c:otherwise>-</c:otherwise></c:choose></td>
                                            <td>${a.overtimeHoursLabel}</td>
                                            <td>
                                                <span class="badge ${a.productionBadgeClass} d-inline-flex align-items-center">
                                                    <i class="ti ti-clock-hour-11 me-1"></i>${a.productionHoursLabel}
                                                </span>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    <c:if test="${empty attendanceList}">
                                        <tr id="noAttendanceData"><td colspan="8" class="text-center py-4">No attendance records found.</td></tr>
                                    </c:if>
                                </tbody>
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

		<!-- Attendance Report -->
		<div class="modal fade" id="attendance_report">
			<div class="modal-dialog modal-dialog-centered modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<h4 class="modal-title">Attendance</h4>
						<button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
							<i class="ti ti-x"></i>
						</button>
					</div>
					<div class="modal-body">
						<div class="card shadow-none bg-transparent-light">
							<div class="card-body pb-1">
								<div class="row">
									<div class="col-sm-3">
										<div class="mb-3">
											<span>Date</span>
											<p class="text-gray-9 fw-medium">${todayLabel}</p>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="mb-3">
											<span>Punch in at</span>
											<p class="text-gray-9 fw-medium">${punchInLabel}</p>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="mb-3">
											<span>Punch out at</span>
											<p class="text-gray-9 fw-medium">${checkoutLabel}</p>
										</div>
									</div>
									<div class="col-sm-3">
										<div class="mb-3">
											<span>Status</span>
											<p class="text-gray-9 fw-medium">${todayStatus}</p>
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
											<p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-dark-transparent me-1"></i>Total Working hours</p>
											<h3>${todayHours}</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-success me-1"></i>Productive Hours</p>
											<h3>${todayProductionHours}</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-warning me-1"></i>Break hours</p>
											<h3>${todayBreakHours}</h3>
										</div>
									</div>
									<div class="col-xl-3">
										<div class="mb-4">
											<p class="d-flex align-items-center mb-1"><i class="ti ti-point-filled text-info me-1"></i>Overtime</p>
											<h3>${todayOvertimeHours}</h3>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8 mx-auto">
										<div class="progress bg-transparent-dark mb-3" style="height: 24px;">
											<div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: ${productiveProgress}%;"></div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: ${breakProgress}%;"></div>
											<div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: 0%;"></div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: 0%;"></div>
											<div class="progress-bar bg-success rounded me-2" role="progressbar" style="width: 0%;"></div>
											<div class="progress-bar bg-warning rounded me-2" role="progressbar" style="width: 0%;"></div>
											<div class="progress-bar bg-info rounded me-2" role="progressbar" style="width: 0%;"></div>
											<div class="progress-bar bg-info rounded" role="progressbar" style="width: 0%;"></div>
										</div>
										
									</div>
									<div class="co-md-12">
										<div class="d-flex align-items-center justify-content-between">
											<span class="fs-10">06:00</span>
											<span class="fs-10">07:00</span>
											<span class="fs-10">08:00</span>
											<span class="fs-10">09:00</span>
											<span class="fs-10">10:00</span>
											<span class="fs-10">11:00</span>
											<span class="fs-10">12:00</span>
											<span class="fs-10">01:00</span>
											<span class="fs-10">02:00</span>
											<span class="fs-10">03:00</span>
											<span class="fs-10">04:00</span>
											<span class="fs-10">05:00</span>
											<span class="fs-10">06:00</span>
											<span class="fs-10">07:00</span>
											<span class="fs-10">08:00</span>
											<span class="fs-10">09:00</span>
											<span class="fs-10">10:00</span>
											<span class="fs-10">11:00</span>
										</div>
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
	<script src="assets/js/circle-progress.js"></script>
	<script src="assets/js/theme-colorpicker.js"></script>
	<script src="assets/js/script.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('attendanceFilterForm');
    const dateRange = document.getElementById('attendanceDateRange');
    const fromDate = document.getElementById('attendanceFromDate');
    const toDate = document.getElementById('attendanceToDate');
    const status = document.getElementById('attendanceStatus');
    const sort = document.getElementById('attendanceSort');

    if (!form) return;

    if (window.jQuery && jQuery.fn.daterangepicker) {
        jQuery('#attendanceDateRange').daterangepicker({
            autoUpdateInput: false,
            locale: { format: 'DD/MM/YYYY', cancelLabel: 'Clear' }
        }, function (start, end) {
            fromDate.value = start.format('YYYY-MM-DD');
            toDate.value = end.format('YYYY-MM-DD');
            dateRange.value = start.format('DD/MM/YYYY') + ' - ' + end.format('DD/MM/YYYY');
            form.submit();
        });

        jQuery('#attendanceDateRange').on('cancel.daterangepicker', function () {
            fromDate.value = '';
            toDate.value = '';
            dateRange.value = '';
            form.submit();
        });
    }

    document.querySelectorAll('.attendance-status-filter').forEach(function (item) {
        item.addEventListener('click', function () {
            status.value = item.dataset.status || '';
            form.submit();
        });
    });

    document.querySelectorAll('.attendance-sort-filter').forEach(function (item) {
        item.addEventListener('click', function () {
            sort.value = item.dataset.sort || 'newest';
            form.submit();
        });
    });
});
</script>

</body>

</html>
