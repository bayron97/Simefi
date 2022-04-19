package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.Gral_contratacionDao;
import main.dao.Gral_contratoOrdenCompraDao;
import main.dao.aclaracionEnmiendaALPDao;
import main.model.Gral_contratacionDetalle;
import main.model.Gral_resultadoAnalisCalidad;

/**
 * Servlet implementation class benefOficioAPI
 */
@WebServlet("/ALPAmendmentsAPI")
public class ALPAmendmentsAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPAmendmentsAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String accion = request.getParameter("accion");
			String data = "";
			if (accion != null && !accion.isEmpty()) {
				PrintWriter out = response.getWriter();				
				switch (accion) {
				
				case "getCorrelativoXProceso":
					data = aclaracionEnmiendaALPDao.getCorrelativoXProceso(request.getParameter("processNum"),request.getParameter("amendmentType"),Integer.parseInt(request.getParameter("correlativoDocumento")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;				
			
			
				default:
					
					break;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
		}
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
