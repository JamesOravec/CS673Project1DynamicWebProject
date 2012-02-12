<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyAdminLogin.jsp"></jsp:include>

<%
	DAO myDao = new DAO();
	int id = 0;
	String query = "DELETE FROM echousers WHERE userID = ?";
	PreparedStatement p = DAO.con.prepareStatement(query);
	String select[] = request.getParameterValues("UserId");
	
	if (select != null) {
		for (int i = 0; i < select.length; i++) {
			id = Integer.valueOf(select[i]);
			p.setInt(1, id);
			p.execute();
		}
		out.println("<center><b>User(s) Removed Successfully</b><BR> <a href=\"adminUserListAll.jsp\">Return</a></center>");
	}else{
		out.println("<center><b>No user Records Removed</b><BR> <a href=\"adminUserListAll.jsp\">Return</a></center>");
	}
%>

<jsp:include page="footer.inc"></jsp:include>