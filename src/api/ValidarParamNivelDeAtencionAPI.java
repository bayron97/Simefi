package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.dao.medicamentosDao;
import main.dao.nivelAtencionDao;
import main.dao.viaAdminDao;


/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ValidarParamNivelDeAtencionAPI")
public class ValidarParamNivelDeAtencionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidarParamNivelDeAtencionAPI() {
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
		String overlayNivel = request.getParameter("overlayNivel");
		String overlayNombre = request.getParameter("overlayNombre");
		String modifId = request.getParameter("modifId");
		
			if (Integer.parseInt(modifId) > 0) {			
				System.out.println("update");
				int Existe = nivelAtencionDao.validarNivelAtencionUpdate(Integer.parseInt(modifId), overlayNivel, overlayNombre);				
				duplicado = String.valueOf(Existe) ;								
			}
			else {
				System.out.println("new");
				int Existe = nivelAtencionDao.validarNivelAtencionNew(overlayNivel, overlayNombre);				
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
