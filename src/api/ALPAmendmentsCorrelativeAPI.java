package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.aclaracionEnmiendaALPDao;

/**
 * Servlet implementation class benefOficioAPI
 */
@WebServlet("/ALPAmendmentsCorrelativeAPI")
public class ALPAmendmentsCorrelativeAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPAmendmentsCorrelativeAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String type = request.getParameter("type");
		String purchaseNumber = request.getParameter("purchaseNumber");

		String newCorrelative = "";
		if (type != null && !type.isBlank()) {
			newCorrelative = String.valueOf(aclaracionEnmiendaALPDao.getNewCorrelative(type, purchaseNumber));
		}
		response.setContentType("text/plain");
		response.getWriter().write(newCorrelative);
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
