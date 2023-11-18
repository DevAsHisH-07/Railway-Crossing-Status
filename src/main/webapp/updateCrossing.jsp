<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.RailwayCrossing"%>
<%@ page import="com.railway.dao.RailwayDAO_Impl"%>

<%
    // Get the crossingId from the request
    int crossingId = Integer.parseInt(request.getParameter("id"));

    // Fetch the crossing details based on the ID
    RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
    RailwayCrossing existingCrossing = crossingService.getCrossingById(crossingId);

    // If the crossing is not found, redirect to an error page or handle it accordingly
    if (existingCrossing == null) {
        response.sendRedirect("error.jsp");
    }

    // Get existing crossing details
    String name = existingCrossing.getName();
    String address = existingCrossing.getAddress();
    String landmark = existingCrossing.getLandmark();
    String trainSchedules = existingCrossing.getTrainSchedules();
    String personInCharge = existingCrossing.getPersonInCharge();
    String status = existingCrossing.getStatus();
%>

<html>
<head>
<title>Update Crossing</title>
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

form {
	width: 50%;
	margin: auto;
	margin-top: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
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
    .radio-group {
        display: flex;
        align-items: center;
    }
       .radio-group input[type="radio"] {
        margin-right: 20px; /* Adjust the margin as needed */
    }

</style>
</head>
<body>

	<h1>Update Crossing Details</h1>

	<form action="updateCrossingProcess.jsp" method="post">
		<input type="hidden" name="crossingId"value="<%= existingCrossing.getId() %>"> 
		<label for="name">Name:</label>
		<input type="text" id="name" name="name" value="<%= name %>" required>

		<label for="address">Address:</label> 
		<input type="text" id="address"
			name="address" value="<%= address %>" required> 
			<label for="landmark">Landmark:</label> 
			<input type="text" id="landmark" name="landmark" value="<%= landmark %>" required> 
			<label for="trainSchedules">Train Schedules:</label> 
			<input type="text"id="trainSchedules" name="trainSchedules"value="<%= trainSchedules %>" required> 
			<label for="personInCharge">Person In Charge:</label> 
			<input type="text"id="personInCharge" name="personInCharge"value="<%= personInCharge %>" required> 
			<label>Status:</label>
			<div class="radio-group">
    		<input type="radio" id="statusOpen" name="status" value="Open" <%= "Open".equals(status) ? "checked" : "" %> required>
    		<label for="statusOpen">Open</label>
		
		    <input type="radio" id="statusClosed" name="status" value="Closed" <%= "Closed".equals(status) ? "checked" : "" %> required>
    		<label for="statusClosed">Closed</label>
            </div>



		<button type="submit">Update Crossing</button>
	</form>

</body>
</html>
