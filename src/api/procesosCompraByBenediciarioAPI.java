package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.procesoCompraALPDao;
import main.dao.productoSolicitudCompraALPDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/procesosCompraByBenediciarioAPI")
public class procesosCompraByBenediciarioAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public procesosCompraByBenediciarioAPI() {
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
		String beneficiario = request.getParameter("beneficiario");
		System.out.println(beneficiario + " beneficiario");
		System.out.println(step + " step");	
		
		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();

			switch (step) {
				case "0":
					String procesosList = procesoCompraALPDao.getProcesosCompra(beneficiario);

					request.setAttribute("benfList", procesosList);
					System.out.println(procesosList);
					response.setContentType("text/plain");

					out.print(procesosList);
					out.flush();
					out.close();

					break;
				default:
					
					String procesosListBycod = procesoCompraALPDao.getProcesosCompra(beneficiario);

					request.setAttribute("benfList", procesosListBycod);
					System.out.println(procesosListBycod);
					response.setContentType("text/plain");

					out.print(procesosListBycod);
					out.flush();
					out.close();
					
					break;
			}
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
