<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.railway.dao.RailwayDAO_Impl"%>

<%
    // Get the crossingId from the request
    int crossingId = Integer.parseInt(request.getParameter("id"));

    // Delete the crossing based on the ID
    RailwayDAO_Impl crossingService = new RailwayDAO_Impl();
    crossingService.deleteCrossing(crossingId);

    // Redirect to the Admin Dashboard after deletion
    response.sendRedirect("adminDashboard.jsp");
%>
