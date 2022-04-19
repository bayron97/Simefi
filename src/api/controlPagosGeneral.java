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
import main.dao.controlPagosDao;
import main.dao.controlPagosGeneralDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.listaRequerimientoALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlPagos
 */
@WebServlet("/controlPagosGeneral")
public class controlPagosGeneral extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controlPagosGeneral() {
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
					String benfList = controlPagosGeneralDao.getInfDistribuidor(ordencompra);

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarTabla":
					String respuesta = controlPagosGeneralDao.getTable(ordencompra);
					response.setContentType("application/json");
					out.println(respuesta.toString());
					out.flush();
					System.out.print(respuesta);

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
