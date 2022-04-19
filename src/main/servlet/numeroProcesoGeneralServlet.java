package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class procesoALPServlet
 */
@WebServlet("/numeroProcesoGeneralServlet")
public class numeroProcesoGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public numeroProcesoGeneralServlet() {
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
		numeroProcesoGeneral p = new numeroProcesoGeneral();
		if (tipoCompra != null) {
			int year = Calendar.getInstance().get(Calendar.YEAR);
			String cod = tipoCompra;
			cod = cod + "-" + year;
			int next = numeroProcesoGeneralDao.count(cod) + 1;
			cod = cod + "-" + next;

			p.setCod(cod);
			p.setEstado("DISPONIBLE");
			p.setIdIncremental(next);

			numeroProcesoGeneralDao.save(p);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramGeneral.jsp").forward(request, response);
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
