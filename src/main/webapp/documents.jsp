<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Document" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRMS | Documents</title>
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
       .nav-links {
            display: flex;
            align-items: center;
            gap: 28px;
        }

        .nav-links a {
            color: #b8c4d4;
            text-decoration: none;
            font-size: 14px;
            transition: 0.25s ease;
        }

        .nav-links a:hover {
            color: #ffffff;
        }

        /* Main */

        .main-container {
            width: 850px;
            max-width: 90%;
            margin: 55px auto;
        }

        .page-heading {
            margin-bottom: 25px;
        }

        .page-heading h1 {
            font-size: 28px;
            margin-bottom: 8px;
        }

        .page-heading p {
            color: #8fa1b8;
            font-size: 14px;
        }

        /* Upload Card */

        .upload-card {
            background: #0d1b2f;
            border: 1px solid #1d3557;
            border-radius: 14px;

            padding: 30px;

            margin-bottom: 35px;

            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.35);
        }

        .upload-card h2 {
            font-size: 20px;
            margin-bottom: 20px;
        }

        .file-input {
            width: 100%;

            padding: 10px;

            border: 1px solid #1d3557;
            border-radius: 7px;

            background: #071426;
            color: #b8c4d4;
        }

        .upload-btn {
            margin-top: 15px;

            padding: 10px 20px;

            border: none;
            border-radius: 7px;

            background: #ffffff;
            color: #071426;

            font-size: 14px;
            font-weight: 600;

            cursor: pointer;

            transition: 0.25s ease;
        }

        .upload-btn:hover {
            background: #dce5ef;
        }

        .upload-info {
            margin-top: 20px;

            color: #7f91a8;

            font-size: 13px;
        }

        /* Documents Table */

        .documents-card {
            background: #0d1b2f;
            border: 1px solid #1d3557;
            border-radius: 14px;

            overflow: hidden;

            box-shadow: 0 18px 45px rgba(0, 0, 0, 0.35);
        }

        .documents-table {
            width: 100%;
            border-collapse: collapse;
        }

        .documents-table th {
            text-align: left;

            padding: 16px 20px;

            font-size: 12px;

            text-transform: uppercase;
            letter-spacing: 1px;

            color: #7f91a8;

            border-bottom: 1px solid #1d3557;
        }

        .documents-table td {
            padding: 18px 20px;

            font-size: 14px;

            color: #ffffff;

            border-bottom: 1px solid #1d3557;
        }

        .documents-table tr:last-child td {
            border-bottom: none;
        }

        .file-name {
            color: #ffffff;
            font-weight: 500;
        }

        .file-type,
        .file-size {
            color: #8fa1b8;
        }

        .download-btn {
            color: #ffffff;

            text-decoration: none;

            font-size: 13px;
            font-weight: 600;
        }

        .download-btn:hover {
            text-decoration: underline;
        }

        /* Empty State */

        .empty-message {
            padding: 30px;

            text-align: center;

            color: #7f91a8;

            font-size: 14px;
        }

        /* Footer */

        .footer {
            text-align: center;

            margin-top: 50px;

            color: #60748d;

            font-size: 12px;
        }

        /* Responsive */

        @media (max-width: 700px) {

            .navbar {
                padding: 0 20px;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .main-container {
                margin-top: 35px;
            }

            .documents-table {
                min-width: 650px;
            }

            .documents-card {
                overflow-x: auto;
            }

        }

    </style>

</head>


<body>


<!-- Navbar -->

<nav class="navbar">

    <div class="logo">
        HRMS
    </div>

    <div class="nav-links">

        <a href="adminDashboard">Dashboard</a>

        <a href="leave">Leave</a>

        <a href="documents">Documents</a>

     <!--   <a href="profile.jsp">Profile</a> -->
     <li class="nav-item"><a class="nav-link active" href="employee">Employee</a></li>
        <a href="SignOut">Sign Out</a>

    </div>

</nav>


<!-- Main -->

<main class="main-container">


    <div class="page-heading">

        <h1>My Documents</h1>

        <p>
            Upload and manage your employee documents.
        </p>

    </div>


    <!-- Upload -->

    <div class="upload-card">

        <h2>Upload</h2>

        <form action="uploadDocument"
              method="post"
              enctype="multipart/form-data">

            <input
                    type="file"
                    name="document"
                    class="file-input"
                    accept=".pdf,.jpg,.jpeg,.png"
                    required
            >

            <br>

            <button type="submit" class="upload-btn">
                Upload
            </button>

        </form>


        <p class="upload-info">
            PDF, JPG, or PNG — up to 5 MB
        </p>

    </div>


    <!-- Documents -->

    <div class="documents-card">

        <table class="documents-table">

            <thead>

            <tr>

                <th>File</th>

                <th>Type</th>

                <th>Size</th>

                <th>Action</th>

            </tr>

            </thead>


      <tbody>

      <%
          List<Document> documents =
                  (List<Document>) request.getAttribute("documents");

          if (documents != null && !documents.isEmpty()) {

              for (Document document : documents) {
      %>

      <tr>

          <td class="file-name">
              <%= document.getFileName() %>
          </td>

          <td class="file-type">
              <%= document.getContentType() %>
          </td>

          <td class="file-size">
              <%= document.getFileSize() %> bytes
          </td>

          <td>
              <a href="downloadDocument?id=<%= document.getId() %>"
                 class="download-btn">
                  Download
              </a>
          </td>

      </tr>

      <%
              }

          } else {
      %>

      <tr>

          <td colspan="4" class="empty-message">
              No documents uploaded yet.
          </td>

      </tr>

      <%
          }
      %>

      </tbody>
        </table>
    </div>

    <div class="footer">
        HRMS • Secure employee operations
    </div>
</main>
</body>
</html>