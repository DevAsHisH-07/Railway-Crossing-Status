<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.RailwayCrossing"%>
<%@ page import="com.railway.dao.RailwayDAO_Impl"%>
<html>
<head>
    <title>Add Crossing</title>
    <style>
        body {
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

        form {
            text-align: center;
            margin-top: 20px;
        }

        label, input {
            margin: 10px;
        }

        input[type="submit"] {
            background-color: #343a40;
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #292b2c;
        }
    </style>
</head>
<body>

    <nav>
        <div style="text-align: center; color: red; font-size: 36px">Railway Crossing Status</div>
        <ul>
            <li><a href="#">Home</a></li>
            <li class="logout"><a href="logout.jsp">Logout</a></li>
        </ul>
    </nav>

    <h1>Add Crossing</h1>

    <form action="addCrossingProcess.jsp" method="post">
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <br>
        <label for="address">Address:</label>
        <input type="text" id="address" name="address" required>
        <br>
        <label for="landmark">Landmark:</label>
        <input type="text" id="landmark" name="landmark" required>
        <br>
        <label for="trainSchedules">Train Schedules:</label>
        <input type="text" id="trainSchedules" name="trainSchedules" required>
        <br>
        <label for="personInCharge">Person In Charge:</label>
        <input type="text" id="personInCharge" name="personInCharge" required>
        <br>
        <label for="status">Status:</label>
        <br>
        <input type="radio" id="statusOpen" name="status" value="Open" required>
        <label for="statusOpen">Open</label>
        <input type="radio" id="statusClosed" name="status" value="Closed" required>
        <label for="statusClosed">Closed</label>
        <br>
        <input type="submit" value="Add Crossing">
    </form>

</body>
</html>
