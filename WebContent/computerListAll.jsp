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
			<th>&nbsp; &nbsp; &nbsp; Edit Record &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerIP &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; networkId &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerPort &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; computerMAC &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; Send Sleep &nbsp; &nbsp; &nbsp; </th>
			<th>&nbsp; &nbsp; &nbsp; Send WakeOnLAN &nbsp; &nbsp; &nbsp; </th>
		</tr>
	<%
		for(ComputerHelper ch: results){
			
			String computerId = "" + ch.getComputerId();
			String computerIP = "" + ch.getComputerIP();
			String networkId = "" + ch.getNetworkId();
			String computerPort = "" + ch.getComputerPort();
			String computerMAC = ch.getComputerMAC();
			if(computerMAC==null){
				computerMAC="";
			}
			
			out.println("<tr>");
				// Check box for Primary Key (ComputerId)
				out.println("<td><input type=\"checkbox\" name=\"" + computerId + "\" />");
				out.println("</td>");
				out.println("<td><a href=\"computerEdit.jsp?computerId=" + computerId + "\">Edit Computer " + computerId + "</a>");
				out.println("</td><td>");
				out.println(computerIP);
				out.println("</td><td>");
				out.println(networkId);
				out.println("</td><td>");
				out.println(computerPort);
				out.println("</td><td>");
				out.println(computerMAC);
				out.println("</td><td>");
				out.println("<a href=\"sleepSend.jsp?host=" + computerIP + "&port=" + computerPort + "\">Send Sleep Command</a>");
				out.println("</td><td>");
				out.println("<a href=\"magicPacketSend.jsp?host=" + computerIP + "&macAddress=" + computerMAC + "\">Send WoL Packet</a>");
				out.println("</td>");
			out.println("</tr>");
		}
	%>
	</table>
	<p>
		<input type="submit" name="add" value="Add System" /> &nbsp;
		<input type="submit" name="delete" value="Delete System" /> &nbsp; 
	</p>
	</form>
</center>

<jsp:include page="footer.inc"></jsp:include>
