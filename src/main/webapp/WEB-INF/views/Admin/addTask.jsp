<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <meta name="description" content="HRMS Admin Dashboard">
    <meta name="keywords" content="HRMS, Human Resource Management System, Admin Dashboard">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">

    <title>Add New Task - HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


          <style>
              .sidebar {
                  height: 100vh !important;
                  overflow-y: auto !important;
                  overflow-x: hidden !important;
              }

              .sidebar-menu {
                  height: auto !important;
                  overflow: visible !important;
              }

              .sidebar::-webkit-scrollbar {
                  width: 5px;
              }

              .sidebar::-webkit-scrollbar-thumb {
                  background: #ccc;
                  border-radius: 10px;
              }
          </style>
</head>

<body>

<c:set var="totalEmployees" value="0"/>
<c:set var="presentToday" value="0"/>
<c:set var="onLeave" value="0"/>
<c:set var="pendingLeaves" value="0"/>

<div id="global-loader">
    <div class="page-loader"></div>
</div>

<div class="main-wrapper">

  
    <%@ include file="adminHeader.jsp" %>
       <%@ include file="adminSidebar.jsp" %>
  

    <!-- PAGE WRAPPER -->
    <div class="page-wrapper">

        <div class="content">

            <!-- PAGE BREADCRUMB -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">Add New Task</h2>

                    <nav>
                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails">
                                    Tasks
                                </a>
                            </li>

                            <li class="breadcrumb-item active" aria-current="page">
                                Add New Task
                            </li>

                        </ol>
                    </nav>

                </div>

            </div>

            <!-- SUCCESS MESSAGE -->
            <c:if test="${not empty successMessage}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    ${successMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                </div>
            </c:if>

            <!-- ERROR MESSAGE -->
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    ${errorMessage}
                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                            aria-label="Close"></button>
                </div>
            </c:if>

            <!-- ADD TASK FORM -->
            <div class="card">

                <div class="card-header">
                    <h5 class="mb-0">Add New Task</h5>
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/AdminDashboardServlet"
                          method="post"
                          enctype="multipart/form-data">

                        <input type="hidden" name="action" value="addTask">

                        <!-- TITLE -->
                        <div class="mb-3">
                            <label class="form-label">
                                Title <span class="text-danger">*</span>
                            </label>

                            <input type="text"
                                   class="form-control"
                                   name="title"
                                   id="title"
                                   value="${title}"
                                   required>
                        </div>

                        <div class="row">

                            <!-- DUE DATE -->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">
                                        Due Date <span class="text-danger">*</span>
                                    </label>

                                    <input type="date"
                                           class="form-control"
                                           name="deadline"
                                           id="deadline"
                                           value="${deadline}"
                                           required>
                                </div>
                            </div>

                            <!-- PROJECT -->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">
                                        Select Project <span class="text-danger">*</span>
                                    </label>

                                    <select class="form-select"
                                            name="projectId"
                                            id="projectId"
                                            required>

                                        <option value="">Select a Project</option>

                                        <c:forEach var="project" items="${activeProjects}">
                                            <option value="${project.projectId}"
                                                ${project.projectId == projectId ? 'selected' : ''}>
                                                ${project.projectName}
                                            </option>
                                        </c:forEach>

                                    </select>
                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <!-- TEAM MEMBERS -->
                            <div class="col-md-6">
                                <div class="mb-3">

                                    <label class="form-label">
                                        Team Members <span class="text-danger">*</span>
                                    </label>

                                    <select class="form-select"
                                            name="teamMembers"
                                            id="teamMembers"
                                            required
                                            disabled>

                                        <option value="">Select Project First</option>

                                    </select>

                                    <small class="text-muted">
                                        Team members will be loaded according to the selected project.
                                    </small>

                                </div>
                            </div>

                            <!-- STATUS -->
                            <div class="col-md-6">
                                <div class="mb-3">

                                    <label class="form-label">
                                        Status <span class="text-danger">*</span>
                                    </label>

                                    <select class="form-select"
                                            name="status"
                                            id="status"
                                            required>

                                        <option value="">Select</option>
                                        <option value="Inprogress"
                                            ${status == 'Inprogress' ? 'selected' : ''}>
                                            Inprogress
                                        </option>
                                        <option value="Pending"
                                            ${status == 'Pending' ? 'selected' : ''}>
                                            Pending
                                        </option>
                                        <option value="Completed"
                                            ${status == 'Completed' ? 'selected' : ''}>
                                            Completed
                                        </option>
                                        <option value="Ongoing"
                                            ${status == 'Ongoing' ? 'selected' : ''}>
                                            Ongoing
                                        </option>

                                    </select>

                                </div>
                            </div>

                        </div>

                        <div class="row">

                            <!-- PRIORITY -->
                            <div class="col-md-6">
                                <div class="mb-3">

                                    <label class="form-label">
                                        Priority <span class="text-danger">*</span>
                                    </label>

                                    <select class="form-select"
                                            name="priority"
                                            id="priority"
                                            required>

                                        <option value="">Select</option>
                                        <option value="High"
                                            ${priority == 'High' ? 'selected' : ''}>
                                            High
                                        </option>
                                        <option value="Medium"
                                            ${priority == 'Medium' ? 'selected' : ''}>
                                            Medium
                                        </option>
                                        <option value="Low"
                                            ${priority == 'Low' ? 'selected' : ''}>
                                            Low
                                        </option>

                                    </select>

                                </div>
                            </div>

                        </div>

                        <!-- DESCRIPTION -->
                        <div class="mb-3">

                            <label class="form-label">
                                Description <span class="text-danger">*</span>
                            </label>

                            <textarea class="form-control"
                                      name="description"
                                      id="description"
                                      rows="4"
                                      maxlength="1000"
                                      required>${description}</textarea>

                        </div>

                        <!-- ATTACHMENT -->
                        <div class="mb-4">

                            <label class="form-label">
                                Upload Attachment
                            </label>

                            <input type="file"
                                   class="form-control"
                                   name="attachment"
                                   id="attachment">

                        </div>

                        <!-- BUTTONS -->
                        <div class="d-flex justify-content-end gap-2">

                            <a href="${pageContext.request.contextPath}/AdminDashboardServlet?action=taskDetails"
                               class="btn btn-light border">
                                Cancel
                            </a>

                            <button type="submit"
                                    class="btn btn-primary">
                                <i class="ti ti-circle-plus me-2"></i>
                                Add New Task
                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

        <!-- FOOTER -->
        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                HRMS
            </p>

            <p class="mb-0">
                Human Resource Management System
            </p>

        </div>

    </div>

