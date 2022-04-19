package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import main.dao.procesoCompraGeneralDao;

/**
 * Servlet implementation class procesosCompraAPI
 */
@WebServlet("/procesosCompraGeneralAPI")
public class procesosCompraGeneralAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public procesosCompraGeneralAPI() {
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
			med = procesoCompraGeneralDao.getByNo(search.toUpperCase());
		} else {
			med = procesoCompraGeneralDao.getAll();
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
