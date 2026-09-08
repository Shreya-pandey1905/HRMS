<%@ page contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8"
         isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <%
        models.Trainers.Training training =
                (models.Trainers.Training) request.getAttribute("training");

        java.util.List<models.Trainers.Trainer> trainers =
                (java.util.List<models.Trainers.Trainer>)
                        request.getAttribute("trainers");

        java.util.List<models.Trainers.TrainingType> trainingTypes =
                (java.util.List<models.Trainers.TrainingType>)
                        request.getAttribute("trainingTypes");

        boolean editMode = training != null;
    %>

    <title>
        <%= editMode ? "Edit Training" : "Add Training" %>
    </title>


    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/icons/feather/feather.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/tabler-icons/tabler-icons.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="<%= request.getContextPath() %>/assets/css/style.css">

</head>

<body>

<%@ include file="adminHeader.jsp" %>

<%@ include file="adminSidebar.jsp" %>


<div class="page-wrapper">

    <div class="content">


        <!-- Page Header -->

        <div class="page-header">

            <div class="row align-items-center">

                <div class="col">

                    <h3 class="page-title">

                        <%= editMode ? "Edit Training" : "Add Training" %>

                    </h3>


                    <ul class="breadcrumb">

                        <li class="breadcrumb-item">

                            <a href="${pageContext.request.contextPath}/trainings">

                                Training

                            </a>

                        </li>


                        <li class="breadcrumb-item active">

                            <%= editMode ? "Edit Training" : "Add Training" %>

                        </li>

                    </ul>

                </div>

            </div>

        </div>


        <!-- Training Form -->

        <div class="card">

            <div class="card-header">

                <h4 class="card-title">

                    Training Information

                </h4>

            </div>


            <div class="card-body">

                <form method="post"
                      action="${pageContext.request.contextPath}/trainings">


                    <!-- ADD / UPDATE -->

                    <input type="hidden"
                           name="action"
                           value="<%= editMode ? "update" : "add" %>">


                    <% if (editMode) { %>

                    <input type="hidden"
                           name="trainingId"
                           value="<%= training.getTrainingId() %>">

                    <% } %>


                    <div class="row">


                        <!-- Trainer -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Trainer Name
                                <span class="text-danger">*</span>

                            </label>


                            <select name="trainerId"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Trainer
                                </option>


                                <% if (trainers != null) { %>

                                <% for (models.Trainers.Trainer trainer
                                        : trainers) { %>

                                <option
                                        value="<%= trainer.getTrainerId() %>"
                                        <%= editMode
                                                && training.getTrainerId()
                                                == trainer.getTrainerId()
                                                ? "selected"
                                                : "" %>>

                                    <%= trainer.getFirstName() %>
                                    <%= trainer.getLastName() %>

                                </option>

                                <% } %>

                                <% } %>

                            </select>

                        </div>


                        <!-- Training Type -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Training Type
                                <span class="text-danger">*</span>

                            </label>


                            <select name="trainingTypeId"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Training Type
                                </option>


                                <% if (trainingTypes != null) { %>

                                <% for (models.Trainers.TrainingType trainingType
                                        : trainingTypes) { %>

                                <option
                                        value="<%= trainingType.getTrainingTypeId() %>"
                                        <%= editMode
                                                && training.getTrainingTypeId()
                                                == trainingType.getTrainingTypeId()
                                                ? "selected"
                                                : "" %>>

                                    <%= trainingType.getTrainingTypeName() %>

                                </option>

                                <% } %>

                                <% } %>

                            </select>

                        </div>


                        <!-- User / Employee -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                User (Emp)
                                <span class="text-danger">*</span>

                            </label>


                            <select name="userId"
                                    class="form-select"
                                    required>

                                <option value="">
                                    Select Employee
                                </option>

                                <%
                                    java.util.List<models.Employees.User> users =
                                            (java.util.List<models.Employees.User>)
                                                    request.getAttribute("users");
                                %>


                                <% if (users != null) { %>

                                <% for (models.Employees.User user
                                        : users) { %>

                                <option
                                        value="<%= user.getUserId() %>"
                                        <%= editMode
                                                && training.getUserId()
                                                == user.getUserId()
                                                ? "selected"
                                                : "" %>>

                                    <%= user.getFirstName() %>
                                    <%= user.getLastName() %>

                                </option>

                                <% } %>

                                <% } %>

                            </select>

                        </div>


                        <!-- Training Cost -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Training Cost
                                <span class="text-danger">*</span>

                            </label>


                            <input type="number"
                                   name="trainingCost"
                                   class="form-control"
                                   placeholder="Enter Training Cost"
                                   step="0.01"
                                   min="0"
                                   value="<%= editMode
                                           ? training.getTrainingCost()
                                           : "" %>"
                                   required>

                        </div>


                        <!-- Start Date -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                Start Date
                                <span class="text-danger">*</span>

                            </label>


                            <input type="datetime-local"
                                   name="startDate"
                                   class="form-control"
                                   value="<%= editMode
                                           && training.getStartDate() != null
                                           ? training.getStartDate()
                                           : "" %>"
                                   required>

                        </div>


                        <!-- End Date -->

                        <div class="col-md-6 mb-3">

                            <label class="form-label">

                                End Date
                                <span class="text-danger">*</span>

                            </label>


                            <input type="datetime-local"
                                   name="endDate"
                                   class="form-control"
                                   value="<%= editMode
                                           && training.getEndDate() != null
                                           ? training.getEndDate()
                                           : "" %>"
                                   required>

                        </div>


                        <!-- Status -->

                        <div class="col-md-6 mb-3">

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


                                <option value="Active"
                                        <%= editMode
                                                && "Active".equalsIgnoreCase(
                                                training.getStatus())
                                                ? "selected"
                                                : "" %>>

                                    Active

                                </option>


                                <option value="Inactive"
                                        <%= editMode
                                                && "Inactive".equalsIgnoreCase(
                                                training.getStatus())
                                                ? "selected"
                                                : "" %>>

                                    Inactive

                                </option>

                            </select>

                        </div>


                        <!-- Description -->

                        <div class="col-md-12 mb-3">

                            <label class="form-label">

                                Description
                                <span class="text-danger">*</span>

                            </label>


                            <textarea name="description"
                                      class="form-control"
                                      rows="4"
                                      placeholder="Enter training description"
                                      required><%= editMode
                                    ? training.getDescription()
                                    : "" %></textarea>

                        </div>


                    </div>


                    <!-- Buttons -->

                    <div class="d-flex justify-content-end gap-2">

                        <a href="${pageContext.request.contextPath}/trainings"
                           class="btn btn-light">

                            Cancel

                        </a>


                        <button type="submit"
                                class="btn btn-primary">

                            <%= editMode
                                    ? "Update Training"
                                    : "Save Training" %>

                        </button>

                    </div>


                </form>

            </div>

        </div>

    </div>

</div>


<script src="<%= request.getContextPath() %>/assets/js/jquery-3.7.1.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>

</body>

</html>