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
@WebServlet("/InformesDataALPAPI")
public class InformesDataALPAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InformesDataALPAPI() {
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
		
		System.out.println("aaaaa");
		
		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();
			
			String data = "";
			switch (step) {
				case "infRecContratacion":
					String codSolicitudCompraParam = request.getParameter("codSolicitudCompraParam");
					String procesoCompraParam = request.getParameter("procesoCompraParam");
					
					data = contratacionesDao.getlisreqSDbyExportData(codSolicitudCompraParam,procesoCompraParam);

					response.setContentType("application/json");
					out.print(data.toString());
					out.flush();
					break;
					
				case "infRecContratacionSegundaRCC":
					 codSolicitudCompraParam = request.getParameter("codSolicitudCompraParam");
					 procesoCompraParam = request.getParameter("procesoCompraParam");
					
					data = contratacionesDao.getlisreqSDbyExportDataSegundaRCC(codSolicitudCompraParam,procesoCompraParam);

					response.setContentType("application/json");
					out.print(data.toString());
					out.flush();
					break;
				
				default:
					//request.setAttribute("openMode", "openError");
					//request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
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
