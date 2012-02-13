<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unlv.cs673.echoteam.UserDAO,
					java.io.PrintWriter,
					java.sql.*,
					javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyAdminLogin.jsp"></jsp:include>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<%
		String select[] = request.getParameterValues("userId");
		String usernames[] = request.getParameterValues("userName");
		String passwords[] = request.getParameterValues("userPassword");
		String emails[] = request.getParameterValues("userEmail");
		
		UserDAO userDAO = new UserDAO();
		userDAO.updateComptuerById(select, usernames, passwords, emails);
	%>
	<center>
	<b>User(s) Updated Successfully</b><BR> <a href="adminUserListAll.jsp">Return</a>
</center>
<jsp:include page="footer.inc"></jsp:include>
</body>
</html>