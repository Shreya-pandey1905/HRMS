<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Roles | HRMS</title>

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


        <!-- ================= SIDEBAR and Header ================= -->


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
                        Roles
                    </h2>

                    <p class="role-count mb-0">
                        Manage employee roles
                    </p>

                </div>

                <div class="mt-3 mt-md-0">

                    <button type="button"
                            class="btn btn-primary"
                            data-bs-toggle="modal"
                            data-bs-target="#add_role">

                        <i class="ti ti-plus me-1"></i>

                        Add Role

                    </button>

                </div>

            </div>



           <!-- Success Message -->

           <c:if test="${not empty sessionScope.success}">

               <div class="alert alert-success alert-dismissible fade show"
                    role="alert">

                   <c:out value="${sessionScope.success}"/>

                   <button type="button"
                           class="btn-close"
                           data-bs-dismiss="alert"
                           aria-label="Close">
                   </button>

               </div>

               <% session.removeAttribute("success"); %>

           </c:if>


           <!-- Error Message -->

           <c:if test="${not empty sessionScope.error}">

               <div class="alert alert-danger alert-dismissible fade show"
                    role="alert">

                   <c:out value="${sessionScope.error}"/>

                   <button type="button"
                           class="btn-close"
                           data-bs-dismiss="alert"
                           aria-label="Close">
                   </button>

               </div>

               <% session.removeAttribute("error"); %>

           </c:if>



            <!-- ========================================================= -->
            <!-- Role Table -->
            <!-- ========================================================= -->

            <div class="card">

                <div class="card-header">

                    <div class="d-flex align-items-center justify-content-between flex-wrap gap-2">

                        <h5 class="card-title mb-0">
                            Role List
                        </h5>

                        <div class="d-flex align-items-center flex-wrap gap-3">

                            <div class="input-icon-end position-relative">
                                <input type="text"
                                       id="roleSearch"
                                       class="form-control"
                                       placeholder="Search role..."
                                       style="width: 240px;">
                                <span class="input-icon-addon">
                                    <i class="ti ti-search"></i>
                                </span>
                            </div>

                            <span class="role-count">

                                Total:
                                <span id="roleTotalCount">
                                <c:choose>

                                    <c:when test="${not empty roles}">
                                        ${roles.size()}
                                    </c:when>

                                    <c:otherwise>
                                        0
                                    </c:otherwise>

                                </c:choose>
                                </span>

                            </span>

                        </div>

                    </div>

                </div>


                <div class="card-body p-0">

                    <div class="table-responsive">

                        <table class="table table-hover mb-0" id="rolesTable">

                            <thead>

                            <tr>

                                <th>#</th>

                                <th>Role Name</th>

                                <th>Status</th>

                                <th>Created By</th>

                                <th>Created At</th>

                                <th>Modified By</th>

                                <th>Modified At</th>

                                <th class="text-end">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody id="rolesTableBody">

                            <c:choose>

                                <c:when test="${not empty roles}">

                                    <c:forEach var="role"
                                               items="${roles}"
                                               varStatus="status">

                                        <tr>

                                            <!-- Serial Number -->

                                            <td>
                                                ${status.count}
                                            </td>


                                            <!-- Role Name -->

                                            <td>

                                                <strong>

                                                    <c:out value="${role.roleName}"/>

                                                </strong>

                                            </td>


                                            <!-- Status -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.status == 'Active'}">

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

                                                    <c:when test="${not empty role.createdBy}">

                                                        <c:out value="${role.createdBy}"/>

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Created At -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.createdAt != null}">

                                                        ${role.createdAt}

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Modified By -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${not empty role.modifiedBy}">

                                                        <c:out value="${role.modifiedBy}"/>

                                                    </c:when>

                                                    <c:otherwise>
                                                        -
                                                    </c:otherwise>

                                                </c:choose>

                                            </td>


                                            <!-- Modified At -->

                                            <td>

                                                <c:choose>

                                                    <c:when test="${role.modifiedAt != null}">

                                                        ${role.modifiedAt}

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
                                                        class="btn btn-sm btn-light me-1 edit-role"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#edit_role"
                                                        data-id="${role.roleId}"
                                                        data-name="${role.roleName}"
                                                        data-status="${role.status}"
                                                        title="Edit Role">

                                                    <i class="ti ti-edit"></i>

                                                </button>


                                                <!-- Delete -->

                                                <button type="button"
                                                        class="btn btn-sm btn-light delete-role"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#delete_role"
                                                        data-id="${role.roleId}"
                                                        data-name="${role.roleName}"
                                                        title="Delete Role">

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

                                                <i class="ti ti-user-shield fs-1 text-muted"></i>

                                                <h5 class="mt-3">
                                                    No roles available
                                                </h5>

                                                <p class="text-muted mb-0">
                                                    Add a role to get started.
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
<!-- Add Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="add_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Add Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <div class="modal-body">

                    <!-- Role Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Role Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="roleName"
                               class="form-control"
                               placeholder="Enter role name"
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

                        Add Role

                    </button>

                </div>

            </form>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- Edit Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="edit_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Edit Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="update">

                <input type="hidden"
                       name="roleId"
                       id="editRoleId">


                <div class="modal-body">

                    <!-- Role Name -->

                    <div class="mb-3">

                        <label class="form-label">

                            Role Name

                            <span class="text-danger">*</span>

                        </label>

                        <input type="text"
                               name="roleName"
                               id="editRoleName"
                               class="form-control"
                               placeholder="Enter role name"
                               required>

                    </div>


                    <!-- Status -->

                    <div class="mb-3">

                        <label class="form-label">

                            Status

                            <span class="text-danger">*</span>

                        </label>

                        <select name="status"
                                id="editRoleStatus"
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
<!-- Delete Role Modal -->
<!-- ========================================================= -->

