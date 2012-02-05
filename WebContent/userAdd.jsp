<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="edu.unlv.cs673.echoteam.DAO,
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
		
		session.setAttribute("username", userName);
		session.setAttribute("password", userPassword);

		/*
		System.out.println("user: " + session.getAttribute("username") + "<BR>");
		System.out.println("Password: " + session.getAttribute("password") + "<BR>");
		*/
		
		// TODO: Refactor so proper DAO pattern
		DAO myDao = new DAO();
		String query = "INSERT INTO echousers (userName, userPassword) Values (?, ?);";
		PreparedStatement p = DAO.con.prepareStatement(query);
		p.setString(1, userName);
		p.setString(2, userPassword);
		p.execute();
 		DAO.close();
		
		%>
		<center>
		<b>User Added Successfully</b><BR>
		<a href="login.jsp">Login</a>
		</center>
		<%
	}catch(Exception e){
		out.println("Error occured when trying to add user");
		System.err.println(e.getStackTrace());
	}
	
%>

<jsp:include page="footer.inc"></jsp:include>
