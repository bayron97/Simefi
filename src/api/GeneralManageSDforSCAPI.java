package api;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.listaRequerimientoConsolidadaGeneral;
import main.model.listaRequerimientoSolicitudCompraALP;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.dao.listaRequerimientoSolicitudCompraALPDao;
import main.dao.listaRequerimientoSolicitudDisponibilidadALPDao;
import main.model.solicitudDisponibilidadALP;
import main.dao.solicitudDisponibilidadALPDao;
import main.model.solicitudCompraALP;
import main.dao.solicitudCompraALPDao;
import main.model.vaciadoEvaluacionRecomendacionALP;
import main.dao.vaciadoEvaluacionRecomendacionALPDao;

import utils.ReportPDF;

/**
 * Servlet implementation class ALPManageSDforSCAPI
 */
@WebServlet("/GeneralManageSDforSCAPI")
public class GeneralManageSDforSCAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GeneralManageSDforSCAPI() {
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
		String id = request.getParameter("id");
		String proveedor = request.getParameter("proveedor");
		String noSolicitud = request.getParameter("noSolicitud");
		String fechaEmision = request.getParameter("fechaEmision");
		String maxFechaEnt = request.getParameter("maxFechaEnt");
		String notaSol = request.getParameter("notaSol");
		String noItem[] = request.getParameterValues("noItem");
		String codATC[] = request.getParameterValues("codATC");
		String producto[] = request.getParameterValues("producto");
		String descripcion[] = request.getParameterValues("descripcion");
		String up[] = request.getParameterValues("up");
		String cantidad[] = request.getParameterValues("cantidad");
		
		
		listaRequerimientoConsolidadaGeneral listG = new listaRequerimientoConsolidadaGeneral();		
		ArrayList<listaRequerimientoConsolidadaGeneral> arrayGeneralList = new ArrayList<listaRequerimientoConsolidadaGeneral>();
				
			for (int i = 0; i < noItem.length; i++) {			  
				listG.setIdListRequirement(Integer.parseInt(noItem[i]));
				listG.setCodigoATC(codATC[i]);
				listG.setNombreProducto(producto[i]);
				listG.setDescripcionTecnica(descripcion[i]);
				listG.setUnidadPresentacion(up[i]);
				listG.setCantidadRequerida(Integer.parseInt(cantidad[i]));				
				arrayGeneralList.add(listG);
			}
		
		
		Long codPadre = (Long)session.getAttribute("codPadreSolCompra");
		if (codPadre == null) {
			codPadre = Long.parseLong("0");
		}
		String codSolCompra = (String)session.getAttribute("noSolCompra");

		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;
			int status2 = 0;

			switch (mode) {
				case "new":
									
					if (noItem != null)
					{						
							String nombreReporte = "_Report.pdf";
						
							//Creacion de Archivo de reporte
							String token = "fd966d32e0c5822a1fb7eecb00449db544754c3ab19a61d1fa8144c423a2a20c";
							File directorio = new File(getServletContext().getRealPath("/assets/files/purchaseRequestGeneralFiles/" + codSolCompra + "/availabilityRequestReports"));
							if (!directorio.exists())
							{
								directorio.mkdirs();
							}
							
							String filePath = "assets/files/purchaseRequestGeneralFiles/" + codSolCompra  + "/availabilityRequestReports/" + nombreReporte;
							String realFilePath = getServletContext().getRealPath(filePath);
							String realAssetsPath = getServletContext().getRealPath("/");
							String hostPath = request.getHeader("host") + request.getContextPath();
							ReportPDF.solicitudDisponibilidadGeneralCreatePDF(hostPath, realAssetsPath, realFilePath, noSolicitud, token);
							
							data = filePath;
							
							System.out.println(data);
						
					}
					else
					{
						data = "inputsReqError";
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
			String empty = "-";
			data = "{ \"data\":[" +  "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
					+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
					+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
					+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\","
					+ "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"]" + "]}";
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
