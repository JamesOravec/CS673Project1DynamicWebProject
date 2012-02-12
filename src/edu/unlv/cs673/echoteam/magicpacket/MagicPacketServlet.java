package edu.unlv.cs673.echoteam.magicpacket;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MagicPacketServlet
 */
public class MagicPacketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MagicPacketServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MagicPacketer magicPacketer = new MagicPacketer();
		magicPacketer.Wake("192.168.1.113", "00:24:8C:9E:17:B4");

		// Test page output
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(5);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();

		out.println("Wake command issued!");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}