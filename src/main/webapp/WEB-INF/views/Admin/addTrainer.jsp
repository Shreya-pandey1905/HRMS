
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Add Trainer - HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <!-- Header -->
    <%@ include file="adminHeader.jsp" %>

    <!-- Sidebar -->
    <%@ include file="adminSidebar.jsp" %>


    <!-- Page Wrapper -->
    <div class="page-wrapper">

        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">Add Trainer</h2>

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

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/trainers">
                                    Trainers
                                </a>

                            </li>

                            <li class="breadcrumb-item active">
                                Add Trainer
                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- Add Trainer Form -->
            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Trainer Information
                    </h5>

                </div>


                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/trainers"
                          method="post">

                        <input type="hidden"
                               name="action"
                               value="add">


                        <div class="row">

                            <!-- First Name -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    First Name <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       name="firstName"
                                       class="form-control"
                                       placeholder="Enter first name"
                                       required>

                            </div>


                            <!-- Last Name -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Last Name <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       name="lastName"
                                       class="form-control"
                                       placeholder="Enter last name"
                                       required>

                            </div>


                            <!-- Role -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Role <span class="text-danger">*</span>
                                </label>

                                <input type="text"
                                       name="role"
                                       class="form-control"
                                       placeholder="Enter role"
                                       required>

                            </div>


                            <!-- Email -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Email <span class="text-danger">*</span>
                                </label>

                                <input type="email"
                                       name="email"
                                       class="form-control"
                                       placeholder="Enter email"
                                       required>

                            </div>


                            <!-- Phone -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Phone <span class="text-danger">*</span>
                                </label>

                                <input type="tel"
                                       name="phone"
                                       class="form-control"
                                       placeholder="Enter phone number"
                                       required>

                            </div>


                            <!-- Status -->
                            <div class="col-md-6 mb-3">

                                <label class="form-label">
                                    Status <span class="text-danger">*</span>
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


                            <!-- Description -->
                            <div class="col-12 mb-3">

                                <label class="form-label">
                                    Description <span class="text-danger">*</span>
                                </label>

                                <textarea name="description"
                                          class="form-control"
                                          rows="4"
                                          placeholder="Enter trainer description"
                                          required></textarea>

                            </div>


                            <!-- Profile Picture -->
                            <div class="col-12 mb-3">

                                <label class="form-label">
                                    Profile Picture
                                </label>

                                <input type="text"
                                       name="profilePicture"
                                       class="form-control"
                                       placeholder="Enter profile picture file name">

                            </div>

                        </div>


                        <!-- Buttons -->
                        <div class="d-flex justify-content-end gap-2 mt-3">

                            <a href="${pageContext.request.contextPath}/trainers"
                               class="btn btn-light">

                                Cancel

                            </a>

                            <button type="submit"
                                    class="btn btn-primary">

                                <i class="ti ti-circle-plus me-2"></i>

                                Add Trainer

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


<!-- jQuery -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js">
</script>

<!-- Bootstrap JS -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js">
</script>

<!-- Feather Icons -->
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js">
</script>

<!-- Slimscroll -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js">
</script>

<!-- Main JS -->
<script src="${pageContext.request.contextPath}/assets/js/script.js">
</script>

</body>

</html>