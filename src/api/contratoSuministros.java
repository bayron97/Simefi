package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.Gral_aperturaProcesoDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/contratoSuministros")
public class contratoSuministros extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contratoSuministros() {
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
				case "Consultar":
					String noProcesoCompra = request.getParameter("noProcesoCompra");
					String benfList = contratoSuministroDao.getOrdenCompra(noProcesoCompra);

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
					
				case "ConsultarProveedores":
					String proveedores = contratoSuministroDao.getProveedores(request.getParameter("procesocompra"));

					request.setAttribute("proveedores", proveedores);
					System.out.println(proveedores);
					response.setContentType("text/plain");

					out.print(proveedores);
					out.flush();
					out.close();

					break;
				case "DetalleOrdenCompra":
				
					String DatosOrdenCompra = contratoSuministroDao.getDatosOrdenCompra(Integer.parseInt(request.getParameter("idDetalleOrdenCompra")));

					request.setAttribute("DatosOrdenCompra", DatosOrdenCompra);
					System.out.println(DatosOrdenCompra);
					response.setContentType("text/plain");

					out.print(DatosOrdenCompra);
					out.flush();
					out.close();

					break;
					
				case "validarNoContrato":
					
					String existe = "0";
					System.out.println("buyProcessId "+request.getParameter("buyProcessId"));
					System.out.println("buyOrderId "+request.getParameter("buyOrderId"));
					System.out.println("verificar "+request.getParameter("verificar"));
					
					if(request.getParameter("verificar").contentEquals("SI")) {
						existe = contratoSuministroDao.validarNoContrato(Integer.parseInt(request.getParameter("buyProcessId")),request.getParameter("buyOrderId"));
					}
					
					response.setContentType("text/plain");
					out.print(existe);
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
