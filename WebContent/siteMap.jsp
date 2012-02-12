<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="edu.unlv.cs673.echoteam.DAO,
				java.io.PrintWriter,
				java.sql.*,
				javax.persistence.*
				" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<a href="aaaSetTempSessionVar.jsp">aaaSetTempSessionVar.jsp</a><BR>
<a href="adminComputerListAll.jsp">adminComputerListAll.jsp</a><BR>
<a href="adminUserChanged.jsp">adminUserChanged.jsp</a><BR>
<a href="adminUserDelete.jsp">adminUserDelete.jsp</a><BR>
<a href="adminUserEdit.jsp">adminUserEdit.jsp</a><BR>
<a href="adminUserListAll.jsp">adminUserListAll.jsp</a><BR>
<a href="computerAdd.jsp">computerAdd.jsp</a><BR>
<a href="computerChanged.jsp">computerChanged.jsp</a><BR>
<a href="computerDelete.jsp">computerDelete.jsp</a><BR>
<a href="computerEdit.jsp">computerEdit.jsp</a><BR>
<a href="computerListAll.jsp">computerListAll.jsp</a><BR>
<a href="index.jsp">index.jsp</a><BR>
<a href="login.jsp">login.jsp</a><BR>
<a href="signup.jsp">signup.jsp</a><BR>
<a href="siteMap.jsp">siteMap.jsp</a><BR>
<a href="userAdd.jsp">userAdd.jsp</a><BR>

<jsp:include page="footer.inc"></jsp:include>
