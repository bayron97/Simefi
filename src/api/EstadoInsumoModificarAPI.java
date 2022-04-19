package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.distribuidorDao;
import main.dao.otrosDao;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/EstadoInsumoModificarAPI")
public class EstadoInsumoModificarAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EstadoInsumoModificarAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String estado = "";	
		String modifId = request.getParameter("modifId");
		int respuesta = otrosDao.updateEstado(Integer.parseInt(modifId));				
		estado = String.valueOf(respuesta) ;								
		
			
		response.setContentType("text/plain");
		response.getWriter().write(estado);
		System.out.print(estado);
		//request.setAttribute("throughServlet", "true");
		//request.getRequestDispatcher("recepcionProductos.jsp").forward(request, response);
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
