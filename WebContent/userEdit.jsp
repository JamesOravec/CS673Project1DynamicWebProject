<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
<jsp:include page="header.inc"></jsp:include>
<center>
	<form method="GET" action="userChanged.jsp" name="listall">
		<table border="1">
			<tr>
				<th>UserName</th>
				<th>UserPassword</th>
			</tr>
			<%
				DAO myDao = new DAO();
				int id = 0;
				String select[] = request.getParameterValues("UserId");
				ResultSet rs = myDao.readQuery("SELECT * FROM echousers;");

				try {
					while (rs.next()) {

						for (int i = 0; i < select.length; i++) {
							id = Integer.valueOf(select[i]);
							if (Integer.valueOf(rs.getString(1)) == id) {
								out.println("<tr>");
								out.println("<td><input type=\"text\" name=\"Username\" value=\""
										+ rs.getString(2) + "\" />");
								out.println("</td>");
								out.println("<td><input type=\"text\" name=\"Password\" value=\""
										+ rs.getString(3) + "\" />");
								out.println("</td>");
								out.println("</tr>");
								out.println("<input type=\"hidden\" name=\"UserId\" value=\""
										+ id + "\" />");
							}

						}
					}

				} catch (SQLException e) {
					e.printStackTrace();
				}
			%>

		</table>
		<input type="submit" name="save" value="Save Changes" />
	</form>
	<a href="userListAll.jsp">Return</a>
</center>
<%
	DAO.close();
%>

<jsp:include page="footer.inc"></jsp:include>
</body>
</html>
