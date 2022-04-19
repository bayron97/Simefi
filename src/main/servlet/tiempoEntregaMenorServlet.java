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
@WebServlet("/tiempoEntregaMenorServlet")
public class tiempoEntregaMenorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public tiempoEntregaMenorServlet() {
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

		tiempoEntregaMenor t = new tiempoEntregaMenor();
		t.setTiempoEntrega(tiempoEntrega);
		t.setObservaciones(observacion);
		t.setEstado("INACTIVO");

		if (submit != null && submit.contentEquals("nuevo")) {
			tiempoEntregaMenorDao.save(t);
		} else {
			if (estado != null && !estado.isEmpty()) {
				t.setEstado("ACTIVO");
			}
			tiempoEntregaMenorDao.activar(t);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramMenorEnTime.jsp").forward(request, response);

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
