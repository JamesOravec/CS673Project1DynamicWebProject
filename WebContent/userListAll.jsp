<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@ page import="edu.unlv.cs673.echoteam.DAO,
				java.io.PrintWriter,
				java.sql.ResultSet,
				java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<center>
	<form method="GET" action='UserController' name="listall">
	<table border="1">
	<%
			DAO myDao = new DAO();
	
			// The following is the output for select query.
			ResultSet rs = myDao.readQuery("SELECT * FROM echousers;");
			StringBuilder sb = new StringBuilder();
			try {
				%>
				<tr>
					<th>Select Record</th>
					<th>UserName</th>
					<th>UserPassword</th>
				</tr>
				<%					
				while (rs.next()) {
					out.println("<tr>");
						out.println("<td><input type=\"checkbox\" name=\"" + rs.getString(1) + "\" />");
						out.println("</td>");
						out.println("<td>");
						out.println(rs.getString(2));
						out.println("</td>");
						out.println("<td>");
						out.println(rs.getString(3));
						out.println("</td>");
					out.println("</tr>");
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
			DAO.close();	// Clean up, close the db connection
	%>
	</table>
	<p>
		<input type="submit" value="Add New User" /> &nbsp;
		<input type="submit" name="delete" value="delete" /> &nbsp; 
		<input type="submit" name="edit" value="edit" /> 
	</p>
	</form>
</center>

<jsp:include page="footer.inc"></jsp:include>
