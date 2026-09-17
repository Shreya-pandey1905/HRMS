<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin Document Name List</title>

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
                            Admin Document Name List
                        </h3>

                        <ul class="breadcrumb">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Admin
                            </li>

                            <li class="breadcrumb-item active">
                                Admin Document Name List
                            </li>

                        </ul>

                    </div>


                    <!-- ADD DOCUMENT BUTTON -->

                    <!-- ADD DOCUMENT BUTTON -->

                    <div class="col-auto ms-auto">

                        <a href="${pageContext.request.contextPath}/admin-document-names?action=add"
                           class="btn btn-primary">

                            <i class="ti ti-plus"></i>

                            Add Document

                        </a>

                    </div>


            <!-- ADMIN DOCUMENT NAME LIST CARD -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Admin Document Name List
                    </h5>

                </div>


                <div class="card-body">

                    <div class="table-responsive">

                        <table class="table table-striped table-hover"
                               id="adminDocumentNameTable">

                            <thead>

                            <tr>

                                <th>
                                    Document ID
                                </th>

                                <th>
                                    Document Name
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="documentName"
                                       items="${documentNames}">

                                <tr>

                                    <td>
                                            ${documentName.id}
                                    </td>

                                    <td>
                                            ${documentName.docName}
                                    </td>

                                    <td>

                                        <!-- EDIT BUTTON -->

                                        <button type="button"
                                                class="btn btn-sm btn-primary me-2"
                                                data-bs-toggle="modal"
                                                data-bs-target="#editDocumentNameModal${documentName.id}">

                                            <i class="ti ti-edit me-1"></i>
                                            Edit

                                        </button>


                                        <!-- DELETE BUTTON -->

                                        <button type="button"
                                                class="btn btn-sm btn-danger"
                                                data-bs-toggle="modal"
                                                data-bs-target="#deleteDocumentNameModal${documentName.id}">

                                            <i class="ti ti-trash me-1"></i>
                                            Delete

                                        </button>

                                    </td>

                                </tr>

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


<!-- ===================================================== -->
<!-- EDIT AND DELETE MODALS -->
<!-- KEEP MODALS OUTSIDE THE TABLE -->
<!-- ===================================================== -->

<c:forEach var="documentName"
           items="${documentNames}">


    <!-- EDIT MODAL -->

    <div class="modal fade"
         id="editDocumentNameModal${documentName.id}"
         tabindex="-1"
         aria-labelledby="editDocumentNameLabel${documentName.id}"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title"
                        id="editDocumentNameLabel${documentName.id}">

                        Edit Admin Document Name

                    </h5>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
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
         aria-labelledby="deleteDocumentNameLabel${documentName.id}"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title"
                        id="deleteDocumentNameLabel${documentName.id}">

                        Delete Admin Document Name

                    </h5>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                    </button>

                </div>


                <div class="modal-body text-center">

                    <p class="mb-0">

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


<!-- JAVASCRIPT -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/js/script.js"></script>
<script>

    $(document).ready(function () {

        $('#adminDocumentNameTable').DataTable({

            pageLength: 5,

            lengthMenu: [5, 10, 25, 50, 100],

            language: {

                lengthMenu: "Row Per Page _MENU_ Entries"

            }

        });

    });

</script>

</body>

</html>