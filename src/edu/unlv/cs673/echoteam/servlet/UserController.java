package edu.unlv.cs673.echoteam.servlet;

import edu.unlv.cs673.echoteam.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class jdbcDemoServlet
 */
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String USER_ADD_JSP = "/userAdd.jsp";
	private static String USER_DELETE_JSP = "/userDelete.jsp";
	private static String USER_EDIT_JSP = "/userEdit.jsp";
	private static String USER_LISTALL_JSP = "/userListAll.jsp";
	
	public void init() throws ServletException {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		// TODO: Verify user is logged in

		// Check get vars to know which function to do
		// Get a map of the request parameters
		String forward="";
		Map parameters = request.getParameterMap();
		if (parameters.containsKey("add")){
			forward = USER_ADD_JSP;
		} else if (parameters.containsKey("delete")){
			forward = USER_DELETE_JSP;
		} else if (parameters.containsKey("edit")){
			forward = USER_EDIT_JSP;
		} else {
			forward = USER_LISTALL_JSP;
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}
	public void destroy() {}
}
