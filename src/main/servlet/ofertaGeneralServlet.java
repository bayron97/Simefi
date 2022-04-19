package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ofertaALPServlet
 */
@WebServlet("/ofertaGeneralServlet")
public class ofertaGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ofertaGeneralServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	
		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			String submit = request.getParameter("submit");

			if (submit != null && !submit.isEmpty()) {
				int status = 0;
				switch (submit) {
					case "offersControl":
						int counter = 0;
						String noProcesoCompra = request.getParameter("buyProcessNumberForModal");
						String[] productIds = request.getParameterValues("productId");
						String[] offerNumbers = request.getParameterValues("recOffer");
						if (productIds != null && offerNumbers != null && noProcesoCompra != null) {
							int cantMedicamentosCompletados = vaciadoOfertasGeneralDao
									.getCompletadosByGeneralNumber(noProcesoCompra);
							for (int i = 0; i < offerNumbers.length; i++) {
								status = listaRequerimientoConsolidadaALPDao.updateNoOfferReceived(noProcesoCompra,
										productIds[i], offerNumbers[i]);
								if (status != 0 && Integer.parseInt(offerNumbers[i]) > 0) {
									counter++;
									int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao
											.getCantMedsByProcAndReqID(Long.parseLong(productIds[i]), noProcesoCompra);
									if (nuevoNumeroOfertasIngresadasPorMedicamento >= Integer.parseInt(offerNumbers[i])) {
										vaciadoOfertasALPDao.updateCompletadosPlus(noProcesoCompra);
									} else if (cantMedicamentosCompletados > 0) {
										vaciadoOfertasALPDao.updateCompletadosMinus(noProcesoCompra);
									}
								}
							}
							//vaciadoOfertasALPDao.updateOfferControlByALPNumber(noProcesoCompra, counter);
						}
						break;
					default:
						break;
				}
				request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
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
