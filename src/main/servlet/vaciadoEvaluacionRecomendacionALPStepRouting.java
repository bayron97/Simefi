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
@WebServlet("/vaciadoEvaluacionRecomendacionALPStepRouting")
public class vaciadoEvaluacionRecomendacionALPStepRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public vaciadoEvaluacionRecomendacionALPStepRouting() {
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
						
						String SDID = request.getParameter("SDID");
						
						switch (step) {
							case "proveedor":
								request.setAttribute("openMode", openMode);
								
								request.setAttribute("SDListYES", SDListYES);
								request.setAttribute("SDListNO", SDListNO);

								request.getRequestDispatcher("nVaciadoEvaluacionRecomendacionALP.jsp").forward(request, response);
								break;
							case "vaciadoOferta":
								if (SDID != null && !SDID.isEmpty())
								{
									String purchaseProcessCod = (String)session.getAttribute("purchaseProcessCod");
									String buyRequestCod = (String)session.getAttribute("buyRequestCod");
									String SCbenef = (String)session.getAttribute("SCbenef");
									solicitudDisponibilidadALP ARSelected = solicitudDisponibilidadALPDao.getOneBySDID(Long.parseLong(SDID));
									
									System.out.println(Long.parseLong(SDID) + " parametro");
									ArrayList<listaRequerimientoSolicitudDisponibilidadALP> reqList = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDID(Long.parseLong(SDID));
									
									session.setAttribute("SDID", SDID);
									
									request.setAttribute("codPadre", idPadre);
									request.setAttribute("openMode", openMode);
									request.setAttribute("SDID", SDID);
									request.setAttribute("purchaseProcessCod", purchaseProcessCod);
									request.setAttribute("buyRequestCod", buyRequestCod);
									request.setAttribute("SCbenef", SCbenef);
									request.setAttribute("provSD", ARSelected.getProveedor() + " - " + ARSelected.getCodSolicitudDisponibilidad());
									request.setAttribute("reqList", reqList);
									
									request.getRequestDispatcher("nVaciadoOfertaForERALP.jsp").forward(request, response);
								}
								else
								{
									request.setAttribute("SDListYES", SDListYES);
									request.setAttribute("SDListNO", SDListNO);

									request.getRequestDispatcher("nVaciadoEvaluacionRecomendacionALP.jsp").forward(request, response);
								}
								break;
							case "evaluarOferta":
								if (SDID != null && !SDID.isEmpty())
								{
									System.out.print(SDID);
//									String idCriterio[] = request.getParameterValues("idCriterio");									
//									CriterioEvaluacionDTO p = new CriterioEvaluacionDTO();
//									p.setidSolicitud(Integer.parseInt(SDID));
//									int canUpdateCriterios = CriterioEvaluacionAndOpcionesALPDao.updateCriteriosByIdSolicitud(Integer.parseInt(SDID));									
//									if(canUpdateCriterios == 0) {
//										
//										for (int i = 0; i < idCriterio.length; i++){						
//					                 	 p.setidC(Integer.parseInt(idCriterio[i]));                 
//					                 	CriterioEvaluacionAndOpcionesALPDao.saveCriterioByIdS(p);					                 
//					                 	}										
//									} else {
//										
//										ArrayList<Integer> criteriosId = CriterioEvaluacionAndOpcionesALPDao.getIdByidSolicitud(Integer.parseInt(SDID));
//										
//										for (int i = 0; i < idCriterio.length; i++){	
//											System.out.println(idCriterio[i]);
//											boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
//											if(cotiene) {		
//												//CriterioEvaluacionDTO criterios = CriterioEvaluacionAndOpcionesALPDao.getCriteriosByidSolicitudAndIdCD(Integer.parseInt(SDID), Integer.parseInt(idCriterio[i]));							
//												 
//												p.setEstado(true);																
//												p.setidC(Integer.parseInt(idCriterio[i]));												
//												CriterioEvaluacionAndOpcionesALPDao.updateCriterio(p);							
//																		
//											}else
//											 	{			
//												p.setEstado(true);							
//												p.setidC(Integer.parseInt(idCriterio[i]));							
//												CriterioEvaluacionAndOpcionesALPDao.saveCriterioByIdS(p);									
//											 	}											
//						                }
//									}
									
									request.setAttribute("SDID", SDID);
									String purchaseProcessCod = (String)session.getAttribute("purchaseProcessCod");
									String buyRequestCod = (String)session.getAttribute("buyRequestCod");
									String SCbenef = (String)session.getAttribute("SCbenef");
									solicitudDisponibilidadALP ARSelected = solicitudDisponibilidadALPDao.getOneBySDID(Long.parseLong(SDID));
									
									ArrayList<listaRequerimientoSolicitudDisponibilidadALP> reqList = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDIDSIoFERTAADO(Long.parseLong(SDID));
									
									session.setAttribute("SDID", SDID);									
									request.setAttribute("codPadre", idPadre);
									request.setAttribute("openMode", openMode);
									request.setAttribute("SDID", SDID);
									request.setAttribute("purchaseProcessCod", purchaseProcessCod);
									request.setAttribute("buyRequestCod", buyRequestCod);
									request.setAttribute("SCbenef", SCbenef);
									request.setAttribute("provSD", ARSelected.getProveedor() + " - " + ARSelected.getCodSolicitudDisponibilidad());
									request.setAttribute("reqList", reqList);
									
									request.getRequestDispatcher("nEvaluacionOfertaForERALP.jsp").forward(request, response);
								}
								else
								{
									request.setAttribute("SDListYES", SDListYES);
									request.setAttribute("SDListNO", SDListNO);

									request.getRequestDispatcher("nVaciadoEvaluacionRecomendacionALP.jsp").forward(request, response);
								}
								break;
							case "recomendarOferta":
								String purchaseProcessCod = (String)session.getAttribute("purchaseProcessCod");
								String buyRequestCod = (String)session.getAttribute("buyRequestCod");
								String SCbenef = (String)session.getAttribute("SCbenef");
								String coddSd = request.getParameter("coddSd");
								
								
								System.out.println(purchaseProcessCod);
								System.out.println(buyRequestCod);
								System.out.println(coddSd);
								
								
								request.setAttribute("codPadre", idPadre);
								request.setAttribute("openMode", openMode);
								request.setAttribute("purchaseProcessCod", purchaseProcessCod);
								request.setAttribute("buyRequestCod", buyRequestCod);
								request.setAttribute("SCbenef", SCbenef);
								request.setAttribute("coddSd", coddSd);
									
								request.getRequestDispatcher("nRecomendacionOfertaForERALP.jsp").forward(request, response);
								break;
							default:
								request.setAttribute("openMode", "openError");
								request.getRequestDispatcher("evaluacionRecomendacionOferta.jsp").forward(request, response);
								break;
						}
					} else {
						request.getRequestDispatcher("evaluacionRecomendacionOferta.jsp").forward(request, response);
					}
					break;
				default:
					request.setAttribute("openMode", "openError");
					request.getRequestDispatcher("evaluacionRecomendacionOferta.jsp").forward(request, response);
					break;
			}
			
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreVaciadoER");
			request.setAttribute("openMode", "openError");

			request.getRequestDispatcher("evaluacionRecomendacionOferta.jsp").forward(request, response);
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
