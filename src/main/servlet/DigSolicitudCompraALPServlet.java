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
 * Servlet implementation class preSeleccionIPSolicitudCompraALP
 */
@WebServlet("/DigSolicitudCompraALPServlet")
public class DigSolicitudCompraALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DigSolicitudCompraALPServlet() {
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
					ArrayList<listaRequerimientoSolicitudCompraALP> actualNoOrStatesList = listaRequerimientoSolicitudCompraALPDao.getReqListStatesOrSCCodsByBuyRequestId(codPadre);
					for(listaRequerimientoSolicitudCompraALP req : actualNoOrStatesList)
					{
						if (req.getCodSolicitudDisponibilidad() != null && req.getCodSolicitudDisponibilidad().equalsIgnoreCase("PRE SELECCIONADO"))
						{
							listaRequerimientoSolicitudCompraALPDao.updateAvailabilityRequestNoOrState(codPadre, req.getNoItem(), "NINGUNO");
						}
					}
					
					try
					{
						String controlChecks[] = request.getParameterValues("reqReg");
						if (controlChecks != null)
						{
							for (int a=0; a<controlChecks.length; a++)
							{
								listaRequerimientoSolicitudCompraALPDao.updateAvailabilityRequestNoOrState(codPadre, Long.parseLong(controlChecks[a]), "PRE SELECCIONADO");
							}
						}
						
						ArrayList<listaRequerimientoSolicitudCompraALP> reqProductSuppliers = listaRequerimientoSolicitudCompraALPDao
								.getReqSuppliersPreselectedByBuyRequestIdForFilter(codPadre);
						request.setAttribute("reqProductSuppliers", reqProductSuppliers);
						request.setAttribute("noSolDisponibilidad", solicitudDisponibilidadALPDao.getNewCod(codPadre));
						
						request.getRequestDispatcher("nDisponibilidadSolicitudCompraALP.jsp").forward(request, response);
					}
					catch (Exception e)
					{
						ArrayList<listaRequerimientoSolicitudCompraALP> reqProductNames = listaRequerimientoSolicitudCompraALPDao
								.getReqSuppliersPreselectedByBuyRequestIdForFilter(codPadre);
						request.setAttribute("reqProductNames", reqProductNames);
						
						request.getRequestDispatcher("nPreseleccionItemSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
				case "CONSULTAR":
					ArrayList<listaRequerimientoSolicitudCompraALP> reqProductSuppliers = listaRequerimientoSolicitudCompraALPDao
						.getReqSuppliersPreselectedByBuyRequestIdForFilter(codPadre);
					request.setAttribute("reqProductSuppliers", reqProductSuppliers);
					
					request.getRequestDispatcher("nDisponibilidadSolicitudCompraALP.jsp").forward(request, response);
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
