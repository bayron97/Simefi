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
import main.dao.Gral_contratacionDao;
import main.dao.Gral_contratoOrdenCompraDao;
import main.dao.Gral_listaRequerimientoDao;
import main.dao.Gral_oficioBeneficiarioDao;
import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.distribuidorDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.ordenCompraGeneralDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.Gral_contratacionDetalle;
import main.model.Gral_contratacionVaciado;
import main.model.Gral_listaRequerimiento;
import main.model.Gral_resultadoAnalisCalidad;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/Gral_controlPagosAPI")
public class Gral_controlPagosAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_controlPagosAPI() {
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
				
				
					
				case "GetBanco":
					data = distribuidorDao.GetCuentaBanco(Integer.parseInt(request.getParameter("idProveedor")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;	
					
					
				case "GetItem":
					data = Gral_contratacionDao.GetItemXidcontratacionDetalle(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;	
				
				case "getFacturas":
					data = Gral_contratacionDao.GetFacturasXContratacion(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;	
					
				case "updatePago":	
					int Guardado = 0;
					try {
						Gral_contratacionDetalle contratacionPago = new Gral_contratacionDetalle();
						
						contratacionPago.setIdcontratacionDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));
						contratacionPago.setFactorCambio(Float.parseFloat(request.getParameter("factorCambio")));
						contratacionPago.setFechafactorCambio(request.getParameter("fechafactorCambio"));
						contratacionPago.setCheque(request.getParameter("cheque"));
						contratacionPago.setBanco(request.getParameter("banco"));
						contratacionPago.setNumCuenta(request.getParameter("numCuenta"));
						Guardado = Gral_contratacionDao.updatePago(contratacionPago);
						
					} catch (Exception e) {
						// TODO: handle exception
						Guardado = 0;
					}
					
					

					if (Guardado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "GetResumenPago":	
					data = Gral_contratacionDao.GetResumenPago(Integer.parseInt(request.getParameter("idContratacion")), request.getParameter("numFactura"));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "GetControlPago":	
					data = Gral_contratacionDao.GetControlPago(Integer.parseInt(request.getParameter("idContratacion")), request.getParameter("numFactura"));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
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
