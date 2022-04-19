package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class amendmentsRoutingServlet
 */
@WebServlet("/amendmentsALPRoutingServlet")
public class amendmentsALPRoutingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public amendmentsALPRoutingServlet() {
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
		String funcion = request.getParameter("submit");
		String controlCod = request.getParameter("id");
		HttpSession session = request.getSession(true);

		String openMode;

		if (funcion != null) {
			session.setAttribute("funcion", funcion);
			switch (funcion) {
				case "nuevo":
					openMode = "";
					request.setAttribute("mProductosChecked", "false");
					request.setAttribute("observaciones", "");
					request.setAttribute("openMode", openMode);
					request.getRequestDispatcher("nAmendmentForALP.jsp").forward(request, response);
					break;
				case "modificar":
					if (controlCod != null && !controlCod.isEmpty()) {

						int cod = Integer.parseInt(controlCod);
						aclaracionEnmiendaALP a = aclaracionEnmiendaALPDao.getById(cod);

						openMode = "";
						request.setAttribute("openMode", openMode);
						request.setAttribute("mProductosChecked", "false");

						request.setAttribute("cod", a.getCod());
						request.setAttribute("noProcesoCompra", a.getProcesoCompra());
						request.setAttribute("fecha", a.getFecha());
						request.setAttribute("tipo", a.getTipo());
						request.setAttribute("horaLimite", a.getHoraLimite());
						request.setAttribute("diaLimite", a.getDiaLimite());
						request.setAttribute("horaApertura", a.getHoraApertura());
						request.setAttribute("diaApertura", a.getDiaApertura());
						request.setAttribute("lugarApertura", a.getLugarApertura());
						request.setAttribute("nombreDocumento", a.getDocumento());
						request.setAttribute("observaciones", a.getObservaciones());
						request.setAttribute("correlativoDocumento", a.getCorrelativoDocumento());
							
						System.out.println(a.getModificacionProductos());
						

						request.getRequestDispatcher("nAmendmentForALP.jsp").forward(request, response);
					} else {
						openMode = "error";
						request.setAttribute("openMode", openMode);
						request.getRequestDispatcher("amendmentsALP.jsp").forward(request, response);
					}
					break;
				case "consultar":
					if (controlCod != null && !controlCod.isEmpty()) {

						int cod = Integer.parseInt(controlCod);
						aclaracionEnmiendaALP a = aclaracionEnmiendaALPDao.getById(cod);

						openMode = "disabled";
						request.setAttribute("openMode", openMode);

						request.setAttribute("cod", a.getCod());
						request.setAttribute("noProcesoCompra", a.getProcesoCompra());
						request.setAttribute("fecha", a.getFecha());
						request.setAttribute("tipo", a.getTipo());
						request.setAttribute("horaLimite", a.getHoraLimite());
						request.setAttribute("diaLimite", a.getDiaLimite());
						request.setAttribute("horaApertura", a.getHoraApertura());
						request.setAttribute("diaApertura", a.getDiaApertura());
						request.setAttribute("lugarApertura", a.getLugarApertura());
						request.setAttribute("nombreDocumento", a.getDocumento());
						request.setAttribute("observaciones", a.getObservaciones());
						request.setAttribute("correlativoDocumento", a.getCorrelativoDocumento());

						if (a.getModificacionProductos().equalsIgnoreCase("SI")) {
							request.setAttribute("mProductosChecked", "true");
						} else {
							request.setAttribute("mProductosChecked", "false");
						}

						request.getRequestDispatcher("nAmendmentForALP.jsp").forward(request, response);
					} else {
						openMode = "error";
						request.setAttribute("openMode", openMode);
						request.getRequestDispatcher("amendmentsALP.jsp").forward(request, response);
					}
					break;
				default:
					openMode = "error";
					request.setAttribute("throughServlet", "true");
					request.setAttribute("openMode", openMode);
					request.getRequestDispatcher("amendmentsALP.jsp").forward(request, response);
					break;
			}

		} else {
			openMode = "error";
			request.setAttribute("throughServlet", "true");
			request.setAttribute("openMode", openMode);
			request.getRequestDispatcher("amendmentsALP.jsp").forward(request, response);
		}
	}

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
