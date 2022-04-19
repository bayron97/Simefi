package api;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
@WebServlet("/ALPManageSDforSCAPI")
public class ALPManageSDforSCAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageSDforSCAPI() {
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
		System.out.println(request.getParameterValues("reqReg") + " cd");
		
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
					String controlChecks[] = request.getParameterValues("reqReg");					
					if (controlChecks != null)
					{
						solicitudDisponibilidadALP newSC = new solicitudDisponibilidadALP();
						//String newCodSD = solicitudDisponibilidadALPDao.getNewCod(codPadre);
						String newCodSD = request.getParameter("noSolicitud");		
						
						String proveedor = request.getParameter("proveedor");
						String fechaEmision = request.getParameter("fechaEmision");
						String fechaMaxResp = request.getParameter("maxFechaEnt");
						String notaSol = request.getParameter("notaSol");
						String nombreReporte = newCodSD + "_Report.pdf";
						
						newSC.setIdSolicitudCompra(codPadre);
						newSC.setProveedor(proveedor.toUpperCase());
						newSC.setCodSolicitudDisponibilidad(newCodSD);
						newSC.setFechaEmision(fechaEmision.toUpperCase());
						newSC.setFechaMaximaRespuesta(fechaMaxResp.toUpperCase());
						newSC.setNota(notaSol);
						newSC.setNombreReporte(nombreReporte);
						newSC.setEstadoVaciados("NO");
						
						status = solicitudDisponibilidadALPDao.save(newSC);
						
						if (status != 0)
						{
							long lastRegID = solicitudDisponibilidadALPDao.getIdBySDCod(newCodSD);
							
							for (int a=0; a<controlChecks.length; a++)
							{
								listaRequerimientoSolicitudCompraALP lr = listaRequerimientoSolicitudCompraALPDao.getOneByBuyRequestIdAndNoItem(codPadre, Integer.parseInt(controlChecks[a]));
								
								listaRequerimientoSolicitudDisponibilidadALP nrd = new listaRequerimientoSolicitudDisponibilidadALP();
								nrd.setIdSolicitudDisponibilidad(lastRegID);
								//nrd.setNoItem(a+1);
								nrd.setNoItem(lr.getNoItem());
								nrd.setNoOficio(lr.getNoOficio());
								nrd.setCodigoATC(lr.getCodigoATC());
								nrd.setNombreProductoRequerido(lr.getNombreProductoRequerido());
								nrd.setNombreProductoOfertado(lr.getNombreProducto());
								nrd.setDescripcionTecnicaRequerida(lr.getDescripcionTecnicaRequerida());
								nrd.setDescripcionTecnicaOfertada(lr.getDescripcionTecnica());
								nrd.setUnidadPresentacionRequerida(lr.getUnidadPresentacionRequerida());
								nrd.setUnidadPresentacionOfertada(lr.getUnidadPresentacion());
								nrd.setCantidadRequerida(lr.getCantidadRequerida());
								nrd.setTiempoEntregaOfertado(lr.getTiempoEntrega());
								nrd.setVidaUtilOfertada(lr.getVidaUtil());
								nrd.setNumCertRegSan(lr.getNumCertRegSan());
								nrd.setNumCertBPM(lr.getCertBPM());
								nrd.setOrigenFP(lr.getOrigenFP());
								nrd.setPrecioUnitarioAcordado(Float.parseFloat(lr.getPrecioUnitario()));
								nrd.setMoneda(lr.getMoneda());
								nrd.setFechaOferta(lr.getFechaOferta());
								nrd.setRecomendacionesBeneficiarios(lr.getRecomendacionesBeneficiarios());
								nrd.setRegSanVenc(lr.getRegSanVenc());
								nrd.setCertBPMVenc(lr.getCertBPMVenc());
								nrd.setCodSolicitudCompra(codSolCompra);
								nrd.setnoOferta(lr.getnoOferta());
								nrd.setregistroSanitario(lr.getregistroSanitario());
								nrd.setcodigoSesal(lr.getcodigoSesal());
								
								status2 = listaRequerimientoSolicitudDisponibilidadALPDao.save(nrd);
								if (status2 != 0)
								{
									listaRequerimientoSolicitudCompraALPDao.updateAvailabilityRequestNoOrState(codPadre, Integer.parseInt(controlChecks[a]), newCodSD);
								}
							}
							
							//Codigo que solo se ejecuta 1 vez para generar el padre del vaciado de recomendaciones
							if (solicitudDisponibilidadALPDao.getCountByBuyRequestId(codPadre) == 1)
							{
								vaciadoEvaluacionRecomendacionALP nuevoVaciadoER = new vaciadoEvaluacionRecomendacionALP();
								solicitudCompraALP sc = solicitudCompraALPDao.getOneByID(codPadre);
								nuevoVaciadoER.setNoProcesoCompra(sc.getNoProcesoCompra());
								nuevoVaciadoER.setCodSolicitudCompra(sc.getCodSolicitudCompra());
								nuevoVaciadoER.setFecha(sc.getFecha());
								nuevoVaciadoER.setBeneficiario(sc.getBeneficiario());
								nuevoVaciadoER.setEstado("EN PROCESO");
								vaciadoEvaluacionRecomendacionALPDao.save(nuevoVaciadoER);
							}
							
							//int newCount = listaRequerimientoSolicitudDisponibilidadALPDao.getCountByBuyRequestCod(codSolCompra);
							//solicitudCompraALPDao.updateNoItemsRequestedById(codPadre, newCount);
							solicitudCompraALPDao.updateNoItemsRequestedById(codPadre,solicitudCompraALPDao.getItemSolicitados(codPadre));
							vaciadoEvaluacionRecomendacionALPDao.updateNumberRequiredItemsByPurchaseRequestCod(codSolCompra, solicitudCompraALPDao.getItemSolicitados(codPadre));
							
							//Creacion de Archivo de reporte
							String token = "fd966d32e0c5822a1fb7eecb00449db544754c3ab19a61d1fa8144c423a2a20c";
							File directorio = new File(getServletContext().getRealPath("/assets/files/purchaseRequestALPFiles/" + codSolCompra + "/availabilityRequestReports"));
							if (!directorio.exists())
							{
								directorio.mkdirs();
							}
							
							String filePath = "assets/files/purchaseRequestALPFiles/" + codSolCompra  + "/availabilityRequestReports/" + nombreReporte;
							String realFilePath = getServletContext().getRealPath(filePath);
							String realAssetsPath = getServletContext().getRealPath("/");
							String hostPath = request.getHeader("host") + request.getContextPath();
							ReportPDF.solicitudDisponibilidadCreatePDF(hostPath, realAssetsPath, realFilePath, newCodSD, token);
							
							data = filePath;
						}
						else
						{
							data = "DBError";
						}
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
