<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>


<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="utf-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, user-scalable=0">

    <title>Employee Details | HRMS</title>

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

      <!-- ================= SIDEBAR and Header ================= -->


     <%@ include file="adminHeader.jsp" %>

       <%@ include file="adminSidebar.jsp" %>


    <!-- ========================================================= -->
    <!-- PAGE -->
    <!-- ========================================================= -->

    <div class="page-wrapper">

        <div class="content">


            <!-- BREADCRUMB -->

            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                <div class="my-auto">

                    <h2 class="mb-1">
                        Employee Details
                    </h2>

                    <nav>

                        <ol class="breadcrumb mb-0">

                            <li class="breadcrumb-item">

                                <a href="${pageContext.request.contextPath}/admin/employees">
                                    Employees
                                </a>

                            </li>

                            <li class="breadcrumb-item active"
                                aria-current="page">

                                Employee Details

                            </li>

                        </ol>

                    </nav>

                </div>

            </div>


            <!-- ================================================= -->
            <!-- EMPLOYEE DETAILS -->
            <!-- ================================================= -->

            <div class="row">


                <!-- ================================================= -->
                <!-- LEFT SIDE -->
                <!-- ================================================= -->

                <div class="col-xl-4 theiaStickySidebar">


                    <!-- PROFILE CARD -->

                    <div class="card card-bg-1">

                        <div class="card-body p-0">


                            <!-- PROFILE IMAGE -->

                            <span class="avatar avatar-xl avatar-rounded border border-2 border-white m-auto d-flex mb-2">

                                <c:choose>

                                    <c:when test="${not empty employeeDetails.user.profilePicture}">

                                        <img src="${pageContext.request.contextPath}/${employeeDetails.user.profilePicture}"
                                             class="w-auto h-auto"
                                             alt="Profile">

                                    </c:when>

                                    <c:otherwise>

                                        <img src="${pageContext.request.contextPath}/assets/img/users/user-13.jpg"
                                             class="w-auto h-auto"
                                             alt="Profile">

                                    </c:otherwise>

                                </c:choose>

                            </span>


                            <!-- NAME -->

                            <div class="text-center px-3 pb-3 border-bottom">

                                <div class="mb-3">

                                    <h5 class="d-flex align-items-center justify-content-center mb-1">

                                        <c:choose>

                                            <c:when test="${not empty employeeDetails.user}">

                                                ${employeeDetails.user.firstName}
                                                ${employeeDetails.user.lastName}

                                            </c:when>

                                            <c:otherwise>

                                                Employee

                                            </c:otherwise>

                                        </c:choose>


                                        <i class="ti ti-discount-check-filled text-success ms-1"></i>

                                    </h5>


                                    <!-- DESIGNATION -->

                                    <c:if test="${not empty employeeDetails.user.designationName}">
<span class="badge badge-soft-dark fw-medium me-2">

    <i class="ti ti-point-filled me-1"></i>

    Designation ID: ${employeeDetails.user.designationId}

