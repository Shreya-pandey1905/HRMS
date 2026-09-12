<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Trainers.Trainer" %>

<%
    List<Trainer> trainers =
            (List<Trainer>) request.getAttribute("trainers");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Trainers - HRMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>

    <%@ include file="adminSidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">

            <!-- Page Header -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">Trainers</h2>

                    <nav>
                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    <i class="ti ti-smart-home"></i>
                                </a>
                            </li>

                            <li class="breadcrumb-item">
                                Training
                            </li>

                            <li class="breadcrumb-item active">
                                Trainers
                            </li>

                        </ol>
                    </nav>

                </div>

                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                    <div class="mb-2">
                        <a href="${pageContext.request.contextPath}/trainers/add"
                           class="btn btn-primary d-flex align-items-center">
                            <i class="ti ti-circle-plus me-2"></i>
                            Add Trainer
                        </a>
                    </div>

                </div>

            </div>
            <!-- /Page Header -->


            <!-- Trainers List -->
            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                <h5 class="mb-0">Trainers List</h5>

                <div class="dropdown">

                    <a href="javascript:void(0);"
                       class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                       data-bs-toggle="dropdown">

                        <i class="ti ti-sort-ascending-2 me-1"></i>
                        Sort By

                    </a>

                    <ul class="dropdown-menu dropdown-menu-end">

                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item trainer-sort"
                               data-direction="asc">
                                Ascending
                            </a>
                        </li>

                        <li>
                            <a href="javascript:void(0);"
                               class="dropdown-item trainer-sort"
                               data-direction="desc">
                                Descending
                            </a>
                        </li>

                    </ul>

                </div>

            </div>
                <div class="card-body p-0">

                    <div class="custom-datatable-filter table-responsive">

                        <table id="trainersTable"
                               class="table table-nowrap datatable">

                            <thead class="thead-light"><tr>

                            <th>Trainer ID</th>

                                <th>Name</th>
                                <th>Phone</th>

                                <th>Email</th>

                                <th>Description</th>

                                <th>Status</th>

                                <th class="text-end">Action</th>

                            </tr>

                            </thead>

                            <tbody>

                            <%
                                if (trainers != null && !trainers.isEmpty()) {

                                    for (Trainer trainer : trainers) {

                                        String fullName =
                                                (trainer.getFirstName() == null ? "" : trainer.getFirstName())
                                                        + " "
                                                        + (trainer.getLastName() == null ? "" : trainer.getLastName());

                                        String status =
                                                trainer.getStatus() == null
                                                        ? ""
                                                        : trainer.getStatus();
                            %>

                            <tr>

                                <td>
                                    <%= trainer.getTrainerId() %>
                                </td>



                                <!-- Name -->
                                <td>

                                    <div class="d-flex align-items-center">

                                        <div class="avatar avatar-md me-2">

                                            <span class="avatar-title rounded-circle bg-primary text-white">
                                                <%= trainer.getFirstName() != null
                                                        && !trainer.getFirstName().isEmpty()
                                                        ? trainer.getFirstName().substring(0,1).toUpperCase()
                                                        : "T" %>
                                            </span>

                                        </div>

                                        <div>

                                            <h6 class="mb-0">
                                                <%= fullName.trim() %>
                                            </h6>

                                            <small class="text-muted">
                                                <%= trainer.getRole() == null
                                                        ? ""
                                                        : trainer.getRole() %>
                                            </small>

                                        </div>

                                    </div>

                                </td>


                                <!-- Phone -->
                                <td>
                                    <%= trainer.getPhone() %>
                                </td>


                                <!-- Email -->
                                <td>
                                    <%= trainer.getEmail() == null
                                            ? ""
                                            : trainer.getEmail() %>
                                </td>


                                <!-- Description -->
                                <td>

                                    <span class="text-truncate d-inline-block"
                                          style="max-width:250px;">

                                        <%= trainer.getDescription() == null
                                                ? ""
                                                : trainer.getDescription() %>

                                    </span>

                                </td>


                                <!-- Status -->
                                <td>

                                    <% if ("Active".equalsIgnoreCase(status)) { %>

                                    <span class="badge badge-success d-inline-flex align-items-center">
                                            <i class="ti ti-point-filled me-1"></i>
                                            Active
                                        </span>

                                    <% } else { %>

                                    <span class="badge badge-danger d-inline-flex align-items-center">
                                            <i class="ti ti-point-filled me-1"></i>
                                            <%= status %>
                                        </span>

                                    <% } %>

                                </td>


                                <!-- Actions -->
                                <td class="text-end">

                                    <div class="action-icon d-inline-flex">

                                        <!-- Edit -->
                                        <a href="javascript:void(0);"
                                           class="me-2"
                                           data-bs-toggle="modal"
                                           data-bs-target="#editTrainerModal<%= trainer.getTrainerId() %>">

                                            <i class="ti ti-edit"></i>

                                        </a>


                                        <!-- Delete -->
                                        <a href="javascript:void(0);"
                                           data-bs-toggle="modal"
                                           data-bs-target="#deleteTrainerModal<%= trainer.getTrainerId() %>">

                                            <i class="ti ti-trash"></i>

                                        </a>

                                    </div>

                                </td>

                            </tr>


                            <!-- EDIT MODAL -->
                            <div class="modal fade"
                                 id="editTrainerModal<%= trainer.getTrainerId() %>"
                                 tabindex="-1">

                                <div class="modal-dialog modal-dialog-centered">

                                    <div class="modal-content">

                                        <div class="modal-header">

                                            <h5 class="modal-title">
                                                Edit Trainer
                                            </h5>

                                            <button type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal">
                                            </button>

                                        </div>


                                        <form action="${pageContext.request.contextPath}/trainers"
                                              method="post">

                                            <div class="modal-body">

                                                <input type="hidden"
                                                       name="action"
                                                       value="update">

                                                <input type="hidden"
                                                       name="trainerId"
                                                       value="<%= trainer.getTrainerId() %>">


                                                <div class="row">

                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            First Name
                                                        </label>

                                                        <input type="text"
                                                               name="firstName"
                                                               class="form-control"
                                                               value="<%= trainer.getFirstName() == null ? "" : trainer.getFirstName() %>"
                                                               required>

                                                    </div>


                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            Last Name
                                                        </label>

                                                        <input type="text"
                                                               name="lastName"
                                                               class="form-control"
                                                               value="<%= trainer.getLastName() == null ? "" : trainer.getLastName() %>"
                                                               required>

                                                    </div>


                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            Role
                                                        </label>

                                                        <select name="role"
                                                                class="form-select"
                                                                required>

                                                            <option value="Employee"
                                                                    <%= "Employee".equalsIgnoreCase(trainer.getRole()) ? "selected" : "" %>>
                                                                Employee
                                                            </option>

                                                            <option value="Manager"
                                                                    <%= "Manager".equalsIgnoreCase(trainer.getRole()) ? "selected" : "" %>>
                                                                Manager
                                                            </option>

                                                            <option value="Admin"
                                                                    <%= "Admin".equalsIgnoreCase(trainer.getRole()) ? "selected" : "" %>>
                                                                Admin
                                                            </option>

                                                        </select>

                                                    </div>
                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            Email
                                                        </label>

                                                        <input type="email"
                                                               name="email"
                                                               class="form-control"
                                                               value="<%= trainer.getEmail() == null ? "" : trainer.getEmail() %>"
                                                               required>

                                                    </div>


                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            Phone
                                                        </label>

                                                        <input type="number"
                                                               name="phone"
                                                               class="form-control"
                                                               value="<%= trainer.getPhone() %>"
                                                               required>

                                                    </div>


                                                    <div class="col-md-6 mb-3">

                                                        <label class="form-label">
                                                            Status
                                                        </label>

                                                        <select name="status"
                                                                class="form-select">

                                                            <option value="Active"
                                                                    <%= "Active".equalsIgnoreCase(status) ? "selected" : "" %>>
                                                                Active
                                                            </option>

                                                            <option value="Inactive"
                                                                    <%= "Inactive".equalsIgnoreCase(status) ? "selected" : "" %>>
                                                                Inactive
                                                            </option>

                                                        </select>

                                                    </div>


                                                    <div class="col-12 mb-3">

                                                        <label class="form-label">
                                                            Description
                                                        </label>

                                                        <textarea name="description"
                                                                  class="form-control"
                                                                  rows="4"><%= trainer.getDescription() == null ? "" : trainer.getDescription() %></textarea>

                                                    </div>

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
                                                    Update Trainer
                                                </button>

                                            </div>

                                        </form>

                                    </div>

                                </div>

                            </div>


                            <!-- DELETE MODAL -->
                            <div class="modal fade"
                                 id="deleteTrainerModal<%= trainer.getTrainerId() %>"
                                 tabindex="-1">

                                <div class="modal-dialog modal-dialog-centered">

                                    <div class="modal-content">

                                        <div class="modal-header">

                                            <h5 class="modal-title">
                                                Delete Trainer
                                            </h5>

                                            <button type="button"
                                                    class="btn-close"
                                                    data-bs-dismiss="modal">
                                            </button>

                                        </div>


                                        <div class="modal-body text-center">

                                            <div class="mb-3">

                                                <span class="avatar avatar-xl bg-danger-subtle text-danger rounded-circle">
                                                    <i class="ti ti-trash fs-2"></i>
                                                </span>

                                            </div>

                                            <h5 class="mb-2">
                                                Delete Trainer?
                                            </h5>

                                            <p class="text-muted mb-0">
                                                Are you sure you want to delete
                                                <strong><%= fullName.trim() %></strong>?
                                            </p>

                                        </div>


                                        <div class="modal-footer">

                                            <button type="button"
                                                    class="btn btn-light"
                                                    data-bs-dismiss="modal">
                                                Cancel
                                            </button>

                                            <a href="${pageContext.request.contextPath}/trainers?action=delete&id=<%= trainer.getTrainerId() %>"
                                               class="btn btn-danger">
                                                Delete
                                            </a>

                                        </div>

                                    </div>

                                </div>

                            </div>

                            <%
                                    }
                                }
                            %>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>
            <!-- /Trainers List -->

        </div>

    </div>

</div>


<!-- Scripts -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>


<script>
    var trainersTable = $('#trainersTable').DataTable({
        "pageLength": 10,
        "ordering": true,
        "searching": true,
        "lengthChange": true,
        "columnDefs": [
            {
                "orderable": false,
                "targets": [6]
            }
        ]
    });

    $('.trainer-sort').on('click', function () {

        var direction = $(this).data('direction');

        trainersTable
            .order([1, direction])
            .draw();

    });


</script>

</body>
</html>