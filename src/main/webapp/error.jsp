<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Page not found</title>
  <meta name="viewport" content="width=device-width,initial-scale=1"/>
  <style>
    body{font-family:Arial,Helvetica,sans-serif;text-align:center;padding:6%;}
    h1{font-size:48px;margin-bottom:0.2em;color:#333}
    p{color:#555}
    a.button{display:inline-block;margin-top:1em;padding:0.6em 1.2em;background:#007bff;color:#fff;text-decoration:none;border-radius:4px}
  </style>
</head>
<body>
<%
  Object status = request.getAttribute("javax.servlet.error.status_code");
  Object message = request.getAttribute("javax.servlet.error.message");
  Object uri = request.getAttribute("javax.servlet.error.request_uri");
%>
  <h1><%= (status != null) ? status : "Error" %></h1>
  <p><strong><%= (message != null) ? message : "Page not found or an unexpected error occurred." %></strong></p>
  <p>Requested: <%= (uri != null) ? uri : request.getRequestURI() %></p>
  <a class="button" href="<%= request.getContextPath() %>/index.jsp">Go to Home</a>
</body>
</html>
