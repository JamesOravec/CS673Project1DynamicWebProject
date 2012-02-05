package edu.unlv.cs673.echoteam.servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ComputerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static String COMPUTER_ADD_JSP = "/computerAdd.jsp";
	private static String COMPUTER_DELETE_JSP = "/computerDelete.jsp";
	private static String COMPUTER_EDIT_JSP = "/computerEdit.jsp";
	private static String COMPUTER_LISTALL_JSP = "/computerListAll.jsp";
	
	public void init() throws ServletException {}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		// TODO: Verify user is logged in

		// Check get vars to know which function to do
		// Get a map of the request parameters
		String forward="";
		Map parameters = request.getParameterMap();
		if (parameters.containsKey("add")){
			forward = COMPUTER_ADD_JSP;
		} else if (parameters.containsKey("delete")){
			forward = COMPUTER_DELETE_JSP;
		} else if (parameters.containsKey("edit")){
			forward = COMPUTER_EDIT_JSP;
		} else {
			forward = COMPUTER_LISTALL_JSP;
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
		
	}
	public void destroy() {}
}
