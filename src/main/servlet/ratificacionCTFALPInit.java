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
 * Servlet implementation class Evaluacion y Recomendacion de Ofertas
 */
@WebServlet("/ratificacionCTFALPInit")
public class ratificacionCTFALPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ratificacionCTFALPInit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Servlet inicial de Evaluacion y Recomendacion
		/*
		* Parametros de sesion establecidos para la pasarela
		* funcion: Modo de visor de pasarela 
		* openMode: interruptor de atributo "disabled" para inputs HTML de la pasarela 
		* codPadreVaciadoER: ID de la base de datos del registro a gestionar en el modo consultar, modificar y revisar & aprobar 
		* purchaseProcessCod: Codigo de proceso de compra vinculado
		* buyRequestCod: Codigo de solicitud de compra
		* SDID: ID de Solicitud de disponibilidad (Se establece en vaciadoEvaluacionRecomendacionALPServlet.java)
		* SCbenef: Beneficiario vinculado a la solicitud de compra
		*/

		HttpSession session = request.getSession(true);
		String func = request.getParameter("submit");

		if (func != null && !func.isEmpty()) {

			switch (func) {
				case "modificar":
				case "consultar":
					String codPadre = request.getParameter("requestBuyCOD");

					if (codPadre == null || codPadre.isEmpty()) {
						request.getRequestDispatcher("ratificacionCTFOferta.jsp").forward(request, response);
					} else {
						Long idPadre = solicitudCompraALPDao.getIDByPurchaseRequestCod(codPadre);
						solicitudCompraALP buyRequestSelected = solicitudCompraALPDao.getOneBySCID(codPadre);

						if (func.contentEquals("consultar")) {
							session.setAttribute("funcion", "CONSULTAR");
							session.setAttribute("openMode", "disabled");

							request.setAttribute("funcion", "CONSULTAR");
							request.setAttribute("openMode", "disabled");
						} else {
							session.setAttribute("funcion", "MODIFICAR");
							session.setAttribute("openMode", "");

							request.setAttribute("funcion", "MODIFICAR");
							request.setAttribute("openMode", "");
						}

						ArrayList<solicitudDisponibilidadALP> SDListYES = solicitudDisponibilidadALPDao.getAllBySCIDAndEmptyingState(idPadre, "SI");
						ArrayList<solicitudDisponibilidadALP> SDListNO = solicitudDisponibilidadALPDao.getAllBySCIDAndEmptyingState(idPadre, "NO");

						session.setAttribute("codPadreVaciadoER", idPadre);
						session.setAttribute("purchaseProcessCod", buyRequestSelected.getNoProcesoCompra());
						session.setAttribute("buyRequestCod", buyRequestSelected.getCodSolicitudCompra());
						session.setAttribute("SCbenef", buyRequestSelected.getBeneficiario());

						request.setAttribute("SDListYES", SDListYES);
						request.setAttribute("SDListNO", SDListNO);

						request.getRequestDispatcher("nVaciadoEvaluacionRatificacionCTFALP.jsp").forward(request, response);
					}
					break;
				default:
					
					session.removeAttribute("openMode");
					session.removeAttribute("codPadreVaciadoER");
					request.setAttribute("openMode", "openError");
					request.getRequestDispatcher("ratificacionCTFOferta.jsp").forward(request, response);
					break;
			}
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreVaciadoER");
			request.setAttribute("openMode", "openError");
			request.getRequestDispatcher("ratificacionCTFOferta.jsp").forward(request, response);
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
