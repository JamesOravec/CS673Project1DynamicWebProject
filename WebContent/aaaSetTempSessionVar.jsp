<%@page import="org.eclipse.jdt.internal.compiler.ast.TryStatement"%>
<%@ page import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<center>
<%
	// Pretend a user is logged in with Id 1.
	session.setAttribute("userId", 1);
%>

<br><br>
<a href="computerAdd.jsp">Go to computerAdd.jsp to test</a>
</center>

<jsp:include page="footer.inc"></jsp:include>