</div>

<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>
    document.getElementById("projectId").addEventListener("change", function () {

        const projectId = this.value;
        const teamMembers = document.getElementById("teamMembers");

        // No project selected
        if (!projectId) {
            teamMembers.innerHTML =
                '<option value="">Select Project First</option>';

            teamMembers.disabled = true;
            return;
        }

        // Show loading
        teamMembers.innerHTML =
            '<option value="">Loading members...</option>';

        teamMembers.disabled = true;

        fetch("${pageContext.request.contextPath}/AdminDashboardServlet?action=projectEmployees&projectId=" + projectId)
            .then(response => {
                if (!response.ok) {
                    throw new Error("Failed to load team members");
                }

                return response.text();
            })
            .then(data => {

                teamMembers.innerHTML =
                    '<option value="">Select Team Member</option>' + data;

                teamMembers.disabled = false;
            })
            .catch(error => {

                console.error(error);

                teamMembers.innerHTML =
                    '<option value="">Unable to load team members</option>';

                teamMembers.disabled = true;
            });
    });

    // Prevent selecting a previous date
    const deadline = document.getElementById("deadline");

    const today = new Date();
    const year = today.getFullYear();
    const month = String(today.getMonth() + 1).padStart(2, "0");
    const day = String(today.getDate()).padStart(2, "0");

    deadline.min = `${year}-${month}-${day}`;
</script>
</body>

</html>


