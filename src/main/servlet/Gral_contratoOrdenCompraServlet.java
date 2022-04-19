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
@WebServlet("/Gral_contratoOrdenCompraServlet")
public class Gral_contratoOrdenCompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratoOrdenCompraServlet() {
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
		if (accion != null && (accion.contentEquals("nuevo") || accion.contentEquals("modificar"))) {
			read = "";
			disable = "";
		}
		
		ArrayList<Gral_aperturaProceso> numProcesoAperturaList = Gral_aperturaProcesoDao.GetListNumerosProcesos();
		ArrayList<distribuidor> proveedoresList = distribuidorDao.proveedorList();
		
		if(accion.contentEquals("nuevo")) {
			session.setAttribute("idcontratoOrdenCompra", 0);
		}
		
		else if(accion.contentEquals("modificar") || accion.contentEquals("consultar")) {
			
			Gral_contratoOrdenCompraDTO contratoOrdenCompra = Gral_contratoOrdenCompraDao.GetContratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
			
			request.setAttribute("idAperturaProceso", contratoOrdenCompra.getIdAperturaProceso());
			request.setAttribute("idProveedor", contratoOrdenCompra.getIdProveedor());
			request.setAttribute("nombreProveedor", contratoOrdenCompra.getNombreProveedor());
			request.setAttribute("tipoDocuemnto", contratoOrdenCompra.getTipoDocuemnto());
			request.setAttribute("numDocumento", contratoOrdenCompra.getNumDocumento());
			request.setAttribute("fechaSuscripcion", contratoOrdenCompra.getFechaSuscripcion());
			request.setAttribute("observaciones", contratoOrdenCompra.getObservaciones());
			request.setAttribute("beneficiario", contratoOrdenCompra.getBeneficiario());
			request.setAttribute("myfile", contratoOrdenCompra.getDocumento());	
			
			session.setAttribute("idcontratoOrdenCompra", request.getParameter("idcontratoOrdenCompra"));
			
		}

		
		session.setAttribute("type", t);
		session.setAttribute("accion", accion);
		session.setAttribute("read", read);
		session.setAttribute("disable", disable);
		session.setAttribute("proveedoresList", proveedoresList);
		session.setAttribute("numProcesoAperturaList", numProcesoAperturaList);
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("Gral_contratoOrdenCompra.jsp").forward(request, response);
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
