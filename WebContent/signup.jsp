<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="header.inc"></jsp:include>

<center>
	<h3>New User Sign Up</h3>
	
	<%
		if(	(Integer)request.getAttribute("user") == 1){
			
			
		}
	
	%>
	
	<form method="POST" action="userAdd.jsp">
		<p align="center">Add User</p>
		<div align="center">
			<table border="0">
				<tr>
					<td width="50%" align="right">
						<p align="right">User Name &nbsp; &nbsp; &nbsp;
					</td>
					<center>
						<td width="50%" align="center">
							<p align="center">
								<input type="text" name="user" size="20">
						</td>
				</tr>
				</center>
				<tr>
					<td width="50%" align="right">
						<p align="right">Password &nbsp; &nbsp; &nbsp;
					</td>
					<center>
						<td width="50%" align="center">
							<p align="center">
								<input type="password" name="password" size="20">
						</td>
				</tr>
			</table>
</center>
</div>
<p align="center">
	<input type="submit" value="Submit" name="B1">
</p>
</form>
</center>

<%
	session.setAttribute( "userSet", 1 );
%>

<jsp:include page="footer.inc"></jsp:include>
