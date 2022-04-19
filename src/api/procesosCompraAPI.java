package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.medicamentosDao;
import main.dao.procesoCompraALPDao;

/**
 * Servlet implementation class procesosCompraAPI
 */
@WebServlet("/procesosCompraAPI")
public class procesosCompraAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public procesosCompraAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String search = request.getParameter("search");
		String med = "";
		if (search != null && !search.isBlank()) {
			med = procesoCompraALPDao.getByNo(search.toUpperCase());
		} else {
			med = procesoCompraALPDao.getAll();
		}
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(med.toString());
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
