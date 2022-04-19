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
import main.dao.Gral_contratoOrdenCompraDao;
import main.dao.Gral_listaRequerimientoDao;
import main.dao.Gral_oficioBeneficiarioDao;
import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.Gral_listaRequerimiento;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/Gral_contratoOrdenCompraAPI")
public class Gral_contratoOrdenCompraAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratoOrdenCompraAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			String accion = request.getParameter("accion");
			String data = "";
			if (accion != null && !accion.isEmpty()) {
				PrintWriter out = response.getWriter();				
				switch (accion) {
				
				case "GetBeneficiario":
					data = Gral_aperturaProcesoDao.getBeneficiarioXidApertura(Integer.parseInt(request.getParameter("idAperturaProceso")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "GetDatosByidcontratoOrdenCompra":
					data = Gral_aperturaProcesoDao.GetDatosByidcontratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "validarNumDocumento":
					data = Gral_contratoOrdenCompraDao.validarNumDocumento(request.getParameter("numDocumento"), request.getParameter("tipoDocuemnto"));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;

					
				default:
					
					break;
				}
			}

		} catch (Exception e) {
			// TODO: handle exception
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
