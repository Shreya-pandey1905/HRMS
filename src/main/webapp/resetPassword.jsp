
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Reset Password</title>
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
            display: flex;
            flex-direction: column;
        }
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
        .main-container {
            width: 430px;
            max-width: 90%;
            margin: 65px auto;
        }
        .page-heading {
            text-align: center;
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
        .password-card {
            background: #0d1b2f;
            border: 1px solid #1d3557;
            border-radius: 14px;
            padding: 35px;
            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.35);
        }
        .form-group {
            margin-bottom: 21px;
        }
        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 8px;
            color: #ffffff;
        }
        .form-group input {
            width: 100%;
            padding: 13px 14px;
            background: #071426;
            border: 1px solid #29415f;
            border-radius: 7px;
            color: #ffffff;
            font-size: 14px;
            outline: none;
            transition: 0.25s ease;
        }
        .form-group input::placeholder {
            color: #7f91a8;
        }
        .form-group input:focus {
            border-color: #ffffff;
        }
        .update-btn {
            width: 100%;
            padding: 13px;
            margin-top: 5px;
            background: #ffffff;
            color: #071426;
            border: none;
            border-radius: 7px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.25s ease;
        }
        .update-btn:hover {
            background: #dce5ef;
        }
        .back-link {
            display: block;
            text-align: center;
            margin-top: 22px;
            color: #8fa1b8;
            font-size: 13px;
            text-decoration: none;
        }
        .back-link:hover {
            color: #ffffff;
        }
        .error {
            background: #1f2937;
            border: 1px solid #475569;
            color: #ffffff;
            padding: 10px;
            border-radius: 6px;
            font-size: 13px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<nav class="navbar">
    <div class="logo">HRMS</div>
    <div class="nav-title">Reset Password</div>
</nav>
<main class="main-container">
    <div class="page-heading">
        <h1>Reset Password</h1>
        <p>Update your account password</p>
    </div>
    <div class="password-card">
        <% if (request.getAttribute("error") != null) { %>
            <div class="error">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        <form action="resetPassword" method="post">
            <div class="form-group">
                <label for="currentPassword">Current Password</label>
                <input type="password" id="currentPassword" name="currentPassword" placeholder="Enter your current password" required>
            </div>
            <div class="form-group">
                <label for="newPassword">New Password</label>
                <input type="password" id="newPassword" name="newPassword" placeholder="Enter your new password" required>
            </div>
            <div class="form-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm your new password" required>
            </div>
            <button type="submit" class="update-btn">Update Password</button>
        </form>
        <a href="profile.jsp" class="back-link">← Back to Profile</a>
    </div>
</main>
</body>
</html>

