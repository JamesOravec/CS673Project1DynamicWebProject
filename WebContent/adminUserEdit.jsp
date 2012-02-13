<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unlv.cs673.echoteam.UserDAO,
					edu.unlv.cs673.echoteam.helpers.UserHelper,
					java.util.List,
					java.util.ArrayList,
					java.io.PrintWriter,
					java.sql.*
					,javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<jsp:include page="header.inc"></jsp:include>
<jsp:include page="verifyAdminLogin.jsp"></jsp:include>

<center>
	<form method="GET" action="adminUserChanged.jsp" name="listall">
		<table border="1">
			<tr>
				<th>UserName</th>
				<th>UserPassword</th>
				<th>UserEmail</th>
			</tr>
			<%
				int currUserId = (Integer) session.getAttribute("userId");
				UserDAO userDao = new UserDAO();
				List<UserHelper> results = userDao.selectAllUsers();
	
				int id = Integer.parseInt(request.getParameter("userId"));
	
				for (int j = 0; j < results.size(); j++) {
					UserHelper uh = results.get(j);
					if (Integer.valueOf(uh.getUserId()) == id) {
						out.println("<tr>");
						out.println("<td><input type=\"text\" name=\"userName\" value=\"" + uh.getUserName() + "\" /></td>");
						out.println("<td><input type=\"text\" name=\"userPassword\" value=\"" + uh.getUserPassword() + "\" /></td>");
						out.println("<td><input type=\"text\" name=\"userEmail\" value=\"" + uh.getUserEmail() + "\" /></td>");
						out.println("</tr>");
						out.println("<input type=\"hidden\" name=\"userId\" value=\"" + id + "\" />");
					}
				}
			%>

		</table>
		<input type="submit" name="save" value="Save Changes" />
	</form>
	<a href="userListAll.jsp">Return</a>
</center>
<jsp:include page="footer.inc"></jsp:include>
</body>
</html>
