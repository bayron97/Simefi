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
@WebServlet("/Gral_controlGarantiasAPI")
public class Gral_controlGarantiasAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_controlGarantiasAPI() {
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
				
				case "GetNumDocumento":
					data = Gral_contratoOrdenCompraDao.getnumDocumentoXidAperturaProceso(Integer.parseInt(request.getParameter("idAperturaProceso")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					System.out.println("data: " + data);
					break;
					
				case "GetNumProcesoCompra":
					data = Gral_aperturaProcesoDao.procesoCompraCompraByBeneficiario(Integer.parseInt(request.getParameter("idBeneficiario")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "GetProveedor":
					data = Gral_contratoOrdenCompraDao.getProveedorXidcontratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					System.out.println(data + " /Proveedor");
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
