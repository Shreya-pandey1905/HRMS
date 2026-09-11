<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Document List</title>

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
                            Admin Document List
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">
                                    Dashboard
                                </a>

                            </li>

                            <li class="breadcrumb-item active">
                                Admin Document List
                            </li>

                        </ul>

                    </div>


                    <div class="col-auto">

                        <a href="${pageContext.request.contextPath}/admin-document-names?action=add"
                           class="btn btn-primary">

                            <i class="ti ti-plus"></i>

                            Add Document Name

                        </a>

                    </div>

                </div>

            </div>


            <!-- ADMIN DOCUMENT LIST -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Admin Document List
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-striped table-hover"
                               id="adminDocumentListTable">

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

                                            <!-- EDIT -->

                                            <a href="#"
                                               class="me-3"
                                               title="Edit"
                                               data-bs-toggle="modal"
                                               data-bs-target="#editDocumentNameModal${documentName.id}">

                                                <i class="ti ti-edit"></i>

                                            </a>


                                            <!-- DELETE -->

                                            <a href="#"
                                               class="text-danger"
                                               title="Delete"
                                               data-bs-toggle="modal"
                                               data-bs-target="#deleteDocumentNameModal${documentName.id}">

                                                <i class="ti ti-trash"></i>

                                            </a>

                                        </div>

                                    </td>

                                </tr>


                                <!-- EDIT MODAL -->

                                <div class="modal fade"
                                     id="editDocumentNameModal${documentName.id}"
                                     tabindex="-1"
                                     aria-hidden="true">

                                    <div class="modal-dialog modal-dialog-centered">

                                        <div class="modal-content">

                                            <div class="modal-header">

                                                <h5 class="modal-title">
                                                    Edit Admin Document Name
                                                </h5>

                                                <button type="button"
                                                        class="btn-close"
                                                        data-bs-dismiss="modal">
                                                </button>

                                            </div>


                                            <form method="post"
                                                  action="${pageContext.request.contextPath}/admin-document-names">

                                                <input type="hidden"
                                                       name="action"
                                                       value="edit">

                                                <input type="hidden"
                                                       name="id"
                                                       value="${documentName.id}">


                                                <div class="modal-body">

                                                    <div class="mb-3">

                                                        <label class="form-label">
                                                            Document Name
                                                        </label>

                                                        <input type="text"
                                                               name="docName"
                                                               class="form-control"
                                                               value="${documentName.docName}"
                                                               required>

                                                    </div>

                                                </div>


                                                <div class="modal-footer">

                                                    <button type="button"
                                                            class="btn btn-secondary"
                                                            data-bs-dismiss="modal">

                                                        Cancel

                                                    </button>

                                                    <button type="submit"
                                                            class="btn btn-primary">

                                                        Save Changes

                                                    </button>

                                                </div>

                                            </form>

                                        </div>

                                    </div>

                                </div>


                                <!-- DELETE MODAL -->

                                <div class="modal fade"
                                     id="deleteDocumentNameModal${documentName.id}"
                                     tabindex="-1"
                                     aria-hidden="true">

                                    <div class="modal-dialog modal-dialog-centered">

                                        <div class="modal-content">

                                            <div class="modal-header">

                                                <h5 class="modal-title">
                                                    Delete Admin Document Name
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

                                                <a href="${pageContext.request.contextPath}/admin-document-names?action=delete&id=${documentName.id}"
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

                                        No Admin Documents Found

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


<script>

    $(document).ready(function () {

        $('#adminDocumentListTable').DataTable({
            pageLength: 10,
            lengthMenu: [10, 25, 50, 100]
        });

    });

</script>

</body>

</html>