package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pCompraWizardRouting
 */
@WebServlet("/Gral_recepcionProductoServlet")
public class Gral_recepcionProductoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_recepcionProductoServlet() {
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
		int idAperturaProceso = Integer.parseInt(request.getParameter("idAperturaProceso"));
		

		HttpSession session = request.getSession(true);
		String sessionType = (String) session.getAttribute("type");


		String read = "readOnly";
		String disable = "disabled";
		if (accion != null && (accion.contentEquals("nuevo") || accion.contentEquals("modificar"))) {
			read = "";
			disable = "";
		}
		
		request.setAttribute("proveedoresList", Gral_contratoOrdenCompraDao.Getproveedores(idAperturaProceso));
		request.setAttribute("beneficiarioProceso", Gral_aperturaProcesoDao.getBeneficiario(idAperturaProceso));
	
		session.setAttribute("accion", accion);
		session.setAttribute("read", read);
		session.setAttribute("disable", disable);
		request.setAttribute("numProcesoCompra", request.getParameter("numProcesoCompra"));
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("Gral_recepcion.jsp").forward(request, response);
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
