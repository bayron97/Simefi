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
 * Servlet implementation class upServlet
 */
@WebServlet("/upServlet")
public class upServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public upServlet() {
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
		String up = request.getParameter("overlayUnd");
		String abreviacion = request.getParameter("overlayAbrv");
		String estado = request.getParameter("activ2");
		String modifId = request.getParameter("modifId");
		String submit = request.getParameter("submit");
		String isRevisar = request.getParameter("isRevisar");

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();
		if(submit == null) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("up.jsp").forward(request, response);
		}else {
		if (submit.contentEquals("modif")) {
			System.out.println(submit);
			if (estado != null && !estado.isEmpty()) {
				estado = "ACTIVO";
			} else {
				estado = "INACTIVO";
			}
			up v = new up();
			v.setUp(up.toUpperCase());
			v.setAbreviacion(abreviacion.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setEstado(estado.toUpperCase());
			upDao.update(v, Integer.parseInt(modifId));

			if (isRevisar != null && isRevisar.contains("yes")) {
				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(UNIDAD DE PRESENTACION)");
				h.setFuncion("REVISAR Y APROBAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
			} else {
				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(UNIDAD DE PRESENTACION)");
				h.setFuncion("MODIFICAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
			}
				
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("up.jsp").forward(request, response);
		} else if (submit.contentEquals("nuevo")) {
			up v = new up();
			v.setUp(up.toUpperCase());
			v.setAbreviacion(abreviacion.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setEstado(" ");
			upDao.save(v);

			h.setModulo("MEDICAMENTOS Y OTROS");
			h.setSubmodulo("PARAMETRIZACION(UNIDAD DE PRESENTACION)");
			h.setFuncion("CREAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("up.jsp").forward(request, response);
		}else{
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("up.jsp").forward(request, response);			
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
