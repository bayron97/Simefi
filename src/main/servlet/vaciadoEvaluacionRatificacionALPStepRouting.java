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
 * Servlet implementation class vaciadoEvaluacionRecomendacionALPServlet
 */
@WebServlet("/vaciadoEvaluacionRatificacionALPStepRouting")
public class vaciadoEvaluacionRatificacionALPStepRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public vaciadoEvaluacionRatificacionALPStepRouting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet de Guardado, Edicion y Consulta: Proveedores

		HttpSession session = request.getSession(true);
		String func = (String) session.getAttribute("funcion");
		String openMode = (String)session.getAttribute("openMode");
		if (openMode == null)
		{
			openMode = "";
		}
		
		String step = request.getParameter("submit");

		if (func != null && !func.isEmpty()) {
			
			Long idPadre = Long.parseLong(session.getAttribute("codPadreVaciadoER").toString());

			switch (func) {
				case "MODIFICAR":
				case "CONSULTAR":
					if (step != null && !step.isEmpty()) {
						ArrayList<solicitudDisponibilidadALP> SDListYES = solicitudDisponibilidadALPDao.getAllBySCIDAndEmptyingState(idPadre, "SI");
						ArrayList<solicitudDisponibilidadALP> SDListNO = solicitudDisponibilidadALPDao.getAllBySCIDAndEmptyingState(idPadre, "NO");
						
						switch (step) {
							case "proveedor":
								request.setAttribute("openMode", openMode);
								
								request.setAttribute("SDListYES", SDListYES);
								request.setAttribute("SDListNO", SDListNO);

								request.getRequestDispatcher("nVaciadoEvaluacionRatificacionCTFALP.jsp").forward(request, response);
								break;
							case "ratificarOferta":
								String purchaseProcessCod = (String)session.getAttribute("purchaseProcessCod");
								String buyRequestCod = (String)session.getAttribute("buyRequestCod");
								String SCbenef = (String)session.getAttribute("SCbenef");
									
								request.setAttribute("codPadre", idPadre);
								request.setAttribute("openMode", openMode);
								request.setAttribute("purchaseProcessCod", purchaseProcessCod);
								request.setAttribute("buyRequestCod", buyRequestCod);
								request.setAttribute("SCbenef", SCbenef);
									
								request.getRequestDispatcher("nRatificacionOfertaForERALP.jsp").forward(request, response);
								break;
							default:
								request.setAttribute("openMode", "openError");
								request.getRequestDispatcher("ratificacionCTFOferta.jsp").forward(request, response);
								break;
						}
					} else {
						request.getRequestDispatcher("ratificacionCTFOferta.jsp").forward(request, response);
					}
					break;
				default:
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
