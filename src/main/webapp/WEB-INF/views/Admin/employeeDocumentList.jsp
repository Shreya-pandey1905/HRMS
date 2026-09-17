<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Employee Document List</title>

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
    <%@ include file="adminSidebar.jsp" %>


    <div class="page-wrapper">

        <div class="content">


            <!-- PAGE HEADER -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col">

                        <h3 class="page-title">
                            Employee Document List
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    Dashboard
                                </a>

                            </li>

                            <li class="breadcrumb-item active">
                                Employee Document List
                            </li>

                        </ul>

                    </div>


                    <div class="col-auto">

                        <a href="${pageContext.request.contextPath}/employee-document-names?action=add"
                           class="btn btn-primary">

                            <i class="ti ti-plus"></i>

                            Add Document Name

                        </a>

                    </div>

                </div>

            </div>


            <!-- EMPLOYEE DOCUMENT LIST -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Employee Document List
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-striped table-hover"
                               id="employeeDocumentListTable">

                            <thead>

                            <tr>

                                <th style="width:80px;">
                                    #
                                </th>

                                <th>
                                    Document Name
                                </th>

                                <th style="width:180px;">
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="documentName"
                                       items="${documentNames}"
                                       varStatus="status">

                                <tr>

                                    <td>
                                            ${status.index + 1}
                                    </td>

                                    <td>
                                            ${documentName.docName}
                                    </td>

                                    <td>

                                        <div class="action-icon d-inline-flex align-items-center">

                                            <a href="#"
                                               class="text-danger"
                                               title="Delete"
                                               data-bs-toggle="modal"
                                               data-bs-target="#deleteEmployeeDocumentNameModal${documentName.id}">

                                                <i class="ti ti-trash"></i>

                                            </a>

                                        </div>

                                    </td>

                                </tr>


                                <!-- DELETE MODAL -->

                                <div class="modal fade"
                                     id="deleteEmployeeDocumentNameModal${documentName.id}"
                                     tabindex="-1"
                                     aria-hidden="true">

                                    <div class="modal-dialog modal-dialog-centered">

                                        <div class="modal-content">

                                            <div class="modal-header">

                                                <h5 class="modal-title">
                                                    Delete Employee Document Name
                                                </h5>

                                                <button type="button"
                                                        class="btn-close"
                                                        data-bs-dismiss="modal">
                                                </button>

                                            </div>


                                            <div class="modal-body text-center">

                                                <p>

                                                    Are you sure you want to delete
                                                    <strong>
                                                            ${documentName.docName}
                                                    </strong>?

                                                </p>

                                            </div>


                                            <div class="modal-footer">

                                                <button type="button"
                                                        class="btn btn-secondary"
                                                        data-bs-dismiss="modal">

                                                    Cancel

                                                </button>

                                                <a href="${pageContext.request.contextPath}/employee-document-names?action=delete&id=${documentName.id}"
                                                   class="btn btn-danger">

                                                    Yes, Delete

                                                </a>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </c:forEach>


                            <c:if test="${empty documentNames}">

                                <tr>

                                    <td colspan="3"
                                        class="text-center">

                                        No Employee Documents Found

                                    </td>

                                </tr>

                            </c:if>

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

        $('#employeeDocumentListTable').DataTable({
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100]
        });

    });

</script>

</body>

</html>