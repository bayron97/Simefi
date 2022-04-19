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
import main.dao.contratacionesGeneralDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.ordenCompraGeneralDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/OrdenCompraGeneralAPI")
public class OrdenCompraGeneralAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrdenCompraGeneralAPI() {
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
		String id = request.getParameter("id");
		String noProcesoCompra = request.getParameter("noProcesoCompra");
		String beneficiario = request.getParameter("beneficiario");
		String solicitudCompra = request.getParameter("solicitudCompra");
		
		
		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();
			String benfList="";
			switch (step) {
				case "Consultar":
					benfList = contratacionesDao.getItembyId(Long.parseLong(id));

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarTabla":
				    benfList = contratacionesGeneralDao.getTableItems(Long.parseLong(id));

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarBen":
					
					benfList = ordenCompraGeneralDao.getBeneficiarios(noProcesoCompra);
					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
					
				case "ConsultarSol":
					benfList = contratacionesDao.getSolicitudesCompra(noProcesoCompra, beneficiario);

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarItem":
					benfList =  ordenCompraGeneralDao.getItemsbySolicitudCompra(noProcesoCompra);

					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarProveedores":
					benfList = beneficiarioDao.getProveedoresbyprocompraandsoli(solicitudCompra,noProcesoCompra);

					System.out.println(solicitudCompra +" "+ noProcesoCompra + " ASASASASASASA");
					
					request.setAttribute("benfList", benfList);
					
					response.setContentType("text/plain");

					out.print(benfList);
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
