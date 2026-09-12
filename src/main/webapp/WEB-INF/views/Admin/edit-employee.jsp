<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%!
    String toProfileUrl(String contextPath, String profilePicture) {
        if (profilePicture == null) {
            return null;
        }
        String path = profilePicture.trim().replace('\\', '/');
        if (path.isEmpty()) {
            return null;
        }
        if (path.startsWith("http://") || path.startsWith("https://")) {
            return path;
        }
        while (path.startsWith("/")) {
            path = path.substring(1);
        }
        if (!path.contains("/")) {
            path = "Content/uploads/" + path;
        }
        StringBuilder url = new StringBuilder(contextPath);
        for (String part : path.split("/")) {
            if (part.isEmpty()) {
                continue;
            }
            url.append('/').append(URLEncoder.encode(part, StandardCharsets.UTF_8).replace("+", "%20"));
        }
        return url.toString();
    }
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

    <meta name="description" content="HRMS - Employee Management">
    <meta name="keywords" content="HRMS, employee, admin, employee management">
    <meta name="author" content="HRMS">
    <meta name="robots" content="noindex, nofollow">

    <title>Edit Employee | HRMS</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon"
          href="${pageContext.request.contextPath}/assets/img/favicon.png">

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180"
          href="${pageContext.request.contextPath}/assets/img/apple-touch-icon.png">

    <!-- Theme Script -->
    <script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">

    <!-- Feather CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/icons/feather/feather.css">

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/tabler-icons/tabler-icons.css">

    <!-- Select2 CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/select2/css/select2.min.css">

    <!-- Fontawesome CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/fontawesome.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/fontawesome/css/all.min.css">

    <!-- Flatpickr -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/flatpickr/flatpickr.min.css">

    <!-- Daterangepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.css">

    <!-- Datatable -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/dataTables.bootstrap5.min.css">

    <!-- Datetimepicker -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/bootstrap-datetimepicker.min.css">

    <!-- Bootstrap Tagsinput -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

    <!-- Main CSS -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/assets/css/style.css">
</head>

<body>

<!-- Global Loader -->
<div id="global-loader" style="display: none;">
    <div class="page-loader"></div>
</div>


 <%@ include file="adminHeader.jsp" %>
    <%@ include file="adminSidebar.jsp" %>

<!-- ================= MAIN WRAPPER ================= -->

