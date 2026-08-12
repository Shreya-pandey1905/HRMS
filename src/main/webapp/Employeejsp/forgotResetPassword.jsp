<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Set New Password</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<main class="auth-page">
    <div class="auth-shell" style="grid-template-columns:0.95fr 1.05fr;">
        <section class="glass-hero auth-branding">
            <div class="auth-brand-row">
                <span class="auth-brand-logo"><i class="bi bi-shield-lock"></i></span>
                HRMS
            </div>
            <div class="glass-kicker"><i class="bi bi-key"></i> Password recovery</div>
            <h1 class="auth-title" style="margin-top:18px;">Create a new password</h1>
            <p class="auth-subtitle">
                Choose a strong new password for your account. Once saved, you can sign in again
                with your updated credentials.
            </p>
            <div class="glass-chip-row" style="margin-top:22px;">
                <span class="glass-chip"><i class="bi bi-lock-fill"></i> Encrypted</span>
                <span class="glass-chip"><i class="bi bi-check2-circle"></i> Confirmed</span>
                <span class="glass-chip"><i class="bi bi-shield-check"></i> Secure</span>
            </div>
        </section>

        <section class="glass-auth-card">
            <div class="auth-logo"><i class="bi bi-key-fill"></i></div>
            <div class="auth-header">
                <h2>Reset Password</h2>
                <p>Enter and confirm your new password.</p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert-glass">
                    <i class="bi bi-exclamation-triangle"></i>
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form action="<%= request.getContextPath() %>/forgotResetPassword" method="post">
                <input type="hidden"
                       name="token"
                       value="<%= request.getParameter("token") != null ? request.getParameter("token") : "" %>">

                <div class="glass-field" style="margin-bottom:16px;">
                    <label for="newPassword">New Password</label>
                    <input type="password"
                           id="newPassword"
                           name="newPassword"
                           class="glass-control"
                           placeholder="Enter your new password"
                           required>
                </div>

                <div class="glass-field" style="margin-bottom:22px;">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password"
                           id="confirmPassword"
                           name="confirmPassword"
                           class="glass-control"
                           placeholder="Confirm your new password"
                           required>
                </div>

                <button type="submit" class="glass-btn" style="width:100%;">
                    <i class="bi bi-shield-check"></i> Reset Password
                </button>
            </form>

            <p class="auth-note" style="margin-top:18px;">
                <a href="<%= request.getContextPath() %>/index.jsp"
                   class="glass-nav-link"
                   style="display:inline-flex;padding:0;background:none;">
                    ← Back to Sign In
                </a>
            </p>
        </section>
    </div>
</main>
</body>
</html>
