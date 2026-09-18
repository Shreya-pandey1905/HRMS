<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Employee Documents</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">
</head>

<body>

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>
    <%@ include file="../common/employee-sidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">

            <!-- Page Header -->
            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            Employee Documents
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">
                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    Dashboard
                                </a>
                            </li>

                            <li class="breadcrumb-item active">
                                Employee Documents
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- Employee Documents List -->
            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Uploaded Employee Documents
                    </h5>

                </div>

                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-striped table-hover"
                               id="employeeDocumentsTable">

                            <thead>

                            <tr>
                                <th>#</th>
                                <th>Employee ID</th>
                                <th>Document ID</th>
                                <th>File Name</th>
                                <th>Action</th>
                            </tr>

                            </thead>

                            <tbody>

                            <c:forEach var="document"
                                       items="${employeeDocuments}"
                                       varStatus="status">

                                <tr>

                                    <td>
                                            ${status.index + 1}
                                    </td>

                                    <td>
                                            ${document.userId}
                                    </td>

                                    <td>
                                            ${document.documentId}
                                    </td>

                                    <td>
                                            ${document.fileName}
                                    </td>

                                    <td>

                                        <!-- View -->

                                        <a href="${pageContext.request.contextPath}${document.filePath}"
                                           target="_blank"
                                           class="btn btn-sm btn-outline-primary">

                                            <i class="ti ti-eye"></i>
                                            View

                                        </a>


                                        <!-- Download -->

                                        <a href="${pageContext.request.contextPath}${document.filePath}"
                                           download="${document.fileName}"
                                           class="btn btn-sm btn-outline-success">

                                            <i class="ti ti-download"></i>
                                            Download

                                        </a>


                                        <!-- Delete -->

                                        <a href="${pageContext.request.contextPath}/employee-documents?action=delete&id=${document.id}"
                                           class="btn btn-sm btn-danger"
                                           onclick="return confirm('Are you sure you want to delete this document?');">

                                            <i class="ti ti-trash"></i>
                                            Delete

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                            </tbody>

                        </table>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<script>

    $(document).ready(function () {

        $('#employeeDocumentsTable').DataTable({
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100]
        });

    });

</script>

</body>

</html>