<div class="main-wrapper">

    <!-- ================= PAGE WRAPPER ================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- Page Header -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto mb-2">

                    <h2 class="mb-1">
                        Edit Employee
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/dashboard">

                                    <i class="ti ti-smart-home"></i>

                                </a>

                            </li>

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/employees?action=list">

                                    Employees

                                </a>

                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Edit Employee

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- Edit Employee Card -->

            <div class="card">

                <div class="card-header">

                    <h5 class="card-title">
                        Edit Employee
                    </h5>

                </div>


                <form id="editEmployeeForm"
                      action="${pageContext.request.contextPath}/admin/employees"
                      method="post"
                      enctype="multipart/form-data"
                      novalidate>

                    <input type="hidden"
                           name="action"
                           value="update">

                    <input type="hidden"
                           name="userId"
                           value="${employee.userId}">


                    <div class="card-body">


                        <!-- Profile Picture -->

                        <div class="row">

                            <div class="col-md-12">

                                <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                    <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark">

                                        <c:choose>

                                            <c:when test="${not empty employee.profilePicture}">
                                                <c:set var="editPicPath" value="${employee.profilePicture}"/>
                                                <%
                                                    String editImg = toProfileUrl(
                                                            request.getContextPath(),
                                                            (String) pageContext.getAttribute("editPicPath")
                                                    );
                                                    pageContext.setAttribute("editProfileImg", editImg);
                                                %>
                                                <img src="${editProfileImg}"
                                                     alt="Profile Picture"
                                                     class="rounded-circle"
                                                     style="width: 100%; height: 100%; object-fit: cover;"
                                                     onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/assets/img/users/user-32.jpg';">

                                            </c:when>

                                            <c:otherwise>

                                                <i class="ti ti-photo text-gray-2 fs-16"></i>

                                            </c:otherwise>

                                        </c:choose>

                                    </div>


                                    <div class="profile-upload">

                                        <div class="mb-2">

                                            <h6 class="mb-1">
                                                Upload Profile Image
                                            </h6>

                                            <p class="fs-12">
                                                Image should be below 4 MB
                                            </p>

                                        </div>


                                        <div class="profile-uploader d-flex align-items-center">

                                            <div class="drag-upload-btn btn btn-sm btn-primary me-2">

                                                Upload

                                                <input type="file"
                                                       class="form-control image-sign"
                                                       id="profilePicture"
                                                       name="profilePicture"
                                                       accept="image/*">

                                            </div>


                                            <button type="button"
                                                    class="btn btn-light btn-sm">

                                                Cancel

                                            </button>

                                        </div>


                                        <c:if test="${not empty employee.profilePicture}">

                                            <small class="text-muted d-block mt-2">

                                                Current file:
                                                ${employee.profilePicture}

                                            </small>

                                        </c:if>

                                    </div>

                                </div>

                            </div>

                        </div>


                        <!-- Employee Fields -->

                        <div class="row">


                            <!-- First Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        First Name
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           id="firstName"
                                           name="firstName"
                                           class="form-control"
                                           value="${employee.firstName}"
                                           required>
                                    <div class="invalid-feedback">Please enter a valid first name.</div>

                                </div>

                            </div>


                            <!-- Last Name -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Last Name
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           id="lastName"
                                           name="lastName"
                                           class="form-control"
                                           value="${employee.lastName}"
                                           required>
                                    <div class="invalid-feedback">Please enter a valid last name.</div>

                                </div>

                            </div>


                            <!-- Joining Date -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Joining Date
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="input-icon-end position-relative">

                                        <input type="date"
                                               id="dateOfJoining"
                                               name="dateOfJoining"
                                               class="form-control"
                                               value="${employee.dateOfJoining.toLocalDate()}"
                                               required>

                                        <span class="input-icon-addon">

                                            <i class="ti ti-calendar text-gray-7"></i>

                                        </span>

                                    </div>
                                    <div class="invalid-feedback">Please select joining date.</div>

                                </div>

                            </div>


                            <!-- Date Of Birth -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Date of Birth
                                        <span class="text-danger">*</span>

                                    </label>

                                    <div class="input-icon-end position-relative">

                                        <input type="date"
                                               id="dateOfBirth"
                                               name="dateOfBirth"
                                               class="form-control"
                                               value="${employee.dateOfBirth.toLocalDate()}"
                                               required>

                                        <span class="input-icon-addon">

                                            <i class="ti ti-calendar text-gray-7"></i>

                                        </span>

                                    </div>
                                    <div class="invalid-feedback">Please select date of birth.</div>

                                </div>

                            </div>


                            <!-- Email -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Email
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="email"
                                           id="email"
                                           name="email"
                                           class="form-control"
                                           value="${employee.email}"
                                           required>
                                    <div class="invalid-feedback">Please enter a valid email address.</div>

                                </div>

                            </div>


                            <!-- Password -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Password
                                    </label>

                                    <div class="pass-group">

                                        <input type="password"
                                               id="password"
                                               name="password"
                                               class="pass-input form-control">

                                        <span class="ti toggle-password ti-eye-off"></span>

                                    </div>
                                    <div class="invalid-feedback">Password must be at least 6 characters.</div>

                                    <small class="text-muted">
                                        Leave blank to keep the existing password.
                                    </small>

                                </div>

                            </div>


                            <!-- Confirm Password -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Confirm Password
                                    </label>

                                    <div class="pass-group">

                                        <input type="password"
                                               id="confirmPassword"
                                               name="confirmPassword"
                                               class="pass-inputs form-control">

                                        <span class="ti toggle-passwords ti-eye-off"></span>

                                    </div>
                                    <div class="invalid-feedback">Passwords must match.</div>

                                </div>

                            </div>


                            <!-- Phone -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Phone Number
                                        <span class="text-danger">*</span>

                                    </label>

                                    <input type="text"
                                           id="phoneNumber"
                                           name="phoneNumber"
                                           class="form-control"
                                           value="${employee.phoneNumber}"
                                           required>
                                    <div class="invalid-feedback">Please enter a valid 10-digit phone number.</div>

                                </div>

                            </div>


                            <!-- Gender -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Gender
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="gender"
                                            id="gender"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Gender
                                        </option>

                                        <option value="Male"
                                            ${employee.gender == 'Male' ? 'selected' : ''}>
                                            Male
                                        </option>

                                        <option value="Female"
                                            ${employee.gender == 'Female' ? 'selected' : ''}>
                                            Female
                                        </option>

                                        <option value="Other"
                                            ${employee.gender == 'Other' ? 'selected' : ''}>
                                            Other
                                        </option>

                                    </select>
                                    <div class="invalid-feedback">Please select gender.</div>

                                </div>

                            </div>


                            <!-- Role -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Role
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="roleId"
                                            id="roleId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Role
                                        </option>

                                        <c:forEach var="role"
                                                   items="${roles}">

                                            <option value="${role.roleId}"
                                                ${employee.roleId == role.roleId ? 'selected' : ''}>

                                                ${role.roleName}

                                            </option>

                                        </c:forEach>

                                    </select>
                                    <div class="invalid-feedback">Please select a role.</div>

                                </div>

                            </div>


                            <!-- Department -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Department
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="departmentId"
                                            id="departmentId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Department
                                        </option>

                                        <c:forEach var="department"
                                                   items="${departments}">

                                            <option value="${department.departmentId}"
                                                ${employee.departmentId == department.departmentId ? 'selected' : ''}>

                                                ${department.departmentName}

                                            </option>

                                        </c:forEach>

                                    </select>
                                    <div class="invalid-feedback">Please select a department.</div>

                                </div>

                            </div>


                            <!-- Designation -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Designation
                                        <span class="text-danger">*</span>

                                    </label>

                                    <select name="designationId"
                                            id="designationId"
                                            class="form-select"
                                            required>

                                        <option value="">
                                            Select Designation
                                        </option>

                                        <c:forEach var="designation"
                                                   items="${designations}">

                                            <option value="${designation.designationId}"
                                                ${employee.designationId == designation.designationId ? 'selected' : ''}>

                                                ${designation.designationName}

                                            </option>

                                        </c:forEach>

                                    </select>
                                    <div class="invalid-feedback">Please select a designation.</div>

                                </div>

                            </div>


                            <!-- Reporting Manager -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Reporting Manager
                                    </label>

                                    <select name="reportingManager"
                                            class="form-select">

                                        <option value="">
                                            Select Reporting Manager
                                        </option>

                                        <c:forEach var="manager"
                                                   items="${managers}">

                                            <option value="${manager.userId}"
                                                ${employee.reportingManager == manager.userId ? 'selected' : ''}>

                                                ${manager.firstName}
                                                ${manager.lastName}

                                            </option>

                                        </c:forEach>

                                    </select>

                                </div>

                            </div>


                            <!-- Status -->

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Status
                                    </label>

                                    <select name="status"
                                            class="form-select">

                                        <option value="Active"
                                            ${employee.status == 'Active' ? 'selected' : ''}>
                                            Active
                                        </option>

                                        <option value="Inactive"
                                            ${employee.status == 'Inactive' ? 'selected' : ''}>
                                            Inactive
                                        </option>

                                    </select>

                                </div>

                            </div>


                            <!-- Address -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">

                                        Address
                                        <span class="text-danger">*</span>

                                    </label>

                                    <textarea name="address"
                                              id="address"
                                              class="form-control"
                                              rows="3"
                                              required>${employee.address}</textarea>
                                    <div class="invalid-feedback">Please enter address.</div>

                                </div>

                            </div>


                            <!-- About Employee -->

                            <div class="col-md-12">

                                <div class="mb-3">

                                    <label class="form-label">

                                        About Employee
                                        <span class="text-danger">*</span>

                                    </label>

                                    <textarea name="aboutEmployee"
                                              id="aboutEmployee"
                                              class="form-control"
                                              rows="4"
                                              required>${employee.aboutEmployee}</textarea>
                                    <div class="invalid-feedback">Please enter about employee.</div>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- Form Footer -->

                    <div class="card-footer d-flex justify-content-end">

                        <a href="${pageContext.request.contextPath}/admin/employees?action=list"
                           class="btn btn-outline-light border me-2">

                            Cancel

                        </a>

                        <button type="submit"
                                class="btn btn-primary">

                            Update Employee

                        </button>

                    </div>

                </form>

            </div>

        </div>


        <!-- Footer -->

        <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

            <p class="mb-0">
                2014 - 2025 &copy; SmartHR.
            </p>

            <p>
                Designed &amp; Developed By

                <a href="javascript:void(0);"
                   class="text-primary">

                    Dreams

                </a>

            </p>

        </div>

    </div>

