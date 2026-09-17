<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Admin Document Name</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>
    <%@ include file="adminSidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">

            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            Add Admin Document Name
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    Dashboard
                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Admin
                            </li>

                            <li class="breadcrumb-item active">
                                Add Admin Document Name
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- ADD ADMIN DOCUMENT NAME -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Add Admin Document Name
                    </h5>

                </div>

                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin-document-names">

                        <div class="row">

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Document Name
                                    </label>

                                    <input type="text"
                                           name="docName"
                                           class="form-control"
                                           placeholder="Enter Document Name"
                                           required>

                                </div>

                            </div>

                        </div>

                        <button type="submit"
                                class="btn btn-primary">

                            Add

                        </button>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

</body>

</html>