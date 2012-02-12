<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="edu.unlv.cs673.echoteam.magicpacket.MagicPacketer,
				java.io.PrintWriter,
				java.sql.*,
				javax.persistence.*
				" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyLogin.jsp"></jsp:include>
<%
	MagicPacketer magicPacketer = new MagicPacketer();
	String host = request.getParameter("host");
	String macAddress = request.getParameter("macAddress");
	
	try{
		magicPacketer.Wake(host, macAddress);
		out.println("<center><b>Magic Packet/WakeOnLAN Packet Sent Successfully</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}catch(Exception e){
		e.printStackTrace();
		out.println("<center><b>Error occured when trying to send Magic Packet/WakeOnLAN Packet</b><BR> <a href=\"computerListAll.jsp\">Return</a></center>");
	}
%>
<jsp:include page="footer.inc"></jsp:include>
