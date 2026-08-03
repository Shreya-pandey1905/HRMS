<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>HRMS | Sign In</title>

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
            display: flex;
            justify-content: center;
            align-items: center;
            color: #ffffff;
        }

        .login-container {
            width: 420px;
            background: #0d1b2f;
            padding: 42px 40px;
            border-radius: 14px;
            border: 1px solid #1d3557;
            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.45);
        }

        /* HRMS Branding */
        .brand {
            text-align: center;
            margin-bottom: 28px;
        }

        .brand h1 {
            font-size: 34px;
            font-weight: 700;
            letter-spacing: 3px;
            color: #ffffff;
            margin-bottom: 8px;
        }

        .brand-line {
            width: 45px;
            height: 2px;
            background: #ffffff;
            margin: 0 auto;
        }

        .subtitle {
            text-align: center;
            font-size: 18px;
            font-weight: 600;
            color: #ffffff;
            margin-bottom: 7px;
        }

        .description {
            text-align: center;
            font-size: 13px;
            color: #b8c4d4;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 21px;
        }

        label {
            display: block;
            font-size: 14px;
            font-weight: 500;
            color: #ffffff;
            margin-bottom: 8px;
        }

        input {
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

        input::placeholder {
            color: #7f91a8;
        }

        input:focus {
            border-color: #ffffff;
        }

        .signin-btn {
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

        .signin-btn:hover {
            background: #dce5ef;
        }

        .footer {
            text-align: center;
            margin-top: 27px;
            font-size: 12px;
            color: #7f91a8;
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="brand">
        <h1>HRMS</h1>
        <div class="brand-line"></div>
    </div>

    <div class="subtitle">
        Sign in to Employee Operations
    </div>

    <div class="description">
        Access your employee management portal
    </div>

    <form action="signin" method="post">

        <div class="form-group">
            <label for="email">Email</label>
            <input
                    type="email"
                    id="email"
                    name="email"
                    placeholder="Enter your email"
                    required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>
            <input
                    type="password"
                    id="password"
                    name="password"
                    placeholder="Enter your password"
                    required>
        </div>

        <button type="submit" class="signin-btn">
            Sign In
        </button>

    </form>

    <div class="footer">
        Human Resource Management System
    </div>

</div>

</body>
</html>

