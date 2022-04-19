package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.ofertaALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPListaOfertasForRecomendationAPI")
public class ALPListaOfertasForRecomendationAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPListaOfertasForRecomendationAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		String search = request.getParameter("searchATC");
		String proc = (String) session.getAttribute("proc");
		System.out.println("search " + search);

		String offerList = "";
		if (search != null && !search.isBlank()) {
			offerList = ofertaALPDao.getofferListForIRByATCNumberJSON(proc, search);
		}
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(offerList.toString());
		out.flush();
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
