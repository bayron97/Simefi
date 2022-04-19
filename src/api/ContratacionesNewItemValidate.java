package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ContratacionesNewItemValidate")
public class ContratacionesNewItemValidate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContratacionesNewItemValidate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		String[] Item = request.getParameterValues("json[]");			
		System.out.println(Item);
		
		HttpSession session = request.getSession(true);
		//String func = (String) session.getAttribute("funcion");
		
		String Id = request.getParameter("Id");
		String IdNew = "";
		
		String IdDetalle = Item[0];
		String NoItem = Item[1];
		String CodigoATC = Item[2];
		String NombreProducto = Item[3];
		String Descripcion = Item[4];
		String UnidadPrecentacion = Item[5];
		String Proveedor = Item[6];
		String LaboratorioFabricante = Item[7];
		String Obsercaiones = Item[8];
		String TiempoEntregaDiasCalendario = Item[9];
		String CantidadCampradoUnidades = Item[10];
		String PrecioUnitario = Item[11];
		String ValorTotalComprado = Item[12];
		String NumeroOrdenCompra = Item[13];
		String FechaSuscripcion = Item[14];
		String CantidadEntregadaPlazos = Item[15];
		String FechaLimiteEntrega = Item[16];
		String Moneda = Item[17];
		String FechaSolicitudCita = Item[18];			
		String FechaRecepcion = Item[19];
		String LugarRecepcion = Item[20];	
		String NoFactura = Item[21];
		String CantidadEntregadaUnidades = Item[22].replaceAll(",", "");		
		String TotalEntregado = Item[23];
		String DiasAtrasoEntrega = Item[24];		
		String MultaEntregaTardia = Item[25];
		String ValorNetoPagar = Item[26].replaceAll(",", "");
		String VidaUtil = Item[27];
		String InfoResultadoAnalisisCalidad = Item[28];
		String NoInfoResultadoAnalisisCalidad = Item[29];
		String NoLoteFravircaionAnalizado = Item[30];
		String NoGarantiaCalidad = Item[31];
		String NoActaRecepcion = Item[32];
		String EstatusPago = Item[33];	
		String AprobacionComite = Item[34];	
		String EstadoEntrega = Item[35];
		
		
		contratacionesDetalle b = new contratacionesDetalle();
		
			if (NoItem != null) {			
				
					if(Integer.parseInt(CantidadEntregadaUnidades)  > 0) {						
						
						b.setFechaSolicitudCita(FechaSolicitudCita);
						b.setFechaRecepcion(FechaRecepcion);
						b.setLugarRecepcion(LugarRecepcion);
						b.setNoFactura(NoFactura);
						b.setCantidadEntrega(Integer.parseInt(CantidadEntregadaUnidades));
						b.setTotalEntrega(TotalEntregado);
						b.setDiasAtraso(Float.parseFloat(DiasAtrasoEntrega));
						b.setMulta(Float.parseFloat(MultaEntregaTardia));
						b.setValorNetoPagar(Float.parseFloat(ValorNetoPagar));
						b.setVidaUtil(VidaUtil);
						b.setNoInformeResultadoAnalisis(NoInfoResultadoAnalisisCalidad);
						b.setInformeResultadoAnalisis(InfoResultadoAnalisisCalidad);
						b.setNoLoteFabricacion(NoLoteFravircaionAnalizado);
						b.setNoGarantia(NoGarantiaCalidad);
						b.setNoActaRecepcion(NoActaRecepcion);
						b.setStatusPago(EstatusPago);
						b.setAprobacionComite(AprobacionComite);
						b.setEstadoEntrega(true);
						b.setIdDetalle(Long.parseLong(IdDetalle));						
						contratacionesDetalleDao.updateRecepcion(b);				
										
						
						if(Integer.parseInt(CantidadEntregadaUnidades) != Integer.parseInt(CantidadEntregadaPlazos)) {
							System.out.println("Nuevo creado");	
							
							b.setCantidadEntregaPlazos(Integer.parseInt(CantidadEntregadaPlazos)-Integer.parseInt(CantidadEntregadaUnidades));
							b.setCantidadEntrega(0);
							b.setId(Long.parseLong(Id));
							b.setNoItem(Integer.parseInt(NoItem));
							b.setFechaSolicitudCita("-");
							b.setFechaRecepcion("-");
							b.setLugarRecepcion("-");
							b.setNoFactura("-");
							b.setTotalEntrega(TotalEntregado);
							b.setDiasAtraso(Float.parseFloat("0"));
							b.setMulta(Float.parseFloat("0"));
							b.setValorNetoPagar(Float.parseFloat("0"));
							b.setVidaUtil(VidaUtil);
							b.setNoGarantia(NoGarantiaCalidad);
							b.setInformeResultadoAnalisis(InfoResultadoAnalisisCalidad);
							b.setNoActaRecepcion(NoActaRecepcion);
							b.setNoLoteFabricacion(NoLoteFravircaionAnalizado);
							b.setNombreProducto(NombreProducto);
							b.setTiempoEntrega(TiempoEntregaDiasCalendario);
							b.setFechaLimiteEntrega(FechaLimiteEntrega);						
							b.setCodigoATC(CodigoATC);
							b.setProveedor(Proveedor);
							b.setUnidadPresentacion(UnidadPrecentacion);
							b.setFabricante_PaisOrigen(LaboratorioFabricante);
							b.setNumeroOdenCompra(NumeroOrdenCompra);
							b.setFechaSuscripcion(FechaSuscripcion);
							b.setEstadoEntrega(false);
							var ccs = contratacionesDetalleDao.saveall(b);	
							
							String j = "";					
							

								j += ccs  ;
							
							j = j.substring(0, j.length());
							j += "";
							
							
							System.out.println(ccs + " pruebA");
							
							IdNew = j;
							
							}									
					}									
			}
			else {
				//a.setNoReferencia(noReferencia);
				//a.setFechaPago(fechaPago);
				//a.setId(Integer.parseInt(Id));
				//contratacionesDao.update(a);				
			}
		response.setContentType("text/plain");
		response.getWriter().write(IdNew);
		System.out.print(IdNew);
		//request.setAttribute("throughServlet", "true");
		//request.getRequestDispatcher("recepcionProductos.jsp").forward(request, response);
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
