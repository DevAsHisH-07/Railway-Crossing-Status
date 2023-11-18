<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="com.railway.pojo.RailwayCrossing"%>
<%@ page import="com.railway.dao.RailwayDAO_Impl"%>
<%@ page import="com.railway.dao.FavoriteCrossingService"%>
<%@ page import="com.railway.pojo.User"%>
<%@ page import="com.railway.dao.UserDAO"%>
<%@ page import="java.util.List"%>
<html>
<head>
    <title>Favourite Crossings</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 0;
        }

        h1 {
            color: #dc3545;
            text-align: center;
            margin-top: 50px;
        }

        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            color: #000000;
        }

        th {
            background-color: #343a40;
            color: #ffffff;
        }

        a {
            color: #dc3545;
            text-decoration: none;
            font-weight: bold;
            display: block;
            margin-top: 20px;
            text-align: center;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h1>Favourite Crossings</h1>

    <%
    // User-specific logic for fetching favorite crossings
    String username = null;
    Object userObj = request.getSession().getAttribute("user");
    if (userObj != null && userObj instanceof User) {
        username = ((User) userObj).getUsername();
    }
    UserDAO userDAO = new UserDAO();
    User user = userDAO.getUserByUsername(username);
    FavoriteCrossingService favoriteService = new FavoriteCrossingService();

    // Handle remove action
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String removeFavorite = request.getParameter("removeFavorite");
        if (removeFavorite != null) {
            // Get the crossingId from the request
            Integer crossingId = Integer.parseInt(removeFavorite);

            // Remove the crossing from favorites
            favoriteService.removeFromFavorites(user, crossingId);
        }
    }

    // Fetch the updated list of favorite crossings
    List<RailwayCrossing> favoriteCrossings = favoriteService.getFavoriteCrossings(user);
    %>

    <table>
        <tr>
            <th>Crossing ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Landmark</th>
            <th>Train Schedules</th>
            <th>Person In Charge</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <%
        for (RailwayCrossing crossing : favoriteCrossings) {
        %>
        <tr>
            <td><%=crossing.getId()%></td>
            <td><%=crossing.getName()%></td>
            <td><%=crossing.getAddress()%></td>
            <td><%=crossing.getLandmark()%></td>
            <td><%=crossing.getTrainSchedules()%></td>
            <td><%=crossing.getPersonInCharge()%></td>
            <td><%=crossing.getStatus()%></td>
            <td>
                <form action="favorite.jsp" method="post">
                    <input type="hidden" name="removeFavorite" value="<%=crossing.getId()%>">
                    <input type="submit" value="Remove from Favorite">
                </form>
            </td>
        </tr>
        <%
        }
        %>
    </table>

    <div>
        <a href="public.jsp">Back to Public Section</a>
    </div>
</body>
</html>
