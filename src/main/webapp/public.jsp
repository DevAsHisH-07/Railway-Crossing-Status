<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.railway.pojo.RailwayCrossing" %>
<%@ page import="com.railway.dao.RailwayDAO_Impl" %>
<%@ page import="com.railway.dao.FavoriteCrossingService" %>
<%@ page import="com.railway.pojo.User"%>
<%@ page import="com.railway.dao.UserDAO"%>
<%@ page import="java.util.List" %>
<html>
<head>
    <title>Public Section</title>
<style>
    body {
        background-repeat: no-repeat;
        background-size: cover;
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
    }

    nav {
        background-color: #343a40;
        padding: 1rem;
        color: #dc3545;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    ul {
        display: flex;
        list-style: none;
        margin: 0;
        padding: 0;
    }

    li {
        margin-left: 10px;
        color: #ffffff;
    }

    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
        max-height: 300px; /* Set the maximum height for the table */
        overflow-y: auto; /* Add a vertical scrollbar if needed */
    }

    th, td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    th {
        background-color: #f2f2f2;
    }

    div {
        text-align: center;
        padding: 50px;
    }

    h1 {
        color: #000000;
    }

    .action-buttons {
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .action-buttons form {
        margin-right: 10px;
    }

    .action-buttons button {
        padding: 10px;
        margin-right: 10px;
    }

    .logout {
        color: #ffffff;
        text-decoration: none;
        margin-right: 20px;
    }
</style>

</head>
<body>

    <nav>
        <div>Railway Crossing Status</div>
        <ul>
            <li><a class="logout" href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <div>
        <h1>Railway Crossings</h1>
        
        <%
            // Use the RailwayDAO_Impl to retrieve all crossings
            RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
            List<RailwayCrossing> crossings = crossingService.getAllCrossings();
            
            // User-specific logic for marking and removing from favorites
            User user = (User) session.getAttribute("user");
            String username = user.getUsername();
            UserDAO userDAO = new UserDAO();
            user = userDAO.getUserByUsername(username);
            FavoriteCrossingService favoriteService = new FavoriteCrossingService();
            List<RailwayCrossing> favoriteCrossings = favoriteService.getFavoriteCrossings(user);
        %>

        <table border="1">
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
                for (RailwayCrossing crossing : crossings) {
            %>
                <tr>
                    <td><%= crossing.getId() %></td>
                    <td><%= crossing.getName() %></td>
                    <td><%= crossing.getAddress() %></td>
                    <td><%= crossing.getLandmark() %></td>
                    <td><%= crossing.getTrainSchedules() %></td>
                    <td><%= crossing.getPersonInCharge() %></td>
                    <td><%= crossing.getStatus() %></td>
                    <td>
                        <div class="action-buttons">
                            <form action="public.jsp" method="post">
                                <input type="hidden" name="crossingId" value="<%= crossing.getId() %>">
                                <button type="submit" name="markAsFavorite">Mark as Favorite</button>
                            </form>

                            
                        </div>
                    </td>
                </tr>
            <%
                }
            %>
        </table>

        <div class="action-buttons">
            <form action="search.jsp" method="post">
                <button type="submit">Search Crossing</button>
            </form>

            <form action="favorite.jsp" method="post">
                <button type="submit">View All Favourite Crossings</button>
            </form>
        </div>
    </div>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String markAsFavorite = request.getParameter("markAsFavorite");
        if (markAsFavorite != null) {
            String crossingIdParam = request.getParameter("crossingId");
            if (crossingIdParam != null && !crossingIdParam.isEmpty()) {
                try {
                    // Get the crossingId from the request
                    Integer crossingId = Integer.parseInt(crossingIdParam);

                    // Mark the crossing as favorite
                    favoriteService.markAsFavorite(user, crossingId);
                } catch (NumberFormatException e) {
                    // Handle the case where parsing the crossingId fails
                    e.printStackTrace(); // Log the exception or handle it as needed
                }
            } else {
                out.println("id not found");// Handle the case where crossingId parameter is null or empty
            }
        }
    }
%>


</body>
</html>
