package api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.dao.medicamentosDao;


/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ValidarCodSESAL")
public class ValidarCodSESAL extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidarCodSESAL() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String[] Item = request.getParameterValues("json[]");			
		System.out.println(Item);
		
		HttpSession session = request.getSession(true);
		//String func = (String) session.getAttribute("funcion");
		
		String duplicado = "";
		
		//
		String codSesal = request.getParameter("codSesal");
		String codSist = request.getParameter("codSist");
		
	System.out.println(codSist + "Coigo sitema");
		
		
			if (Integer.parseInt(codSist) == 0) {			
				
				int Existe = medicamentosDao.validarSESALNew(codSesal);				
				duplicado = String.valueOf(Existe) ;								
			}
			else {
					
				int Existe = medicamentosDao.validarSESALUpdate(codSesal,codSist);				
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
