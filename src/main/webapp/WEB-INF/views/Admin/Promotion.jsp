<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Promotions - HRMS</title>


    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- Feather Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">


    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">


    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">


    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <style>

        .sidebar {
            height: 100vh !important;
            overflow-y: auto !important;
            overflow-x: hidden !important;
        }

        .sidebar-menu {
            height: auto !important;
            overflow: visible !important;
        }

        .sidebar::-webkit-scrollbar {
            width: 5px;
        }

        .sidebar::-webkit-scrollbar-thumb {
            background: #ccc;
            border-radius: 10px;
        }

        .promotion-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #fff;
        }

        .promotion-title {
            font-size: 20px;
            font-weight: 600;
            color: #1f2d5a;
        }

        .promotion-table th {
            background: #eef0f3;
            font-weight: 600;
            white-space: nowrap;
        }

        .promotion-table td {
            vertical-align: middle;
        }

        .employee-name {
            font-weight: 600;
            color: #1f2d5a;
        }

        .employee-avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: #d9d9d9;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-right: 10px;
            color: #fff;
            font-size: 12px;
        }

        .add-promotion-btn {
            background: #ff6b35;
            border-color: #ff6b35;
            color: #fff;
        }

        .add-promotion-btn:hover {
            background: #e85b29;
            border-color: #e85b29;
            color: #fff;
        }

        .action-btn {
            border: none;
            background: transparent;
            font-size: 17px;
            margin-right: 8px;
        }

        .edit-btn {
            color: #52677d;
        }

        .delete-btn {
            color: #52677d;
        }

    </style>

</head>


<body>

