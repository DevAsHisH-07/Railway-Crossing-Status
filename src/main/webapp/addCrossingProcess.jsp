<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.pojo.RailwayCrossing" %>
<%@ page import="com.railway.dao.RailwayDAO_Impl" %>

<%
    // Retrieve parameters from the form submission
    String name = request.getParameter("name");
    String address = request.getParameter("address");
    String landmark = request.getParameter("landmark");
    String trainSchedules = request.getParameter("trainSchedules");
    String personInCharge = request.getParameter("personInCharge");
    String status = request.getParameter("status");

    // Create a new RailwayCrossing object
    RailwayCrossing newCrossing = new RailwayCrossing();
    newCrossing.setName(name);
    newCrossing.setAddress(address);
    newCrossing.setLandmark(landmark);
    newCrossing.setTrainSchedules(trainSchedules);
    newCrossing.setPersonInCharge(personInCharge);
    newCrossing.setStatus(status);

    // Add the new crossing to the database using the DAO
    RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
    crossingService.addCrossing(newCrossing);

    // Redirect to a success page or back to the admin dashboard
    response.sendRedirect("adminDashboard.jsp");
%>
