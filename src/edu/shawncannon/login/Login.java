/**
 * @author James Oravec, Shawn Cannon
 * CS673 - Project 1 - Echo Team
 */

package edu.shawncannon.login;

import javax.servlet.*;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import edu.unlv.cs673.echoteam.UserDAO;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String target = "/computerListAll.jsp";
	private String failure = "/login.jsp";

	/**
	 * Takes in a username and password, will check to see if there an a username/password
	 * combination in the database which matches the parameters. If one exists then the
	 * userId will be returned in the form of String, else the empty string will be returned.
	 * 
	 * @param username
	 * @param password
	 * @return
	 */
	public String Authenticate(String username, String password) {
		UserDAO userDao = new UserDAO();
		String userId = userDao.validUserPassword(username, password);
		return userId;
	}

	public void init(ServletConfig config) throws ServletException {
		super.init(config);
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ServletContext context = getServletContext();
		String user = Authenticate(username, password);
		request.setAttribute("userId", user);

		if (user == "") {
			RequestDispatcher dispatcher = context.getRequestDispatcher(failure);
			dispatcher.forward(request, response);
		}

		if (user != "") {
			RequestDispatcher dispatcher = context.getRequestDispatcher(target);
			dispatcher.forward(request, response);
		}
	}

	public void destroy() {}
}
