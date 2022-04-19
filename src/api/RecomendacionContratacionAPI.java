package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/RecomendacionContratacionAPI")
public class RecomendacionContratacionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecomendacionContratacionAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String step = request.getParameter("submit");
		
			PrintWriter out = response.getWriter();
			String Respuestas="";
			switch (step) {
				case "GetNumSanitario_BPM":
					String noOfertaCatalogo_Param = request.getParameter("noOfertaCatalogo_Param");
					
				
					Respuestas = contratacionesDao.GetNumSanitario_BPM(Integer.parseInt(noOfertaCatalogo_Param));

					request.setAttribute("Respuestas", Respuestas);
					System.out.println(Respuestas);
					response.setContentType("text/plain");

					out.print(Respuestas);
					out.flush();
					out.close();

					break;			
			
				default:
					//request.setAttribute("openMode", "openError");
					//request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
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
