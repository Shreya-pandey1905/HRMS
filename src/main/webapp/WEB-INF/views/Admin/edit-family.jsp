<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Edit Family Details | HRMS</title>

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
                    <h4>Edit Family Details</h4>
                    <h6>Update employee family information</h6>
                </div>

            </div>

            <div class="card">

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/employee/family/edit"
                          method="post"
                          onsubmit="return validateFamilyForm()">

                        <input type="hidden"
                               name="familyDetailId"
                               value="${familyDetails.familyDetailId}">

                        <input type="hidden"
                               name="userId"
                               value="${familyDetails.userId}">

                        <div class="row">

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="name"
                                           class="form-control"
                                           value="${familyDetails.name}"
                                           required
                                           pattern="[A-Za-z ]+"
                                           maxlength="100"
                                           title="Name should contain only letters and spaces">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Relation
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="relation"
                                           class="form-control"
                                           value="${familyDetails.relation}"
                                           required
                                           pattern="[A-Za-z ]+"
                                           maxlength="50"
                                           title="Relation should contain only letters and spaces">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Date of Birth
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="datetime-local"
                                           name="dateOfBirth"
                                           id="dateOfBirth"
                                           class="form-control"
                                           value="${familyDetails.dateOfBirth}"
                                           required>

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Phone
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="phone"
                                           class="form-control"
                                           value="${familyDetails.phone}"
                                           required
                                           pattern="[0-9]{10}"
                                           minlength="10"
                                           maxlength="10"
                                           inputmode="numeric"
                                           title="Phone number must contain exactly 10 digits">

                                </div>

                            </div>

                        </div>

                        <button type="submit"
                                class="btn btn-primary">

                            <i class="ti ti-edit me-1"></i>
                            Update Family Details

                        </button>

                        <a href="${pageContext.request.contextPath}/employee/details?userId=${familyDetails.userId}"
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

    function validateFamilyForm() {

        const dateOfBirth = document.getElementById("dateOfBirth").value;

        if (dateOfBirth) {

            const dob = new Date(dateOfBirth);
            const today = new Date();

            if (dob > today) {
                alert("Date of birth cannot be in the future.");
                return false;
            }
        }

        return true;
    }

</script>

</body>
</html>