<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String alertType = (String) request.getAttribute("alertType");
    String alertMessage = (String) request.getAttribute("alertMessage");
    boolean isSuccess = "success".equalsIgnoreCase(alertType);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Forgot Password</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/glass.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="glass-body">
<main class="auth-page">
    <div class="auth-shell" style="grid-template-columns:0.95fr 1.05fr;">
        <section class="glass-hero auth-branding">
            <div class="auth-brand-row">
                <span class="auth-brand-logo"><i class="bi bi-people-fill"></i></span>
                HRMS
            </div>
            <div class="glass-kicker"><i class="bi bi-envelope-at"></i> Account recovery</div>
            <h1 class="auth-title" style="margin-top:18px;">Forgot your password?</h1>
            <p class="auth-subtitle">
                Enter the email linked to your HRMS account and we will send a secure reset link
                so you can create a new password.
            </p>

        </section>

        <section class="glass-auth-card">
            <div class="auth-logo"><i class="bi bi-envelope-paper"></i></div>
            <div class="auth-header">
                <h2>Forgot Password</h2>
                <p>We will email you a password reset link.</p>
            </div>

            <% if (alertMessage != null) { %>
                <div class="alert-glass <%= isSuccess ? "alert-glass-success" : "" %>">
                    <i class="bi <%= isSuccess ? "bi-check2-circle" : "bi-exclamation-triangle" %>"></i>
                    <%= alertMessage %>
                </div>
            <% } %>
<% if (request.getAttribute("success") != null) { %>
    <div style="color: green;">
        <%= request.getAttribute("success") %>
    </div>
<% } %>

<% if (request.getAttribute("error") != null) { %>
    <div style="color: red;">
        <%= request.getAttribute("error") %>
    </div>
<% } %>
            <form action="<%= request.getContextPath() %>/forgotPassword" method="post">
                <div class="glass-field" style="margin-bottom:22px;">
                    <label for="email">Work Email</label>
                    <input id="email"
                           type="email"
                           name="email"
                           class="glass-control"
                           placeholder="Enter your registered email"
                           required>
                </div>

                <button class="glass-btn" type="submit" style="width:100%;">
                    <i class="bi bi-send"></i> Send Reset Link
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

<% if (isSuccess && alertMessage != null) { %>
<script>
    alert("<%= alertMessage.replace("\"", "\\\"") %>");
</script>
<% } %>
</body>
</html>
