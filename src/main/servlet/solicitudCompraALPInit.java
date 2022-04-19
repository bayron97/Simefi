package main.servlet;

import main.Database;
import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class solicitudCompraALPInit
 */
@WebServlet("/solicitudCompraALPInit")
public class solicitudCompraALPInit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public solicitudCompraALPInit() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Servlet inicial de Solicitudes de Compra
		/*
		 * Parametros de sesion establecidos para la pasarela 
		 * funcion: Modo de visor de pasarela 
		 * openMode: interruptor de atributo "disabled" para inputs HTML de la pasarela 
		 * codPadreSolCompra: ID de la base de datos del registro a gestionar en el modo consultar, modificar y revisar & aprobar
		 * noSolCompra: Codigo generado de solicitud de compra
		 * purchaseCOD: Codigo de proceso de compra vinculado
		 */

		HttpSession session = request.getSession(true);
		String func = request.getParameter("submit");
		
		ArrayList<CriterioEvaluacion> criterios = CriterioEvalucionDao.getCriterios();											
		ArrayList<CriterioEvaluacionDTO> NewCriterios = new ArrayList<CriterioEvaluacionDTO>();

		if (func != null && !func.isEmpty()) {

			ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
			ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
			ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();
			
			//Para nuevo catalago
			ArrayList<ofertaALP> procesosCompra = ofertaALPDao.getAll();

			switch (func) {
				case "nuevo":

					session.setAttribute("funcion", "NUEVO");
					session.setAttribute("openMode", "");

					request.setAttribute("funcion", "NUEVO");
					request.setAttribute("openMode", "");
					//request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
					request.setAttribute("noSolCompra", "");
					request.setAttribute("benfList", benfList);
					request.setAttribute("beneficiarioTemp", "");//Es de uso temporal por cambios de catalogo
					request.setAttribute("proCompra", "");//Es de uso temporal por cambios de catalogo
					request.setAttribute("purchaseActiveList", purchaseActiveList);
					request.setAttribute("purchaseDescList", purchaseDescList);
					request.setAttribute("procesosCompra", procesosCompra);
					
					for(CriterioEvaluacion cri : criterios) {
						CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();
					
						crit.setIdCE(cri.getId());
						crit.setNombreCriterio(cri.getNombreCriterio());
						crit.setEstado(false);
						NewCriterios.add(crit);
					}				
					request.setAttribute("criterios", NewCriterios);

					request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					break;
				case "consultar":
				case "modificar":
					long codPadre;
					try {
						String codPadreTemp = request.getParameter("requestID");
						if (codPadreTemp != null && !codPadreTemp.isEmpty()) {
							codPadre = Long.parseLong(codPadreTemp); // Linea que puede activar una Excepcion
						} else {
							codPadre = -1;
						}
					} catch (Exception e) {
						codPadre = -1;
					}

					if (codPadre == -1) {
						request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					} else {
						if (func.contentEquals("consultar")) {
							session.setAttribute("funcion", "CONSULTAR");
							session.setAttribute("openMode", "disabled");

							request.setAttribute("funcion", "CONSULTAR");
							request.setAttribute("openMode", "disabled");
						} else {
							session.setAttribute("funcion", "MODIFICAR");
							session.setAttribute("openMode", "");

							request.setAttribute("funcion", "MODIFICAR");
							request.setAttribute("openMode", "");
						}

						solicitudCompraALP mr = solicitudCompraALPDao.getOneByID(codPadre);
						ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
								.getAllBySCID(codPadre);

						session.setAttribute("codPadreSolCompra", codPadre);
						session.setAttribute("purchaseCOD", mr.getNoProcesoCompra());
						session.setAttribute("noSolCompra", mr.getCodSolicitudCompra());
						
						for(CriterioEvaluacion cri : criterios) {
							
							CriterioEvaluacionDTO citeriosTrue = CriterioEvaluacionSolicitudCompraALPDao.getCriteriosByNoCompraAndIdCD(codPadre, cri.getId());						
							CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();				
							crit.setIdCE(cri.getId());
							crit.setNombreCriterio(cri.getNombreCriterio());
							crit.setEstado(citeriosTrue.getEstado());						
							NewCriterios.add(crit);											
						}				
						request.setAttribute("criterios", NewCriterios);
						request.setAttribute("procesosCompra", procesosCompra);
						

						request.setAttribute("codPadreSolCompra", codPadre);
						request.setAttribute("noSolCompra", mr.getCodSolicitudCompra());
						request.setAttribute("benefGuardado", mr.getBeneficiario());
						request.setAttribute("descripcionCompraGuardado", mr.getDescripcionCompra());
						request.setAttribute("fecha", mr.getFecha());
						request.setAttribute("noProcesoCompraGuardado", mr.getNoProcesoCompra());
						request.setAttribute("beneficiarioTemp", mr.getBeneficiario());//Es de uso temporal por cambios de catalogo
						request.setAttribute("proCompra", mr.getNoProcesoCompra());//Es de uso temporal por cambios de catalogo

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("benfList", benfList);
						request.setAttribute("purchaseActiveList", purchaseActiveList);
						request.setAttribute("purchaseDescList", purchaseDescList);

						request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
					
				case "cancelarAnular":
					solicitudCompraALPDao.anularSolicitudCompra(Integer.parseInt(request.getParameter("requestID")));
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
				default:
					request.setAttribute("openMode", "openError");
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
