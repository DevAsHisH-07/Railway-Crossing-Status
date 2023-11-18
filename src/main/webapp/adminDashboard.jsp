<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.railway.pojo.RailwayCrossing"%>
<%@ page import="com.railway.dao.RailwayDAO_Impl"%>
<html>
<head>
    <title>Admin Dashboard</title>
    <style>
        body {
            
            background-repeat: no-repeat;
            background-size: cover;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        nav {
            background-color: #343a40;
            padding: 1rem;
            text-align: center;
        }

        h1 {
            color: #000000;
            text-align: center;
            margin-top: 50px;
        }

        table {
            margin: auto;
            width: 80%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        th {
            background-color: #343a40;
            color: #ffffff;
        }

        a {
            color: #343a40; /* Change link color to a darker shade */
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .logout {
            float: right;
            margin-top: -20px;
            color: #ffffff;
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
        <div style="text-align: center; color: red; font-size: 36px">Railway Crossing Status</div>
        <ul>
            <li class="logout"><a href="logout.jsp" style="color: #ffffff;">Logout</a></li>
        </ul>
    </nav>

    <h1>Admin Dashboard</h1>
    <div style="text-align: center; margin-top: 20px;">
        <form action="addCrossing.jsp" method="get">
            <input type="hidden" name="param1" value="value1">
            <button type="submit">Add Crossing</button>
        </form>
                <form action="searchAdmin.jsp" method="get">
            <input type="hidden" name="param1" value="value1">
            <button type="submit">Search</button>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Address</th>
            <th>Landmark</th>
            <th>Train Schedules</th>
            <th>Person In Charge</th>
            <th>Status</th>
            <th>Action</th>
        </tr>

        <% // Fetch the latest list of crossings from the database
            List<RailwayCrossing> crossings = new RailwayDAO_Impl().getAllCrossings();
            for (RailwayCrossing crossing : crossings) { %>
            <tr>
                <td><%= crossing.getId() %></td>
                <td><%= crossing.getName() %></td>
                <td><%= crossing.getAddress() %></td>
                <td><%= crossing.getLandmark() %></td>
                <td><%= crossing.getTrainSchedules() %></td>
                <td><%= crossing.getPersonInCharge() %></td>
                <td><%= crossing.getStatus() %></td>
                <td><a href="updateCrossing.jsp?id=<%= crossing.getId() %>" style="color: #343a40;">Update</a> |
                    <a href="deleteCrossing.jsp?id=<%= crossing.getId() %>" style="color: #343a40;">Delete</a></td>
            </tr>
        <% } %>
    </table>

</body>
</html>
