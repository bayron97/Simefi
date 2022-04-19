package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.Format;
import java.text.ParseException;
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
@WebServlet("/ALPManageEmptyingOffersForERAPI")
public class ALPManageEmptyingOffersForERAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageEmptyingOffersForERAPI() {
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
		String mode = request.getParameter("mode");
		Long codPadreVaciadoDisponibilidadER = (Long)session.getAttribute("codPadreVaciadoER");
		if (codPadreVaciadoDisponibilidadER == null) {
			codPadreVaciadoDisponibilidadER = Long.parseLong("0");
		}

		Long codDisponibilidadER = Long.parseLong(session.getAttribute("SDID").toString());
		
		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;

			switch (mode) {
				case "new":
					int noItem;
					try {
						noItem = Integer.parseInt(request.getParameter("noItem"));
					}catch(Exception e) {
						noItem = -1;
						data = "inputError";
					}
					
					String ofertaStatus = (String)request.getParameter("sinOferta");
					
					String tiempoEntregaOfertado = "N/A";
					String vidaUtilOfertada = "N/A";
					String estadoCompra = "NO PRESENTO OFERTA";
					String aclaracion = request.getParameter("detallesAclaracion");
					if (aclaracion == null || aclaracion.isEmpty())
					{
						aclaracion = "-";
					}
					int cantidadOfertada = 0;
					int cantidadEmpaquePrimario = 0;
					int cantidadEmpaqueSecundario = 0;
					int cantidadEmpaqueTerciario = 0;
					
					
					if (ofertaStatus == null)
					{
						tiempoEntregaOfertado = request.getParameter("tiempoEntregaOfertado");
						vidaUtilOfertada = request.getParameter("vidaUtilOfertada");
						estadoCompra = "VACIADO REALIZADO";
						
						try {
							cantidadOfertada = Integer.parseInt(request.getParameter("cantidadOfertada").replaceAll(",", ""));
							cantidadEmpaquePrimario = Integer.parseInt(request.getParameter("cantidadEmpaquePrimario").replaceAll(",", ""));
							cantidadEmpaqueSecundario = Integer.parseInt(request.getParameter("cantidadEmpaqueSecundario").replaceAll(",", ""));
							cantidadEmpaqueTerciario = Integer.parseInt(request.getParameter("cantidadEmpaqueSecundario").replaceAll(",", ""));
						}
						catch (Exception e){
							cantidadOfertada = 0;
							cantidadEmpaquePrimario = 0;
							cantidadEmpaqueSecundario = 0;
							cantidadEmpaqueTerciario = 0;
						}
					}
					System.out.println(cantidadOfertada);
					System.out.println(cantidadEmpaquePrimario);
					System.out.println(cantidadEmpaqueSecundario);
					
					listaRequerimientoSolicitudDisponibilidadALP ul = new listaRequerimientoSolicitudDisponibilidadALP();
					
					ul.setIdSolicitudDisponibilidad(codDisponibilidadER);
					ul.setNoItem(noItem);
					ul.setTiempoEntregaOfertado(tiempoEntregaOfertado.toUpperCase());
					ul.setVidaUtilOfertada(vidaUtilOfertada.toUpperCase());
					ul.setCantidadOfertada(cantidadOfertada);
					ul.setCantidadEmpaquePrimario(cantidadEmpaquePrimario);
					ul.setCantidadEmpaqueSecundario(cantidadEmpaqueSecundario);
					ul.setcantidadEmpaqueTerciario(cantidadEmpaqueTerciario);
					ul.setEstadoCompra(estadoCompra);
					ul.setnumRegSanitarioVen(request.getParameter("numRegSanitarioVenc"));
					ul.setCertBPMVenc(request.getParameter("numCerBPMVenc"));
					ul.setObserRespuestaProveedor(request.getParameter("ObserRespuestaProveedor"));
					ul.setregistroSanitario(request.getParameter("registroSanitario"));
					
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
					ul.setFechaVaciado(simpleDateFormat.format(new Date()).toString());									
					
					ul.setfechaRegSanitarioVen(  request.getParameter("fechaRegSanitarioVenc"));
					ul.setfechaCerBPMVen(request.getParameter("fechaCerBPMVenc"));
					ul.setId(Integer.parseInt(request.getParameter("idItemRequerimiento")));
					
					
					status = listaRequerimientoSolicitudDisponibilidadALPDao.updateEmptyingOffer(ul);
					
					if (status != 0)
					{
						solicitudDisponibilidadALPDao.updateEmptyingStatus(codDisponibilidadER, "SI");
						data = "successful";
					}
					else
					{
						data = "DBError";
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
			data = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDID_JSON(codDisponibilidadER);
			System.out.println("Get all Req Med data");
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
