<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unlv.cs673.echoteam.ComputerDAO,
					edu.unlv.cs673.echoteam.helpers.ComputerHelper,
					java.util.List,
					java.util.ArrayList,
					java.io.PrintWriter,
					java.sql.ResultSet,
					java.sql.SQLException" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<%
		ComputerDAO computerDao = new ComputerDAO();
		
		String select[] = request.getParameterValues("computerId");
		String IPs[] = request.getParameterValues("computerIP");
		String Ports[] = request.getParameterValues("computerPort");
		String MACs[] = request.getParameterValues("computerMAC");
		
		computerDao.updateComputers(select, IPs, Ports, MACs);
	%>
	<center>
	<b>Systems(s) Updated Successfully</b><BR> <a href="computerListAll.jsp">Return</a>
</center>
<jsp:include page="footer.inc"></jsp:include>
</body>
</html>