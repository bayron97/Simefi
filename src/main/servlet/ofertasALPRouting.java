package main.servlet;

import main.dao.*;
import main.model.*;
import utils.ReportOfertaRecomendadaPDF;
import utils.ReportPDF;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ofertasALPRouting
 */
@WebServlet("/ofertasALPRouting")
public class ofertasALPRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ofertasALPRouting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String proc = request.getParameter("proc");
		String func = request.getParameter("submit");
		
		System.out.println(" vista" + func);
		System.out.println(" proc" + proc);

		String openMode = "";

		if (proc != null && !proc.isEmpty()) {
			System.out.println(" proc2" + proc);
			int codPadre = Integer.parseInt(request.getParameter("codPadre"));
			if (func != null && !func.isEmpty()) {
				System.out.println(" proc3" + proc);
				vaciadoOfertasALP emptyingData = vaciadoOfertasALPDao.getOne(codPadre);
				session.setAttribute("funcion", func);
				session.setAttribute("codPadre", codPadre);
				session.setAttribute("proc", proc);
				session.setAttribute("provSaved", emptyingData.getProveedorAutorizado());
				
				switch (func) {
					case "actaApertura":
						String purchaseDescription = procesoCompraALPDao.getBuyPurchaseDescriptionByALPNumber(proc);
						ArrayList<listaRequerimientoConsolidadaALP> reqConsList = listaRequerimientoConsolidadaALPDao.getActiveConsolidatedListByBuyProcessNumber(proc);
						ArrayList<distribuidor> distList = distribuidorDao.getAllBasic();
						request.setAttribute("buyProcessNumber", proc);
						request.setAttribute("purchaseDescription", purchaseDescription);
						request.setAttribute("reqConsList", reqConsList);
						request.setAttribute("distList", distList);
						request.getRequestDispatcher("actaAperturaALP.jsp").forward(request, response);
						break;
					case "nuevaOferta":
						openMode = "nuevaOferta";
						request.setAttribute("openMode", openMode);
						request.setAttribute("buyProcessNumber", proc);					
						Integer cod =   CriterioEvalucionDao.getcodProcesoComALP(proc);						
						ArrayList<CriterioEvaluacionDTO> CriteriosAplica =   CriterioEvalucionDao.getCriteriosByproCompra(cod);
						
						
						//ArrayList<CriterioEvaluacionDTO> opciones = CriterioEvalucionDao.getLisOpcionesCriterio(criterio.getidC());
                        
						request.setAttribute("cod", cod);
						request.setAttribute("CriteriosAplica", CriteriosAplica);
						if (emptyingData.getProveedorAutorizado() == null || emptyingData.getProveedorAutorizado().isEmpty()) {
							request.setAttribute("provSaved", "ESTABLECER EN ACTA DE APERTURA...");
						}
						else
						{
							request.setAttribute("provSaved", emptyingData.getProveedorAutorizado());
						}
						request.getRequestDispatcher("nOfertaForALP.jsp").forward(request, response);
						break;
					case "consultarOferta":
						openMode = "consultarOferta";
						cod =   CriterioEvalucionDao.getcodProcesoComALP(proc);						
						CriteriosAplica =   CriterioEvalucionDao.getCriteriosByproCompra(cod);
						
						request.setAttribute("cod", cod);
						request.setAttribute("CriteriosAplica", CriteriosAplica);
						
						request.setAttribute("openMode", openMode);
						request.setAttribute("buyProcessNumber", proc);
						request.getRequestDispatcher("nOfertaForALP.jsp").forward(request, response);
						break;
					case "verCatalogoRecomendado":
						ArrayList<ofertaALP> offerRecommendList = ofertaALPDao.getRecommendOffersByProc(proc);
						
//						//Creacion de Archivo de reporte
//						String nombreReporte = proc + "_Report.pdf";
//						String token = "fd966d32e0c5822a1fb7eecb00449db544754c3ab19a61d1fa8144c423a2a20c";
//						File directorio = new File(getServletContext().getRealPath("/assets/files/RecommendedOffers/" + proc + "/RecommendedOffersRequestReports"));
//						if (!directorio.exists())
//						{
//							directorio.mkdirs();
//						}
//						
//						String filePath = "assets/files/RecommendedOffers/" + proc  + "/RecommendedOffersRequestReports/" + nombreReporte;
//						String realFilePath = getServletContext().getRealPath(filePath);
//						String realAssetsPath = getServletContext().getRealPath("/");
//						String hostPath = request.getHeader("host") + request.getContextPath();
//						ReportOfertaRecomendadaPDF.OfertaRecomendadaCreatePDF(hostPath, realAssetsPath, realFilePath, proc, token);
											
						request.setAttribute("offerRecommendList", offerRecommendList);
						request.setAttribute("proCod", proc);
						request.getRequestDispatcher("catalogoRecomendadoALP.jsp").forward(request, response);
						break;
					case "verCatalogoRecomendadoV2":
						offerRecommendList = ofertaALPDao.getRecommendOffersByProcV2(proc);
						
						request.setAttribute("offerRecommendList", offerRecommendList);
						request.setAttribute("proCod", proc);
						request.getRequestDispatcher("catalogoRecomendadoV2ALP.jsp").forward(request, response);
						break;
					case "nuevaRecomendacionTecnica":
						ArrayList<CriterioEvaluacionDTO> Header = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpcionesHeader(proc);
						request.setAttribute("HeaderCriterios", Header);
						request.getRequestDispatcher("nRecomendacionTecnicaForALP.jsp").forward(request, response);
						break;
					case "consultarRecomendacionTecnica":
						openMode = "consultarRecomendacionTecnica";
						request.setAttribute("openMode", openMode);
						request.setAttribute("buyProcessNumber", proc);
						 Header = CriterioEvaluacionAndOpcionesALPDao.getIdBynoOfertaCriteriosOpcionesHeader(proc);
						request.setAttribute("HeaderCriterios", Header);
						request.getRequestDispatcher("nRecomendacionTecnicaForALP.jsp").forward(request, response);
						break;
					case "recomendacionOfertaALP":
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("recomendacionOfertaALP.jsp").forward(request, response);
						break;
					default:
						openMode = "error";
						request.setAttribute("openMode", openMode);
						request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
						break;
				}
			}
		} else {
			openMode = "error";
			System.out.println(" else" + func);
			request.setAttribute("openMode", openMode);
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
