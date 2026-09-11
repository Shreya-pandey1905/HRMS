<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.nio.charset.StandardCharsets" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="java.time.LocalTime" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="models.Employees.User" %>
<%@ page import="serviceImplementer.Employee.EmployeeServiceImpl" %>
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
<%
    User currentUser = null;
    Integer sessionUserId = null;
    Object userIdAttr = session.getAttribute("userId");
    if (userIdAttr instanceof Integer) {
        sessionUserId = (Integer) userIdAttr;
    } else if (userIdAttr != null) {
        try {
            sessionUserId = Integer.parseInt(String.valueOf(userIdAttr));
        } catch (NumberFormatException ignored) {
            sessionUserId = null;
        }
    }

    if (sessionUserId != null) {
        try {
            currentUser = new EmployeeServiceImpl().getEmployeeById(sessionUserId);
        } catch (Exception ignored) {
            currentUser = null;
        }
    }

    String profileImgUrl = currentUser != null
            ? toProfileUrl(request.getContextPath(), currentUser.getProfilePicture())
            : null;

    String joinedOnDisplay = null;
    if (currentUser != null && currentUser.getDateOfJoining() != null) {
        LocalDateTime doj = currentUser.getDateOfJoining();
        if (doj.getYear() > 1900) {
            joinedOnDisplay = doj.format(DateTimeFormatter.ofPattern("dd MMM yyyy"));
        }
    }

    int hour = LocalTime.now().getHour();
    String greetingText;
    if (hour < 12) {
        greetingText = "Good Morning";
    } else if (hour < 17) {
        greetingText = "Good Afternoon";
    } else {
        greetingText = "Good Evening";
    }

    String currentTimeDisplay = LocalTime.now().format(DateTimeFormatter.ofPattern("hh:mm a"));

    request.setAttribute("currentUser", currentUser);
    request.setAttribute("profileImgUrl", profileImgUrl);
    request.setAttribute("joinedOnDisplay", joinedOnDisplay);
    request.setAttribute("greetingText", greetingText);
    request.setAttribute("currentTimeDisplay", currentTimeDisplay);
    request.setAttribute("attendanceDateDisplay", null);

    String displayName = "User";
    if (currentUser != null && currentUser.getFirstName() != null && !currentUser.getFirstName().isBlank()) {
        displayName = currentUser.getFirstName() +
                (currentUser.getLastName() != null ? " " + currentUser.getLastName() : "");
    } else if (session.getAttribute("firstName") != null) {
        displayName = String.valueOf(session.getAttribute("firstName"));
    } else if (session.getAttribute("email") != null) {
        displayName = String.valueOf(session.getAttribute("email"));
    }
    request.setAttribute("sidebarDisplayName", displayName);

    String sidebarRole = session.getAttribute("roleName") != null
            ? String.valueOf(session.getAttribute("roleName"))
            : "Employee";
    if (currentUser != null && currentUser.getDesignationName() != null
            && !currentUser.getDesignationName().isBlank()) {
        sidebarRole = currentUser.getDesignationName();
    }
    request.setAttribute("sidebarRoleLabel", sidebarRole);
%>
