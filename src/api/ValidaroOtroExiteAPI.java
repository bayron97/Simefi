package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.dao.medicamentosDao;
import main.dao.otrosDao;
import main.dao.upDao;



/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ValidaroOtroExiteAPI")
public class ValidaroOtroExiteAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidaroOtroExiteAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String duplicado = "";	
		System.out.println("llego");
		String nombre = request.getParameter("nombre");
		String modifId = request.getParameter("modifId");
		
			if (Integer.parseInt(modifId) > 0) {			
				System.out.println("update");
				int Existe = otrosDao.validarExistOtroupdate(Integer.parseInt(modifId), nombre);				
				duplicado = String.valueOf(Existe) ;								
			}
			else {
				System.out.println("new");
				int Existe = otrosDao.validarExistNew( nombre);					
				duplicado = String.valueOf(Existe) ;
			}
		response.setContentType("text/plain");
		response.getWriter().write(duplicado);
		System.out.print(duplicado);
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
