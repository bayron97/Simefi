package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.model.listaRequerimientoSolicitudCompraALP;
import main.dao.listaRequerimientoSolicitudCompraALPDao;
import main.model.ofertaALP;
import main.dao.ofertaALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPManageReqOffersForSCAPI")
public class ALPManageReqOffersForSCAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageReqOffersForSCAPI() {
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
		String cc =  request.getParameter("purchaseProc");
		System.out.println(cc + " Proceso");
		
		if (codPadre == null) {
			codPadre = Long.parseLong("0");
		}

		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;
			
			String proc = (String) session.getAttribute("purchaseCOD");

			switch (mode) {
				case "new":
					
					int aprovOfferProductID = Integer.parseInt(request.getParameter("offerNoID"));

					listaRequerimientoSolicitudCompraALP r = new listaRequerimientoSolicitudCompraALP();
					ofertaALP o = ofertaALPDao.getOneAprovBasic(proc, aprovOfferProductID);

					String legalNumber = request.getParameter("legalNumber");
					String reqCant = request.getParameter("reqCant");
					String tiempoEntReq = request.getParameter("tiempoEntReq");
					String vidaUtilReq = request.getParameter("vidaUtilReq");
					String benfObs = request.getParameter("benfObs");

					r.setIdSolicitudCompra(codPadre);
					r.setNoItem(listaRequerimientoSolicitudCompraALPDao.getReqLastNoItemByBuyRequestId(codPadre) + 1);
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

					status = listaRequerimientoSolicitudCompraALPDao.save(r);

					if (status != 0) {
						data = "successful";
					} else {
						data = "DBError";
					}
					break;
				case "edit":
					data = "Error";
					break;
				case "delete":
					int productIDForDelete = Integer.parseInt(request.getParameter("deleteReqID"));
					status = listaRequerimientoSolicitudCompraALPDao.delete(codPadre, productIDForDelete);
					if (status != 0) {
						data = "successful";
					} else {
						data = "DBError";
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
			data = listaRequerimientoSolicitudCompraALPDao.getReqListByBuyRequestIdJSON(codPadre);
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
