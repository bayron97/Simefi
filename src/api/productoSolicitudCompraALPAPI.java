package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.listaRequerimientoSolicitudCompraALP;
import main.dao.listaRequerimientoSolicitudCompraALPDao;
import main.model.ofertaALP;
import main.model.productoSolicitudCompraALP;
import main.dao.ofertaALPDao;
import main.dao.productoSolicitudCompraALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/productoSolicitudCompraALPAPI")
public class productoSolicitudCompraALPAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public productoSolicitudCompraALPAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String mode = request.getParameter("mode");
		Long codPadre = (Long) session.getAttribute("codPadreSolCompra");
		if (codPadre == null) {
			codPadre = Long.parseLong("0");
		}

		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;
			
			switch (mode) {
				case "new":		
					
					productoSolicitudCompraALP psc = new productoSolicitudCompraALP();					
					psc.setidSolicitudCompra(codPadre);
					psc.setnOficio(request.getParameter("legalNumber"));
					psc.setnombreProductoSegunCatalogo(request.getParameter("nombreProducto"));
					psc.setUnidadPresentacion(request.getParameter("up"));
					psc.setitem(Integer.parseInt(request.getParameter("item")) );
					psc.setcodigoSesal(request.getParameter("codSesal"));
					psc.setcodigoATC(request.getParameter("codAtc"));
					psc.setcantidadRequerida(Integer.parseInt(request.getParameter("reqCant").replaceAll(",","")));
					psc.settiempoEntregaRequerido(request.getParameter("tiempoEntReq"));
					psc.setvidaUtilRequerida(request.getParameter("vidaUtilReq"));
					psc.setobservacionBeneficiario(request.getParameter("benfObs"));
					psc.setdescripcionTecnicaAcordada(request.getParameter("descripcionTecnica"));
					status = productoSolicitudCompraALPDao.save(psc);
					
					//----------------------------------
					
					listaRequerimientoSolicitudCompraALP r = new listaRequerimientoSolicitudCompraALP();
										
					ArrayList<ofertaALP> ofertas = ofertaALPDao.getOfertabyProCompraParaSolicitud(request.getParameter("purchaseProc"),request.getParameter("nombreProducto"));
							
					for(ofertaALP o : ofertas) {
					System.out.println("Entre");
						String legalNumber = request.getParameter("legalNumber");
						String reqCant = request.getParameter("reqCant").replaceAll(",","");
						String tiempoEntReq = request.getParameter("tiempoEntReq");
						String vidaUtilReq = request.getParameter("vidaUtilReq");
						String benfObs = request.getParameter("benfObs");

						r.setIdSolicitudCompra(codPadre);
						//r.setNoItem(listaRequerimientoSolicitudCompraALPDao.getReqLastNoItemByBuyRequestId(codPadre) + 1);
						r.setNoItem(o.getIdItem());
						r.setNoOficio(legalNumber.toUpperCase());
						r.setCodigoATC(o.getCodATC());
						r.setNombreProducto(o.getMedicamentoOfertado());
						r.setNombreProductoRequerido(o.getMedicamentoEstimado());
						r.setDescripcionTecnica(o.getDescripcionTecnica());
						r.setDescripcionTecnicaRequerida(o.getDescripcionTecnicaRequerida());
						r.setUnidadPresentacion(o.getUp());
						r.setUnidadPresentacionRequerida(o.getUnidadPresentacionRequerida());
						r.setCantidadRequerida(Float.parseFloat(reqCant));
						r.setTiempoEntrega(tiempoEntReq.toUpperCase());
						r.setVidaUtil(vidaUtilReq.toUpperCase());
						r.setProveedor(o.getDistribuidor());
						r.setObservaciones(benfObs.toUpperCase());
						r.setNumCertRegSan(o.getNumSanitario());
						r.setCertBPM(o.getNumCertif());
						r.setOrigenFP(o.getNombreFabricante() + "/" + o.getPaisOrigen());
						r.setPrecioUnitario(o.getPrecio());
						r.setMoneda(o.getMoneda());
						r.setFechaOferta(o.getFechaOferta());
						r.setRecomendacionesBeneficiarios(o.getRecomendacionesBeneficiario());
						r.setRegSanVenc(o.getFechaVencSan());
						r.setCertBPMVenc(o.getFechaVencManufactura());
						r.setprelacionRALP(o.getprelacionRALP());
						r.setrecomendacionComite(o.getRecomendacionComite());
						r.setnoOferta(Integer.parseInt(o.getnoOferta()));
						r.setcodigoSesal(o.getcodSesal());
						r.setfechaEmisionRegSan(o.getFechaEmisionSan());
						r.setfechaVencimientoRegSan(o.getFechaVencSan());
						r.setfechaEmisionBPM(o.getFechaEmisionManufactura());
						r.setfechaVencimientoBPM(o.getFechaVencManufactura());
					
						status = listaRequerimientoSolicitudCompraALPDao.save(r);
						
					}

					if (status != 0) {
						data = "successful";
					} else {
						data = "DBError";
					}
					break;
				case "edit":
					
					 psc = new productoSolicitudCompraALP();					
					psc.setidSolicitudCompra(codPadre);
					psc.setnOficio(request.getParameter("legalNumber"));
					psc.setnombreProductoSegunCatalogo(request.getParameter("nombreProducto"));
					psc.setUnidadPresentacion(request.getParameter("up"));
					psc.setcodigoATC(request.getParameter("codAtc"));
					psc.setcantidadRequerida(Integer.parseInt(request.getParameter("reqCant").replaceAll(",","")));
					psc.settiempoEntregaRequerido(request.getParameter("tiempoEntReq"));
					psc.setvidaUtilRequerida(request.getParameter("vidaUtilReq"));
					psc.setobservacionBeneficiario(request.getParameter("benfObs"));	
					psc.setid(Integer.parseInt(request.getParameter("idEditar")));
					status = productoSolicitudCompraALPDao.update(psc);
					
					System.out.println("status: "+status);
					if (status != 0) {
						data = "successful";
					} else {
						data = "DBError";
					}
					break;
				case "delete":
					int productIDForDelete = Integer.parseInt(request.getParameter("deleteReqID"));
					status = 0; //listaRequerimientoSolicitudCompraALPDao.delete(codPadre, productIDForDelete);
					if (status != 0) {
						data = "successful";
					} else {
						data = "DBError";
					}
					break;
					
				case "verificarRequerimiento":
					System.out.println("codPadre "+ codPadre);
					System.out.println("nombreProducto "+ request.getParameter("nombreProducto"));
					
					status = productoSolicitudCompraALPDao.verificarRequerimiento(codPadre, request.getParameter("nombreProducto"));
					
					if (status != 0) {
						data = "existe";
					} else {
						data = "noExiste";
					}
					break;
				default:
					data = "Error";
					break;
			}
			response.setContentType("text/plain");
			System.out.println("Request status: " + data);
		} else {
			response.setContentType("application/json");
			data = productoSolicitudCompraALPDao.getListProductoSolicitubCompraJSON(codPadre);
			System.out.println("Get all Req Med data");
		}

		PrintWriter out = response.getWriter();
		out.print(data.toString());
		out.flush();
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
