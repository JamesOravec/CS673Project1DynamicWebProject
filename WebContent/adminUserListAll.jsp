<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@ page import="edu.unlv.cs673.echoteam.UserDAO,
				edu.unlv.cs673.echoteam.helpers.UserHelper,
				java.util.List,
				java.util.ArrayList,
				java.io.PrintWriter,
				java.sql.ResultSet,
				java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyAdminLogin.jsp"></jsp:include>


<center>
	<form method="GET" action='UserController' name="listall">
	<table border="1">
	<%
		UserDAO userDao = new UserDAO();
		List<UserHelper> results = userDao.selectAllUsers();
	%>
		<tr>
			<th>&nbsp; &nbsp; &nbsp; Select Record &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; Edit User &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userId &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userName &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userPassword &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; userEmail &nbsp; &nbsp; &nbsp; </th>
		</tr>
		<%					
		for(UserHelper uh: results){
			out.println("<tr>");
				// Check box for Primary Key (ComputerId)
				out.println("<td><input type=\"checkbox\" name=\"" + uh.getUserId() + "\" />");
				out.println("</td>");
				out.println("<td><a href=\"adminUserEdit.jsp?userId=" + uh.getUserId() + "\">Edit User " + uh.getUserId() + "</a>");
				out.println("</td><td>");
				out.println(uh.getUserId());
				out.println("</td><td>");
				out.println(uh.getUserName());
				out.println("</td><td>");
				out.println(uh.getUserPassword());
				out.println("</td>");
				out.println("<td>");
				out.println(uh.getUserEmail());
				out.println("</td>");
			out.println("</tr>");
		}
	%>
	</table>
	<p>
		<input type="submit" name="add" value="Add New User" /> &nbsp;
		<input type="submit" name="delete" value="delete" /> &nbsp; 
	</p>
	</form>
</center>

<jsp:include page="footer.inc"></jsp:include>
