package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.aclaracionEnmiendaALPDao;
import main.dao.actaAperturaALPDao;
import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.listaRequerimientoConsolidadaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.actaAperturaALP;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ActaAperturaAPI")
public class ActaAperturaAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ActaAperturaAPI() {
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
		
		
		
		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();
			
			switch (step) {				
				case "ConsultarTablaByProveedor":					
					String noProceso = request.getParameter("noProceso");
					String proveedor = request.getParameter("proveedor");					
					
					String itemss = "";					
					itemss = listaRequerimientoConsolidadaALPDao.getActiveConsolidatedListByBuyProcessNumberByPrveedor(noProceso, proveedor);
					System.out.println(itemss);
					request.setAttribute("itemss", itemss);					
					response.setContentType("application/json");
					out.print(itemss.toString());
					out.flush();					
					break;
					
				case "noOfertador":				
					
					itemss = listaRequerimientoConsolidadaALPDao.getNoOfertadorByProcesoAndProveedor(request.getParameter("noProceso"), request.getParameter("proveedor"));
					System.out.println(itemss);
					request.setAttribute("itemss", itemss);					
					response.setContentType("application/json");
					out.print(itemss.toString());
					out.flush();					
					break;
					
				case "VerificarNumeroOfertador":
					System.out.println(request.getParameter("noProceso")+ " noProceso");
					System.out.println(request.getParameter("noOfertador") + " noOfertador");
					String data = actaAperturaALPDao.VerificarNumeroOfertador(request.getParameter("noProceso"),Integer.parseInt(request.getParameter("noOfertador")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
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
