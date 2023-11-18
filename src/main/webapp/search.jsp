<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.RailwayCrossing" %>
<%@ page import="com.railway.dao.RailwayDAO_Impl" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Search Crossing</title>
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
    }

    div {
        text-align: center;
        padding: 50px;
    }

    h2 {
        color: #000000;
    }

    table {
        border-collapse: collapse;
        width: 80%;
        margin-top: 20px;
    }

    th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        background-color: #343a40;
        color: #ffffff; /* Color for table heading */
    }

    td {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
        color: #000000; /* Font color for table content */
    }

    p {
        color: #000000;
    }

    form {
        margin-top: 10px;
    }
    button {
	padding: 10px;
	background-color: #343a40;
	color: #ffffff;
	border: none;
	cursor: pointer;
	}	

	button:hover {
	background-color: #007bff;
	}
</style>


</head>
<body>

    <nav>
        <div style="color: #dc3545; font-weight: bold;">Railway Crossing Status</div>
    </nav>

    <div>
        <h2>Search Crossing by Name</h2>

        <%-- Search form handling logic --%>
        <%	
            RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
            if ("POST".equalsIgnoreCase(request.getMethod())) {
                String searchName = request.getParameter("crossingName");

                // Add logic to search for crossings by name
                List<RailwayCrossing> searchResults = crossingService.searchCrossingsByName(searchName);

                // Display search results
                if (searchResults != null && !searchResults.isEmpty()) {
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
                            for (RailwayCrossing crossing : searchResults) {
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
                                        <%-- Add any additional action buttons as needed --%>
                                    </td>
                                </tr>
                        <%
                            }
                        %>
                    </table>

                <%
                } else {
                %>
                    <p>No crossings found with the given name.</p>
                <%
                }
            }
        %>

        <%-- Search form --%>
        <form action="search.jsp" method="post">
            <label for="crossingName">Crossing Name:</label>
            <input type="text" id="crossingName" name="crossingName" required>
            <input type="submit" value="Search">
        </form>
        <form action="public.jsp">
            <input type="submit" value="Back">
        </form>
    </div>

</body>
</html>
