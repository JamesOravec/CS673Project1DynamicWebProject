<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	int currUserId = (Integer)session.getAttribute("userId");
	// Check if invalid user
	if(currUserId<1){
		response.sendRedirect("index.jsp"); // redirect to index.jsp
	}
%>