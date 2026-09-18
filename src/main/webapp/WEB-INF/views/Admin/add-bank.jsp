<%@ page contentType="text/html;charset=UTF-8"
         language="java"
         isELIgnored="false" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>Add Bank Details | HRMS</title>

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
                    <h4>Add Bank Details</h4>
                    <h6>Add employee bank information</h6>
                </div>

            </div>

            <div class="card">

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/employee/bank/add"
                          method="post">

                        <input type="hidden"
                               name="userId"
                               value="${userId}">

                        <div class="row">

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Bank Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="bankName"
                                           class="form-control"
                                           required
                                           pattern="[A-Za-z ]+"
                                           maxlength="100"
                                           title="Bank name should contain only letters and spaces">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Account Number
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="accountNumber"
                                           class="form-control"
                                           required
                                           pattern="[0-9]{9,18}"
                                           minlength="9"
                                           maxlength="18"
                                           inputmode="numeric"
                                           title="Account number must contain 9 to 18 digits">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        IFSC Code
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="ifscCode"
                                           class="form-control"
                                           required
                                           pattern="[A-Z]{4}0[A-Z0-9]{6}"
                                           maxlength="11"
                                           style="text-transform: uppercase;"
                                           title="Enter a valid IFSC code, for example SBIN0001234">

                                </div>

                            </div>

                            <div class="col-md-6">

                                <div class="mb-3">

                                    <label class="form-label">
                                        Branch Name
                                        <span class="text-danger">*</span>
                                    </label>

                                    <input type="text"
                                           name="branchName"
                                           class="form-control"
                                           required
                                           pattern="[A-Za-z ]+"
                                           maxlength="100"
                                           title="Branch name should contain only letters and spaces">

                                </div>

                            </div>

                        </div>

                        <button type="submit"
                                class="btn btn-primary">

                            <i class="ti ti-plus me-1"></i>
                            Add Bank Details

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

</body>
</html>