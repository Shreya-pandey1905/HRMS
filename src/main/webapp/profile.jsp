    <%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
            <!DOCTYPE html>
            <html lang="en">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">

                <title>HRMS | Profile</title>

                <style>
                    * {
                        margin: 0;
                        padding: 0;
                        box-sizing: border-box;
                        font-family: "Segoe UI", Arial, sans-serif;
                    }

                    body {
                        min-height: 100vh;
                        background: #071426;
                        color: #ffffff;
                    }

                    /* Navbar */
                    .navbar {
                        height: 70px;
                        background: #0d1b2f;
                        border-bottom: 1px solid #1d3557;

                        display: flex;
                        align-items: center;
                        justify-content: space-between;

                        padding: 0 55px;
                    }

                    .logo {
                        font-size: 25px;
                        font-weight: 700;
                        letter-spacing: 3px;
                    }

                    .nav-title {
                        color: #b8c4d4;
                        font-size: 14px;
                    }

                    /* Main */
                    .main-container {
                        width: 850px;
                        max-width: 90%;
                        margin: 55px auto;
                    }

                    .page-heading {
                        margin-bottom: 30px;
                    }

                    .page-heading h1 {
                        font-size: 28px;
                        margin-bottom: 8px;
                    }

                    .page-heading p {
                        color: #8fa1b8;
                        font-size: 14px;
                    }

                    /* Profile Card */
                    .profile-card {
                        background: #0d1b2f;
                        border: 1px solid #1d3557;
                        border-radius: 14px;
                        padding: 35px;
                        box-shadow: 0 18px 45px rgba(0, 0, 0, 0.35);
                    }

                    .profile-header {
                        display: flex;
                        align-items: center;
                        gap: 20px;

                        padding-bottom: 30px;
                        margin-bottom: 30px;

                        border-bottom: 1px solid #1d3557;
                    }

                    .profile-icon {
                        width: 65px;
                        height: 65px;

                        border-radius: 50%;
                        background: #ffffff;
                        color: #071426;

                        display: flex;
                        align-items: center;
                        justify-content: center;

                        font-size: 25px;
                        font-weight: 700;
                    }

                    .profile-header h2 {
                        font-size: 21px;
                        margin-bottom: 5px;
                    }

                    .profile-header span {
                        color: #8fa1b8;
                        font-size: 13px;
                    }

                    /* Details */
                    .details {
                        display: grid;
                        grid-template-columns: 1fr 1fr;
                        gap: 25px 45px;
                    }

                    .detail-item {
                        display: flex;
                        flex-direction: column;
                        gap: 7px;
                    }

                    .detail-label {
                        font-size: 12px;
                        color: #7f91a8;
                        text-transform: uppercase;
                        letter-spacing: 1px;
                    }

                    .detail-value {
                        font-size: 15px;
                        color: #ffffff;
                    }

                    /* Password Section */
                    .password-section {
                        margin-top: 35px;
                        padding-top: 28px;
                        border-top: 1px solid #1d3557;

                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                    }

                    .password-section h3 {
                        font-size: 16px;
                        margin-bottom: 6px;
                    }

                    .password-section p {
                        color: #7f91a8;
                        font-size: 13px;
                    }

                    .reset-btn {
                        text-decoration: none;
                        background: #ffffff;
                        color: #071426;

                        padding: 11px 20px;

                        border-radius: 7px;
                        font-size: 14px;
                        font-weight: 600;

                        transition: 0.25s ease;
                    }

                    .reset-btn:hover {
                        background: #dce5ef;
                    }

                    /* Responsive */
                    @media (max-width: 650px) {

                        .navbar {
                            padding: 0 20px;
                        }

                        .main-container {
                            margin-top: 35px;
                        }

                        .profile-card {
                            padding: 25px;
                        }

                        .details {
                            grid-template-columns: 1fr;
                        }

                        .password-section {
                            flex-direction: column;
                            align-items: flex-start;
                            gap: 18px;
                        }
                    }
                </style>
            </head>

            <body>

         <nav class="navbar">

             <div class="logo">
                 HRMS
             </div>

             <div class="nav-links">

                 <a href="employeeDashboard.jsp">Dashboard</a>

                 <a href="leave">Leave</a>

                 <a href="Document.jsp">Documents</a>

                 <a href="profile.jsp">Profile</a>

                 <a href="SignOut">Sign Out</a>

             </div>

         </nav>

            <!-- Main Content -->
            <main class="main-container">

                <div class="page-heading">
                    <h1>My Profile</h1>
                    <p>View your employee information and account settings.</p>
                </div>


                <div class="profile-card">

                    <!-- Profile Header -->
                    <div class="profile-header">

                        <div class="profile-icon">
                            ${user.name.substring(0,1).toUpperCase()}
                        </div>

                        <div>
                            <h2>${user.name}</h2>
                            <span>Employee Profile</span>
                        </div>

                    </div>


                    <!-- Employee Details -->
                    <div class="details">

                        <div class="detail-item">
                            <span class="detail-label">Name</span>
                            <span class="detail-value">${user.name}</span>
                        </div>

                        <div class="detail-item">
                            <span class="detail-label">Email</span>
                            <span class="detail-value">${user.email}</span>
                        </div>

                        <div class="detail-item">
                            <span class="detail-label">Department</span>
                            <span class="detail-value">${user.department}</span>
                        </div>

                        <div class="detail-item">
                            <span class="detail-label">Role</span>
                            <span class="detail-value">${user.role}</span>
                        </div>

                    </div>


                    <!-- Reset Password -->
                    <div class="password-section">

                        <div>
                            <h3>Password</h3>
                            <p>Change your account password.</p>
                        </div>

                        <a href="resetPassword.jsp" class="reset-btn">
                            Reset Password
                        </a>

                    </div>

                </div>

            </main>

            </body>
            </html>

