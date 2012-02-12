/**
 * @author James Oravec, Shawn Cannon
 * CS673 - Project 1 - Echo Team
 * 
 * Repurposed JdbcDemo for returning a match for the username/password
 * This class will be used to handle the data from the form in login.jsp. It will connect to a database and authenticate the login.
 * mysql username and password are hardcoded in here
 */

package edu.shawncannon.login;

import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;
import edu.unlv.cs673.echoteam.DAO;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String target = "/computerListAll.jsp";
	private String failure = "/login.jsp";

	/**
	 * @author James Oravec The following will connect to the MySQL db, query
	 *         the user table and search for a match to the given username and
	 *         password. if one is found it will return the UserID number
	 *         (String) if none is found it will return an empty string ("")
	 * @return
	 */
	public String Authenticate(String username, String password) {
		try {
			DAO myDao = new DAO();
			ResultSet rs = myDao.readQuery("SELECT * FROM echousers;");

			while (rs.next()) {
				if (username.equals(rs.getString(2))
						&& password.equals(rs.getString(3)))
					return rs.getString(1);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DAO.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return "";
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ServletContext context = getServletContext();
		String user = Authenticate(username, password);
		request.setAttribute("userId", user);
		
		if(user == "")
		{
		RequestDispatcher dispatcher = context.getRequestDispatcher(failure);
		dispatcher.forward(request, response);
		}
		
		if(user != "")
		{
		RequestDispatcher dispatcher = context.getRequestDispatcher(target);
		dispatcher.forward(request, response);
		}
		
		
	}

	public void destroy() {
	}
}
