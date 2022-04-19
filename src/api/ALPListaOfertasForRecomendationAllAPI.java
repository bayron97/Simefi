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
@WebServlet("/ALPListaOfertasForRecomendationAllAPI")
public class ALPListaOfertasForRecomendationAllAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPListaOfertasForRecomendationAllAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String codPadreBus = request.getParameter("codPadreBus");
		System.out.println("cod " + codPadreBus);
		String offerList = "";
			offerList = ofertaALPDao.getofferListForJSON(Integer.parseInt(codPadreBus));
		System.out.println(offerList);
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