</div>


<!-- ================= JAVASCRIPT ================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/feather.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.slimscroll.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/jquery.dataTables.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/dataTables.bootstrap5.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/moment.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/daterangepicker/daterangepicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap-datetimepicker.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/select2/js/select2.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/apexcharts.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/apexchart/chart-data.js"></script>

<script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-colorpicker.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

<script>
    (function () {
        var form = document.getElementById('editEmployeeForm');
        if (!form) return;

        function showError(el, message) {
            el.classList.add('is-invalid');
            el.classList.remove('is-valid');
            var feedback = el.parentElement.querySelector('.invalid-feedback')
                || (el.closest('.mb-3') && el.closest('.mb-3').querySelector('.invalid-feedback'));
            if (feedback && message) feedback.textContent = message;
        }

        function clearError(el) {
            el.classList.remove('is-invalid');
            el.classList.add('is-valid');
        }

        form.addEventListener('submit', function (e) {
            var valid = true;
            var nameRegex = /^[A-Za-z][A-Za-z\s.'-]{1,49}$/;
            var phoneRegex = /^[0-9]{10}$/;
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

            var firstName = form.firstName;
            var lastName = form.lastName;
            var email = form.email;
            var password = form.password;
            var confirmPassword = form.confirmPassword;
            var phoneNumber = form.phoneNumber;
            var gender = form.gender;
            var roleId = form.roleId;
            var departmentId = form.departmentId;
            var designationId = form.designationId;
            var dateOfJoining = form.dateOfJoining;
            var dateOfBirth = form.dateOfBirth;
            var address = form.address;
            var aboutEmployee = form.aboutEmployee;
            var profilePicture = form.profilePicture;

            [firstName, lastName, email, password, confirmPassword, phoneNumber, gender, roleId,
                departmentId, designationId, dateOfJoining, dateOfBirth, address, aboutEmployee]
                .forEach(function (el) {
                    if (el) el.classList.remove('is-invalid', 'is-valid');
                });

            if (!nameRegex.test((firstName.value || '').trim())) {
                showError(firstName, 'First name must be 2-50 letters.');
                valid = false;
            } else clearError(firstName);

            if (!nameRegex.test((lastName.value || '').trim())) {
                showError(lastName, 'Last name must be 2-50 letters.');
                valid = false;
            } else clearError(lastName);

            if (!emailRegex.test((email.value || '').trim())) {
                showError(email, 'Please enter a valid email address.');
                valid = false;
            } else clearError(email);

            if (password.value) {
                if (password.value.length < 6) {
                    showError(password, 'Password must be at least 6 characters.');
                    valid = false;
                } else clearError(password);

                if (confirmPassword.value !== password.value) {
                    showError(confirmPassword, 'Passwords must match.');
                    valid = false;
                } else clearError(confirmPassword);
            } else if (confirmPassword.value) {
                showError(confirmPassword, 'Passwords must match.');
                valid = false;
            }

            if (!phoneRegex.test((phoneNumber.value || '').trim())) {
                showError(phoneNumber, 'Please enter a valid 10-digit phone number.');
                valid = false;
            } else clearError(phoneNumber);

            if (!gender.value) {
                showError(gender, 'Please select gender.');
                valid = false;
            } else clearError(gender);

            if (!roleId.value) {
                showError(roleId, 'Please select a role.');
                valid = false;
            } else clearError(roleId);

            if (!departmentId.value) {
                showError(departmentId, 'Please select a department.');
                valid = false;
            } else clearError(departmentId);

            if (!designationId.value) {
                showError(designationId, 'Please select a designation.');
                valid = false;
            } else clearError(designationId);

            if (!dateOfJoining.value) {
                showError(dateOfJoining, 'Please select joining date.');
                valid = false;
            } else clearError(dateOfJoining);

            if (!dateOfBirth.value) {
                showError(dateOfBirth, 'Please select date of birth.');
                valid = false;
            } else {
                var dob = new Date(dateOfBirth.value);
                var today = new Date();
                var age = today.getFullYear() - dob.getFullYear();
                var m = today.getMonth() - dob.getMonth();
                if (m < 0 || (m === 0 && today.getDate() < dob.getDate())) age--;
                if (age < 18) {
                    showError(dateOfBirth, 'Employee must be at least 18 years old.');
                    valid = false;
                } else clearError(dateOfBirth);
            }

            if (!(address.value || '').trim()) {
                showError(address, 'Please enter address.');
                valid = false;
            } else clearError(address);

            if (!(aboutEmployee.value || '').trim()) {
                showError(aboutEmployee, 'Please enter about employee.');
                valid = false;
            } else clearError(aboutEmployee);

            if (profilePicture && profilePicture.files && profilePicture.files[0]) {
                var file = profilePicture.files[0];
                var allowed = ['image/jpeg', 'image/png', 'image/jpg', 'image/webp', 'image/gif'];
                if (allowed.indexOf(file.type) === -1) {
                    alert('Profile image must be JPG, PNG, WEBP or GIF.');
                    valid = false;
                } else if (file.size > 4 * 1024 * 1024) {
                    alert('Profile image must be below 4 MB.');
                    valid = false;
                }
            }

            if (!valid) {
                e.preventDefault();
                e.stopPropagation();
                var firstInvalid = form.querySelector('.is-invalid');
                if (firstInvalid) firstInvalid.focus();
            }
        });
    })();
</script>

</body>

</html>