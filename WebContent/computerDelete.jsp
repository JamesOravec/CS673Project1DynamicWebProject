<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unlv.cs673.echoteam.ComputerDAO,
					java.io.PrintWriter,java.sql.*,
					javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>
<%
	ComputerDAO computerDao = new ComputerDAO();
	String select[] = request.getParameterValues("computerId");
	int id = 0;
	
	if (select != null) {
		// delete all computers marked for deletion 
		for (int i = 0; i < select.length; i++) {
			id = Integer.valueOf(select[i]);
			computerDao.deleteComputerById(id);
		}
		out.println("<center><b>Computer Record(s) Removed Successfully</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}else{
		out.println("<center><b>No Computer Record Removed</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}
%>
<jsp:include page="footer.inc"></jsp:include>
