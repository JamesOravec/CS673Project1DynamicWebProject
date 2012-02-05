package com.jamesoravec.samplecode.examples.jdbc;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class jdbcDemoServlet
 */
public class jdbcDemoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static JdbcDemo myDao = new JdbcDemo();

	public void init() throws ServletException {
		// Nothing needed.
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
//		// Set a cookie for the user, so that the counter does not increate
//		// everytime the user press refresh
//		HttpSession session = request.getSession(true);
//		// Set the session valid for 5 secs
//		session.setMaxInactiveInterval(5);
//		response.setContentType("text/plain");

		PrintWriter out = response.getWriter();
		out.println(myDao.outputAllEchoUserRecords());
	}

	public void destroy() {
//		super.destroy();
//		try {
//			dao.save(count);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	}

}
