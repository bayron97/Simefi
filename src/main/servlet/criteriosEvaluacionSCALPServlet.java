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
 * Servlet implementation class criteriosEvaluacionSCALP
 */
@WebServlet("/criteriosEvaluacionSCALPServlet")
public class criteriosEvaluacionSCALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public criteriosEvaluacionSCALPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet de Guardado, Edicion y Consulta: Criterios de Evaluacion

		HttpSession session = request.getSession(true);
		String func = (String) session.getAttribute("funcion");
		long codPadre = (Long) session.getAttribute("codPadreSolCompra");		
		String[] idCriterio = request.getParameterValues("idCriterio");
				
		if (func != null && !func.isEmpty()) {
			String openMode = session.getAttribute("openMode").toString();
			request.setAttribute("openMode", openMode);
			request.setAttribute("funcion", func);

			solicitudCompraALP editarSolicitud = solicitudCompraALPDao.getOneByID(codPadre);
			System.out.println(func + " Funcion");
			
			switch (func) {
				case "NUEVO":
					int _status = 0; //solicitudCompraALPDao.updateCriteriaData(editarSolicitud);
					
					CriterioEvaluacionSolicitudCompraALP p = new CriterioEvaluacionSolicitudCompraALP();
					
					p.setCod(editarSolicitud.getId());
					for (int i = 0; i < idCriterio.length; i++){						
                 	 p.setidC(Integer.parseInt(idCriterio[i]));                 
                 	CriterioEvaluacionSolicitudCompraALPDao.save(p);
                 	_status = i;
                 	}

					if (_status != 0) {
						ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
								.getAllBySCID(codPadre);
						ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
								.getReqListByBuyRequestId(codPadre);

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("reqList", reqList);

						request.setAttribute("noProcesoCompra", editarSolicitud.getNoProcesoCompra());

						request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request,
								response);
					} else {
						request.setAttribute("cantCriterioGuardado", editarSolicitud.getCantCriterio());
						request.setAttribute("regSanCriterioGuardado", editarSolicitud.getRegSanCriterio());
						request.setAttribute("certBPMCriterioGuardado", editarSolicitud.getCertBPMCriterio());
						request.setAttribute("tiempoEntregaCriterioGuardado",
								editarSolicitud.getTiempoEntregaCriterio());
						request.setAttribute("vidaUtilCriterioGuardado", editarSolicitud.getVidaUtilCriterio());

						request.getRequestDispatcher("nCriteriosEvaluacionSolicitudCompraALP.jsp").forward(request,
								response);
					}
					break;							
				case "MODIFICAR":	

					int status = 0; //solicitudCompraALPDao.updateCriteriaData(editarSolicitud);
					
					CriterioEvaluacionSolicitudCompraALP pc = new CriterioEvaluacionSolicitudCompraALP();
					
					ArrayList<Integer> criteriosId = CriterioEvaluacionSolicitudCompraALPDao.getIdDC(editarSolicitud.getId());
					Integer[] miarray = new Integer[criteriosId.size()];
					miarray = criteriosId.toArray(miarray);
					
					for(Integer s : miarray) {
						System.out.println(s);
						CriterioEvaluacionDTO criterios = CriterioEvaluacionSolicitudCompraALPDao.getCriteriosByCodAndIdCD(editarSolicitud.getId(), s);											
						pc.setEstado(false);
						pc.setid(criterios.getId());
						pc.setidC(s);
						CriterioEvaluacionSolicitudCompraALPDao.update(editarSolicitud.getId(), pc);
						status = 1;
					}						
					
					for (int i = 0; i < idCriterio.length; i++){						
						boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
						if(cotiene) {		
							
							CriterioEvaluacionDTO criterios = CriterioEvaluacionSolicitudCompraALPDao.getCriteriosByCodAndIdCD(editarSolicitud.getId(), Integer.parseInt(idCriterio[i]));							
							 
							pc.setEstado(true);							
							pc.setid(criterios.getId());
							pc.setidC(Integer.parseInt(idCriterio[i]));
							CriterioEvaluacionSolicitudCompraALPDao.update(editarSolicitud.getId(), pc);							
													
						}else 
						 	{			
							pc.setCod(editarSolicitud.getId());
							pc.setEstado(true);							
							pc.setidC(Integer.parseInt(idCriterio[i]));							
							CriterioEvaluacionSolicitudCompraALPDao.save(pc);							
						 	}		
						status = 1;
	                }

					if (status != 0) {
						ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
								.getAllBySCID(codPadre);
//						ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
//								.getReqListByBuyRequestId(codPadre);
						
						ArrayList<productoSolicitudCompraALP> reqList = productoSolicitudCompraALPDao
								.getReqListByBuyRequestId(codPadre);

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("reqList", reqList);

						request.setAttribute("noProcesoCompra", editarSolicitud.getNoProcesoCompra());

						request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request,
								response);
					} else {
						request.setAttribute("cantCriterioGuardado", editarSolicitud.getCantCriterio());
						request.setAttribute("regSanCriterioGuardado", editarSolicitud.getRegSanCriterio());
						request.setAttribute("certBPMCriterioGuardado", editarSolicitud.getCertBPMCriterio());
						request.setAttribute("tiempoEntregaCriterioGuardado",
								editarSolicitud.getTiempoEntregaCriterio());
						request.setAttribute("vidaUtilCriterioGuardado", editarSolicitud.getVidaUtilCriterio());

						request.getRequestDispatcher("nCriteriosEvaluacionSolicitudCompraALP.jsp").forward(request,
								response);
					}
					break;
				case "CONSULTAR":
					ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
							.getAllBySCID(codPadre);
					ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
							.getReqListByBuyRequestId(codPadre);

					request.setAttribute("oficiosList", oficiosList);
					request.setAttribute("reqList", reqList);

					request.setAttribute("noProcesoCompra", editarSolicitud.getNoProcesoCompra());

					request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request,
							response);
					break;
				default:
					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
			}
		} else {
			request.setAttribute("openMode", "openError");
			request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
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
