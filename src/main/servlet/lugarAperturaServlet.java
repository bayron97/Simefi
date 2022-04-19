package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class lugarAperturaServlet
 */
@WebServlet("/lugarAperturaServlet")
public class lugarAperturaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public lugarAperturaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String lugarApert = request.getParameter("lugarApert");
		String observacion = request.getParameter("obsApert");
		String estado = request.getParameter("activo");
		String submit = request.getParameter("submit");

		lugarApertura a = new lugarApertura();
		a.setLugarApertura(lugarApert);
		a.setObservaciones(observacion);
		a.setEstado("INACTIVO");

		if (submit.contentEquals("nuevo")) {
			lugarAperturaDao.save(a);
		} else {
			if (estado != null && !estado.isEmpty()) {
				a.setEstado("ACTIVO");
			}
			String motivo = request.getParameter("motivo");
			a.setmotivo(motivo);
			lugarAperturaDao.activar(a);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramOpeningPlace.jsp").forward(request, response);
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
