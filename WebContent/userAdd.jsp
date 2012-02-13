<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="edu.unlv.cs673.echoteam.UserDAO,
				java.io.PrintWriter,
				java.sql.*,
				javax.persistence.*
				" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<%
	try{
		// TODO: Add checks to make sure user doesn't already exist in db.
		
		// Get information that was posted from signup.jsp
		String userName = request.getParameter("user");
		String userPassword = request.getParameter("password");
		String userEmail = request.getParameter("email");
		
		// Check for nulls and replace with empty strings
		if(userName==null){
			userName="";
		}
		if(userPassword==null){
			userPassword="";
		}
		if(userEmail==null){
			userEmail="";
		}
		
		UserDAO userDao = new UserDAO();
		userDao.insertUser(userName, userPassword, userEmail);			 

		out.println("<center><b>User Added Successfully<br><a href=\"index.jsp\">Return to index.jsp</a></b><BR></center>");
	} catch (Exception e) {
		out.println("<center><b>Exception occured when trying to add user.<br><a href=\"index.jsp\">Return to index.jsp</a></b><BR></center>");
		e.printStackTrace();
	}
%>
<jsp:include page="footer.inc"></jsp:include>
