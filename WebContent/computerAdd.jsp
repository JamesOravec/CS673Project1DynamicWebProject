<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@ page import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<center>
<%
	// If session var is set, then add the computer info to the db, else display the form to add a computer
	if ((session.getAttribute("addComputerFlag")!=null)&&(Integer)session.getAttribute("addComputerFlag") == 1) {
		try {
			// Logic to add computer

			// Get information that was posted from signup.jsp
			String userId = Integer.toString(((Integer)session.getAttribute("userId")));
			String systemIP = request.getParameter("systemIP");
			String systemDNS = request.getParameter("systemDNS");
			String systemPort = request.getParameter("systemPort");
			String systemMAC = request.getParameter("systemMAC");

			// Check for nulls and replace with empty strings
			if(systemIP==null){
				systemIP="";
			}
			if(systemDNS==null){
				systemDNS="";
			}
			if(systemPort==null){
				systemPort="";
			}
			if(systemMAC==null){
				systemMAC="";
			}
			
			/*
			System.out.println("user: " + session.getAttribute("username") + "<BR>");
			System.out.println("Password: " + session.getAttribute("password") + "<BR>");
			 */

			// TODO: Refactor so proper DAO pattern
			DAO myDao = new DAO();
			String query = "";
			query = "INSERT INTO echosystems (userId, systemIP, systemDNS, systemPort, systemMAC) Values (?, ?,?,?,?);";
			PreparedStatement p = null;
			p = DAO.con.prepareStatement(query);
			p.setString(1, userId);
			p.setString(2, systemIP);
			p.setString(3, systemDNS);
			p.setString(4, systemPort);
			p.setString(5, systemMAC);
			System.out.println(p.toString());
			p.execute();
			query = "commit;";
			p = DAO.con.prepareStatement(query);
			p.execute();
			DAO.close();
			

			// Post Successful Add
			%>
			<b>Computer Added Successfully</b><BR>
			<%
		} catch (Exception e) {
			%>
			<b>Exception occured when trying to add user.</b><BR>
			<%
			e.printStackTrace();
		}
		// Clear add computer marker
		session.setAttribute("addComputerFlag", 0);
	}else{
		// Set flag showing want to add a computer.
		session.setAttribute("addComputerFlag", 1);
		
		// Display form to add computer
		%>
		<form method="POST" action="computerAdd.jsp">
		  <p align="center">&nbsp;</p>
		  <div align="center">
		    <center>
		    <table border="0">
		      <tr>
		        <td width="50%" align="center">
		          <p align="center">Field</td>
		        <td width="50%" align="center">
		          <p align="center">Value</td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">
		          <p align="center">systemIP</td>
		        <td width="50%" align="center">
		          <p align="center"><input type="text" name="systemIP" size="20"></td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">
		          <p align="center">systemDNS</td>
		        <td width="50%" align="center">
		          <p align="center"><input type="text" name="systemDNS" size="20"></td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">
		          <p align="center">systemPort</td>
		        <td width="50%" align="center">
		          <p align="center"><input type="text" name="systemPort" size="20"></td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">systemMAC</td>
		        <td width="50%" align="center"><input type="text" name="systemMAC" size="20"></td>
		      </tr>
		    </table>
		    </center>
		  </div>
		  <p align="center"><input type="submit" value="Submit" name="B1"></p>
		</form>
		<%
	}
%>

<br><br>
<a href="computerListAll.jsp">Return to Computer List</a>
</center>

<jsp:include page="footer.inc"></jsp:include>
