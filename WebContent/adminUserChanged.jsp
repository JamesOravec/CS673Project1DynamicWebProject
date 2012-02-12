<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*"%>
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
		DAO myDao = new DAO();
		String query = "UPDATE echousers set userName = ?, userPassword = ? WHERE userID = ?";
		String select[] = request.getParameterValues("UserId");
		String usernames[] = request.getParameterValues("Username");
		String passwords[] = request.getParameterValues("Password");
		PreparedStatement p;
		int id = 0;
		try {
			p = DAO.con.prepareStatement(query);
			if (usernames != null) {
				for (int i = 0; i < select.length; i++) {
					id = Integer.valueOf(select[i]);
					p.setString(1, usernames[i]);
					p.setString(2, passwords[i]);
					p.setInt(3, id);
					p.execute();
				}

				DAO.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<center>
	<b>User(s) Updated Successfully</b><BR> <a href="userListAll.jsp">Return</a>
</center>
<jsp:include page="footer.inc"></jsp:include>
</body>
</html>