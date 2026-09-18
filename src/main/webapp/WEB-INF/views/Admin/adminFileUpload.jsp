<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Admin File Upload</title>

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
                            Admin File Upload
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
                                Admin File Upload
                            </li>

                        </ul>

                    </div>

                </div>

            </div>


            <!-- UPLOAD CARD -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title mb-0">
                        Admin File Upload
                    </h5>

                </div>

                <div class="card-body">

                    <form method="post"
                          action="${pageContext.request.contextPath}/admin-documents"
                          enctype="multipart/form-data">


                        <!-- USER -->

                        <div class="row">

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">
                                        User
                                    </label>

                                    <select name="email"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select User
                                        </option>

                                        <c:forEach var="employee"
                                                   items="${employees}">

                                            <option value="${employee.email}">

                                                    ${employee.firstName}
                                                    ${employee.lastName}
                                                (${employee.email})

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>

                        </div>


                        <!-- DOCUMENT ROWS -->

                        <div id="documentRows">

                            <div class="row document-row align-items-end">


                                <!-- DOCUMENT NAME -->

                                <div class="col-md-5">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Document Name
                                        </label>

                                        <select name="docName"
                                                class="form-select"
                                                required>

                                            <option value="">
                                                Select Document
                                            </option>

                                            <c:forEach var="documentName"
                                                       items="${documentNames}">

                                                <option value="${documentName.docName}">

                                                        ${documentName.docName}

                                                </option>

                                            </c:forEach>

                                        </select>

                                    </div>

                                </div>


                                <!-- DOCUMENT FILE -->

                                <div class="col-md-5">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Document File
                                        </label>

                                        <input type="file"
                                               name="docFile"
                                               class="form-control"
                                               required>

                                    </div>

                                </div>


                                <!-- BUTTONS -->

                                <div class="col-md-2">

                                    <div class="mb-3 d-flex align-items-center">


                                        <!-- ADD -->

                                        <button type="button"
                                                class="btn btn-primary me-2"
                                                onclick="addDocumentRow()"
                                                title="Add Document"
                                                style="width:36px;
                                                       height:36px;
                                                       font-size:22px;
                                                       line-height:1;
                                                       padding:0;">

                                            +

                                        </button>


                                        <!-- REMOVE -->

                                        <button type="button"
                                                class="btn btn-danger remove-row"
                                                onclick="removeDocumentRow(this)"
                                                title="Remove Document"
                                                style="display:none;
                                                       width:36px;
                                                       height:36px;
                                                       font-size:22px;
                                                       line-height:1;
                                                       padding:0;">

                                            −

                                        </button>


                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- SAVE -->

                        <div class="mt-2">

                            <button type="submit"
                                    class="btn btn-primary">

                                Save

                            </button>

                        </div>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>


<!-- JAVASCRIPT -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>


    function addDocumentRow() {

        const container =
            document.getElementById("documentRows");


        const firstRow =
            container.querySelector(".document-row");


        const newRow =
            firstRow.cloneNode(true);


        const documentSelect =
            newRow.querySelector('select[name="docName"]');


        documentSelect.selectedIndex = 0;


        const fileInput =
            newRow.querySelector('input[name="docFile"]');


        fileInput.value = "";


        const removeButton =
            newRow.querySelector(".remove-row");


        removeButton.style.display =
            "inline-block";


        container.appendChild(newRow);


        updateRemoveButtons();

    }


    function removeDocumentRow(button) {

        const rows =
            document.querySelectorAll(".document-row");


        if (rows.length > 1) {

            button.closest(".document-row").remove();

        }


        updateRemoveButtons();

    }


    function updateRemoveButtons() {

        const rows =
            document.querySelectorAll(".document-row");


        rows.forEach(function(row) {

            const removeButton =
                row.querySelector(".remove-row");


            if (rows.length > 1) {

                removeButton.style.display =
                    "inline-block";

            } else {

                removeButton.style.display =
                    "none";

            }

        });

    }


</script>
<script>
document.addEventListener("DOMContentLoaded", function () {

    var menus = document.querySelectorAll(".sidebar-menu > ul > li.submenu > a");

    menus.forEach(function (menu) {

        menu.addEventListener("click", function (event) {

            event.preventDefault();

            var submenu = this.parentElement.querySelector(":scope > ul");

            if (submenu.style.display === "block") {
                submenu.style.display = "none";
            } else {
                submenu.style.display = "block";
            }

        });

    });

});
</script>
</body>

</html>