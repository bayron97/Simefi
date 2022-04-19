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
@WebServlet("/pRecepcionProductosGeneral")
public class pRecepcionProductosGeneral extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pRecepcionProductosGeneral() {
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
				cod = -1;
				next = "nRecepcionProductosGeneral.jsp";
				request.setAttribute("Id", cod);
				session.setAttribute("procesocompra", 0);
				session.setAttribute("beneficiario", 0);
				session.setAttribute("solicitudcompra", 0);
				session.setAttribute("nombreproveedor", "");
				session.setAttribute("type", t);
				session.setAttribute("funcion", "nuevo");
				session.setAttribute("read", read);
				session.setAttribute("disable", disable);
				session.setAttribute("ogFunc", "nuevo");

				break;
			case "modificar":
				if (id == null) {
					int i = (Integer) request.getAttribute("id");
					id = String.valueOf(i);
				}
				if (id != null && !id.isEmpty()) {
					cod = Integer.parseInt(id);
					next = "nRecepcionProductosGeneral.jsp";

					contratacionesGenerales p = contratacionesGeneralDao.getById(Integer.parseInt(id));
					
					request.setAttribute("Id", cod);
					session.setAttribute("procesocompra", p.getIdProcesoCompra());
					session.setAttribute("beneficiario", p.getIdBeneficiario());
					session.setAttribute("solicitudcompra", p.getIdSolicitudCompra());
					session.setAttribute("nombreproveedor", p.getProveedor());
					request.setAttribute("procesocompracod", p.getProcesoCompra());
					request.setAttribute("ordencompra", p.getNoOrdenCompra());
					request.setAttribute("nombreproveedor", p.getProveedor());
					request.setAttribute("nombrebeneficiario", p.getBeneficiario());
					request.setAttribute("nombresolicitudcompra", p.getSolicitudCompra());
					request.setAttribute("fechasuscripcion", p.getFechaSuscripcion());
					request.setAttribute("myfile", p.getNombreDocumento());
					request.setAttribute("observaciones", p.getObservaciones());

					session.setAttribute("type", t);
					session.setAttribute("noCompra", cod);
					session.setAttribute("funcion", "modificar");
					session.setAttribute("ogFunc", "modificar");
					session.setAttribute("read", read);
					session.setAttribute("disable", disable);
				}
				break;
			case "consultar":

				if (id != null && !id.isEmpty()) {
					cod = Integer.parseInt(id);
					next = "nRecepcionProductosGeneral.jsp";

 					contratacionesGenerales p = contratacionesGeneralDao.getById(Integer.parseInt(id));
					
					request.setAttribute("Id", cod);
					session.setAttribute("procesocompra", p.getIdProcesoCompra());
					session.setAttribute("beneficiario", p.getIdBeneficiario());
					session.setAttribute("solicitudcompra", p.getIdSolicitudCompra());
					session.setAttribute("nombreproveedor", p.getProveedor());
					request.setAttribute("procesocompracod", p.getProcesoCompra());
					request.setAttribute("ordencompra", p.getNoOrdenCompra());
					request.setAttribute("nombreproveedor", p.getProveedor());
					request.setAttribute("nombrebeneficiario", p.getBeneficiario());
					request.setAttribute("nombresolicitudcompra", p.getSolicitudCompra());
					request.setAttribute("fechasuscripcion", p.getFechaSuscripcion());
					request.setAttribute("myfile", p.getNombreDocumento());
					request.setAttribute("observaciones", p.getObservaciones());

					session.setAttribute("type", t);
					session.setAttribute("noCompra", cod);
					session.setAttribute("funcion", "consultar");
					session.setAttribute("ogFunc", "consultar");
					session.setAttribute("read", read);
					session.setAttribute("disable", disable);
				}
				break;
			default:
				next = "recepcionProductosGeneral.jsp";
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
