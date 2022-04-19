package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.vaciadoOfertasALPDao;

/**
 * Servlet implementation class benefOficioAPI
 */
@WebServlet("/ALPBuyPurchaseDescriptionAPI")
public class ALPBuyPurchaseDescriptionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPBuyPurchaseDescriptionAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String buyPurchaseNumber = request.getParameter("search");
		String description = "";
		if (buyPurchaseNumber != null && !buyPurchaseNumber.isBlank()) {
			description = vaciadoOfertasALPDao.getBuyPurchaseDescriptionByALPNumber(buyPurchaseNumber);
		}
		response.setContentType("text/plain");
		response.getWriter().write(description);
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
