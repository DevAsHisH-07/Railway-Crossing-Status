<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.User" %>
<%@ page import="com.railway.dao.UserDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Login</title>
</head>
<body style="background-repeat: no-repeat; background-size: cover; margin: 0; padding: 0; font-family: Arial, sans-serif;">

    <nav style="background-color: #343a40; padding: 1rem;">
        <div style="color: #dc3545; font-weight: bold;">Railway Crossing Status</div>
        <ul style="margin-left: auto;">
           
            <li style="margin-left: 10px; color: #ffffff;"><a href="adminLogin.jsp">Admin-Login/Signup</a></li>
            
        </ul>
    </nav>

    <div style="text-align: center; padding: 50px;">
        <h2 style="color: #000000;">User Login</h2>

        <%-- Login form handling --%>
        <%
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String loginUsername = request.getParameter("username");
                String loginPassword = request.getParameter("password");

                UserDAO userDAO = new UserDAO();
                User user = userDAO.getUserByUsername(loginUsername);

                if (user != null && user.getPassword().equals(loginPassword)) {
                    // User login successful, redirect to public.jsp
                    session.setAttribute("user", user);
                    response.sendRedirect("public.jsp");
                } else {
        %>
                    <p style="color: #dc3545;">Invalid credentials. Please try again.</p>
        <%
                }
            }
        %>

        <%-- Login form --%>
        <form action="userLogin.jsp" method="post">
            <label for="username" style="color: #000000;">Username:</label>
            <input type="text" id="username" name="username" required>
            <br>
            <label for="password" style="color: #000000;">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <input type="submit" value="Login">
        </form>

        <p style="color: #000000;">New user? <a href="userRegister.jsp">Register here</a></p>
    </div>

</body>
</html>
