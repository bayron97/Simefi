package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class solicitudDisponibilidadALP
 */
@WebServlet("/solicitudDisponibilidadALPServlet")
public class solicitudDisponibilidadALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public solicitudDisponibilidadALPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet de Guardado, Edicion y Consulta: Lista de requerimientos

		HttpSession session = request.getSession(true);
		String func = (String) session.getAttribute("funcion");
		
		System.out.println(func + " cccc");

		if (func != null && !func.isEmpty()) {
			String openMode = session.getAttribute("openMode").toString();
			request.setAttribute("openMode", openMode);

			switch (func) {
				case "NUEVO":
					System.out.println("Nuevo");
				case "MODIFICAR":
					System.out.println("Modificar");
				case "CONSULTAR":
					
					System.out.println("Consultar");
					//session.setAttribute("funcion", func);
					
					break;
				default:
					request.setAttribute("openMode", "openError");
					break;
			}
			session.setAttribute("funcion", func);
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreSolCompra");
			session.removeAttribute("purchaseCOD");
			request.setAttribute("throughServlet", "true");
			//request.getRequestDispatcher("nDigSolicitudCompALP.jsp").forward(request, response);
			request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreSolCompra");
			session.removeAttribute("purchaseCOD");
			request.setAttribute("openMode", "openError");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
