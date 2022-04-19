package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.listaRequerimientoGeneralDao;
import main.dao.medicamentosDao;
import main.dao.ofertaALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ProductoSeleccionadoAPI")
public class ProductoSeleccionadoAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductoSeleccionadoAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String medicamento = request.getParameter("search");
		HttpSession session = request.getSession(true);
		
		
		String producto = "";
		if (medicamento != null && !medicamento.isBlank()) {
			producto = medicamentosDao.getProductoSeleccionado(medicamento);
			
		}
		System.out.println("benef: " + producto);
		response.setContentType("text/plain");
		response.getWriter().write(producto);
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
