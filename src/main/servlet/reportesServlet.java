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
 * Servlet implementation class reportesServlet
 */
@WebServlet("/reportesServlet")
public class reportesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public reportesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String codEmp = request.getParameter("codEmp");
		String usuario = request.getParameter("usuario");
		String submit = request.getParameter("submit");
		request.setAttribute("padre", codEmp);
		request.setAttribute("usuario", usuario);

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		if (submit.contentEquals("historialUsuario")) {

			h.setModulo("PARAMETRIZACION DE USUARIOS");
			h.setSubmodulo("REPORTES DE HISTORIAL");
			h.setFuncion("CONSULTAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			if (usuario != null && !usuario.isEmpty()) {
				request.getRequestDispatcher("reportesUsuario.jsp").forward(request, response);
			} else {
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("reportes.jsp").forward(request, response);
			}
		} else if (submit.contentEquals("back")) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("reportes.jsp").forward(request, response);
		} else {
			h.setModulo("PARAMETRIZACION DE USUARIOS");
			h.setSubmodulo("REPORTES DE HISTORIAL");
			h.setFuncion("CONSULTAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			if (usuario != null && !usuario.isEmpty()) {
				request.getRequestDispatcher("reportesAccesos.jsp").forward(request, response);
			} else {
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("reportes.jsp").forward(request, response);
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
