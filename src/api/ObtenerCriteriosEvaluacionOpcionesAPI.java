package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import main.dao.CriterioEvaluacionAndOpcionesALPDao;


/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ObtenerCriteriosEvaluacionOpcionesAPI")
public class ObtenerCriteriosEvaluacionOpcionesAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ObtenerCriteriosEvaluacionOpcionesAPI() {
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
	
		String id =  request.getParameter("id");
		String idSolicitud =  request.getParameter("idSolicitud");
		System.out.println(id + " id " + idSolicitud);
		
		String reqList = "";

		reqList = CriterioEvaluacionAndOpcionesALPDao.getCriteriosOpciones(Integer.parseInt(idSolicitud),Integer.parseInt(id));
			
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(reqList.toString());
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