<div class="main-wrapper">


    <!-- ================= HEADER ================= -->

    <div class="header">

        <div class="main-header">

            <div class="header-left">

                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg"
                         alt="HRMS Logo">

                </a>


                <a href="${pageContext.request.contextPath}/admin/dashboard"
                   class="dark-logo">

                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg"
                         alt="HRMS Logo">

                </a>

            </div>


            <a id="mobile_btn"
               class="mobile_btn"
               href="#sidebar">

                <span class="bar-icon">
                    <span></span>
                    <span></span>
                    <span></span>
                </span>

            </a>


            <div class="header-user">

                <div class="nav user-menu nav-list">

                    <div class="me-auto d-flex align-items-center"
                         id="header-search">

                        <a id="toggle_btn"
                           href="javascript:void(0);"
                           class="btn btn-menubar me-1">

                            <i class="ti ti-arrow-bar-to-left"></i>

                        </a>


                        <div class="input-group input-group-flat d-inline-flex me-1">

                            <span class="input-icon-addon">
                                <i class="ti ti-search"></i>
                            </span>

                            <input type="text"
                                   class="form-control"
                                   placeholder="Search in HRMS">

                            <span class="input-group-text">
                                <kbd>CTRL + /</kbd>
                            </span>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- ================= SIDEBAR ================= -->

    <jsp:include page="adminSidebar.jsp"/>


    <!-- ================= PAGE CONTENT ================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- ================= PAGE HEADER ================= -->

            <div class="page-header">

                <div class="row align-items-center">

                    <div class="col-sm-8">

                        <h4 class="page-title">
                            Promotions
                        </h4>

                        <p class="text-muted mb-0">
                            Manage employee promotions
                        </p>

                    </div>


                    <div class="col-sm-4 text-sm-end mt-3 mt-sm-0">

                        <!-- IMPORTANT:
                             This opens ADD PROMOTION page -->
                        <a href="${pageContext.request.contextPath}/promotion?action=add"
                           class="btn add-promotion-btn">

                            <i class="ti ti-circle-plus me-1"></i>

                            Add Promotion

                        </a>

                    </div>

                </div>

            </div>


            <!-- ================= PROMOTION LIST ================= -->

            <div class="card promotion-card">

                <div class="card-body">


                    <div class="d-flex justify-content-between
                                align-items-center mb-4">

                        <h5 class="promotion-title mb-0">
                            Promotion List
                        </h5>


                        <div class="d-flex gap-2">

                            <input type="text"
                                   id="promotionSearch"
                                   class="form-control"
                                   placeholder="Search"
                                   style="width: 220px;">

                        </div>

                    </div>


                    <div class="table-responsive">

                        <table class="table promotion-table mb-0"
                               id="promotionTable">

                            <thead>

                            <tr>

                                <th style="width: 40px;">
                                    <input type="checkbox">
                                </th>

                                <th>
                                    Promoted Employee
                                </th>

                                <th>
                                    Department
                                </th>

                                <th>
                                    Designation From
                                </th>

                                <th>
                                    Designation To
                                </th>

                                <th>
                                    Promotion Date
                                </th>

                                <th>
                                    Action
                                </th>

                            </tr>

                            </thead>


                            <tbody>

                            <!-- =========================================
                                 DATABASE RECORDS
                                 Expected request attribute:
                                 promotions
                                 ========================================= -->

                            <c:choose>

                                <c:when test="${not empty promotions}">

                                    <c:forEach var="promotion"
                                               items="${promotions}">

                                        <tr>

                                            <td>
                                                <input type="checkbox"
                                                       value="${promotion.promotionId}">
                                            </td>


                                            <td>

                                                <div class="d-flex align-items-center">

                                                    <div class="employee-avatar">
                                                        ${promotion.firstName.substring(0,1)}
                                                    </div>

                                                    <span class="employee-name">

                                                        ${promotion.firstName}
                                                        ${promotion.lastName}

                                                    </span>

                                                </div>

                                            </td>


                                            <td>
                                                ${promotion.department}
                                            </td>


                                            <td>
                                                ${promotion.designationFrom}
                                            </td>


                                            <td>
                                                ${promotion.designationTo}
                                            </td>


                                            <td>
                                                ${promotion.date}
                                            </td>


                                            <td>

                                                <!-- Edit -->
                                                <a href="${pageContext.request.contextPath}/promotion?action=edit&id=${promotion.promotionId}"
                                                   class="action-btn edit-btn"
                                                   title="Edit">

                                                    <i class="ti ti-edit"></i>

                                                </a>


                                                <!-- Delete -->
                                                <form action="${pageContext.request.contextPath}/promotion"
                                                      method="post"
                                                      style="display: inline;">

                                                    <input type="hidden"
                                                           name="action"
                                                           value="delete">

                                                    <input type="hidden"
                                                           name="promotionId"
                                                           value="${promotion.promotionId}">

                                                    <button type="submit"
                                                            class="action-btn delete-btn"
                                                            title="Delete"
                                                            onclick="return confirm('Are you sure you want to delete this promotion?');">

                                                        <i class="ti ti-trash"></i>

                                                    </button>

                                                </form>

                                        </tr>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <tr>

                                        <td colspan="7"
                                            class="text-center py-4 text-muted">

                                            No promotion records found.

                                        </td>

                                    </tr>

                                </c:otherwise>

                            </c:choose>

                            </tbody>

                        </table>

                    </div>


                    <!-- ================= FOOTER ================= -->

                    <div class="d-flex justify-content-between
                                align-items-center mt-4">

                        <span class="text-muted">

                            Showing
                            ${not empty promotions ? promotions.size() : 0}
                            entries

                        </span>

                    </div>

                </div>

            </div>


        </div>

    </div>


</div>


<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- ================= SEARCH ================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const searchInput =
            document.getElementById("promotionSearch");

        const table =
            document.getElementById("promotionTable");

        searchInput.addEventListener("keyup", function () {

            const searchValue =
                searchInput.value.toLowerCase();

            const rows =
                table.querySelectorAll("tbody tr");

            rows.forEach(function (row) {

                const text =
                    row.textContent.toLowerCase();

                row.style.display =
                    text.includes(searchValue) ? "" : "none";

            });

        });

    });

</script>


</body>

</html>