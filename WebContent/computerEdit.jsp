<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page
	import="edu.unlv.cs673.echoteam.DAO,java.io.PrintWriter,java.sql.*,javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<jsp:include page="header.inc"></jsp:include>
	<center>
		<form method="GET" action="computerChanged.jsp" name="listall">
			<table border="1">
				<tr>
					<th>&nbsp; &nbsp; &nbsp; systemIP &nbsp; &nbsp; &nbsp;</th>
					<th>&nbsp; &nbsp; &nbsp; systemDNS &nbsp; &nbsp; &nbsp;</th>
					<th>&nbsp; &nbsp; &nbsp; systemPort &nbsp; &nbsp; &nbsp;</th>
					<th>&nbsp; &nbsp; &nbsp; systemMAC &nbsp; &nbsp; &nbsp;</th>
				</tr>
				<%
					DAO myDao = new DAO();
					int id = 0;
					String select[] = request.getParameterValues("systemId");
					ResultSet rs = myDao.readQuery("SELECT * FROM echosystems;");

					try {
						while (rs.next() && select != null) {
							for (int i = 0; i < select.length; i++) {
								id = Integer.valueOf(select[i]);
								if (Integer.valueOf(rs.getString(1)) == id) {
									out.println("<tr>");
									out.println("<td><input type=\"text\" name=\"systemIP\" value=\""
											+ rs.getString(3) + "\" />");
									out.println("</td>");
									out.println("<td><input type=\"text\" name=\"systemDNS\" value=\""
											+ rs.getString(4) + "\" />");
									out.println("</td>");
									out.println("<td><input type=\"text\" name=\"systemPort\" value=\""
											+ rs.getString(5) + "\" />");
									out.println("</td>");
									out.println("<td><input type=\"text\" name=\"systemMAC\" value=\""
											+ rs.getString(6) + "\" />");
									out.println("</td>");
									out.println("</tr>");
									out.println("<input type=\"hidden\" name=\"systemId\" value=\""
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
		<a href="computerListAll.jsp">Return</a>
	</center>
	<%
		DAO.close();
	%>

	<jsp:include page="footer.inc"></jsp:include>
</body>
</html>
