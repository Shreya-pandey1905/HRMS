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

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">
                                Admin
                            </li>

                            <li class="breadcrumb-item active">
                                Admin Document List
                            </li>

                        </ul>

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
                               id="adminDocumentsTable">

                            <thead>

                            <tr>

                                <th>
                                    #
                                </th>

                                <th>
                                    Employee
                                </th>

                                <th>
                                    Document Name
                                </th>

                                <th>
                                    Document File
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <c:forEach var="document"
                                       items="${documents}"
                                       varStatus="status">

                                <tr>

                                    <td>
                                        ${status.index + 1}
                                    </td>

                                    <td>
                                        ${document.employeeName}
                                    </td>

                                    <td>
                                        ${document.docName}
                                    </td>

                                    <td>

                                        <a href="${pageContext.request.contextPath}${document.docFile}"
                                           target="_blank"
                                           class="btn btn-sm btn-info me-1">

                                            <i class="ti ti-eye"></i>
                                            View

                                        </a>


                                        <a href="${pageContext.request.contextPath}${document.docFile}"
                                           download
                                           class="btn btn-sm btn-secondary">

                                            <i class="ti ti-download"></i>
                                            Download

                                        </a>

                                    </td>


                                    <td>

                                        <button type="button"
                                                class="btn btn-sm btn-danger"
                                                data-bs-toggle="modal"
                                                data-bs-target="#deleteAdminDocumentModal${document.adminDocId}">

                                            <i class="ti ti-trash me-1"></i>
                                            Delete

                                        </button>

                                    </td>

                                </tr>

                            </c:forEach>


                            <c:if test="${empty documents}">

                                <tr>

                                    <td colspan="5"
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
<!-- DELETE MODALS -->
<!-- MODALS ARE OUTSIDE THE TABLE -->
<!-- ===================================================== -->

<c:forEach var="document"
           items="${documents}">

    <div class="modal fade"
         id="deleteAdminDocumentModal${document.adminDocId}"
         tabindex="-1"
         aria-labelledby="deleteAdminDocumentLabel${document.adminDocId}"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">

                <div class="modal-header">

                    <h5 class="modal-title"
                        id="deleteAdminDocumentLabel${document.adminDocId}">

                        Delete Admin Document

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
                            ${document.docName}
                        </strong>?

                    </p>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>


                    <a href="${pageContext.request.contextPath}/admin-documents?action=delete&id=${document.adminDocId}"
                       class="btn btn-danger">

                        Yes, Delete

                    </a>

                </div>

            </div>

        </div>

    </div>

</c:forEach>


<!-- ===================================================== -->
<!-- JAVASCRIPT -->
<!-- ===================================================== -->

<script src="<%= request.getContextPath() %>/assets/js/jquery-3.7.1.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/feather.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/moment.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="<%= request.getContextPath() %>/assets/plugins/select2/js/select2.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/theme-colorpicker.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/jquery.slimscroll.min.js"></script>


<!-- DATATABLES -->

<script src="<%= request.getContextPath() %>/assets/js/jquery.dataTables.min.js"></script>

<script src="<%= request.getContextPath() %>/assets/js/dataTables.bootstrap5.min.js"></script>


<!-- MAIN THEME SCRIPT -->
<!-- Required for sidebar -->

<script src="<%= request.getContextPath() %>/assets/js/script.js"></script>


<!-- DATATABLE INITIALIZATION -->

<script>

    $(document).ready(function () {

        $('#adminDocumentsTable').DataTable({

            pageLength: 10,

            lengthMenu: [10, 25, 50, 100]

        });

    });

</script>

</body>

</html>