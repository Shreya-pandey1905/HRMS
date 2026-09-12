<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

<meta charset="utf-8">

<meta name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=0">

<title>Designations | HRMS</title>

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



<!-- ========================================================= -->
<!-- Page Content -->
<!-- ========================================================= -->

<div class="page-wrapper">

    <div class="content">

        <!-- Page Header -->

        <div class="d-md-flex d-block align-items-center justify-content-between mb-3">

            <div>

                <h2 class="mb-1">
                    Designations
                </h2>

                <p class="designation-count mb-0">
                    Manage employee designations
                </p>

            </div>

            <div class="mt-3 mt-md-0">

                <button type="button"
                        class="btn btn-primary"
                        data-bs-toggle="modal"
                        data-bs-target="#add_designation">

                    <i class="ti ti-plus me-1"></i>

                    Add Designation

                </button>

            </div>

        </div>


        <!-- Success Message -->

        <c:if test="${not empty success}">

            <div class="alert alert-success alert-dismissible fade show"
                 role="alert">

                <c:out value="${success}"/>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert"
                        aria-label="Close">
                </button>

            </div>

        </c:if>


        <!-- Error Message -->

        <c:if test="${not empty error}">

            <div class="alert alert-danger alert-dismissible fade show"
                 role="alert">

                <c:out value="${error}"/>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="alert"
                        aria-label="Close">
                </button>

            </div>

        </c:if>


        <!-- Designation Table -->

        <div class="card">

            <div class="card-header">

                <div class="d-flex align-items-center justify-content-between">

                    <h5 class="card-title mb-0">
                        Designation List
                    </h5>

                    <span class="designation-count">

                        Total:

                        <c:choose>

                            <c:when test="${not empty designations}">
                                ${designations.size()}
                            </c:when>

                            <c:otherwise>
                                0
                            </c:otherwise>

                        </c:choose>

                    </span>

                </div>

            </div>


            <div class="card-body p-0">

                <div class="table-responsive">

                    <table class="table table-hover mb-0">

                        <thead>

                        <tr>

                            <th>#</th>

                            <th>Designation Name</th>

                            <th>Department</th>

                            <th>No. of Employees</th>

                            <th>Status</th>

                            <th>Created By</th>

                            <th>Created At</th>

                            <th class="text-end">
                                Action
                            </th>

                        </tr>

                        </thead>


                        <tbody>

                        <c:choose>

                            <c:when test="${not empty designations}">

                                <c:forEach var="designation"
                                           items="${designations}"
                                           varStatus="status">

                                    <tr>

                                        <!-- Serial Number -->

                                        <td>
                                            ${status.count}
                                        </td>


                                        <!-- Designation Name -->

                                        <td>

                                            <strong>

                                                <c:out value="${designation.name}"/>

                                            </strong>

                                        </td>


                                        <!-- Department -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty departments}">

                                                    <c:forEach var="department"
                                                               items="${departments}">

                                                        <c:if test="${department.departmentId == designation.departmentId}">

                                                            <c:out value="${department.name}"/>

                                                        </c:if>

                                                    </c:forEach>

                                                </c:when>

                                                <c:otherwise>

                                                    -

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- Employee Count -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${designation.noOfEmployee != null}">

                                                    ${designation.noOfEmployee}

                                                </c:when>

                                                <c:otherwise>

                                                    0

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- Status -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${designation.status == 'Active'}">

                                                    <span class="badge bg-success">
                                                        Active
                                                    </span>

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="badge bg-danger">
                                                        Inactive
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- Created By -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${not empty designation.createdBy}">

                                                    <c:out value="${designation.createdBy}"/>

                                                </c:when>

                                                <c:otherwise>

                                                    -

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- Created At -->

                                        <td>

                                            <c:choose>

                                                <c:when test="${designation.createdAt != null}">

                                                    ${designation.createdAt}

                                                </c:when>

                                                <c:otherwise>

                                                    -

                                                </c:otherwise>

                                            </c:choose>

                                        </td>


                                        <!-- Actions -->

                                        <td class="text-end">

                                            <!-- Edit -->

                                            <button type="button"
                                                    class="btn btn-sm btn-light me-1 edit-designation"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#edit_designation"
                                                    data-id="${designation.designationId}"
                                                    data-department-id="${designation.departmentId}"
                                                    data-name="${designation.name}"
                                                    data-employee-count="${designation.noOfEmployee}"
                                                    data-status="${designation.status}"
                                                    title="Edit Designation">

                                                <i class="ti ti-edit"></i>

                                            </button>


                                            <!-- Delete -->

                                            <button type="button"
                                                    class="btn btn-sm btn-light delete-designation"
                                                    data-bs-toggle="modal"
                                                    data-bs-target="#delete_designation"
                                                    data-id="${designation.designationId}"
                                                    data-name="${designation.name}"
                                                    title="Delete Designation">

                                                <i class="ti ti-trash"></i>

                                            </button>

                                        </td>

                                    </tr>

                                </c:forEach>

                            </c:when>


                            <c:otherwise>

                                <tr>

                                    <td colspan="8"
                                        class="text-center py-5">

                                        <div>

                                            <i class="ti ti-user-cog fs-1 text-muted"></i>

                                            <h5 class="mt-3">
                                                No designations available
                                            </h5>

                                            <p class="text-muted mb-0">
                                                Add a designation to get started.
                                            </p>

                                        </div>

                                    </td>

                                </tr>

                            </c:otherwise>

                        </c:choose>

                        </tbody>

                    </table>

                </div>

            </div>

        </div>

    </div>


    <!-- ========================================================= -->
    <!-- Footer -->
    <!-- ========================================================= -->

    <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

        <p class="mb-0">
            © 2026 HRMS
        </p>

        <p class="mb-0">
            Human Resource Management System
        </p>

    </div>

