package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class viaAdminServlet
 */
@WebServlet("/viaAdminServlet")
public class viaAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public viaAdminServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String observacion = request.getParameter("overlayObs");
		String viaAdmin = request.getParameter("overlayNombre");
		String abreviacion = request.getParameter("overlayAbrv");
		String estado = request.getParameter("activ2");		
		String submit = request.getParameter("submit");
		System.out.println();
		System.out.println(submit + " cde");
		
		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		if(submit == null) {
			request.setAttribute("openMode", "null");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("parametrizacion.jsp").forward(request, response);	
			
		}else {
			if (submit.contentEquals("modif")) {
				String modifId = request.getParameter("modifId");

				viaAdmin v = new viaAdmin();
				v.setViaAdmin(viaAdmin.toUpperCase());
				v.setAbreviacion(abreviacion.toUpperCase());
				v.setObservacion(observacion.toUpperCase());

				viaAdminDao.update(v, Integer.parseInt(modifId));

				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(VIA DE ADMINISTRACION)");
				h.setFuncion("MODIFICAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				request.setAttribute("openMode", "null");
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("parametrizacion.jsp").forward(request, response);
			} else if (submit.contentEquals("rev")) {
				String modifId = request.getParameter("modifId");

				if (estado != null && !estado.isEmpty()) {
					estado = "ACTIVO";
				} else {
					estado = "INACTIVO";
				}

				viaAdminDao.updateState(estado, Integer.parseInt(modifId));

				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(VIA DE ADMINISTRACION)");
				h.setFuncion("REVISAR Y APROBAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				request.setAttribute("openMode", "null");
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("parametrizacion.jsp").forward(request, response);
			}
			else if (submit.contentEquals("guardar")){
				System.out.print("Esytoy por guardar");
				viaAdmin v = new viaAdmin();
				v.setViaAdmin(viaAdmin.toUpperCase());
				v.setAbreviacion(abreviacion.toUpperCase());
				v.setObservacion(observacion.toUpperCase());
				v.setEstado(" ");
				viaAdminDao.save(v);
				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(VIA DE ADMINISTRACION)");
				h.setFuncion("CREAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				request.setAttribute("throughServlet", "true");
				request.setAttribute("openMode", "null");
				request.getRequestDispatcher("parametrizacion.jsp").forward(request, response);
			} else{
				request.setAttribute("throughServlet", "true");
				request.setAttribute("openMode", "null");
				request.getRequestDispatcher("parametrizacion.jsp").forward(request, response);
			}			
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
