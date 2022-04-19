package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pCompraGeneralWizardRouting
 */
@WebServlet("/pCompraGeneralWizardRouting")
public class pCompraGeneralWizardRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pCompraGeneralWizardRouting() {
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
		
		try {
			String accion = request.getParameter("submit");//accion nuevo editar ect..
			String type = request.getParameter("type");//tipo compra
			String inWizard = (String) request.getAttribute("inWizard");
			//String sub = (String) request.getAttribute("submit");
			String pantalla = request.getParameter("next");
			int idAperturaProceso = Integer.parseInt(request.getParameter("idAperturaProceso"));//id Pantalla
		

			// Variable temporal para type
			String t = "none";
			String read = "readOnly";
			String disable = "disabled";
			
			
			
//			if (submit == null && sub != null) {
//				submit = sub;
//			}

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

			if (accion != null && (accion.contentEquals("nuevo") || accion.contentEquals("modificar"))) {
				read = "";
				disable = "";
			}
			int cod;
			
			ArrayList<descripcioncompra> desCompraList = descripcioncompraDao.getAllActive();	
			ArrayList<lugarApertura> lugarAperturaList = lugarAperturaDao.getAllActive();
			
			
			
			Gral_aperturaProceso apertura = new Gral_aperturaProceso();
			
			if(accion.contentEquals("nuevo")) {
				ArrayList<numeroProcesoCompra> numProcesoCompraList = numeroProcesoCompraDao.numsProcesoCompra();request.setAttribute("numProcesoCompraList", numProcesoCompraList);
				ArrayList<distribuidor> beneficiarios = distribuidorDao.beneficiarios();
				request.setAttribute("beneficiarios", beneficiarios);
				session.setAttribute("idAperturaProceso", 0);
				session.setAttribute("estado", "EN PROCESO");
				session.setAttribute("observaciones", "NINGUNA");				
			}
			else if(accion.contentEquals("modificar") || accion.contentEquals("consultar") || accion.contentEquals("revisar")) {
				
				 apertura =  Gral_aperturaProcesoDao.GetAperturaProceso(idAperturaProceso);
				
				 
						request.setAttribute("numProcesoCompra", apertura.getNumProcesoCompra());
						request.setAttribute("descripcionCompra", apertura.getDescripcionCompra());
						
						String[] fechaLimite = apertura.getFechaLimite().split("\\|");						
						request.setAttribute("fechaLimiteView", fechaLimite[0]);
						request.setAttribute("horaLimiteView", fechaLimite[1]);						
						System.out.println(fechaLimite[1]);
						
						String[] fechaApertura = apertura.getFechaApertura().split("\\|");						
						request.setAttribute("fechaAperturaView", fechaApertura[0]);
						request.setAttribute("horaAperturaView", fechaApertura[1]);
						System.out.println(fechaApertura[1]);
						
						
						request.setAttribute("lugar", apertura.getLugar());
						request.setAttribute("periodoValidez", apertura.getPeriodoValidez());											
						request.setAttribute("fechaPublicacion", apertura.getFechaPublicacion());
						request.setAttribute("idBeneficiario", apertura.getIdBeneficiario());
						request.setAttribute("beneficiario", apertura.getbeneficiario());
						
						ArrayList<Gral_oficioBeneficiario> oficios =  Gral_oficioBeneficiarioDao.GetListOficioByApertura(idAperturaProceso);
				
						request.setAttribute("oficios", oficios);
						session.setAttribute("idAperturaProceso", idAperturaProceso);
						session.setAttribute("estado", apertura.getEstado());
						session.setAttribute("observaciones", apertura.getObservaciones());
						session.setAttribute("numProcesoCompra", apertura.getNumProcesoCompra());
						
			}
			
			
			
			
			request.setAttribute("descripcionCompraList", desCompraList);
			request.setAttribute("lugarList", lugarAperturaList);
			
			session.setAttribute("type", t);
			session.setAttribute("accion", accion);
			session.setAttribute("read", read);
			session.setAttribute("disable", disable);
			request.setAttribute("throughServlet", "true");
			//request.getRequestDispatcher(pantalla).forward(request, response);
			request.getRequestDispatcher("Gral_aperturaProceso.jsp").forward(request, response);

			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
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
