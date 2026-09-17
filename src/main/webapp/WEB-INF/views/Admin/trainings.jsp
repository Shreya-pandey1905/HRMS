<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="models.Trainers.Training" %>

<%
    List<Training> trainings =
            (List<Training>) request.getAttribute("trainings");
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Training - HRMS</title>

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

                    <h2 class="mb-1">Training</h2>

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
                                Training List
                            </li>

                        </ol>
                    </nav>

                </div>

            </div>
            <!-- /Page Header -->


            <!-- Training List -->
            <div class="card">

                <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                    <h5 class="mb-0">
                        Training List
                    </h5>


                    <div class="d-flex align-items-center gap-2">

                        <!-- Add Training -->
                        <div>

                            <a href="${pageContext.request.contextPath}/trainings/add"
                               class="btn btn-primary d-flex align-items-center">

                                <i class="ti ti-circle-plus me-2"></i>

                                Add Training

                            </a>

                        </div>


                        <!-- Sort -->
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
                                       class="dropdown-item training-sort"
                                       data-direction="asc">

                                        Ascending

                                    </a>

                                </li>


                                <li>

                                    <a href="javascript:void(0);"
                                       class="dropdown-item training-sort"
                                       data-direction="desc">

                                        Descending

                                    </a>

                                </li>

                            </ul>

                        </div>

                    </div>

                </div>


                <div class="card-body p-0">

                    <div class="custom-datatable-filter table-responsive">

                        <table id="trainingsTable"
                               class="table table-nowrap datatable">

                            <thead class="thead-light">

                            <tr>

                                <th>
                                    Training ID
                                </th>

                                <th>
                                    Trainer Name
                                </th>

                                <th>
                                    Training Type
                                </th>

                                <th>
                                    User (Emp)
                                </th>

                                <th>
                                    Training Cost
                                </th>

                                <th>
                                    Description
                                </th>

                                <th>
                                    Status
                                </th>

                                <th>
                                    Start Date
                                </th>

                                <th>
                                    End Date
                                </th>

                                <th class="text-end">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <%
                                if (trainings != null && !trainings.isEmpty()) {

                                    for (Training training : trainings) {

                                        String status =
                                                training.getStatus() == null
                                                        ? ""
                                                        : training.getStatus();

                                        String userName =
                                                ((training.getUserFirstName() == null)
                                                        ? ""
                                                        : training.getUserFirstName())
                                                        + " "
                                                        + ((training.getUserLastName() == null)
                                                        ? ""
                                                        : training.getUserLastName());

                                        String trainerName =
                                                ((training.getTrainerFirstName() == null)
                                                        ? ""
                                                        : training.getTrainerFirstName())
                                                        + " "
                                                        + ((training.getTrainerLastName() == null)
                                                        ? ""
                                                        : training.getTrainerLastName());
                            %>


                            <tr>

                                <!-- Training ID -->
                                <td>

                                    <%= training.getTrainingId() %>

                                </td>


                                <!-- Trainer Name -->
                                <td>

                                    <%= trainerName.trim() %>

                                </td>


                                <!-- Training Type -->
                                <td>

                                    <%= training.getTrainingTypeName() == null
                                            ? ""
                                            : training.getTrainingTypeName() %>

                                </td>


                                <!-- User -->
                                <td>

                                    <%= userName.trim() %>

                                </td>


                                <!-- Training Cost -->
                                <td>

                                    <%= training.getTrainingCost() %>

                                </td>


                                <!-- Description -->
                                <td>

                                    <span class="text-truncate d-inline-block"
                                          style="max-width:250px;">

                                        <%= training.getDescription() == null
                                                ? ""
                                                : training.getDescription() %>

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


                                <!-- Start Date -->
                                <td>

                                    <%= training.getStartDate() == null
                                            ? ""
                                            : training.getStartDate() %>

                                </td>


                                <!-- End Date -->
                                <td>

                                    <%= training.getEndDate() == null
                                            ? ""
                                            : training.getEndDate() %>

                                </td>


                                <!-- Actions -->
                                <td class="text-end">

                                    <div class="action-icon d-inline-flex">

                                        <!-- Edit -->

                                        <a href="${pageContext.request.contextPath}/trainings?action=edit&id=<%= training.getTrainingId() %>"
                                           class="me-2">

                                            <i class="ti ti-edit"></i>

                                        </a>


                                        <!-- Delete -->

                                        <a href="javascript:void(0);"
                                           data-bs-toggle="modal"
                                           data-bs-target="#deleteTrainingModal<%= training.getTrainingId() %>">

                                            <i class="ti ti-trash"></i>

                                        </a>

                                    </div>

                                </td>

                            </tr>


                            <!-- DELETE MODAL -->

                            <div class="modal fade"
                                 id="deleteTrainingModal<%= training.getTrainingId() %>"
                                 tabindex="-1">

                                <div class="modal-dialog modal-dialog-centered">

                                    <div class="modal-content">


                                        <div class="modal-header">

                                            <h5 class="modal-title">
                                                Delete Training
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
                                                Delete Training?
                                            </h5>


                                            <p class="text-muted mb-0">

                                                Are you sure you want to delete
                                                this training?

                                            </p>

                                        </div>


                                        <div class="modal-footer">

                                            <button type="button"
                                                    class="btn btn-light"
                                                    data-bs-dismiss="modal">

                                                Cancel

                                            </button>


                                            <a href="${pageContext.request.contextPath}/trainings?action=delete&id=<%= training.getTrainingId() %>"
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
            <!-- /Training List -->

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

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- DataTables -->

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>


<script>

    var trainingsTable = $('#trainingsTable').DataTable({

        "pageLength": 5,

        "ordering": true,

        "searching": true,

        "lengthChange": true,

        "columnDefs": [
            {
                "orderable": false,
                "targets": [9]
            }
        ]

    });


    $('.training-sort').on('click', function () {

        var direction = $(this).data('direction');

        trainingsTable
            .order([1, direction])
            .draw();

    });

</script>

</body>

</html>