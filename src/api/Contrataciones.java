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
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/Contrataciones")
public class Contrataciones extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Contrataciones() {
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
				case "ConsultarCantidadPlazos":
					benfList = contratacionesDao.getItembyIdCantPlazos(Integer.parseInt(id),Long.parseLong( request.getParameter("idContratacion")));
					request.setAttribute("benfList", benfList);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();

					break;
				case "ConsultarTabla":
					
					String itemss = "";
					
					itemss = contratacionesDao.getTableItems(Long.parseLong(id));

					request.setAttribute("itemss", itemss);
					
					response.setContentType("application/json");
					out.print(itemss.toString());
					out.flush();
					
					//out.close();

					break;
				case "ConsultarBen":
					benfList = contratacionesDao.getBeneficiarios(noProcesoCompra);

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
					
					benfList = contratacionesDao.getItemsbySolicitudCompra(solicitudCompra,request.getParameter("proveedor"));

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
				case "NewAndUpdateItem":
					String data = "";
					int Resultado = 0;
					contratacionesDetalle b = new contratacionesDetalle();
					listaRequerimientoSolicitudDisponibilidadALP c = new listaRequerimientoSolicitudDisponibilidadALP();
					System.out.println(request.getParameter("-TEST CABO-"));
					System.out.println(request.getParameter("-------------"));
					System.out.println(request.getParameter("tiemposEntrega"));
					System.out.println(request.getParameter("cantidadComprada"));
					System.out.println(request.getParameter("canEntregarPlazo"));
					System.out.println(request.getParameter("fechaLimiteEntrega"));
					System.out.println(request.getParameter("IdDetalle"));
					System.out.println(request.getParameter("-------------"));
					
					if(request.getParameter("IdDetalle").contentEquals("-1")) {
						int idListarequerimientoSolicitudDisponibilidad = Integer.parseInt(request.getParameter("idListarequerimientoSolicitudDisponibilidad"));
						b.setId(Integer.parseInt(request.getParameter("Id")));
						b.setNoItem(Integer.parseInt(request.getParameter("noItem")));
						b.setNombreProducto(request.getParameter("nombreProducto"));
						b.setTiempoEntrega(request.getParameter("tiemposEntrega"));
						b.setCantidadComprado(Float.parseFloat(request.getParameter("cantidadComprada")));
						b.setCantidadEntregaPlazos(Integer.parseInt(request.getParameter("canEntregarPlazo")));
						b.setFechaLimiteEntrega(request.getParameter("fechaLimiteEntrega"));
						
						c=contratacionesDao.getByItem(Integer.parseInt(request.getParameter("idItemMedicamento")));
						b.setCodigoATC(c.getCodigoATC());
						b.setDescripcionTecnica(c.getDescripcionTecnicaOfertada());
						b.setUnidadPresentacion(c.getUnidadPresentacionOfertada());
						b.setFabricante_PaisOrigen(c.getOrigenFP());
						b.setObservaciones(c.getObservaciones());
						b.setPrecioUnitario(c.getPrecioUnitarioAcordado());
						b.setValorTotalCompra(c.getPrecioTotal());
						b.setMoneda(c.getMoneda());
						
						System.out.println("l.getMoneda() " + c.getMoneda());
						
						b.setProveedor(request.getParameter("nombreproveedor"));
						b.setNumeroOdenCompra(request.getParameter("ordencompra"));
						
						Resultado = contratacionesDetalleDao.save(b , idListarequerimientoSolicitudDisponibilidad);
					}
					else {
//						int idListarequerimientoSolicitudDisponibilidad = Integer.parseInt(request.getParameter("idListarequerimientoSolicitudDisponibilidad"));
						b.setTiempoEntrega(request.getParameter("tiemposEntrega"));
						b.setCantidadComprado(Float.parseFloat(request.getParameter("cantidadComprada")));
						b.setCantidadEntregaPlazos(Integer.parseInt(request.getParameter("canEntregarPlazo")));
						b.setFechaLimiteEntrega(request.getParameter("fechaLimiteEntrega"));
						int IdDetalle = Integer.parseInt(request.getParameter("IdDetalle"));
						
						
						Resultado = contratacionesDetalleDao.update(b, IdDetalle);
						
					}
					
					
					if (Resultado != 0) {
						data = "successful";
					} else {
						data = "DBError";
					}
					
					
					response.setContentType("text/plain");
					System.out.println("Request status: " + data);		
					
					out.print(data.toString());
					out.flush();
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