<div class="modal fade"
     id="delete_role"
     tabindex="-1"
     aria-hidden="true">

    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content">

            <div class="modal-header">

                <h5 class="modal-title">
                    Delete Role
                </h5>

                <button type="button"
                        class="btn-close"
                        data-bs-dismiss="modal"
                        aria-label="Close">
                </button>

            </div>


            <form action="${pageContext.request.contextPath}/admin/roles"
                  method="post">

                <input type="hidden"
                       name="action"
                       value="delete">

                <input type="hidden"
                       name="roleId"
                       id="deleteRoleId">


                <div class="modal-body">

                    <div class="text-center">

                        <i class="ti ti-trash fs-1 text-danger"></i>

                        <h5 class="mt-3">
                            Are you sure?
                        </h5>

                        <p class="text-muted mb-0">

                            Do you want to delete

                            <strong id="deleteRoleName"></strong>?

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


<script>

    document.addEventListener("DOMContentLoaded", function () {

        /* =========================================================
           Edit Role
           ========================================================= */

        const editButtons =
            document.querySelectorAll(".edit-role");

        editButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const roleId =
                    button.getAttribute("data-id");

                const roleName =
                    button.getAttribute("data-name");

                const roleStatus =
                    button.getAttribute("data-status");

                document.getElementById("editRoleId").value =
                    roleId;

                document.getElementById("editRoleName").value =
                    roleName;

                document.getElementById("editRoleStatus").value =
                    roleStatus;

            });

        });


        /* =========================================================
           Delete Role
           ========================================================= */

        const deleteButtons =
            document.querySelectorAll(".delete-role");

        deleteButtons.forEach(function (button) {

            button.addEventListener("click", function () {

                const roleId =
                    button.getAttribute("data-id");

                const roleName =
                    button.getAttribute("data-name");

                document.getElementById("deleteRoleId").value =
                    roleId;

                document.getElementById("deleteRoleName").textContent =
                    roleName;

            });

        });

        // Role Search Filter
        const roleSearch = document.getElementById("roleSearch");
        const globalSearch = document.getElementById("globalHeaderSearch");
        const roleCountEl = document.getElementById("roleTotalCount");
        const roleTbody = document.getElementById("rolesTableBody");

        function filterRoles(query) {
            if (!roleTbody) return;
            const q = (query || "").trim().toLowerCase();
            const rows = roleTbody.querySelectorAll("tr:not(.no-search-match)");
            let visibleCount = 0;

            rows.forEach(function (row) {
                if (row.querySelector("td[colspan]")) {
                    return;
                }
                const text = row.textContent.toLowerCase();
                if (text.includes(q)) {
                    row.style.display = "";
                    visibleCount++;
                } else {
                    row.style.display = "none";
                }
            });

            let noMatchRow = document.getElementById("roleNoMatchRow");
            if (visibleCount === 0 && q.length > 0) {
                if (!noMatchRow) {
                    noMatchRow = document.createElement("tr");
                    noMatchRow.id = "roleNoMatchRow";
                    noMatchRow.className = "no-search-match";
                    noMatchRow.innerHTML = '<td colspan="8" class="text-center py-4"><i class="ti ti-search fs-1 text-muted d-block mb-2"></i><h6 class="mb-1">No roles found</h6><p class="text-muted mb-0">No roles match your search term.</p></td>';
                    roleTbody.appendChild(noMatchRow);
                } else {
                    noMatchRow.style.display = "";
                }
            } else if (noMatchRow) {
                noMatchRow.style.display = "none";
            }

            if (roleCountEl) {
                roleCountEl.textContent = visibleCount;
            }
        }

        if (roleSearch) {
            roleSearch.addEventListener("input", function () {
                filterRoles(this.value);
                if (globalSearch && globalSearch.value !== this.value) {
                    globalSearch.value = this.value;
                }
            });
        }

        if (globalSearch) {
            globalSearch.addEventListener("input", function () {
                if (roleSearch) {
                    roleSearch.value = this.value;
                }
                filterRoles(this.value);
            });
        }

    });

</script>

</body>

</html>