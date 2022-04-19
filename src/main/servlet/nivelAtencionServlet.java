package main.servlet;

import main.dao.*;
import main.model.*;

import java.awt.SystemColor;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class nivelAtencionServlet
 */
@WebServlet("/nivelAtencionServlet")
public class nivelAtencionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public nivelAtencionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nivel = request.getParameter("overlayNivel");
		String observacion = request.getParameter("overlayObs");
		String nombre = request.getParameter("overlayNombre");
		String abreviacion = request.getParameter("overlayAbrv");
		String estado = request.getParameter("activ2");

		String submit = request.getParameter("submit");
		String isRevisar = request.getParameter("isRevisar");

		HttpSession session = request.getSession(true);
		System.out.println(submit + " aqui");
		

		historialAccesos h = new historialAccesos();
		if(submit == null) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nivelAtencion.jsp").forward(request, response);
			
		}else {
		if (submit.contentEquals("modif")) {
			String id = request.getParameter("modifId");

			nivelAtencion v = new nivelAtencion();
			v.setNivel(nivel.toUpperCase());
			v.setNombre(nombre.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setAbreviacion(abreviacion.toUpperCase());
			nivelAtencionDao.update(v, Integer.parseInt(id));

			// History: edit
			h.setModulo("MEDICAMENTOS Y OTROS");
			h.setSubmodulo("PARAMETRIZACION(NIVEL DE ATENCION)");
			h.setFuncion("MODIFICAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nivelAtencion.jsp").forward(request, response);
		} else if (submit.contentEquals("rev")) {
			String id = request.getParameter("modifId");

			if (estado != null && !estado.isEmpty()) {
				estado = "ACTIVO";
			} else {
				estado = "INACTIVO";
			} System.out.println(estado + " esto");
			nivelAtencionDao.updateState(estado, Integer.parseInt(id));

			// History: rev & aprov
			h.setModulo("MEDICAMENTOS Y OTROS");
			h.setSubmodulo("PARAMETRIZACION(NIVEL DE ATENCION)");
			h.setFuncion("REVISAR Y APROBAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nivelAtencion.jsp").forward(request, response);
		} else if (submit.contentEquals("guardar")){
			nivelAtencion v = new nivelAtencion();
			v.setNivel(nivel.toUpperCase());
			v.setNombre(nombre.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setEstado(" ");
			v.setAbreviacion(abreviacion.toUpperCase());
			nivelAtencionDao.save(v);

			h.setModulo("MEDICAMENTOS Y OTROS");
			h.setSubmodulo("PARAMETRIZACION(CATEGORIAS)");
			h.setSubmodulo("PARAMETRIZACION(NIVEL DE ATENCION)");
			h.setFuncion("CREAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nivelAtencion.jsp").forward(request, response);
		}else {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("nivelAtencion.jsp").forward(request, response);			
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
