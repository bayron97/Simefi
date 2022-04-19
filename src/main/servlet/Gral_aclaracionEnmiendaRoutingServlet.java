package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.math.BigInteger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class amendmentsRoutingServlet
 */
@WebServlet("/Gral_aclaracionEnmiendaRoutingServlet")
public class Gral_aclaracionEnmiendaRoutingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_aclaracionEnmiendaRoutingServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		String funcion = request.getParameter("submit");
//		String controlCod = request.getParameter("id");
		HttpSession session = request.getSession(true);
		
		try {
			
			  session.removeAttribute("idAclaracionEnmienda");
		      session.removeAttribute("idAperturaProceso");
		      session.removeAttribute("accion");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
			
			
		}catch (Exception e){
			
		}
		
		
		
	}

//		String openMode;

		

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 * 
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
