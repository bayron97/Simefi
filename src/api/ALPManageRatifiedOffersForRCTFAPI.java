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
@WebServlet("/ALPManageRatifiedOffersForRCTFAPI")
public class ALPManageRatifiedOffersForRCTFAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageRatifiedOffersForRCTFAPI() {
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
		
		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;

			switch (mode) {
				case "new":
					String SDCod = request.getParameter("SDCod");
					System.out.println("ASASASASASASAS " + SDCod);
					int noItem;
//					try {
//						noItem = Integer.parseInt(request.getParameter("noItemSelected"));
//					}catch(Exception e) {
//						noItem = -1;
//						data = "inputError";
//					}
					
					if (SDCod != null && !SDCod.isEmpty())
					{
						
						String prelacionRTC = request.getParameter("prelacionRTC");
						String ratificacionCT = request.getParameter("ratificacionCT");
						String segundaRCC = request.getParameter("segundaRCC");
						String criterioResolucionCT = request.getParameter("criterioResolucionCT");
						String comentariosRatificacion = request.getParameter("comentariosRatificacion");
						String estadoCompra = "RATIFICACION REALIZADA";
						
						listaRequerimientoSolicitudDisponibilidadALP ul = new listaRequerimientoSolicitudDisponibilidadALP();
						
						//ul.setIdSolicitudDisponibilidad(solicitudDisponibilidadALPDao.getIdBySDCod(SDCod));
						//ul.setNoItem(noItem);
						ul.setRatificacionCT(ratificacionCT.toUpperCase());
						ul.setCriterioResolucionCT(criterioResolucionCT.toUpperCase());
						ul.setComentariosRatificacion(comentariosRatificacion.toUpperCase());
						ul.setEstadoCompra(estadoCompra);
						ul.setsegundaRCC(segundaRCC);
						
						ul.setPrelacionRT(prelacionRTC);
						System.out.println(ul.getsegundaRCC());
						
						SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
						ul.setFechaRatificacion(simpleDateFormat.format(new Date()).toString());
						
						

						int id = Integer.parseInt(request.getParameter("idModificar"));
						
						status = listaRequerimientoSolicitudDisponibilidadALPDao.actualizarRactificacion(ul,id);
						
						
						//status = listaRequerimientoSolicitudDisponibilidadALPDao.updateRatifiedOffer(ul);
						
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
			response.setContentType("application/json");
			long filterItem;
			try {
				filterItem = Long.parseLong(request.getParameter("filterItem"));
			}
			catch (Exception e)
			{
				filterItem = -1;
			}
			//data = listaRequerimientoSolicitudDisponibilidadALPDao.getAllByNoItemForRatifiedOffers_JSON(buyRequestCod, filterItem, request.getParameter("filterItem"));
			data = listaRequerimientoSolicitudDisponibilidadALPDao.getAllByNoItemForRatifiedOffers_JSON_(buyRequestCod, filterItem, request.getParameter("filterItem"));
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
