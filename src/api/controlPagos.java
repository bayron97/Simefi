package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.contratacionesDao;
import main.dao.contratoSuministroDao;
import main.dao.controlPagosDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.listaRequerimientoALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlPagos
 */
@WebServlet("/controlPagos")
public class controlPagos extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controlPagos() {
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
		String ordencompra = request.getParameter("ordencompra");
		String proveedor = request.getParameter("proveedor");
		
		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();

			switch (step) {
				case "Consultar":
					String benfList = controlPagosDao.getInfDistribuidor(ordencompra);

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarTabla":
					String respuesta = controlPagosDao.getTable(ordencompra);
					response.setContentType("application/json");
					out.println(respuesta.toString());
					out.flush();
					System.out.print(respuesta);

					break;
					
				case "ConsultarItems":
					String items = contratacionesDao.getItemsContrataciones(Integer.parseInt(request.getParameter("ordencompra")) );
					request.setAttribute("items", items);
					System.out.println(items);
					response.setContentType("text/plain");

					out.print(items);
					out.flush();
					out.close();

					break;
					
				case "ConsultarFacturas":
					String itemseleccionado = request.getParameter("items");
					String facturas = contratacionesDao.getFacturass(itemseleccionado, Integer.parseInt(request.getParameter("ordencompra")));
					request.setAttribute("items", facturas);
					System.out.println(facturas);
					response.setContentType("text/plain");

					out.print(facturas);
					out.flush();
					out.close();

					break;
					
				case "ConsultarCampos":
					String facturano = request.getParameter("factura");
					String campos = contratacionesDao.getCampos(facturano);
					request.setAttribute("campos", campos);
					System.out.println(campos);
					response.setContentType("text/plain");

					out.print(campos);
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
