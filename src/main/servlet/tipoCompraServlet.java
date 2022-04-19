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
 * Servlet implementation class tipoCompraServlet
 */
@WebServlet("/tipoCompraServlet")
public class tipoCompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public tipoCompraServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipoCompra = request.getParameter("purchaseType");
		String abreviatura = request.getParameter("abrev");
		String estado = request.getParameter("checkActivo");
		String observacion = request.getParameter("obs");
		String submit = request.getParameter("submit");

		tipoCompra t = new tipoCompra();

		t.setTipoCompra(tipoCompra.toUpperCase());
		t.setabreviatura(abreviatura.toUpperCase());
		t.setObservaciones(observacion.toUpperCase());
		t.setEstado("INACTIVO");

		if (submit != null && submit.contentEquals("nuevo")) {
			tipoCompraDao.save(t);
		} else {
			if (estado != null && !estado.isEmpty()) {
				t.setEstado("ACTIVO");
			}
			String motivo = request.getParameter("motivo");
			t.setmotivo(motivo);
			tipoCompraDao.activar(t);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramPurchaseType.jsp").forward(request, response);
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
