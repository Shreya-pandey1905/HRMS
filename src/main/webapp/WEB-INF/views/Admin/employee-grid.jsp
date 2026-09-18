<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="models.Employees.User" %>
<%!
    String toProfileUrl(String contextPath, String profilePicture) {
        if (profilePicture == null) {
            return null;
        }
        String path = profilePicture.trim().replace('\\', '/');
        if (path.isEmpty()) {
            return null;
        }
        if (path.startsWith("http://") || path.startsWith("https://")) {
            return path;
        }
        while (path.startsWith("/")) {
            path = path.substring(1);
        }
        if (!path.contains("/")) {
            path = "Content/uploads/" + path;
        }
        StringBuilder url = new StringBuilder(contextPath);
        for (String part : path.split("/")) {
            if (part.isEmpty()) {
                continue;
            }
            url.append('/').append(URLEncoder.encode(part, StandardCharsets.UTF_8).replace("+", "%20"));
        }
        return url.toString();
    }
%>
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

	      <!-- ================= SIDEBAR ================= -->

	<!-- Main Wrapper -->
	<div class="main-wrapper">

		  <%@ include file="adminHeader.jsp" %>
            <%@ include file="adminSidebar.jsp" %>

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

                <!-- Search Filter -->
                <div class="me-3">
                    <div class="input-icon-end position-relative">
                        <input type="text"
                               id="employeeGridSearch"
                               class="form-control"
                               placeholder="Search employee..."
                               style="width: 240px;">
                        <span class="input-icon-addon">
                            <i class="ti ti-search"></i>
                        </span>
                    </div>
                </div>

                <!-- Designation Filter -->
                <div class="dropdown me-3">
                    <a href="javascript:void(0);"
                       id="selectedDesignationGrid"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">
                        Designation: All
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end p-3" id="designationDropdownGrid" style="max-height: 280px; overflow-y: auto;">
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1 active" data-designation="all">All</a>
                        </li>
                    </ul>
                </div>

                <!-- Status Filter -->
                <div class="dropdown me-3">
                    <a href="javascript:void(0);"
                       id="selectedStatusGrid"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">
                        Status: All
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end p-3" id="statusDropdownGrid">
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1 active" data-status="all">All</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1" data-status="Active">Active</a>
                        </li>
                        <li>
                            <a href="javascript:void(0);" class="dropdown-item rounded-1" data-status="Inactive">Inactive</a>
                        </li>
                    </ul>
                </div>

                <!-- Sort -->
                <div class="dropdown">
                    <a href="javascript:void(0);"
                       id="selectedSortGrid"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">
                        Sort By: Ascending
                    </a>

                    <ul class="dropdown-menu dropdown-menu-end p-3" id="sortDropdownGrid">
                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item rounded-1 active"
                               data-sort="asc">
                                Ascending (A-Z)
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item rounded-1"
                               data-sort="desc">
                                Descending (Z-A)
                            </a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</div>


<!-- Employees Grid -->
<div class="row" id="employeeGridRow">

    <c:forEach var="employee" items="${employees}">

        <div class="col-xl-3 col-lg-4 col-md-6 employee-grid-card"
             data-name="${employee.firstName} ${employee.lastName}"
             data-designation="${employee.designationName}"
             data-status="${employee.status}"
             data-id="${employee.userId}">

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
                                <%
                                    User gridEmp = (User) pageContext.getAttribute("employee");
                                    String gridImg = toProfileUrl(
                                            request.getContextPath(),
                                            gridEmp != null ? gridEmp.getProfilePicture() : null
                                    );
                                    pageContext.setAttribute("gridProfileImg", gridImg);
                                %>
                                <c:choose>

                                    <c:when test="${not empty gridProfileImg}">
                                        <img src="${gridProfileImg}"
                                             class="img-fluid rounded-circle"
                                             alt="Profile"
                                             style="width:100%;height:100%;object-fit:cover;"
                                             onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">
                                    </c:when>

                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-32.jpg"
                                             class="img-fluid rounded-circle"
                                             alt="Profile"
                                             style="width:100%;height:100%;object-fit:cover;">
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

