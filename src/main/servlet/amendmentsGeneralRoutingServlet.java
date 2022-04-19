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
 * Servlet implementation class amendmentsRoutingServlet
 */
@WebServlet("/amendmentsGeneralRoutingServlet")
public class amendmentsGeneralRoutingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public amendmentsGeneralRoutingServlet() {
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
		
		
		

		String openMode;
		try {
			String accion = request.getParameter("submit");
			HttpSession session = request.getSession(true);
			Gral_aclaracionEnmiendaDTO aclaracionEnmienda = new Gral_aclaracionEnmiendaDTO();
			
			if ((accion.contentEquals("nuevo") || accion.contentEquals("modificar"))) {
				openMode = "";
			}else {
				openMode = "readOnly";
			}
			
			if (accion.contentEquals("nuevo")) {
				
				ArrayList<Gral_aperturaProceso> aperturaProceso = Gral_aperturaProcesoDao.listAperturaProceso();				
				request.setAttribute("aperturaProceso", aperturaProceso);
				session.setAttribute("idAclaracionEnmienda", 0);
				request.setAttribute("numProcesoCompra", "");
				
			}
			
			else if (accion.contentEquals("modificar") || accion.contentEquals("consultar") ) { 
				int idAclaracionEnmienda = Integer.parseInt(request.getParameter("idAclaracionEnmienda"));//id Pantalla
				aclaracionEnmienda =  Gral_aclaracionEnmiendaDao.GetAclaracionEnmienda(idAclaracionEnmienda);
				session.setAttribute("idAclaracionEnmienda", idAclaracionEnmienda);
				request.setAttribute("idAperturaProceso", aclaracionEnmienda.getIdAperturaProceso());
				request.setAttribute("numProcesoCompra", aclaracionEnmienda.getNumProcesoCompra());
				request.setAttribute("fecha", aclaracionEnmienda.getFecha());
				request.setAttribute("aclaracionEnmienda", aclaracionEnmienda.getAclaracionEnmienda());
				request.setAttribute("horaLimite", aclaracionEnmienda.getHoraLimite());
				request.setAttribute("diaLimite", aclaracionEnmienda.getDiaLimite());
				request.setAttribute("horaApertura", aclaracionEnmienda.getHoraApertura());
				request.setAttribute("diaApertura", aclaracionEnmienda.getDiaApertura());
				request.setAttribute("lugarApertura", aclaracionEnmienda.getLugarApertura());
				request.setAttribute("documento", aclaracionEnmienda.getDocumento());
				request.setAttribute("observaciones", aclaracionEnmienda.getObservaciones());
				request.setAttribute("correlativoEnmienda", aclaracionEnmienda.getCorrelativoEnmienda());
				request.setAttribute("oficio", aclaracionEnmienda.getOficio());
				request.setAttribute("beneficiario", aclaracionEnmienda.getBeneficiario());
				
				System.out.println("beneficiario "+ aclaracionEnmienda.getBeneficiario());
				
				
			}
			request.setAttribute("openMode", openMode);
			session.setAttribute("accion", accion);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nAmendmentForGeneral.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}
//		if (accion != null) {
//			
//			session.setAttribute("accion", accion);
//			switch (accion) {
//				case "nuevo":
//					
//					break;
//				case "modificar":
//					if (controlCod != null && !controlCod.isEmpty()) {
//
//						int cod = Integer.parseInt(controlCod);
//						aclaracionEnmiendaGeneral a = aclaracionEnmiendaGeneralDao.getById(cod);
//
//						openMode = "";
//						request.setAttribute("openMode", openMode);
//
//						request.setAttribute("cod", a.getCod());
//						request.setAttribute("noProcesoCompra", a.getProcesoCompra());
//						request.setAttribute("fecha", a.getFecha());
//						request.setAttribute("tipo", a.getTipo());
//						request.setAttribute("horaLimite", a.getHoraLimite());
//						request.setAttribute("diaLimite", a.getDiaLimite());
//						request.setAttribute("horaApertura", a.getHoraApertura());
//						request.setAttribute("diaApertura", a.getDiaApertura());
//						request.setAttribute("lugarApertura", a.getLugarApertura());
//						request.setAttribute("nombreDocumento", a.getDocumento());
//						request.setAttribute("observaciones", a.getObservaciones());
//						request.setAttribute("correlativoDocumento", a.getCorrelativoDocumento());

//						if (a.getModificacionProductos().equalsIgnoreCase("SI")) {
//							request.setAttribute("mProductosChecked", "true");
//						} else {
//							request.setAttribute("mProductosChecked", "false");
//						}
//
//						request.getRequestDispatcher("nAmendmentForGeneral.jsp").forward(request, response);
//					} else {
//						openMode = "error";
//						request.setAttribute("openMode", openMode);
//						request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
//					}
//					break;
//				case "consultar":
//					if (controlCod != null && !controlCod.isEmpty()) {
//
//						int cod = Integer.parseInt(controlCod);
//						aclaracionEnmiendaGeneral a = aclaracionEnmiendaGeneralDao.getById(cod);
//
//						openMode = "disabled";
//						request.setAttribute("openMode", openMode);
//
//						request.setAttribute("cod", a.getCod());
//						request.setAttribute("noProcesoCompra", a.getProcesoCompra());
//						request.setAttribute("fecha", a.getFecha());
//						request.setAttribute("tipo", a.getTipo());
//						request.setAttribute("horaLimite", a.getHoraLimite());
//						request.setAttribute("diaLimite", a.getDiaLimite());
//						request.setAttribute("horaApertura", a.getHoraApertura());
//						request.setAttribute("diaApertura", a.getDiaApertura());
//						request.setAttribute("lugarApertura", a.getLugarApertura());
//						request.setAttribute("nombreDocumento", a.getDocumento());
//						request.setAttribute("observaciones", a.getObservaciones());
//						request.setAttribute("correlativoDocumento", a.getCorrelativoDocumento());
//
////						if (a.getModificacionProductos().equalsIgnoreCase("SI")) {
////							request.setAttribute("mProductosChecked", "true");
////						} else {
////							request.setAttribute("mProductosChecked", "false");
////						}
//
//						request.getRequestDispatcher("nAmendmentForGeneral.jsp").forward(request, response);
//					} else {
//						openMode = "error";
//						request.setAttribute("openMode", openMode);
//						request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
//					}
//					break;
//				default:
//					openMode = "error";
//					request.setAttribute("openMode", openMode);
//					request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
//					break;
//			}
//
//		} else {
//			openMode = "error";
//			request.setAttribute("openMode", openMode);
//			request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
//		}
//	}

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
