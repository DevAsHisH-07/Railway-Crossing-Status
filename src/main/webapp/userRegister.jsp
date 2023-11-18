<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.User" %>
<%@ page import="com.railway.dao.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Registration</title>
    <style>
        body {
             /* Replace with the actual path to your railway image */
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
            color: #000000; /* Set font color to white for better visibility on the background */
        }
    </style>
</head>
<body>

    <nav style="background-color: #343a40; padding: 1rem;">
        <div style="color: #dc3545; font-weight: bold;">Railway Crossing Status</div>
        <ul style="margin-left: auto;">
            <li style="margin-left: 10px; color: #ffffff;"><a href="#">Home</a></li>
            <li style="margin-left: 10px; color: #ffffff;"><a href="adminLogin.jsp">Admin-Login/Signup</a></li>
            <li style="margin-left: 10px; color: #ffffff;"><a href="userLogin.jsp">User-Login/Signup</a></li>
        </ul>
    </nav>

    <div style="text-align: center; padding: 50px;">
        <h2>User Registration</h2>
        <%-- Form handling --%>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String registerUsername = request.getParameter("username");
                String registerPassword = request.getParameter("password");

                UserDAO userDAO = new UserDAO();

                try {
                    userDAO.registerUser(registerUsername, registerPassword);
        %>
                    <p style="color: #28a745;">Registration successful. <a href="userLogin.jsp">Login here</a></p>
        <%
                } catch (Exception e) {
                    e.printStackTrace();
        %>
                    <p style="color: #dc3545;">Registration failed. Please try again.</p>
        <%
                }
            }
        %>

        <%-- Registration form --%>
        <form action="userRegister.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Register">
        </form>

        <p>Already have an account? <a href="userLogin.jsp">Login here</a></p>
    </div>

</body>
</html>
