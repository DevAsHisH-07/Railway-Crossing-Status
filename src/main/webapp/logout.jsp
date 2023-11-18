<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLEncoder" %>
<html>
<head>
    <title>Logout</title>
</head>
<body>

    <%
       	session = request.getSession(false);
        
        if (session != null) {
            // Invalidate the session
            session.invalidate();
        }

        // Redirect to the login page with a logout message
        String logoutMessage = "You have been successfully logged out.";
        response.sendRedirect("homepage.jsp?message=" + URLEncoder.encode(logoutMessage, "UTF-8"));
    %>

</body>
</html>
