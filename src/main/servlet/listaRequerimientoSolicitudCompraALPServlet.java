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
 * Servlet implementation class listaRequerimientoSolicitudCompraALP
 */
@WebServlet("/listaRequerimientoSolicitudCompraALPServlet")
public class listaRequerimientoSolicitudCompraALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listaRequerimientoSolicitudCompraALPServlet() {
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

		if (func != null && !func.isEmpty()) {
			String openMode = session.getAttribute("openMode").toString();
			long codPadre = (Long) session.getAttribute("codPadreSolCompra");
			request.setAttribute("openMode", openMode);
			request.setAttribute("funcion", func);

			switch (func) {
				case "NUEVO":
				case "MODIFICAR":
				case "CONSULTAR":
//					ArrayList<listaRequerimientoSolicitudCompraALP> reqProductNames = listaRequerimientoSolicitudCompraALPDao
//							.getReqNamesByBuyRequestIdForFilter(codPadre);
//					request.setAttribute("reqProductNames", reqProductNames);
					
					ArrayList<productoSolicitudCompraALP> reqProductNames = productoSolicitudCompraALPDao
							.getReqNamesByBuyRequestIdForFilter(codPadre);
					request.setAttribute("reqProductNames", reqProductNames);

					request.getRequestDispatcher("nPreseleccionItemSolicitudCompraALP.jsp").forward(request, response);
					break;
				default:
					session.removeAttribute("funcion");
					session.removeAttribute("openMode");
					session.removeAttribute("codPadreSolCompra");
					session.removeAttribute("purchaseCOD");
					request.setAttribute("openMode", "openError");

					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
			}
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreSolCompra");
			session.removeAttribute("purchaseCOD");
			request.setAttribute("openMode", "openError");

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
