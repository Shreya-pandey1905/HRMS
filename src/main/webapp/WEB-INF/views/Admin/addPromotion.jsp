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

    <title>
        ${empty promotion ? 'Add Promotion' : 'Edit Promotion'} - HRMS
    </title>


    <!-- Bootstrap -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">


    <!-- Tabler Icons -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">


    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">


    <!-- Flatpickr -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">


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

        .form-label {
            font-weight: 500;
            color: #1f2d5a;
        }

        .promote-btn {
            background: #ff6b35;
            border-color: #ff6b35;
            color: #fff;
        }

        .promote-btn:hover {
            background: #e85b29;
            border-color: #e85b29;
            color: #fff;
        }

        #calendarBtn {
            cursor: pointer;
        }

        .flatpickr-calendar {
            border-radius: 8px;
            box-shadow: 0 5px 25px rgba(0, 0, 0, 0.15);
        }

        .flatpickr-day.selected,
        .flatpickr-day.selected:hover {
            background: #ff6b35;
            border-color: #ff6b35;
        }

        .flatpickr-day.today {
            border-color: #ff6b35;
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

                <div class="row">

                    <div class="col-sm-12">

                        <h4 class="page-title">

                            ${empty promotion
                                ? 'Add Promotion'
                                : 'Edit Promotion'}

                        </h4>


                        <p class="text-muted">

                            ${empty promotion
                                ? 'Promote an employee to a new designation'
                                : 'Update employee promotion details'}

                        </p>

                    </div>

                </div>

            </div>


            <!-- ================= FORM ================= -->

            <div class="row">

                <div class="col-md-8 col-lg-7">

                    <div class="card promotion-card">

                        <div class="card-body">


                            <h5 class="promotion-title mb-4">

                                ${empty promotion
                                    ? 'Add Promotion'
                                    : 'Edit Promotion'}

                            </h5>


                            <form action="${pageContext.request.contextPath}/promotion"
                                  method="post">


                                <!-- ================= ACTION ================= -->

                                <input type="hidden"
                                       name="action"
                                       value="${empty promotion ? 'add' : 'edit'}">


                                <!-- ================= PROMOTION ID ================= -->

                                <c:if test="${not empty promotion}">

                                    <input type="hidden"
                                           name="promotionId"
                                           value="${promotion.promotionId}">

                                </c:if>


                                <!-- ================= EMPLOYEE ================= -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Employee
                                    </label>


                                    <select name="userId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Employee
                                        </option>


                                        <c:forEach var="user"
                                                   items="${users}">

                                            <option value="${user.userId}"
                                                ${not empty promotion &&
                                                  promotion.userId == user.userId
                                                  ? 'selected'
                                                  : ''}>

                                                ${user.firstName}
                                                ${user.lastName}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>


                                <!-- ================= CURRENT DESIGNATION ================= -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        Current Designation
                                    </label>


                                    <select name="designationFrom"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Current Designation
                                        </option>


                                        <c:forEach var="designation"
                                                   items="${designations}">

                                            <option value="${designation.name}"
                                                ${not empty promotion &&
                                                  promotion.designationFrom == designation.name
                                                  ? 'selected'
                                                  : ''}>

                                                ${designation.name}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>


                                <!-- ================= NEW DESIGNATION ================= -->

                                <div class="mb-3">

                                    <label class="form-label">
                                        New Designation
                                    </label>


                                    <select name="designationTo"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select New Designation
                                        </option>


                                        <c:forEach var="designation"
                                                   items="${designations}">

                                            <option value="${designation.name}"
                                                ${not empty promotion &&
                                                  promotion.designationTo == designation.name
                                                  ? 'selected'
                                                  : ''}>

                                                ${designation.name}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>


                                <!-- ================= PROMOTION DATE ================= -->

                                <div class="mb-4">

                                    <label class="form-label">
                                        Promotion Date
                                    </label>


                                    <div class="input-group">

                                        <input type="text"
                                               id="promotionDate"
                                               name="date"
                                               class="form-control"
                                               placeholder="dd-mm-yyyy"
                                               autocomplete="off"
                                               required>


                                        <button type="button"
                                                id="calendarBtn"
                                                class="btn btn-outline-secondary">

                                            <i class="ti ti-calendar"></i>

                                        </button>

                                    </div>

                                </div>


                                <!-- ================= BUTTONS ================= -->

                                <div class="d-flex gap-2">


                                    <button type="submit"
                                            class="btn promote-btn">

                                        <i class="ti ti-check me-1"></i>

                                        ${empty promotion
                                            ? 'Promote Employee'
                                            : 'Save Changes'}

                                    </button>


                                    <a href="${pageContext.request.contextPath}/promotion"
                                       class="btn btn-light">

                                        Cancel

                                    </a>


                                </div>


                            </form>


                        </div>

                    </div>

                </div>

            </div>


        </div>

    </div>


</div>


<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>


<!-- ================= DATE PICKER ================= -->

<script>

    document.addEventListener("DOMContentLoaded", function () {

        const dateInput =
            document.getElementById("promotionDate");

        const calendarBtn =
            document.getElementById("calendarBtn");


        /*
         * When editing:
         * promotion.date will look like:
         *
         * 2026-09-17T00:00
         *
         * We only need:
         *
         * 2026-09-17
         */

        const existingDate =
            "${empty promotion ? '' : promotion.date}";


        const datePicker =
            flatpickr(dateInput, {

                dateFormat: "d/m/Y",

                altInput: true,

                altFormat: "d-m-Y",

                allowInput: true,

                clickOpens: true,

                disableMobile: true,

                defaultDate:
                    existingDate
                        ? existingDate.substring(0, 10)
                        : new Date()

            });


        calendarBtn.addEventListener(
            "click",
            function () {

                datePicker.open();

            }
        );

    });

</script>


</body>

</html>