package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
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
@WebServlet("/Gral_contratacionServlet")
public class Gral_contratacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratacionServlet() {
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
		String accion = request.getParameter("accion");
		String type = request.getParameter("type");
		String inWizard = (String) request.getAttribute("inWizard");		

		// Variable temporal para type
		String t = "none";
		
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
		if ((accion.contentEquals("nuevo") || accion.contentEquals("modificar"))) {
			read = "";
			disable = "";
		}
		
		
		
		if(accion.contentEquals("nuevo")) {			
			ArrayList<Gral_contratoOrdenCompraDTO> procesosWhitcontratoOrdenCompraList = Gral_contratoOrdenCompraDao.procesosWhitcontratoOrdenCompraList();
			request.setAttribute("procesosWhitcontratoOrdenCompraList", procesosWhitcontratoOrdenCompraList);
			session.setAttribute("idContratacion", 0);			
		}else if((accion.contentEquals("modificar") || accion.contentEquals("consultar"))){			
			Gral_contratacionDTO contratacion  = Gral_contratacionDao.Getcontratacion(Integer.parseInt(request.getParameter("idContratacion")));
			
			request.setAttribute("numProcesoCompra", contratacion.getNumProcesoCompra());
			request.setAttribute("monedaCompra", contratacion.getMonedaCompra());
			request.setAttribute("beneficiario", contratacion.getBeneficiario());
			request.setAttribute("nombreProveedor", contratacion.getNombreProveedor());
			request.setAttribute("tipoDocuemnto", contratacion.getTipoDocuemnto());
			request.setAttribute("numDocumento", contratacion.getNumDocumento());
			request.setAttribute("fechaSuscripcion", contratacion.getFechaSuscripcion());
			request.setAttribute("observacion", contratacion.getObservacion());
			request.setAttribute("myfile", contratacion.getDocumento());
			request.setAttribute("idcontratoOrdenCompra", contratacion.getIdcontratoOrdenCompra());
			session.setAttribute("idContratacion", Integer.parseInt(request.getParameter("idContratacion")));	
		}
		

		
		session.setAttribute("type", t);
		session.setAttribute("accion", accion);
		session.setAttribute("read", read);
		session.setAttribute("disable", disable);	
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("Gral_contratacion.jsp").forward(request, response);
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
