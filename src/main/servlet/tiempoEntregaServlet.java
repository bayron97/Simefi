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
 * Servlet implementation class tiempoEntregaServlet
 */
@WebServlet("/tiempoEntregaServlet")
public class tiempoEntregaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public tiempoEntregaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tiempoEntrega = request.getParameter("timEnt");
		String observacion = request.getParameter("obs");
		String estado = request.getParameter("checkActivo");
		String submit = request.getParameter("submit");

		tiempoEntrega t = new tiempoEntrega();
		t.setTiempoEntrega(tiempoEntrega);
		t.setObservaciones(observacion);
		t.setEstado("INACTIVO");

		if (submit != null && submit.contentEquals("nuevo")) {
			tiempoEntregaDao.save(t);
		} else {
			if (estado != null && !estado.isEmpty()) {
				t.setEstado("ACTIVO");
			}
			tiempoEntregaDao.activar(t);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramEnTime.jsp").forward(request, response);

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