<script>
    document.addEventListener("DOMContentLoaded", function () {
        const gridSearch = document.getElementById("employeeGridSearch");
        const globalSearch = document.getElementById("globalHeaderSearch");
        const gridRow = document.getElementById("employeeGridRow");
        const designationDropdown = document.getElementById("designationDropdownGrid");
        const selectedDesignationLabel = document.getElementById("selectedDesignationGrid");
        const selectedStatusLabel = document.getElementById("selectedStatusGrid");
        const selectedSortLabel = document.getElementById("selectedSortGrid");

        let currentSearchQuery = "";
        let currentDesignation = "all";
        let currentStatus = "all";
        let currentSort = "asc";

        // 1. Dynamically populate Designation dropdown with unique values
        if (gridRow && designationDropdown) {
            const cards = gridRow.querySelectorAll(".employee-grid-card");
            const designationsSet = new Set();
            cards.forEach(function (card) {
                const desig = (card.getAttribute("data-designation") || "").trim();
                if (desig) {
                    designationsSet.add(desig);
                }
            });

            const sortedDesignations = Array.from(designationsSet).sort();
            sortedDesignations.forEach(function (desig) {
                const li = document.createElement("li");
                li.innerHTML = '<a href="javascript:void(0);" class="dropdown-item rounded-1 designation-filter-opt" data-designation="' + desig + '">' + desig + '</a>';
                designationDropdown.appendChild(li);
            });
        }

        // 2. Main Filter & Sort Engine
        function applyFiltersAndSort() {
            if (!gridRow) return;
            const cards = Array.from(gridRow.querySelectorAll(".employee-grid-card"));
            let visibleCount = 0;
            const q = (currentSearchQuery || "").trim().toLowerCase();

            cards.forEach(function (card) {
                const text = card.textContent.toLowerCase();
                const cardDesig = (card.getAttribute("data-designation") || "").trim().toLowerCase();
                const cardStatus = (card.getAttribute("data-status") || "").trim().toLowerCase();

                const matchesSearch = !q || text.includes(q);
                const matchesDesig = currentDesignation === "all" || cardDesig === currentDesignation.toLowerCase();
                const matchesStatus = currentStatus === "all" || cardStatus === currentStatus.toLowerCase();

                if (matchesSearch && matchesDesig && matchesStatus) {
                    card.style.display = "";
                    visibleCount++;
                } else {
                    card.style.display = "none";
                }
            });

            // Sorting cards
            cards.sort(function (a, b) {
                const nameA = (a.getAttribute("data-name") || "").trim().toLowerCase();
                const nameB = (b.getAttribute("data-name") || "").trim().toLowerCase();
                if (currentSort === "asc") {
                    return nameA.localeCompare(nameB);
                } else {
                    return nameB.localeCompare(nameA);
                }
            });

            // Re-append cards in sorted order
            cards.forEach(function (card) {
                gridRow.appendChild(card);
            });

            // No match feedback
            let noMatchDiv = document.getElementById("employeeGridNoMatch");
            if (visibleCount === 0 && cards.length > 0) {
                if (!noMatchDiv) {
                    noMatchDiv = document.createElement("div");
                    noMatchDiv.id = "employeeGridNoMatch";
                    noMatchDiv.className = "col-12 text-center py-5";
                    noMatchDiv.innerHTML = '<div class="card p-4"><i class="ti ti-users fs-1 text-muted d-block mb-2"></i><h5 class="mb-1">No employees found</h5><p class="text-muted mb-0">No employees match your selected filter criteria.</p></div>';
                }
                noMatchDiv.style.display = "";
                gridRow.appendChild(noMatchDiv);
            } else if (noMatchDiv) {
                noMatchDiv.style.display = "none";
            }
        }

        // 3. Designation Selection Handler
        if (designationDropdown) {
            designationDropdown.addEventListener("click", function (e) {
                const opt = e.target.closest("[data-designation]");
                if (!opt) return;
                e.preventDefault();
                currentDesignation = opt.getAttribute("data-designation");

                designationDropdown.querySelectorAll(".dropdown-item").forEach(function (el) {
                    el.classList.remove("active");
                });
                opt.classList.add("active");

                if (selectedDesignationLabel) {
                    selectedDesignationLabel.innerHTML = 'Designation: ' + (currentDesignation === "all" ? "All" : currentDesignation);
                }
                applyFiltersAndSort();
            });
        }

        // 4. Status Selection Handler
        const statusDropdown = document.getElementById("statusDropdownGrid");
        if (statusDropdown) {
            statusDropdown.addEventListener("click", function (e) {
                const opt = e.target.closest("[data-status]");
                if (!opt) return;
                e.preventDefault();
                currentStatus = opt.getAttribute("data-status");

                statusDropdown.querySelectorAll(".dropdown-item").forEach(function (el) {
                    el.classList.remove("active");
                });
                opt.classList.add("active");

                if (selectedStatusLabel) {
                    selectedStatusLabel.innerHTML = 'Status: ' + (currentStatus === "all" ? "All" : currentStatus);
                }
                applyFiltersAndSort();
            });
        }

        // 5. Sort Selection Handler
        const sortDropdown = document.getElementById("sortDropdownGrid");
        if (sortDropdown) {
            sortDropdown.addEventListener("click", function (e) {
                const opt = e.target.closest("[data-sort]");
                if (!opt) return;
                e.preventDefault();
                currentSort = opt.getAttribute("data-sort");

                sortDropdown.querySelectorAll(".dropdown-item").forEach(function (el) {
                    el.classList.remove("active");
                });
                opt.classList.add("active");

                if (selectedSortLabel) {
                    selectedSortLabel.innerHTML = 'Sort By: ' + (currentSort === "asc" ? "Ascending" : "Descending");
                }
                applyFiltersAndSort();
            });
        }

        // 6. Search Handlers
        if (gridSearch) {
            gridSearch.addEventListener("input", function () {
                currentSearchQuery = this.value;
                applyFiltersAndSort();
                if (globalSearch && globalSearch.value !== this.value) {
                    globalSearch.value = this.value;
                }
            });
        }

        if (globalSearch) {
            globalSearch.addEventListener("input", function () {
                if (gridSearch) {
                    gridSearch.value = this.value;
                }
                currentSearchQuery = this.value;
                applyFiltersAndSort();
            });
        }

        // Initial sort/filter
        applyFiltersAndSort();
    });
</script>

</body>

</html>