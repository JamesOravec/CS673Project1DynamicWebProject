<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@ page import="edu.unlv.cs673.echoteam.ComputerDAO,
					java.io.PrintWriter,java.sql.*,
					javax.persistence.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>

<center>
<%
	// If session var is set, then add the computer info to the db, else display the form to add a computer
	if ((session.getAttribute("addComputerFlag")!=null)&&(Integer)session.getAttribute("addComputerFlag") == 1) {
		try {
			// Get information that was posted from signup.jsp
			String userId = Integer.toString(((Integer)session.getAttribute("userId")));
			String computerIP = request.getParameter("computerIP");
			String computerPort = request.getParameter("computerPort");
			String computerMAC = request.getParameter("computerMAC");

			// Check for nulls and replace with empty strings
			if(computerIP==null){
				computerIP="";
			}
			if(computerPort==null){
				computerPort="";
			}
			if(computerMAC==null){
				computerMAC="";
			}
			
			ComputerDAO myDao = new ComputerDAO();
			myDao.insertComputer(userId, computerIP, computerPort, computerMAC);			 

			out.println("<center><b>Computer Added Successfully</b><BR></center>");
		} catch (Exception e) {
			out.println("<center><b>Exception occured when trying to add computer.</b><BR></center>");
			e.printStackTrace();
		}
		// Clear add computer marker
		session.setAttribute("addComputerFlag", 0);
	} else { 
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
		          <p align="center">computerIP</td>
		        <td width="50%" align="center">
		          <p align="center"><input type="text" name="computerIP" size="20"></td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">
		          <p align="center">computerPort</td>
		        <td width="50%" align="center">
		          <p align="center"><input type="text" name="computerPort" size="20"></td>
		      </tr>
		      <tr>
		        <td width="50%" align="center">computerMAC</td>
		        <td width="50%" align="center"><input type="text" name="computerMAC" size="20"></td>
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
