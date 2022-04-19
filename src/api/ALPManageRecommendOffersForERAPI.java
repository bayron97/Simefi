package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.dao.listaRequerimientoSolicitudDisponibilidadALPDao;
import main.dao.solicitudDisponibilidadALPDao;

/**
 * Servlet implementation class ALPManageEmptyingOffersForERAPI
 */
@WebServlet("/ALPManageRecommendOffersForERAPI")
public class ALPManageRecommendOffersForERAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageRecommendOffersForERAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String buyRequestCod = (String)session.getAttribute("buyRequestCod");
		String mode = request.getParameter("mode");
		System.out.println(buyRequestCod + " ccod");
		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;

			switch (mode) {
				case "new":
					String id = request.getParameter("SDCod");
					int noItem;
					try {
						noItem = Integer.parseInt(request.getParameter("noItemSelected"));
					}catch(Exception e) {
						noItem = -1;
						data = "inputError";
					}
					
					if (id != null && !id.isEmpty())
					{
						String recomendacionCE = request.getParameter("recomendacionCE");
						String criterioRecomendacion = request.getParameter("criterioRecomendacion");
						String observaciones = request.getParameter("observaciones");
						String prelacionRT = request.getParameter("prelacionRT");
						String estadoCompra = "RECOMENDACION REALIZADA";
						String segundaRCC = request.getParameter("segundaRCC");
						
						listaRequerimientoSolicitudDisponibilidadALP ul = new listaRequerimientoSolicitudDisponibilidadALP();
						
						//ul.setIdSolicitudDisponibilidad(solicitudDisponibilidadALPDao.getIdBySDCod(SDCod));
						
						if(segundaRCC.contentEquals("SOLICITDA")) {
							ul.setsegundaRCC("REALIZADA");
						}else {
							ul.setsegundaRCC(segundaRCC);
						}
						
						ul.setNoItem(noItem);
						ul.setRecomendacionCE(recomendacionCE.toUpperCase());
						ul.setCriterioRecomendacion(criterioRecomendacion.toUpperCase());
						ul.setObservaciones(observaciones.toUpperCase());
						ul.setPrelacionRT(prelacionRT);
						ul.setEstadoCompra(estadoCompra);
						ul.setId(Integer.parseInt(id));
						
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
						ul.setFechaRecomendacion(simpleDateFormat.format(new Date()).toString());
						
						status = listaRequerimientoSolicitudDisponibilidadALPDao.updateRecommendOfferById(ul);
						
						if (status != 0)
						{
							data = "successful";
						}
						else
						{
							data = "DBError";
						}
					}
					else
					{
						data = "inputError";
					}
					break;
				default:
					data = "modeError";
					break;
			}
			response.setContentType("text/plain");
			System.out.println("Request status: " + data);
		} else {
			//String coddSd = (String) session.getAttribute("SDID");
			String procesoCompra = request.getParameter("procesoCompra");
			
			response.setContentType("application/json");
			long filterItem;
			try {
				filterItem = Long.parseLong(request.getParameter("filterItem"));
				
			 
			}
			catch (Exception e)
			{
				filterItem = -1;
			}
			data = listaRequerimientoSolicitudDisponibilidadALPDao.getAllByNoItem_JSON(buyRequestCod, filterItem, procesoCompra);
			System.out.println("Get all offer data");
		}

		PrintWriter out = response.getWriter();
		out.print(data.toString());
		out.flush();
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
