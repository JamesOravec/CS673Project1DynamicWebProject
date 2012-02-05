<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<%
	// Get information that was posted from signup.jsp
	String username = request.getParameter("user");
	String password = request.getParameter("password");
	
	session.setAttribute("username", username);
	session.setAttribute("password", password);

	/*
	System.out.println("user: " + session.getAttribute("username") + "<BR>");
	System.out.println("Password: " + session.getAttribute("password") + "<BR>");
	*/

	
	
%>

<jsp:include page="footer.inc"></jsp:include>
