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
 * Servlet implementation class beneficiarioFinalServlet
 */
@WebServlet("/beneficiarioMenorFinalServlet")
public class beneficiarioMenorFinalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public beneficiarioMenorFinalServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String beneficiarioFinal = request.getParameter("benFinal");
		String direccion = request.getParameter("dirEntrega");
		String estado = request.getParameter("checkActivo");
		String obs = request.getParameter("obs");
		String submit = request.getParameter("submit");

		beneficiarioMenorFinal b = new beneficiarioMenorFinal();

		b.setBeneficiarioFinal(beneficiarioFinal);
		b.setDireccion(direccion);
		b.setEstado("INACTIVO");
		b.setObservaciones(obs);

		if (submit != null && submit.contentEquals("nuevo")) {
			beneficiarioMenorFinalDao.save(b);
		} else {
			if (estado != null && !estado.isEmpty()) {
				b.setEstado("ACTIVO");
			}
			beneficiarioMenorFinalDao.activar(b);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramMenorBenFinal.jsp").forward(request, response);
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
