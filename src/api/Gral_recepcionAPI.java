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
@WebServlet("/Gral_recepcionAPI")
public class Gral_recepcionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_recepcionAPI() {
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
				
				case "GetnumDocumentos":
					data = Gral_contratoOrdenCompraDao.getnumDocumentoXproveedor(Integer.parseInt(request.getParameter("idProveedor")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "GetDatosProceso":
					data = Gral_contratacionDao.GetDatosApertura(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;	
					
				case "UpdateDetalleRecepcion":	
					int Guardado = 0;
					try {
						Gral_contratacionDetalle recepcion = new Gral_contratacionDetalle();
						
						recepcion.setIdcontratacionDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));
						recepcion.setFechaSolicitudCita(request.getParameter("fechaSolicitudCita"));
						recepcion.setFechaRecepcion(request.getParameter("fechaRecepcion"));
						recepcion.setLugarRecepcion(request.getParameter("lugarRecepcion"));
						recepcion.setNumFactura(request.getParameter("numFactura"));
						recepcion.setCantidadEntregada(Integer.parseInt(request.getParameter("cantidadEntregada")));
						recepcion.setCantidadEntregarSegunPlazos(Integer.parseInt(request.getParameter("cantidadEntregarSegunPlazos")));						
						recepcion.setDiasAtrasoEntrega(Integer.parseInt(request.getParameter("diasAtrasoEntrega")));
						recepcion.setDiasExoneradosMulta(Integer.parseInt(request.getParameter("diasExoneradosMulta")));
						recepcion.setTiempoEntrega(Integer.parseInt(request.getParameter("tiempoEntrega")));
						recepcion.setVidaUtilAceptar(request.getParameter("vidaUtilAceptar"));
						recepcion.setNumActaRecepcion(request.getParameter("numActaRecepcion"));
						recepcion.setNumCagarantiaCumplimientoCalidad(request.getParameter("numCagarantiaCumplimientoCalidad"));
						recepcion.setEntregada(true);						
						Guardado = Gral_contratacionDao.updateDetalleRecepcion(recepcion);
						
						if(Guardado > 0 && recepcion.getCantidadEntregada() < recepcion.getCantidadEntregarSegunPlazos()) {							
							recepcion.setCantidadEntregarSegunPlazos(recepcion.getCantidadEntregarSegunPlazos()-recepcion.getCantidadEntregada());
							recepcion.setIdContratacionVaciado(Integer.parseInt(request.getParameter("idContratacionVaciado")));
							recepcion.setNumeroEntrega(request.getParameter("numeroEntrega"));
							recepcion.setFechaLimiteEntrega(request.getParameter("fechaLimiteEntrega"));
							
							Guardado = Gral_contratacionDao.saveDetalle(recepcion);
						}
						 
						 
						
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
					
			
				
				case "getDetalleRecepcion":
					data = Gral_contratacionDao.GetContratacionDetalleRecepcion(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "getDetalleRecepcionCanceladas":
					data = Gral_contratacionDao.GetContratacionDetalleRecepcionCanceladas(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "saveresultadosCalidad":						
					try {
						Gral_resultadoAnalisCalidad resultadoAnalisCalidad = new Gral_resultadoAnalisCalidad();
						
						resultadoAnalisCalidad.setIdcontratacionDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));
						resultadoAnalisCalidad.setnumInformeResultadoAnalisis(request.getParameter("numInformeResultadoAnalisis"));
						resultadoAnalisCalidad.setResultadoAnalisisCalidad(request.getParameter("resultadoAnalisisCalidad"));
						resultadoAnalisCalidad.setNumLoteFabricanteAnalizado(request.getParameter("numLoteFabricanteAnalizado"));
						resultadoAnalisCalidad.setObservaciones(request.getParameter("observaciones"));
						 
						Guardado =  Gral_contratacionDao.saveresultadosCalidad(resultadoAnalisCalidad);
						
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
					
				case "getResultadosCalidad":
					data = Gral_contratacionDao.GetResultadoCalidadXDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					//out.close();
					break;
					
				case "CancelarItem":	
					int cancelado = 0;
					try {
						Gral_contratacionDetalle recepcion = new Gral_contratacionDetalle();
						
						recepcion.setIdcontratacionDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));						
						recepcion.setCantidadCancelada(Integer.parseInt(request.getParameter("cantidadCancelada")));
						recepcion.setCancelada(true);				
						recepcion.setMotivoCancelacion(request.getParameter("motivoCancelacion"));
						Guardado = Gral_contratacionDao.cancelarDetalleRecepcion(recepcion);						
					 
						
					} catch (Exception e) {
						// TODO: handle exception
						cancelado = 0;
					}
					
					if (cancelado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "getPagosJson":	
					System.out.println(request.getParameter("idContratacion")+" "+ request.getParameter("numFactura"));
					data = Gral_contratacionDao.GetPagosXFactura(Integer.parseInt(request.getParameter("idContratacion")), request.getParameter("numFactura"));
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
