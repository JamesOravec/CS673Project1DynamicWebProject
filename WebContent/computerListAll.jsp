<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@ page import="edu.unlv.cs673.echoteam.DAO,
				java.io.PrintWriter,
				java.sql.ResultSet,
				java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<center>
	<form method="GET" action='ComputerController' name="listall">
	<table border="1">
	<%
			DAO myDao = new DAO();
	
			// The following is the output for select query.
			ResultSet rs = myDao.readQuery("SELECT * FROM echosystems;");
			try {
				%>
				<tr>
					<th>&nbsp; &nbsp; &nbsp; Select Record &nbsp; &nbsp; &nbsp; </th>
					<th>&nbsp; &nbsp; &nbsp; systemIP &nbsp; &nbsp; &nbsp; </th>
					<th>&nbsp; &nbsp; &nbsp; systemDNS &nbsp; &nbsp; &nbsp; </th>
					<th>&nbsp; &nbsp; &nbsp; systemPort &nbsp; &nbsp; &nbsp; </th>
					<th>&nbsp; &nbsp; &nbsp; systemMAC &nbsp; &nbsp; &nbsp; </th>
				</tr>
				<%					
				while (rs.next()) {
					out.println("<tr>");
						// Check box for Primary Key
						out.println("<td><input type=\"checkbox\" name=\"" + rs.getString(1) + "\" />");
						out.println("</td>");

						// Skip past foreign key

						// Print systemIP
						out.println("<td>");
						out.println(rs.getString(3));
						out.println("</td>");

						// Print systemDNS
						out.println("<td>");
						out.println(rs.getString(4));
						out.println("</td>");

						// Print systemPort
						out.println("<td>");
						out.println(rs.getString(5));
						out.println("</td>");

						// Print systemMAC
						out.println("<td>");
						out.println(rs.getString(6));
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
		<input type="submit" name="add" value="Add System" /> &nbsp;
		<input type="submit" name="delete" value="Delete System" /> &nbsp; 
		<input type="submit" name="edit" value="Edit System" />  
	</p>
	</form>
</center>

<jsp:include page="footer.inc"></jsp:include>
