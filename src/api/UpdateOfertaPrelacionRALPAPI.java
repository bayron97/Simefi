package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.ofertaALPDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.ofertaALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/UpdateOfertaPrelacionRALPAPI")
public class UpdateOfertaPrelacionRALPAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateOfertaPrelacionRALPAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String prelacion = request.getParameter("prelacion");
		String noOferta = request.getParameter("noOferta");
		String resultado = "";
			
			if (noOferta != null) {	
				
				ofertaALP ofer = new ofertaALP();
				ofer.setnoOferta(noOferta);
				ofer.setprelacionRALP(Integer.parseInt(prelacion));
				
				int  updatestate = ofertaALPDao.updateRecomendacionPrelacion(ofer);
				
				String j = "";
				j += updatestate;
				
				j = j.substring(0, j.length());
				j += "";
				
				resultado = j;
				
														
			}
			else {			
			}
		response.setContentType("text/plain");
		response.getWriter().write(resultado);
		System.out.print(resultado);
		
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
