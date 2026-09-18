<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Add Education Details | HRMS</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">

</head>

<body>

<div class="main-wrapper">

    <%@ include file="adminHeader.jsp" %>

    <%@ include file="adminSidebar.jsp" %>

    <div class="page-wrapper">

        <div class="content">

            <div class="page-header">

                <div class="page-title">

                    <h4>Add Education Details</h4>

                    <h6>Add employee education information</h6>

                </div>

            </div>

            <div class="card">

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/employee/education/add"
                          method="post"
                          id="educationForm"
                          novalidate>

                        <input type="hidden"
                               name="userId"
                               value="${userId}">

                        <div class="row">

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Education Type
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           id="educationType"
                                           name="educationType"
                                           class="form-control"
                                           required>

                                    <div class="invalid-feedback">
                                        Education type is required.
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        University Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           id="universityName"
                                           name="universityName"
                                           class="form-control"
                                           required>

                                    <div class="invalid-feedback">
                                        University name is required.
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Start Date
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="datetime-local"
                                           id="startDate"
                                           name="startDate"
                                           class="form-control"
                                           required>

                                    <div class="invalid-feedback"
                                         id="startDateFeedback">
                                        Start date is required.
                                    </div>

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        End Date
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="datetime-local"
                                           id="endDate"
                                           name="endDate"
                                           class="form-control"
                                           required>

                                    <div class="invalid-feedback"
                                         id="endDateFeedback">
                                        End date is required.
                                    </div>

                                </div>

                            </div>

                        </div>

                        <button type="submit"
                                class="btn btn-primary">

                            <i class="ti ti-plus me-1"></i>

                            Add Education

                        </button>

                        <a href="${pageContext.request.contextPath}/employee/details?userId=${userId}"
                           class="btn btn-secondary">

                            Cancel

                        </a>

                    </form>

                </div>

            </div>

        </div>

    </div>

</div>

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>

    (function () {

        var form = document.getElementById('educationForm');

        var educationTypeInput = document.getElementById('educationType');
        var universityNameInput = document.getElementById('universityName');
        var startDateInput = document.getElementById('startDate');
        var endDateInput = document.getElementById('endDate');

        var startDateFeedback = document.getElementById('startDateFeedback');
        var endDateFeedback = document.getElementById('endDateFeedback');

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

        function setStartDateMax() {
            startDateInput.setAttribute(
                'max',
                toDateTimeLocalString(new Date())
            );
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

                startDateFeedback.textContent =
                    'Start date is required.';

                setFieldValidity(startDateInput, false);

                return false;
            }

            var startDate = new Date(startDateInput.value);
            var now = new Date();

            if (startDate.getTime() > now.getTime()) {

                startDateFeedback.textContent =
                    'Start date cannot be in the future.';

                setFieldValidity(startDateInput, false);

                return false;
            }

            setFieldValidity(startDateInput, true);

            return true;
        }

        function validateEndDate() {

            if (endDateInput.value === '') {

                endDateFeedback.textContent =
                    'End date is required.';

                setFieldValidity(endDateInput, false);

                return false;
            }

            if (startDateInput.value !== '') {

                var startDate =
                    new Date(startDateInput.value);

                var endDate =
                    new Date(endDateInput.value);

                if (endDate.getTime() < startDate.getTime()) {

                    endDateFeedback.textContent =
                        'End date cannot be earlier than the start date.';

                    setFieldValidity(endDateInput, false);

                    return false;
                }
            }

            setFieldValidity(endDateInput, true);

            return true;
        }

        educationTypeInput.addEventListener('input', function () {
            validateRequired(educationTypeInput);
        });

        universityNameInput.addEventListener('input', function () {
            validateRequired(universityNameInput);
        });

        startDateInput.addEventListener('change', function () {

            validateStartDate();

            if (endDateInput.value !== '') {
                validateEndDate();
            }

        });

        endDateInput.addEventListener('change', function () {
            validateEndDate();
        });

        form.addEventListener('submit', function (event) {

            var isEducationTypeValid =
                validateRequired(educationTypeInput);

            var isUniversityNameValid =
                validateRequired(universityNameInput);

            var isStartDateValid =
                validateStartDate();

            var isEndDateValid =
                validateEndDate();

            var isFormValid =
                isEducationTypeValid &&
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