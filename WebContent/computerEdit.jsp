<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="edu.unlv.cs673.echoteam.ComputerDAO,
					edu.unlv.cs673.echoteam.helpers.ComputerHelper,
					java.util.List,
					java.util.Map,
					java.util.*,
					java.util.ArrayList,
					java.io.PrintWriter,
					java.sql.*,
					javax.persistence.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
	<jsp:include page="header.inc"></jsp:include>
	<jsp:include page="verifyLogin.jsp"></jsp:include>
	
	<center>
		<form method="GET" action="computerChanged.jsp" name="listall">
			<table border="1">
				<tr>
					<th>&nbsp; &nbsp; &nbsp; computerIP &nbsp; &nbsp; &nbsp;</th>
					<th>&nbsp; &nbsp; &nbsp; computerPort &nbsp; &nbsp; &nbsp;</th>
					<th>&nbsp; &nbsp; &nbsp; computerMAC &nbsp; &nbsp; &nbsp;</th>
				</tr>
				<%
					int currUserId = (Integer) session.getAttribute("userId");
					ComputerDAO computerDao = new ComputerDAO();
					List<ComputerHelper> results = computerDao.selectAllComputersForUser(currUserId);

					int id = Integer.parseInt(request.getParameter("computerId"));

					for (int j = 0; j < results.size(); j++) {
						ComputerHelper ch = results.get(j);
						if (Integer.valueOf(ch.getComputerId()) == id) {
							out.println("<tr>");
							out.println("<td><input type=\"text\" name=\"computerIP\" value=\"" + ch.getComputerIP() + "\" /></td>");
							out.println("<td><input type=\"text\" name=\"computerPort\" value=\"" + ch.getComputerPort() + "\" /></td>");
							out.println("<td><input type=\"text\" name=\"computerMAC\" value=\"" + ch.getComputerMAC() + "\" /></td>");
							out.println("</tr>");
							out.println("<input type=\"hidden\" name=\"computerId\" value=\"" + id + "\" />");
						}
					}
				%>
			</table>
			<input type="submit" name="save" value="Save Changes" />
		</form>
		<a href="computerListAll.jsp">Return</a>
	</center>
	<jsp:include page="footer.inc"></jsp:include>
</body>
</html>
