package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pCompraWizardRouting
 */
@WebServlet("/pCompraALPWizardRouting")
public class pCompraALPWizardRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pCompraALPWizardRouting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String submit = request.getParameter("submit");
		String type = request.getParameter("type");
		String inWizard = (String) request.getAttribute("inWizard");
		String sub = (String) request.getAttribute("submit");
		String next = request.getParameter("next");

		String id = request.getParameter("id");

		// Variable temporal para type
		String t = "none";
		
		ArrayList<CriterioEvaluacion> criterios = CriterioEvalucionDao.getCriterios();											
		ArrayList<CriterioEvaluacionDTO> NewCriterios = new ArrayList<CriterioEvaluacionDTO>();	

		if (submit == null && sub != null) {
			submit = sub;
		}

		HttpSession session = request.getSession(true);
		String sessionType = (String) session.getAttribute("type");

		if (inWizard == null || inWizard.isEmpty()) {
			if (type != null && !type.isEmpty()) {
				t = type;
			}
		} else {
			if (sessionType != null && !sessionType.isEmpty()) {
				t = sessionType;
			}
		}

		String read = "readOnly";
		String disable = "disabled";
		if (submit != null && (submit.contentEquals("nuevo") || submit.contentEquals("modificar"))) {
			read = "";
			disable = "";
		}
		int cod;

		switch (submit) {
			case "nuevo":
				
				ArrayList<CriterioEvaluacion> criteriosNEW = CriterioEvalucionDao.getCriteriosnEW();	
				
				cod = 0;
				next = "nPurchaseProcessALP.jsp";
				session.setAttribute("noCompra", cod);
				session.setAttribute("type", t);
				session.setAttribute("estado", "EN PROCESO");
				session.setAttribute("funcion", "nuevo");
				session.setAttribute("read", read);
				session.setAttribute("disable", disable);
				session.setAttribute("ogFunc", "nuevo");
				
				
				for(CriterioEvaluacion cri : criteriosNEW) {
					CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();
				
					crit.setIdCE(cri.getId());
					crit.setNombreCriterio(cri.getNombreCriterio());
					crit.setEstado(false);
					NewCriterios.add(crit);
				}				
				request.setAttribute("criterios", NewCriterios);
				
				break;
			case "modificar":
				if (id == null) {
					int i = (Integer) request.getAttribute("id");
					id = String.valueOf(i);
				}
				if (id != null && !id.isEmpty()) {
					cod = Integer.parseInt(id);
					next = "nPurchaseProcessALP.jsp";

					procesoCompraALP p = procesoCompraALPDao.getById(Integer.parseInt(id));
					String[] fechaL = p.getFechaLimite().split("\\|");
					String[] fechaA = p.getFechaApertura().split("\\|");

					request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
					request.setAttribute("horaLimite", fechaL[1]);
					request.setAttribute("fechaLimite", fechaL[0]);
					request.setAttribute("fechaApertura", fechaA[0]);
					request.setAttribute("horaApertura", fechaA[1]);
					request.setAttribute("lugar", p.getLugar());
					request.setAttribute("periodoValidez", p.getPeriodoValidez());
					request.setAttribute("descripcioncompra", p.getDescripcionCompra());
					session.setAttribute("estado", p.getEstado1());
					session.setAttribute("observaciones", p.getObservaciones());

					session.setAttribute("type", t);
					session.setAttribute("noCompra", cod);
					session.setAttribute("funcion", "modificar");
					session.setAttribute("ogFunc", "modificar");
					session.setAttribute("read", read);
					session.setAttribute("disable", disable);
						
					for(CriterioEvaluacion cri : criterios) {
						CriterioEvaluacionDTO citeriosTrue = CriterioEvalucionDao.getCriteriosByNoCompraAndIdCD(Integer.parseInt(id), cri.getId());						
						
						CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();				
						crit.setIdCE(cri.getId());
						crit.setNombreCriterio(cri.getNombreCriterio());
						crit.setEstado(citeriosTrue.getEstado());
						NewCriterios.add(crit);											
					}				
					request.setAttribute("criterios", NewCriterios);
					
				}
				break;
			case "consultar":

				if (id != null && !id.isEmpty()) {
					cod = Integer.parseInt(id);
					next = "nPurchaseProcessALP.jsp";

					procesoCompraALP p = procesoCompraALPDao.getById(Integer.parseInt(id));
					String[] fechaL = p.getFechaLimite().split("\\|");
					String[] fechaA = p.getFechaApertura().split("\\|");

					request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
					request.setAttribute("horaLimite", fechaL[1]);
					request.setAttribute("fechaLimite", fechaL[0]);
					request.setAttribute("fechaApertura", fechaA[0]);
					request.setAttribute("horaApertura", fechaA[1]);
					request.setAttribute("lugar", p.getLugar());
					request.setAttribute("descripcioncompra", p.getDescripcionCompra());
					request.setAttribute("periodoValidez", p.getPeriodoValidez());
					request.setAttribute("descripcioncompra", p.getDescripcionCompra());
					session.setAttribute("estado", p.getEstado1());
					session.setAttribute("observaciones", p.getObservaciones());

					session.setAttribute("type", t);
					session.setAttribute("noCompra", cod);
					session.setAttribute("funcion", "consultar");
					session.setAttribute("ogFunc", "consultar");
					session.setAttribute("read", read);
					session.setAttribute("disable", disable);
					
					for(CriterioEvaluacion cri : criterios) {
						CriterioEvaluacionDTO citeriosTrue = CriterioEvalucionDao.getCriteriosByNoCompraAndIdCD(Integer.parseInt(id), cri.getId());						
						
						System.out.println(Integer.parseInt(id) + " parametros "+ cri.getId());
						
						
						CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();				
						crit.setIdCE(cri.getId());
						crit.setNombreCriterio(cri.getNombreCriterio());
						crit.setEstado(citeriosTrue.getEstado());
						NewCriterios.add(crit);
										
					}				
					request.setAttribute("criterios", NewCriterios);					
				}
				break;
			case "revisar":

				if (id != null && !id.isEmpty()) {
					cod = Integer.parseInt(id);
					next = "nPurchaseProcessALP.jsp";

					procesoCompraALP p = procesoCompraALPDao.getById(Integer.parseInt(id));
					String[] fechaL = p.getFechaLimite().split("\\|");
					String[] fechaA = p.getFechaApertura().split("\\|");

					request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
					request.setAttribute("horaLimite", fechaL[1]);
					request.setAttribute("fechaLimite", fechaL[0]);
					request.setAttribute("fechaApertura", fechaA[0]);
					request.setAttribute("horaApertura", fechaA[1]);
					request.setAttribute("lugar", p.getLugar());
					request.setAttribute("descripcioncompra", p.getDescripcionCompra());
					request.setAttribute("periodoValidez", p.getPeriodoValidez());
					request.setAttribute("descripcioncompra", p.getDescripcionCompra());
					session.setAttribute("estado", p.getEstado1());
					session.setAttribute("observaciones", p.getObservaciones());

					session.setAttribute("type", t);
					session.setAttribute("noCompra", cod);
					session.setAttribute("funcion", "revisar");
					session.setAttribute("ogFunc", "revisar");
					session.setAttribute("read", read);
					session.setAttribute("disable", disable);
					
					for(CriterioEvaluacion cri : criterios) {
						CriterioEvaluacionDTO citeriosTrue = CriterioEvalucionDao.getCriteriosByNoCompraAndIdCD(Integer.parseInt(id), cri.getId());						
						
						System.out.println(Integer.parseInt(id) + " parametros "+ cri.getId());
						
						
						CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();				
						crit.setIdCE(cri.getId());
						crit.setNombreCriterio(cri.getNombreCriterio());
						crit.setEstado(citeriosTrue.getEstado());
						NewCriterios.add(crit);												
					}				
					request.setAttribute("criterios", NewCriterios);
				}
				break;
			default:
				break;
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher(next).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 *
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
