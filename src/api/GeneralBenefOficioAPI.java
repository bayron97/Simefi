package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.listaRequerimientoALPDao;
import main.dao.listaRequerimientoGeneralDao;

/**
 * Servlet implementation class benefOficioAPI
 */
@WebServlet("/GeneralBenefOficioAPI")
public class GeneralBenefOficioAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GeneralBenefOficioAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String oficio = request.getParameter("search");
		HttpSession session = request.getSession(true);
		int cod = (int) session.getAttribute("noCompra");
		String benef = "";
		if (oficio != null && !oficio.isBlank()) {
			benef = listaRequerimientoGeneralDao.getBenefsOficio(oficio, cod);
		}
		System.out.println("benef: " + benef);
		response.setContentType("text/plain");
		response.getWriter().write(benef);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("LLego");
		doGet(request, response);
	}

}