</div>

</div>


<!-- ========================================================= -->
<!-- Add Designation Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="add_designation"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Add Designation
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/designations"
                  method="post">

                <div class="modal-body">

                    <!-- Department -->

                    <div class="mb-3">

                        <label class="form-label">

                            Department

                            <span class="text-danger">*</span>

                        </label>

                        <select name="departmentId"
                                class="form-select"
                                required>

                            <option value="">
                                Select Department
                            </option>

                            <c:forEach var="department"
                                       items="${departments}">

                                <option value="${department.departmentId}">

                                    <c:out value="${department.name}"/>

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- Designation Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Designation Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="name"
                               class="form-control"
                               placeholder="Enter designation name"
                               required>

                    </div>




                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">

                            Status

                            <span class="text-danger">*</span>

                        </label>

                        <select name="status"
                                class="form-select"
                                required>

                            <option value="">
                                Select Status
                            </option>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-plus me-1"></i>

                        Add Designation

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Edit Designation Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="edit_designation"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Edit Designation
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/designations"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="designationId"
                       id="editDesignationId">


                <div class="modal-body">

                    <!-- Department -->

                    <div class="mb-3">

                        <label class="form-label">

                            Department

                            <span class="text-danger">*</span>

                        </label>

                        <select name="departmentId"
                                id="editDesignationDepartment"
                                class="form-select"
                                required>

                            <option value="">
                                Select Department
                            </option>

                            <c:forEach var="department"
                                       items="${departments}">

                                <option value="${department.departmentId}">

                                    <c:out value="${department.name}"/>

                                </option>

                            </c:forEach>

                        </select>

                    </div>


                    <!-- Designation Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Designation Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="name"
                               id="editDesignationName"
                               class="form-control"
                               placeholder="Enter designation name"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">

                            Status

                            <span class="text-danger">*</span>

                        </label>

                        <select name="status"
                                id="editDesignationStatus"
                                class="form-select"
                                required>

                            <option value="Active">
                                Active
                            </option>

                            <option value="Inactive">
                                Inactive
                            </option>

                        </select>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-primary">

                        <i class="ti ti-device-floppy me-1"></i>

                        Save Changes

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Delete Designation Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="delete_designation"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Delete Designation
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/designations"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="delete">

                <input type="hidden"
                       name="designationId"
                       id="deleteDesignationId">


                <div class="modal-body">

                    <div class="text-center">

                        <i class="ti ti-trash fs-1 text-danger"></i>

                        <h5 class="mt-3">
                            Are you sure?
                        </h5>

                        <p class="text-muted mb-0">

                            Do you want to delete

                            <strong id="deleteDesignationName"></strong>?

                        </p>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <button type="submit"
                            class="btn btn-danger">

                        <i class="ti ti-trash me-1"></i>

                        Delete

                    </button>

                </div>

            </form>

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


<!-- ========================================================= -->
<!-- Designation JavaScript -->
<!-- ========================================================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        /* =========================================
           Edit Designation
        ========================================= */

        const editButtons =
            document.querySelectorAll(".edit-designation");

        editButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const designationId =
                    button.getAttribute("data-id");

                const departmentId =
                    button.getAttribute("data-department-id");

                const designationName =
                    button.getAttribute("data-name");

                const employeeCount =
                    button.getAttribute("data-employee-count");

                const designationStatus =
                    button.getAttribute("data-status");


                document.getElementById("editDesignationId").value =
                    designationId;


                document.getElementById("editDesignationDepartment").value =
                    departmentId;


                document.getElementById("editDesignationName").value =
                    designationName;


                document.getElementById("editDesignationEmployeeCount").value =
                    employeeCount || 0;


                document.getElementById("editDesignationStatus").value =
                    designationStatus;

            });

        });


        /* =========================================
           Delete Designation
        ========================================= */

        const deleteButtons =
            document.querySelectorAll(".delete-designation");

        deleteButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const designationId =
                    button.getAttribute("data-id");

                const designationName =
                    button.getAttribute("data-name");


                document.getElementById("deleteDesignationId").value =
                    designationId;


                document.getElementById("deleteDesignationName").textContent =
                    designationName;

            });

        });

    });

</script>

</body>

</html>