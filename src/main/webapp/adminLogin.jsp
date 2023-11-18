<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.railway.pojo.RailwayCrossing" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Admin Login</title>
    <style>
        body {
            background-image: url('https://source.unsplash.com/1000x1000/?train,railway');
            background-repeat: no-repeat;
            background-size: cover;
            
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        nav {
            background-color: #343a40;
            padding: 1rem;
        }

        div {
            text-align: center;
            padding: 50px;
            color: #ffffff;
        }

        form {
            display: inline-block;
        }

        label, input {
            margin: 10px;
        }

        input[type="submit"] {
            background-color: #dc3545;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #c82333;
        }

        .error-message {
            color: #ff0000;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>

    <nav>
        <div style="text-align: center; color: red; font-size:36px">Railway Crossing Status</div>
    </nav>

    <div>
        <h2>Admin Login</h2>
        <form action="adminLogin.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username"  required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password"  required>
            <br>
            <input type="submit" value="Login">
        </form>
        
        <c:if test="${not empty param.error}">
            <p class="error-message">${param.error}</p>
        </c:if>

        <%
            String adminUsername = request.getParameter("username");
            String adminPassword = request.getParameter("password");

            if ("admin".equals(adminUsername) && "admin123".equals(adminPassword)) {
                // Redirect to admin dashboard on successful login
                response.sendRedirect("adminDashboard.jsp");
                return; // Important to prevent further rendering of the JSP
            } else if (adminUsername != null || adminPassword != null) {
                // Display error message if credentials are incorrect
                response.sendRedirect("adminLogin.jsp?error=Invalid credentials");
                return; // Important to prevent further rendering of the JSP
            }
        %>
    </div>

</body>
</html>