</span>

                                    </c:if>


                                    <!-- ROLE -->

                                   <span class="badge badge-soft-secondary fw-medium">

                                       Role ID: ${employeeDetails.user.roleId}

                                   </span>

                                </div>


                                <div>


                                    <!-- USER ID -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-id me-2"></i>

                                            User ID

                                        </span>

                                        <p class="text-dark mb-0">

                                            ${employeeDetails.user.userId}

                                        </p>

                                    </div>


                                    <!-- DEPARTMENT -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-star me-2"></i>

                                            Department

                                        </span>

                                        <p class="text-dark mb-0">

                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.user.departmentName}">

                                                    ${employeeDetails.user.departmentName}

                                                </c:when>

                                                <c:otherwise>

                                                    Not Available

                                                </c:otherwise>

                                            </c:choose>

                                        </p>

                                    </div>


                                    <!-- DATE OF JOINING -->

                                    <div class="d-flex align-items-center justify-content-between mb-2">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-calendar-check me-2"></i>

                                            Date Of Join

                                        </span>

                                        <p class="text-dark mb-0">

                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.user.dateOfJoining}">

                                                    ${employeeDetails.user.dateOfJoining}

                                                </c:when>

                                                <c:otherwise>

                                                    Not Available

                                                </c:otherwise>

                                            </c:choose>

                                        </p>

                                    </div>


                                    <!-- REPORTING MANAGER -->

                                    <div class="d-flex align-items-center justify-content-between">

                                        <span class="d-inline-flex align-items-center">

                                            <i class="ti ti-user-check me-2"></i>

                                            Reporting Manager

                                        </span>

                                        <p class="text-gray-9 mb-0">

                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.user.reportingManager}">

                                                    ${employeeDetails.user.reportingManager}

                                                </c:when>

                                                <c:otherwise>

                                                    Not Available

                                                </c:otherwise>

                                            </c:choose>

                                        </p>

                                    </div>


                                    <!-- BUTTONS -->

                                    <div class="row gx-2 mt-3">

                                        <div class="col-6">

                                            <a href="#"
                                               class="btn btn-dark w-100"
                                               data-bs-toggle="modal"
                                               data-bs-target="#edit_employee">

                                                <i class="ti ti-edit me-1"></i>

                                                Edit Info

                                            </a>

                                        </div>


                                        <div class="col-6">

                                            <a href="#"
                                               class="btn btn-primary w-100">

                                                <i class="ti ti-message-heart me-1"></i>

                                                Message

                                            </a>

                                        </div>

                                    </div>

                                </div>

                            </div>


                            <!-- ================================================= -->
                            <!-- BASIC INFORMATION -->
                            <!-- ================================================= -->

                            <div class="p-3 border-bottom">

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <h6>
                                        Basic information
                                    </h6>

                                    <a href="javascript:void(0);"
                                       class="btn btn-icon btn-sm"
                                       data-bs-toggle="modal"
                                       data-bs-target="#edit_employee">

                                        <i class="ti ti-edit"></i>

                                    </a>

                                </div>


                                <!-- PHONE -->

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-phone me-2"></i>

                                        Phone

                                    </span>

                                    <p class="text-dark mb-0">

                                        <c:choose>

                                            <c:when test="${not empty employeeDetails.user.phoneNumber}">

                                                ${employeeDetails.user.phoneNumber}

                                            </c:when>

                                            <c:otherwise>

                                                Not Available

                                            </c:otherwise>

                                        </c:choose>

                                    </p>

                                </div>


                                <!-- EMAIL -->

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-mail-check me-2"></i>

                                        Email

                                    </span>

                                    <c:choose>

                                        <c:when test="${not empty employeeDetails.user.email}">

                                            <a href="mailto:${employeeDetails.user.email}"
                                               class="text-info d-inline-flex align-items-center">

                                                ${employeeDetails.user.email}

                                                <i class="ti ti-copy text-dark ms-2"></i>

                                            </a>

                                        </c:when>

                                        <c:otherwise>

                                            <span class="text-dark">
                                                Not Available
                                            </span>

                                        </c:otherwise>

                                    </c:choose>

                                </div>


                                <!-- GENDER -->

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-gender-male me-2"></i>

                                        Gender

                                    </span>

                                    <p class="text-dark text-end mb-0">

                                        <c:choose>

                                            <c:when test="${not empty employeeDetails.user.gender}">

                                                ${employeeDetails.user.gender}

                                            </c:when>

                                            <c:otherwise>

                                                Not Available

                                            </c:otherwise>

                                        </c:choose>

                                    </p>

                                </div>


                                <!-- BIRTHDAY -->

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-cake me-2"></i>

                                        Birthday

                                    </span>

                                    <p class="text-dark text-end mb-0">

                                        <c:choose>

                                            <c:when test="${not empty employeeDetails.user.dateOfBirth}">

                                                ${employeeDetails.user.dateOfBirth}

                                            </c:when>

                                            <c:otherwise>

                                                Not Available

                                            </c:otherwise>

                                        </c:choose>

                                    </p>

                                </div>


                                <!-- ADDRESS -->

                                <div class="d-flex align-items-center justify-content-between">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-map-pin-check me-2"></i>

                                        Address

                                    </span>

                                    <p class="text-dark text-end mb-0">

                                        <c:choose>

                                            <c:when test="${not empty employeeDetails.user.address}">

                                                ${employeeDetails.user.address}

                                            </c:when>

                                            <c:otherwise>

                                                Not Available

                                            </c:otherwise>

                                        </c:choose>

                                    </p>

                                </div>

                            </div>


                            <!-- ================================================= -->
                            <!-- PERSONAL INFORMATION -->
                            <!-- ================================================= -->

                            <div class="p-3 border-bottom">

                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <h6>
                                        Personal Information
                                    </h6>

                                    <a href="javascript:void(0);"
                                       class="btn btn-icon btn-sm"
                                       data-bs-toggle="modal"
                                       data-bs-target="#edit_personal">

                                        <i class="ti ti-edit"></i>

                                    </a>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-e-passport me-2"></i>

                                        Passport No

                                    </span>

                                    <p class="text-dark mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-calendar-x me-2"></i>

                                        Passport Exp Date

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-gender-male me-2"></i>

                                        Nationality

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-bookmark-plus me-2"></i>

                                        Religion

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-hotel-service me-2"></i>

                                        Marital status

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between mb-2">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-briefcase-2 me-2"></i>

                                        Employment of spouse

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>


                                <div class="d-flex align-items-center justify-content-between">

                                    <span class="d-inline-flex align-items-center">

                                        <i class="ti ti-baby-bottle me-2"></i>

                                        No. of children

                                    </span>

                                    <p class="text-dark text-end mb-0">
                                        -
                                    </p>

                                </div>

                            </div>

                        </div>

                    </div>


                    <!-- ================================================= -->
                    <!-- EMERGENCY CONTACT -->
                    <!-- ================================================= -->

                    <div class="d-flex align-items-center justify-content-between mb-2 mt-3">

                        <h6>
                            Emergency Contact Number
                        </h6>

                        <a href="javascript:void(0);"
                           class="btn btn-icon btn-sm"
                           data-bs-toggle="modal"
                           data-bs-target="#edit_emergency">

                            <i class="ti ti-edit"></i>

                        </a>

                    </div>


                    <div class="card">

                        <div class="card-body p-0">


                            <c:choose>

                                <c:when test="${not empty employeeDetails.familyDetails}">

                                    <c:forEach var="family"
                                               items="${employeeDetails.familyDetails}"
                                               varStatus="status">

                                        <div class="p-3 border-bottom">

                                            <div class="d-flex align-items-center justify-content-between">

                                                <div>

                                                    <span class="d-inline-flex align-items-center">

                                                        <c:choose>

                                                            <c:when test="${status.index == 0}">
                                                                Primary
                                                            </c:when>

                                                            <c:otherwise>
                                                                Secondary
                                                            </c:otherwise>

                                                        </c:choose>

                                                    </span>


                                                    <h6 class="d-flex align-items-center fw-medium mt-1 mb-0">

                                                        ${family.name}

                                                        <span class="d-inline-flex mx-1">

                                                            <i class="ti ti-point-filled text-danger"></i>

                                                        </span>

                                                        ${family.relation}

                                                    </h6>

                                                </div>


                                                <p class="text-dark mb-0">

                                                    ${family.phone}

                                                </p>

                                            </div>

                                        </div>

                                    </c:forEach>

                                </c:when>


                                <c:otherwise>

                                    <div class="p-3">

                                        No emergency contact available.

                                    </div>

                                </c:otherwise>

                            </c:choose>

                        </div>

                    </div>

                </div>


                <!-- ================================================= -->
                <!-- RIGHT SIDE -->
                <!-- ================================================= -->

                <div class="col-xl-8">


                    <div class="tab-content custom-accordion-items">

                        <div class="tab-pane active show"
                             id="bottom-justified-tab1"
                             role="tabpanel">


                            <div class="accordion accordions-items-seperate"
                                 id="accordionExample">


                                <!-- ================================================= -->
                                <!-- ABOUT EMPLOYEE -->
                                <!-- ================================================= -->

                                <div class="accordion-item">

                                    <div class="accordion-header"
                                         id="headingOne">

                                        <div class="accordion-button">

                                            <div class="d-flex align-items-center flex-fill">

                                                <h5>
                                                    About Employee
                                                </h5>


                                                <a href="#"
                                                   class="btn btn-sm btn-icon ms-auto"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#edit_employee">

                                                    <i class="ti ti-edit"></i>

                                                </a>


                                                <a href="#"
                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                   data-bs-toggle="collapse"
                                                   data-bs-target="#primaryBorderOne"
                                                   aria-expanded="true"
                                                   aria-controls="primaryBorderOne">

                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                </a>

                                            </div>

                                        </div>

                                    </div>


                                    <div id="primaryBorderOne"
                                         class="accordion-collapse collapse show border-top"
                                         aria-labelledby="headingOne"
                                         data-bs-parent="#accordionExample">

                                        <div class="accordion-body mt-2">

                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.user.aboutEmployee}">

                                                    ${employeeDetails.user.aboutEmployee}

                                                </c:when>

                                                <c:otherwise>

                                                    <span class="text-muted">
                                                        No information available.
                                                    </span>

                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                    </div>

                                </div>


                                <!-- ================================================= -->
                                <!-- BANK INFORMATION -->
                                <!-- ================================================= -->

                                <div class="accordion-item">

                                    <div class="accordion-header"
                                         id="headingTwo">

                                        <div class="accordion-button">

                                            <div class="d-flex align-items-center flex-fill">

                                                <h5>
                                                    Bank Information
                                                </h5>


                                                <a href="#"
                                                   class="btn btn-sm btn-icon ms-auto"
                                                   data-bs-toggle="modal"
                                                   data-bs-target="#edit_bank">

                                                    <i class="ti ti-edit"></i>

                                                </a>


                                                <a href="#"
                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                   data-bs-toggle="collapse"
                                                   data-bs-target="#primaryBorderTwo"
                                                   aria-expanded="false"
                                                   aria-controls="primaryBorderTwo">

                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                </a>

                                            </div>

                                        </div>

                                    </div>


                                    <div id="primaryBorderTwo"
                                         class="accordion-collapse collapse border-top"
                                         aria-labelledby="headingTwo"
                                         data-bs-parent="#accordionExample">

                                        <div class="accordion-body">


                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.bankDetails}">

                                                    <div class="row">

                                                        <div class="col-md-3">

                                                            <span class="d-inline-flex align-items-center">
                                                                Bank Name
                                                            </span>

                                                            <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                ${employeeDetails.bankDetails.bankName}

                                                            </h6>

                                                        </div>


                                                        <div class="col-md-3">

                                                            <span class="d-inline-flex align-items-center">
                                                                Bank account no
                                                            </span>

                                                            <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                ${employeeDetails.bankDetails.accountNumber}

                                                            </h6>

                                                        </div>


                                                        <div class="col-md-3">

                                                            <span class="d-inline-flex align-items-center">
                                                                IFSC Code
                                                            </span>

                                                            <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                ${employeeDetails.bankDetails.IFSCCode}

                                                            </h6>

                                                        </div>


                                                        <div class="col-md-3">

                                                            <span class="d-inline-flex align-items-center">
                                                                Branch
                                                            </span>

                                                            <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                ${employeeDetails.bankDetails.branchName}

                                                            </h6>

                                                        </div>

                                                    </div>

                                                </c:when>


                                                <c:otherwise>

                                                    <p class="mb-0 text-muted">

                                                        No bank information available.

                                                    </p>

                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                    </div>

                                </div>


                                <!-- ================================================= -->
                                <!-- FAMILY INFORMATION -->
                                <!-- ================================================= -->

                                <div class="accordion-item">

                                    <div class="accordion-header"
                                         id="headingThree">

                                        <div class="accordion-button">

                                            <div class="d-flex align-items-center justify-content-between flex-fill">

                                                <h5>
                                                    Family Information
                                                </h5>


                                                <div class="d-flex">

                                                    <a href="#"
                                                       class="btn btn-icon btn-sm"
                                                       data-bs-toggle="modal"
                                                       data-bs-target="#edit_familyinformation">

                                                        <i class="ti ti-edit"></i>

                                                    </a>


                                                    <a href="#"
                                                       class="d-flex align-items-center collapsed collapse-arrow"
                                                       data-bs-toggle="collapse"
                                                       data-bs-target="#primaryBorderThree"
                                                       aria-expanded="false"
                                                       aria-controls="primaryBorderThree">

                                                        <i class="ti ti-chevron-down fs-18"></i>

                                                    </a>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                    <div id="primaryBorderThree"
                                         class="accordion-collapse collapse border-top"
                                         aria-labelledby="headingThree"
                                         data-bs-parent="#accordionExample">

                                        <div class="accordion-body">


                                            <c:choose>

                                                <c:when test="${not empty employeeDetails.familyDetails}">

                                                    <c:forEach var="family"
                                                               items="${employeeDetails.familyDetails}">

                                                        <div class="row mb-3">

                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Name
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${family.name}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Relationship
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${family.relation}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Date of birth
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${family.dateOfBirth}

                                                                </h6>

                                                            </div>


                                                            <div class="col-md-3">

                                                                <span class="d-inline-flex align-items-center">
                                                                    Phone
                                                                </span>

                                                                <h6 class="d-flex align-items-center fw-medium mt-1">

                                                                    ${family.phone}

                                                                </h6>

                                                            </div>

                                                        </div>

                                                        <hr>

                                                    </c:forEach>

                                                </c:when>


                                                <c:otherwise>

                                                    <p class="mb-0 text-muted">

                                                        No family information available.

                                                    </p>

                                                </c:otherwise>

                                            </c:choose>

                                        </div>

                                    </div>

                                </div>


                                <!-- ================================================= -->
                                <!-- EDUCATION + EXPERIENCE -->
                                <!-- ================================================= -->

                                <div class="row">


                                    <!-- EDUCATION -->

                                    <div class="col-md-6">

                                        <div class="accordion-item">

                                            <div class="row">

                                                <div class="accordion-header"
                                                     id="headingFour">

                                                    <div class="accordion-button">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>
                                                                Education Details
                                                            </h5>


                                                            <div class="d-flex">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#edit_education">

                                                                    <i class="ti ti-edit"></i>

                                                                </a>


                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFour"
                                                                   aria-expanded="false"
                                                                   aria-controls="primaryBorderFour">

                                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>


                                                <div id="primaryBorderFour"
                                                     class="accordion-collapse collapse border-top"
                                                     aria-labelledby="headingFour"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">


                                                        <c:choose>

                                                            <c:when test="${not empty employeeDetails.educationDetails}">

                                                                <c:forEach var="education"
                                                                           items="${employeeDetails.educationDetails}">

                                                                    <div class="mb-3">

                                                                        <div class="d-flex align-items-center justify-content-between">

                                                                            <div>

                                                                                <span class="d-inline-flex align-items-center fw-normal">

                                                                                    ${education.universityName}

                                                                                </span>

                                                                                <h6 class="d-flex align-items-center mt-1">

                                                                                    ${education.educationType}

                                                                                </h6>

                                                                            </div>


                                                                            <p class="text-dark">

                                                                                ${education.startdate}

                                                                                -

                                                                                ${education.enddate}

                                                                            </p>

                                                                        </div>

                                                                    </div>

                                                                </c:forEach>

                                                            </c:when>


                                                            <c:otherwise>

                                                                <p class="mb-0 text-muted">

                                                                    No education details available.

                                                                </p>

                                                            </c:otherwise>

                                                        </c:choose>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>


                                    <!-- EXPERIENCE -->

                                    <div class="col-md-6">

                                        <div class="accordion-item">

                                            <div class="row">

                                                <div class="accordion-header"
                                                     id="headingFive">

                                                    <div class="accordion-button collapsed">

                                                        <div class="d-flex align-items-center justify-content-between flex-fill">

                                                            <h5>
                                                                Experience
                                                            </h5>


                                                            <div class="d-flex">

                                                                <a href="#"
                                                                   class="btn btn-icon btn-sm"
                                                                   data-bs-toggle="modal"
                                                                   data-bs-target="#edit_experience">

                                                                    <i class="ti ti-edit"></i>

                                                                </a>


                                                                <a href="#"
                                                                   class="d-flex align-items-center collapsed collapse-arrow"
                                                                   data-bs-toggle="collapse"
                                                                   data-bs-target="#primaryBorderFive"
                                                                   aria-expanded="false"
                                                                   aria-controls="primaryBorderFive">

                                                                    <i class="ti ti-chevron-down fs-18"></i>

                                                                </a>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>


                                                <div id="primaryBorderFive"
                                                     class="accordion-collapse collapse border-top"
                                                     aria-labelledby="headingFive"
                                                     data-bs-parent="#accordionExample">

                                                    <div class="accordion-body">

                                                        <p class="text-muted mb-0">

                                                            Experience details are not available in the current database.

                                                        </p>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>


                                <!-- ================================================= -->
                                <!-- PROJECTS / ASSETS -->
                                <!-- ================================================= -->

                                <div class="card">

                                    <div class="card-body">


                                        <div class="contact-grids-tab p-0 mb-3">

                                            <ul class="nav nav-underline"
                                                id="myTab"
                                                role="tablist">


                                                <!-- PROJECTS TAB -->

                                                <li class="nav-item"
                                                    role="presentation">

                                                    <button class="nav-link active"
                                                            id="info-tab2"
                                                            data-bs-toggle="tab"
                                                            data-bs-target="#basic-info2"
                                                            type="button"
                                                            role="tab"
                                                            aria-selected="true">

                                                        Projects

                                                    </button>

                                                </li>


                                                <!-- ASSETS TAB -->

                                                <li class="nav-item"
                                                    role="presentation">

                                                    <button class="nav-link"
                                                            id="address-tab2"
                                                            data-bs-toggle="tab"
                                                            data-bs-target="#address2"
                                                            type="button"
                                                            role="tab"
                                                            aria-selected="false">

                                                        Assets

                                                    </button>

                                                </li>

                                            </ul>

                                        </div>


                                        <div class="tab-content"
                                             id="myTabContent3">


                                            <!-- PROJECTS -->

                                            <div class="tab-pane fade show active"
                                                 id="basic-info2"
                                                 role="tabpanel"
                                                 aria-labelledby="info-tab2"
                                                 tabindex="0">

                                                <div class="row">

                                                    <div class="col-md-12">

                                                        <div class="card mb-0">

                                                            <div class="card-body">

                                                                <p class="text-muted mb-0">

                                                                    Project details are not available
                                                                    in the current database.

                                                                </p>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>


                                            <!-- ASSETS -->

                                            <div class="tab-pane fade"
                                                 id="address2"
                                                 role="tabpanel"
                                                 aria-labelledby="address-tab2"
                                                 tabindex="0">

                                                <div class="row">

                                                    <div class="col-md-12">

                                                        <div class="card mb-0">

                                                            <div class="card-body">

                                                                <p class="text-muted mb-0">

                                                                    Asset details are not available
                                                                    in the current database.

                                                                </p>

                                                            </div>

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</div>


<!-- ========================================================= -->
<!-- JAVASCRIPT -->
<!-- ========================================================= -->

<script src="${pageContext.request.contextPath}/assets/js/jquery-3.7.1.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/bootstrap.bundle.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/theme-script.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/script.js"></script>

</body>

</html>