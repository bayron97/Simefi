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
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/Gral_contratacionAPI")
public class Gral_contratacionAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratacionAPI() {
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
					
				case "GetProveedores":						
					data = Gral_contratoOrdenCompraDao.proveedotOrdenContratoByIdsAperturaProceso(Integer.parseInt(request.getParameter("idAperturaProceso")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "GetcontratoOrdenCompra":						
					data = Gral_contratoOrdenCompraDao.contratoOrdenCompraByProveedor(Integer.parseInt(request.getParameter("idProveedor")),Integer.parseInt(request.getParameter("idAperturaProceso")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "saveVaciado":		
					System.out.println("save vaciado");
					Gral_contratacionVaciado vaciado = new Gral_contratacionVaciado();
					vaciado.setIdContratacion(Integer.parseInt(request.getParameter("idContratacion")));
					vaciado.setNumItem(Integer.parseInt(request.getParameter("numItem")));
					vaciado.setNombreMedicamento(request.getParameter("nombreMedicamento"));
					vaciado.setCodigoATC(request.getParameter("codigoATC"));
					vaciado.setCodigoSesal(request.getParameter("codigoSesal"));
					vaciado.setDescripcionTecnica(request.getParameter("descripcionTecnica"));
					vaciado.setUnidadPresentacion(request.getParameter("unidadPresentacion"));
					vaciado.setNombreFabricante(request.getParameter("nombreFabricante"));
					vaciado.setPaisOrigen(request.getParameter("paisOrigen"));
					vaciado.setMarca(request.getParameter("marca"));
					vaciado.setModelo(request.getParameter("modelo"));
					vaciado.setCantidadComprada(Integer.parseInt(request.getParameter("cantidadComprada").replaceAll(",", "")));
					vaciado.setPrecioUnitario(request.getParameter("precioUnitario"));
					vaciado.setTiemposEntrega(request.getParameter("tiemposEntrega"));
					vaciado.setVidaUtil(request.getParameter("vidaUtil"));
					vaciado.setObservaciones(request.getParameter("observaciones"));
					
					int Guardado = Gral_contratacionDao.saveVaciado(vaciado);

					if (Guardado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "updateVaciado":						
					vaciado = new Gral_contratacionVaciado();
					vaciado.setIdContratacionVaciado(Integer.parseInt(request.getParameter("idContratacionVaciado")));
					vaciado.setIdContratacion(Integer.parseInt(request.getParameter("idContratacion")));
					vaciado.setNumItem(Integer.parseInt(request.getParameter("numItem")));
					vaciado.setNombreMedicamento(request.getParameter("nombreMedicamento"));
					vaciado.setCodigoATC(request.getParameter("codigoATC"));
					vaciado.setCodigoSesal(request.getParameter("codigoSesal"));
					vaciado.setDescripcionTecnica(request.getParameter("descripcionTecnica"));
					vaciado.setUnidadPresentacion(request.getParameter("unidadPresentacion"));
					vaciado.setNombreFabricante(request.getParameter("nombreFabricante"));
					vaciado.setPaisOrigen(request.getParameter("paisOrigen"));
					vaciado.setMarca(request.getParameter("marca"));
					vaciado.setModelo(request.getParameter("modelo"));
					vaciado.setCantidadComprada(Integer.parseInt(request.getParameter("cantidadComprada").replaceAll(",", "")));
					vaciado.setPrecioUnitario(request.getParameter("precioUnitario"));
					vaciado.setTiemposEntrega(request.getParameter("tiemposEntrega"));
					vaciado.setVidaUtil(request.getParameter("vidaUtil"));
					vaciado.setObservaciones(request.getParameter("observaciones"));
					
					int editado = Gral_contratacionDao.updateVaciado(vaciado);

					if (editado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();

					break;
					
				case "anularVaciado":	
					vaciado = new Gral_contratacionVaciado();
					vaciado.setIdContratacionVaciado(Integer.parseInt(request.getParameter("idContratacionVaciado")));
					int anulado = Gral_contratacionDao.anularItem(vaciado);

					if (anulado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "getVaciadoXContratacionJson":			
					System.out.println("si "+ Integer.parseInt(request.getParameter("idContratacion")));
					data = Gral_contratacionDao.getVaciadoXContratacionJson(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "getCantidades":					
					data = Gral_contratacionDao.getCantidades(Integer.parseInt(request.getParameter("idContratacionVaciado")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();

					break;	
					
				case "saveDetalle":		
					System.out.println("save detalle");
					Gral_contratacionDetalle detalle  = new Gral_contratacionDetalle();
					detalle.setIdContratacionVaciado(Integer.parseInt(request.getParameter("idContratacionVaciado")));
					detalle.setCantidadEntregarSegunPlazos(Integer.parseInt(request.getParameter("cantidadEntregarSegunPlazos")));
					detalle.setFechaLimiteEntrega(request.getParameter("fechaLimiteEntrega"));
					detalle.setNumeroEntrega(request.getParameter("numeroEntrega"));
					
					
					Guardado = Gral_contratacionDao.saveDetalle(detalle);
					System.out.println("Guardado " + Guardado);
					if (Guardado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "updateDetalle":		
					System.out.println("save detalle");
					detalle  = new Gral_contratacionDetalle();
					detalle.setIdcontratacionDetalle(Integer.parseInt(request.getParameter("idcontratacionDetalle")));
					detalle.setCantidadEntregarSegunPlazos(Integer.parseInt(request.getParameter("cantidadEntregarSegunPlazos")));
					detalle.setFechaLimiteEntrega(request.getParameter("fechaLimiteEntrega"));
					detalle.setNumeroEntrega(request.getParameter("numeroEntrega"));
					
					
					Guardado = Gral_contratacionDao.updateDetalle(detalle);
					System.out.println("Guardado " + Guardado);
					if (Guardado > 0) {
						data = "successful";
					} else {
						data = "DBError";
					}

					response.setContentType("text/plain");
					out.print(data.toString());
					out.flush();
					break;
					
				case "getDetalleContratacionJson":			
					System.out.println("si "+ Integer.parseInt(request.getParameter("idContratacion")));
					data = Gral_contratacionDao.getDetalleContratacionJson(Integer.parseInt(request.getParameter("idContratacion")));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();
					break;
					
				case "validarProductoXProveedor":					
					data = Gral_contratacionDao.validarProductoXProveedor(Integer.parseInt(request.getParameter("idContratacion")), request.getParameter("nombreMedicamento"), request.getParameter("nombreFabricante"));
					response.setContentType("text/plain");
					out.print(data);
					out.flush();
					out.close();

					break;	
					
				case "validarProductoXProveedorUpdate":					
					data = Gral_contratacionDao.validarProductoXProveedorUpdate(Integer.parseInt(request.getParameter("idContratacion")), request.getParameter("nombreMedicamento"), request.getParameter("nombreFabricante"));
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
