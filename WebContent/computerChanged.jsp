<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<jsp:include page="header.inc"></jsp:include>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>
	<%
		DAO myDao = new DAO();
		String query = "UPDATE echosystems set systemIP = ?, systemDNS = ?, systemPort = ?, systemMAC = ? WHERE systemId = ?";
		String select[] = request.getParameterValues("systemId");
		String IPs[] = request.getParameterValues("systemIP");
		String DNSs[] = request.getParameterValues("systemDNS");
		String Ports[] = request.getParameterValues("systemPort");
		String MACs[] = request.getParameterValues("systemMAC");
		PreparedStatement p;
		int id = 0;
		try {
			p = DAO.con.prepareStatement(query);
			if (select != null) {
				for (int i = 0; i < select.length; i++) {
					id = Integer.valueOf(select[i]);
					p.setString(1, IPs[i]);
					p.setString(2, DNSs[i]);
					p.setString(3, Ports[i]);
					p.setString(4, MACs[i]);
					p.setInt(5, id);
					p.execute();
				}

				DAO.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	%>
	<center>
	<b>Systems(s) Updated Successfully</b><BR> <a href="computerListAll.jsp">Return</a>
</center>
<jsp:include page="footer.inc"></jsp:include>
</body>
</html>