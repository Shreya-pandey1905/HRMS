````
```
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS Manager Panel">
    <meta name="keywords" content="HRMS, Human Resource Management System">
    <meta name="author" content="HRMS Team">
    <meta name="robots" content="noindex, nofollow">

    <title>HRMS - Add Project</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Theme -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- FontAwesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Main CSS -->
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

        .sidebar-menu .submenu > a .menu-arrow {
            margin-left: 15px !important;
        }
    </style>
</head>

<body>

<div class="main-wrapper">

   <!-- HEADER -->
   <div class="header">
       <div class="main-header">

           <div class="header-left">

               <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=dashboard"
                  class="logo">

                   <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                        alt="HRMS Logo">

               </a>

               <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=dashboard"
                  class="dark-logo">

                   <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                        alt="HRMS Logo">

               </a>

           </div>


           <!-- Mobile Menu -->
           <a id="mobile_btn"
              class="mobile_btn"
              href="#sidebar">

               <span class="bar-icon">
                   <span></span>
                   <span></span>
                   <span></span>
               </span>

           </a>


           <!-- Header User -->
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

           </div>


           <!-- Mobile User Menu -->
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

   <!-- Sidebar -->
       <jsp:include page="/WEB-INF/views/common/manager-sidebar.jsp" />



<!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div>
                    <h2 class="mb-1">Add Project</h2>

                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>

                            <li class="breadcrumb-item">Manager</li>
                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=projectDetails">
                                    Projects
                                </a>
                            </li>
                            <li class="breadcrumb-item active" aria-current="page">
                                Add Project
                            </li>
                        </ol>
                    </nav>
                </div>
            </div>

            <!-- Add Project Form -->
            <div class="card">
                <div class="card-header">
                    <h5 class="card-title mb-0">Add Project</h5>
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/ManagerDashboardServlet"
                          method="post"
                          enctype="multipart/form-data">

                       <input type="hidden"
                              name="action"
                              value="${editMode ? 'updateProject' : 'addProject'}">

                       <c:if test="${editMode}">
                           <input type="hidden"
                                  name="projectId"
                                  value="${project.projectId}">
                       </c:if>
<div class="col-md-12 mb-3">

    <label class="form-label">
        Project Name <span class="text-danger">*</span>
    </label>

    <input type="text"
           name="projectName"
           class="form-control"
           placeholder="Enter Project Name"
           value="${not empty project ? project.projectName : projectName}"
           required>

    <c:if test="${not empty projectNameError}">
        <small class="text-danger">
            ${projectNameError}
        </small>
    </c:if>

</div>

                            <!-- Client Name -->
                            <div class="col-md-12 mb-3">
                                <label class="form-label">
                                    Client Name <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       name="clientName"
                                       class="form-control"
                                       placeholder="Enter Client Name"
                                       value="${not empty project ? project.clientName : clientName}"
                                       required>
                            </div>

                            <!-- Description -->
                            <div class="col-md-12 mb-3">
                                <label class="form-label">
                                    Description <span class="text-danger">*</span>
                                </label>

                                <textarea name="description"
                                          class="form-control"
                                          rows="4"
                                          placeholder="Enter Project Description"
                                          required>${not empty project ? project.description : description}</textarea>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Start Date <span class="text-danger">*</span>
                                </label>

                                <input type="date"
                                       name="startDate"
                                       class="form-control"
                                       value="${not empty project ? project.startDate.toLocalDate() : startDate}"
                                       required>
                            </div>

                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    End Date <span class="text-danger">*</span>
                                </label>

                                <input type="date"
                                       name="endDate"
                                       class="form-control"
                                       value="${not empty project ? project.endDate.toLocalDate() : endDate}"
                                       required>
                                <c:if test="${not empty dateError}">
                                    <small class="text-danger">
                                        ${dateError}
                                    </small>
                                </c:if>
                            </div>

                            <!-- Priority -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Priority <span class="text-danger">*</span>
                                </label>

                                <select name="priority" class="form-select" required>

                                    <option value="">Select Priority</option>

                                    <option value="High"
                                        ${not empty project && project.priority == 'High' ? 'selected' : ''}>
                                        High
                                    </option>

                                    <option value="Medium"
                                        ${not empty project && project.priority == 'Medium' ? 'selected' : ''}>
                                        Medium
                                    </option>

                                    <option value="Low"
                                        ${not empty project && project.priority == 'Low' ? 'selected' : ''}>
                                        Low
                                    </option>

                                </select>
                            </div>

                            <!-- Project Value -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Project Value
                                </label>

                               <input type="number"
                                      name="projectValue"
                                      class="form-control"
                                      placeholder="Enter Project Value"
                                      value="${not empty project ? project.projectValue : projectValue}"
                                      step="0.01"
                                      required>
                            </div>

                            <!-- Price Type -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Price Type
                                </label>

                                <select name="priceType" class="form-select" required>

                                    <option value="">Select Price Type</option>

                                    <option value="INR"
                                        ${not empty project && project.priceType == 'INR' ? 'selected' : ''}>
                                        INR
                                    </option>

                                    <option value="USD"
                                        ${not empty project && project.priceType == 'USD' ? 'selected' : ''}>
                                        USD
                                    </option>

                                    <option value="INR"
                                        ${not empty project && project.priceType == 'INR' ? 'selected' : ''}>
                                        INR - Indian Rupee
                                    </option>

                                    <option value="USD"
                                        ${not empty project && project.priceType == 'USD' ? 'selected' : ''}>
                                        USD - US Dollar
                                    </option>

                                    <option value="EUR"
                                        ${not empty project && project.priceType == 'EUR' ? 'selected' : ''}>
                                        EUR - Euro
                                    </option>

                                    <option value="GBP"
                                        ${not empty project && project.priceType == 'GBP' ? 'selected' : ''}>
                                        GBP - British Pound
                                    </option>

                                    <option value="AED"
                                        ${not empty project && project.priceType == 'AED' ? 'selected' : ''}>
                                        AED - UAE Dirham
                                    </option>

                                    <option value="CAD"
                                        ${not empty project && project.priceType == 'CAD' ? 'selected' : ''}>
                                        CAD - Canadian Dollar
                                    </option>

                                    <option value="AUD"
                                        ${not empty project && project.priceType == 'AUD' ? 'selected' : ''}>
                                        AUD - Australian Dollar
                                    </option>

                                    <option value="SGD"
                                        ${not empty project && project.priceType == 'SGD' ? 'selected' : ''}>
                                        SGD - Singapore Dollar
                                    </option>

                                    <option value="JPY"
                                        ${not empty project && project.priceType == 'JPY' ? 'selected' : ''}>
                                        JPY - Japanese Yen
                                    </option>

                                    <option value="CNY"
                                        ${not empty project && project.priceType == 'CNY' ? 'selected' : ''}>
                                        CNY - Chinese Yuan
                                    </option>

                                    <option value="CHF"
                                        ${not empty project && project.priceType == 'CHF' ? 'selected' : ''}>
                                        CHF - Swiss Franc
                                    </option>

                                </select>
                            </div>

                            <!-- Status -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Status <span class="text-danger">*</span>
                                </label>

                                <select name="status" class="form-select" required>

                                    <option value="">Select Status</option>

                                    <option value="Active"
                                        ${not empty project && project.status == 'Active' ? 'selected' : ''}>
                                        Active
                                    </option>

                                    <option value="Pending"
                                        ${not empty project && project.status == 'Pending' ? 'selected' : ''}>
                                        Pending
                                    </option>

                                    <option value="Completed"
                                        ${not empty project && project.status == 'Completed' ? 'selected' : ''}>
                                        Completed
                                    </option>

                                </select>
                            </div>

                            <!-- Team Members -->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">
                                        Team Members
                                    </label>

                                    <select name="teamMembers"
                                            class="select2"
                                            multiple="multiple"
                                            style="width: 100%;">

                                        <c:forEach var="employee" items="${employees}">

                                            <option value="${employee.userId}"
                                                ${not empty project &&
                                                  project.teamMemberIds.contains(employee.userId)
                                                  ? 'selected' : ''}>

                                                ${employee.firstName} ${employee.lastName}

                                            </option>

                                        </c:forEach>

                                    </select>
                                </div>
                            </div>
                            <!-- Manager -->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label class="form-label">
                                        Project Manager <span class="text-danger">*</span>
                                    </label>

                                   <select name="managerName" class="form-select" required>

                                       <option value="">Select Manager</option>

                                       <c:forEach var="manager" items="${managers}">

                                           <c:set var="fullManagerName"
                                                  value="${manager.firstName} ${manager.lastName}" />

                                           <option value="${fullManagerName}"
                                               ${not empty project && project.managerName == fullManagerName
                                                       ? 'selected' : ''}>

                                               ${fullManagerName}

                                           </option>

                                       </c:forEach>

                                   </select>
                                </div>
                            </div>

                            <!-- Project Logo -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Upload Project Logo
                                </label>

                                <input type="file"
                                       name="projectLogo"
                                       class="form-control"
                                       accept="image/*">
                            </div>

                            <!-- Project File -->
                            <div class="col-md-6 mb-3">
                                <label class="form-label">
                                    Upload File
                                </label>

                                <input type="file"
                                       name="projectFile"
                                       class="form-control">
                            </div>

                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-end gap-2 mt-3">

                            <a href="${pageContext.request.contextPath}/ManagerDashboardServlet?action=projectDetails"
                               class="btn btn-light">
                                Cancel
                            </a>

                            <button type="submit"
                                    class="btn btn-primary">
                                Save
                            </button>

                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>
<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<!-- Bootstrap Core JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>
<script>
    $(document).ready(function () {

        $('.select2').select2({
            width: '100%',
            placeholder: 'Select Employees',
            allowClear: true
        });

    });
</script>
</body>
</html>
