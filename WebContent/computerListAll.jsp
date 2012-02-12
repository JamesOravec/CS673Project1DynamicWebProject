<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	
<%@ page import="edu.unlv.cs673.echoteam.ComputerDAO,
				edu.unlv.cs673.echoteam.helpers.ComputerHelper,
				java.util.List,
				java.util.ArrayList,
				java.io.PrintWriter,
				java.sql.ResultSet,
				java.sql.SQLException" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>

<center>
	<form method="GET" action='ComputerController' name="listall">
	<table border="1">
	<%
		int currUserId = (Integer)session.getAttribute("userId");

		ComputerDAO computerDao = new ComputerDAO();
		List<ComputerHelper> results = computerDao.selectAllComputersForUser(currUserId);
	%>
		<tr>
			<th>&nbsp; &nbsp; &nbsp; Select Record &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerIP &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; networkId &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerPort &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerMAC &nbsp; &nbsp; &nbsp; </th>
		</tr>
		<%
		for(ComputerHelper ch: results){
			out.println("<tr>");
				// Check box for Primary Key (ComputerId)
				out.println("<td><input type=\"checkbox\" name=\"" + ch.getComputerId() + "\" />");
				out.println("</td><td>");
				out.println(ch.getComputerIP());
				out.println("</td><td>");
				out.println(ch.getNetworkId());
				out.println("</td><td>");
				out.println(ch.getComputerPort());
				out.println("</td><td>");
				out.println(ch.getComputerMAC());
				out.println("</td>");
			out.println("</tr>");
		}
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
