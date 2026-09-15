<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${empty termination ? 'Add Termination' : 'Edit Termination'} - HRMS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">

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

        .termination-card {
            border: 1px solid #e9ecef;
            border-radius: 10px;
            background: #fff;
        }

        .termination-title {
            font-size: 20px;
            font-weight: 600;
            color: #1f2d5a;
        }

        .termination-btn {
            background: #ff6b35;
            border-color: #ff6b35;
            color: #fff;
        }

        .termination-btn:hover {
            background: #e85b29;
            border-color: #e85b29;
            color: #fff;
        }

        #noticeCalendarBtn,
        #resignCalendarBtn {
            cursor: pointer;
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

    <div class="header">
        <div class="main-header">
            <div class="header-left">
                <a href="${pageContext.request.contextPath}/admin/dashboard" class="logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo.svg" alt="HRMS Logo">
                </a>

                <a href="${pageContext.request.contextPath}/admin/dashboard" class="dark-logo">
                    <img src="${pageContext.request.contextPath}/assets/img/logo-white.svg" alt="HRMS Logo">
                </a>
            </div>

            <a id="mobile_btn" class="mobile_btn" href="#sidebar">
                <span class="bar-icon"><span></span><span></span><span></span></span>
            </a>

            <div class="header-user">
                <div class="nav user-menu nav-list">
                    <div class="me-auto d-flex align-items-center" id="header-search">
                        <a id="toggle_btn" href="javascript:void(0);" class="btn btn-menubar me-1">
                            <i class="ti ti-arrow-bar-to-left"></i>
                        </a>

                        <div class="input-group input-group-flat d-inline-flex me-1">
                            <span class="input-icon-addon"><i class="ti ti-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search in HRMS">
                            <span class="input-group-text"><kbd>CTRL + /</kbd></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="adminSidebar.jsp"/>

    <div class="page-wrapper">
        <div class="content">

            <div class="page-header">
                <div class="row">
                    <div class="col-sm-12">
                        <h4 class="page-title">
                            ${empty termination ? 'Add Termination' : 'Edit Termination'}
                        </h4>

                        <p class="text-muted">
                            ${empty termination
                                ? 'Record an employee termination'
                                : 'Update employee termination details'}
                        </p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-8 col-lg-7">
                    <div class="card termination-card">
                        <div class="card-body">

                            <h5 class="termination-title mb-4">
                                ${empty termination ? 'Add Termination' : 'Edit Termination'}
                            </h5>

                            <form action="${pageContext.request.contextPath}/termination" method="post">

                                <input type="hidden"
                                       name="action"
                                       value="${empty termination ? 'add' : 'edit'}">

                                <c:if test="${not empty termination}">
                                    <input type="hidden"
                                           name="terminationId"
                                           value="${termination.terminationId}">
                                </c:if>

                                <!-- EMPLOYEE -->
                                <div class="mb-3">
                                    <label class="form-label">Terminated Employee</label>

                                    <select name="userId" class="form-select" required>
                                        <option value="">Select Employee</option>

                                        <c:forEach var="user" items="${users}">
                                            <option value="${user.userId}"
                                                ${not empty termination && termination.userId == user.userId
                                                  ? 'selected'
                                                  : ''}>
                                                ${user.firstName} ${user.lastName}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </div>

                                <!-- TERMINATION TYPE -->
                                <div class="mb-3">
                                    <label class="form-label">Termination Type</label>

                                    <select name="terminationType" class="form-select" required>
                                        <option value="">Select</option>
                                        <option value="Retirement"
                                            ${termination.terminationType == 'Retirement' ? 'selected' : ''}>
                                            Retirement
                                        </option>
                                        <option value="Insubordination"
                                            ${termination.terminationType == 'Insubordination' ? 'selected' : ''}>
                                            Insubordination
                                        </option>
                                        <option value="Layoff"
                                            ${termination.terminationType == 'Layoff' ? 'selected' : ''}>
                                            Layoff
                                        </option>
                                        <option value="Lack of Skills"
                                            ${termination.terminationType == 'Lack of Skills' ? 'selected' : ''}>
                                            Lack of Skills
                                        </option>
                                        <option value="Breach of Contract"
                                            ${termination.terminationType == 'Breach of Contract' ? 'selected' : ''}>
                                            Breach of Contract
                                        </option>
                                    </select>
                                </div>

                                <!-- NOTICE DATE -->
                                <div class="mb-3">
                                    <label class="form-label">Notice Date</label>

                                    <div class="input-group">
                                        <input type="text"
                                               id="noticeDate"
                                               name="noticeDate"
                                               class="form-control"
                                               placeholder="dd/mm/yyyy"
                                               value="${termination.noticeDateInput}"
                                               autocomplete="off"
                                               required>

                                        <button type="button"
                                                id="noticeCalendarBtn"
                                                class="btn btn-outline-secondary">
                                            <i class="ti ti-calendar"></i>
                                        </button>
                                    </div>
                                </div>

                                <!-- REASON -->
                                <div class="mb-3">
                                    <label class="form-label">Reason</label>

                                    <textarea name="reason"
                                              class="form-control"
                                              rows="4"
                                              required>${empty termination ? '' : termination.reason}</textarea>
                                </div>

                                <!-- RESIGNATION DATE -->
                                <div class="mb-4">
                                    <label class="form-label">Resignation Date</label>

                                    <div class="input-group">
                                        <input type="text"
                                               id="resignDate"
                                               name="resignDate"
                                               class="form-control"
                                               placeholder="dd/mm/yyyy"
                                               value="${termination.resignDateInput}"
                                               autocomplete="off"
                                               required>

                                        <button type="button"
                                                id="resignCalendarBtn"
                                                class="btn btn-outline-secondary">
                                            <i class="ti ti-calendar"></i>
                                        </button>
                                    </div>
                                </div>

                                <!-- BUTTONS -->
                                <div class="d-flex gap-2">
                                    <button type="submit" class="btn termination-btn">
                                        <i class="ti ti-check me-1"></i>
                                        ${empty termination ? 'Add Termination' : 'Save Changes'}
                                    </button>

                                    <a href="${pageContext.request.contextPath}/termination"
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

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>
    document.addEventListener("DOMContentLoaded", function () {

        const noticeInput = document.getElementById("noticeDate");
        const noticeBtn = document.getElementById("noticeCalendarBtn");
        const resignInput = document.getElementById("resignDate");
        const resignBtn = document.getElementById("resignCalendarBtn");

        const existingNoticeDate = "${termination.noticeDateInput}";
        const existingResignDate = "${termination.resignDateInput}";

        const noticePicker = flatpickr(noticeInput, {
            dateFormat: "d/m/Y",
            altInput: true,
            altFormat: "d-m-Y",
            allowInput: true,
            clickOpens: true,
            disableMobile: true,
            defaultDate: existingNoticeDate || new Date()
        });

        const resignPicker = flatpickr(resignInput, {
            dateFormat: "d/m/Y",
            altInput: true,
            altFormat: "d-m-Y",
            allowInput: true,
            clickOpens: true,
            disableMobile: true,
            defaultDate: existingResignDate || new Date()
        });

        noticeBtn.addEventListener("click", function () {
            noticePicker.open();
        });

        resignBtn.addEventListener("click", function () {
            resignPicker.open();
        });
    });
</script>

</body>
</html>
