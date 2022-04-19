package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.solicitudDisponibilidadALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPGetNewCodForSDAPI")
public class ALPGetNewCodForSDAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPGetNewCodForSDAPI() {
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
		Long codPadre = (Long) session.getAttribute("codPadreSolCompra");
		if (codPadre == null) {
			codPadre = Long.parseLong("0");
		}

		String data = "-";
		
		if (codPadre != null)
		{
			data = solicitudDisponibilidadALPDao.getNewCod(codPadre);
		}
			
		response.setContentType("text/plain");
		System.out.println("New Code: " + data);

		PrintWriter out = response.getWriter();
		out.print(data.toString());
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
