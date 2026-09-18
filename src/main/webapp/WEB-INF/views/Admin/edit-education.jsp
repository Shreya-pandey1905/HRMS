<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Edit Education Details | HRMS</title>

    <link rel="shortcut icon"
          type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <!-- HEADER -->

    <%@ include file="adminHeader.jsp" %>

    <!-- SIDEBAR -->

    <%@ include file="adminSidebar.jsp" %>

    <!-- PAGE -->

    <div class="page-wrapper">

        <div class="content">

            <!-- BREADCRUMB -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">
                        Edit Education Details
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/employees">
                                    Employees
                                </a>

                            </li>

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/employee/details?userId=${educationDetails.userId}">
                                    Employee Details
                                </a>

                            </li>

                            <li class="breadcrumb-item active">

                                Edit Education Details

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>

            <!-- FORM CARD -->

            <div class="row">

                <div class="col-xl-8 col-lg-10">

                    <div class="card">

                        <div class="card-header">

                            <h5 class="card-title mb-0">
                                Education Details
                            </h5>

                        </div>

                        <div class="card-body">

                            <form method="post"
                                  id="educationForm"
                                  action="${pageContext.request.contextPath}/employee/education/edit"
                                  novalidate>

                                <!-- EDUCATION ID -->

                                <input type="hidden"
                                       name="educationDetailsId"
                                       value="${educationDetails.educationDetailsId}">

                                <!-- USER ID -->

                                <input type="hidden"
                                       name="userId"
                                       value="${educationDetails.userId}">

                                <div class="row">

                                    <!-- EDUCATION TYPE -->

                                    <div class="col-md-6">

                                        <div class="mb-3">

                                            <label class="form-label">
                                                Education Type
                                            </label>

                                            <input type="text"
                                                   id="educationType"
                                                   name="educationType"
                                                   class="form-control"
                                                   value="${educationDetails.educationType}"
                                                   required>

                                            <div class="invalid-feedback">
                                                Education type is required.
                                            </div>

                                        </div>

                                    </div>

                                    <!-- UNIVERSITY -->

                                    <div class="col-md-6">

                                        <div class="mb-3">

                                            <label class="form-label">
                                                University Name
                                            </label>

                                            <input type="text"
                                                   id="universityName"
                                                   name="universityName"
                                                   class="form-control"
                                                   value="${educationDetails.universityName}"
                                                   required>

                                            <div class="invalid-feedback">
                                                University name is required.
                                            </div>

                                        </div>

                                    </div>

                                    <!-- START DATE -->

                                    <div class="col-md-6">

                                        <div class="mb-3">

                                            <label class="form-label">
                                                Start Date
                                            </label>

                                            <input type="datetime-local"
                                                   id="startDate"
                                                   name="startDate"
                                                   class="form-control"
                                                   value="${educationDetails.startdate}"
                                                   required>

                                            <div class="invalid-feedback" id="startDateFeedback">
                                                Start date is required.
                                            </div>

                                        </div>

                                    </div>

                                    <!-- END DATE -->

                                    <div class="col-md-6">

                                        <div class="mb-3">

                                            <label class="form-label">
                                                End Date
                                            </label>

                                            <input type="datetime-local"
                                                   id="endDate"
                                                   name="endDate"
                                                   class="form-control"
                                                   value="${educationDetails.enddate}"
                                                   required>

                                            <div class="invalid-feedback" id="endDateFeedback">
                                                End date is required.
                                            </div>

                                        </div>

                                    </div>

                                </div>

                                <!-- BUTTONS -->

                                <div class="d-flex align-items-center justify-content-end mt-3">

                                    <a href="${pageContext.request.contextPath}/employee/details?userId=${educationDetails.userId}"
                                       class="btn btn-light me-2">

                                        Cancel

                                    </a>

                                    <button type="submit"
                                            class="btn btn-primary">

                                        <i class="ti ti-check me-1"></i>

                                        Update Education Details

                                    </button>

                                </div>

                            </form>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>

<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<!-- EDUCATION FORM VALIDATION -->

<script>
    (function () {

        var form = document.getElementById('educationForm');

        var educationTypeInput = document.getElementById('educationType');
        var universityNameInput = document.getElementById('universityName');
        var startDateInput = document.getElementById('startDate');
        var endDateInput = document.getElementById('endDate');

        var startDateFeedback = document.getElementById('startDateFeedback');
        var endDateFeedback = document.getElementById('endDateFeedback');

        // Format a Date object as "YYYY-MM-DDTHH:mm" for datetime-local inputs/comparisons.
        function toDateTimeLocalString(date) {

            var pad = function (num) {
                return String(num).padStart(2, '0');
            };

            return date.getFullYear() + '-' +
                pad(date.getMonth() + 1) + '-' +
                pad(date.getDate()) + 'T' +
                pad(date.getHours()) + ':' +
                pad(date.getMinutes());
        }

        // Prevent picking a future start date directly in the date picker.
        function setStartDateMax() {
            startDateInput.setAttribute('max', toDateTimeLocalString(new Date()));
        }

        setStartDateMax();

        function setFieldValidity(input, isValid) {

            if (isValid) {
                input.classList.remove('is-invalid');
                input.classList.add('is-valid');
            } else {
                input.classList.remove('is-valid');
                input.classList.add('is-invalid');
            }
        }

        function validateRequired(input) {

            var isValid = input.value.trim() !== '';

            setFieldValidity(input, isValid);

            return isValid;
        }

        function validateStartDate() {

            if (startDateInput.value === '') {
                startDateFeedback.textContent = 'Start date is required.';
                setFieldValidity(startDateInput, false);
                return false;
            }

            var startDate = new Date(startDateInput.value);
            var now = new Date();

            if (startDate.getTime() > now.getTime()) {
                startDateFeedback.textContent = 'Start date cannot be in the future.';
                setFieldValidity(startDateInput, false);
                return false;
            }

            setFieldValidity(startDateInput, true);
            return true;
        }

        function validateEndDate() {

            if (endDateInput.value === '') {
                endDateFeedback.textContent = 'End date is required.';
                setFieldValidity(endDateInput, false);
                return false;
            }

            if (startDateInput.value !== '') {

                var startDate = new Date(startDateInput.value);
                var endDate = new Date(endDateInput.value);

                if (endDate.getTime() < startDate.getTime()) {
                    endDateFeedback.textContent = 'End date cannot be earlier than the start date.';
                    setFieldValidity(endDateInput, false);
                    return false;
                }
            }

            setFieldValidity(endDateInput, true);
            return true;
        }

        // Live validation as the user interacts with the fields.
        educationTypeInput.addEventListener('input', function () {
            validateRequired(educationTypeInput);
        });

        universityNameInput.addEventListener('input', function () {
            validateRequired(universityNameInput);
        });

        startDateInput.addEventListener('change', function () {
            validateStartDate();
            // End date depends on start date, so re-check it too.
            if (endDateInput.value !== '') {
                validateEndDate();
            }
        });

        endDateInput.addEventListener('change', function () {
            validateEndDate();
        });

        form.addEventListener('submit', function (event) {

            var isEducationTypeValid = validateRequired(educationTypeInput);
            var isUniversityNameValid = validateRequired(universityNameInput);
            var isStartDateValid = validateStartDate();
            var isEndDateValid = validateEndDate();

            var isFormValid = isEducationTypeValid &&
                isUniversityNameValid &&
                isStartDateValid &&
                isEndDateValid;

            if (!isFormValid) {
                event.preventDefault();
                event.stopPropagation();
            }
        });

    })();
</script>

</body>

</html>
