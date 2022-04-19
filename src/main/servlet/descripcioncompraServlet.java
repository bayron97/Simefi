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
 * Servlet implementation class descripcioncompraServlet
 */
@WebServlet("/descripcioncompraServlet")
public class descripcioncompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public descripcioncompraServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombrecompra = request.getParameter("nombrec");
		String estado = request.getParameter("checkActivo");
		String submit = request.getParameter("submit");

		descripcioncompra t = new descripcioncompra();
		t.setNombreCompra(nombrecompra.toUpperCase());
		t.setEstado("INACTIVO");

		if (submit != null && submit.contentEquals("nuevo")) {
			descripcioncompraDao.save(t);
		} else {
			if (estado != null && !estado.isEmpty()) {
				t.setEstado("ACTIVO");
			}
			else {
				t.setEstado("INACTIVO");
			}
			int id = -1;
			try {
				id = Integer.parseInt((String)request.getParameter("BTID"));
			}
			catch(Exception e) {
				id = -1;
			}
			t.setNo(id);
			String motivo = request.getParameter("motivo");
			t.setmotivo(motivo);
			descripcioncompraDao.activar(t);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramPurchaseDescription.jsp").forward(request, response);

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
