<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.RailwayCrossing" %>
<%@ page import="com.railway.dao.RailwayDAO_Impl" %>

<%
    // Get parameters from the form submission
    int crossingId = Integer.parseInt(request.getParameter("crossingId"));
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String landmark = request.getParameter("landmark");
    String trainSchedules = request.getParameter("trainSchedules");
    String personInCharge = request.getParameter("personInCharge");
    String status = request.getParameter("status");

    // Create a new RailwayCrossing object with updated details
    RailwayCrossing updatedCrossing = new RailwayCrossing();
    updatedCrossing.setId(crossingId);
    updatedCrossing.setName(name);
    updatedCrossing.setAddress(address);
    updatedCrossing.setLandmark(landmark);
    updatedCrossing.setTrainSchedules(trainSchedules);
    updatedCrossing.setPersonInCharge(personInCharge);
    updatedCrossing.setStatus(status);

    // Update the crossing details in the database
    RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
    crossingService.updateCrossing(updatedCrossing);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Update Crossing Processed</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0;
            padding: 0;
            text-align: center;
        }

        h1 {
            color: #343a40;
            margin-top: 50px;
        }

        p {
            color: #007bff;
        }
    </style>
</head>
<body>

    <h1>Update Crossing Processed</h1>
    <p>Crossing details have been successfully updated.</p>
    
    <div>
    <a href="adminDashboard.jsp">Back to Dashboard</a>
	</div>
</body>
</html>
