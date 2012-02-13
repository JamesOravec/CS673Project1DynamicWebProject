<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.jamesoravec.samplecode.examples.hibernate.*,
					java.io.PrintWriter,
					java.sql.*,
					javax.persistence.*
					" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>
<%
	String host = request.getParameter("host");
	int port = Integer.parseInt(request.getParameter("port"));
	Requestor sleepRequestor = new Requestor();
	
	try{
		sleepRequestor.run(host, port);
		out.println("<center><b>Sleep Request Sent Successfully</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<center><b>Error occured when trying to send Sleep Request</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}
%>
<jsp:include page="footer.inc"></jsp:include>
