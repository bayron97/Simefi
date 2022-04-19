package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ofertaALPServlet
 */
@WebServlet("/ofertaALPServlet")
public class ofertaALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ofertaALPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(true);

		String submit = request.getParameter("submit");

		
		if (submit != null && !submit.isEmpty()) {
			int status = 0;
			switch (submit) {
				case "offersControl":
					int counter = 0;
					String noProcesoCompra = (String)session.getAttribute("proc");
					String[] productIds = request.getParameterValues("productId");
					String[] offerNumbers = request.getParameterValues("recOffer");
					
					int cantidadProveedores = 0;
					int cantidadProDeciertos = 0;
					
					if (productIds != null && offerNumbers != null && noProcesoCompra != null) {
						
						int cantMedicamentosCompletados = vaciadoOfertasALPDao.getCompletadosByALPNumber(noProcesoCompra);
						
						String autorizedProv = (String)request.getParameter("prov");
						String noOfertador = (String)request.getParameter("noOfertador");
						
						vaciadoOfertasALP updateEmptying = new vaciadoOfertasALP();
						updateEmptying.setProcesoCompra(noProcesoCompra);
						updateEmptying.setProveedorAutorizado(autorizedProv);
						status = vaciadoOfertasALPDao.updateAutorizedProvider(updateEmptying);
						
						System.out.println("offerNumbers.length " + offerNumbers.length);
						
						if (status != 0) {
							for (int i = 0; i < offerNumbers.length; i++) {
								
								int noOfertaRe = 0;
								
								if(!offerNumbers[i].isEmpty()) {
									
									noOfertaRe = Integer.parseInt(offerNumbers[i]);
								}
								
								//valores para  tabla acta conteo por proveedor
								actaAperturaALP acta = new actaAperturaALP();								
								acta.setidListRequirement(Integer.parseInt(productIds[i]));
								acta.setdenominacion(autorizedProv);
								acta.setofertasRecividas(noOfertaRe);
								acta.setnoOfertador(Integer.parseInt(noOfertador));
								
								acta.setestado(true);								
								if(noOfertaRe == 0) {
									acta.setestado(false);
								}						
								acta.setprocesoCompra(noProcesoCompra);	
								
								int validador = actaAperturaALPDao.validarExistencia(acta);
								
								if(validador > 0) {			
									status = actaAperturaALPDao.update(acta);									
								}else {
									status = actaAperturaALPDao.save(acta);
								}
								
								int cantidadProductoOfertado = actaAperturaALPDao.cantidadOfertada(acta);								
								status = listaRequerimientoConsolidadaALPDao.updateNoOfferReceived(noProcesoCompra, productIds[i], String.valueOf(cantidadProductoOfertado));
								//status = listaRequerimientoConsolidadaALPDao.updateNoOfferReceived(noProcesoCompra, productIds[i], offerNumbers[i]);
								 cantidadProveedores = actaAperturaALPDao.cantidadProveedores(acta);
								 cantidadProDeciertos = actaAperturaALPDao.cantidadProductosByProceso(noProcesoCompra);
								
								if (status != 0 && noOfertaRe > 0) {
									counter++;
									int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqID(Long.parseLong(productIds[i]), noProcesoCompra);
									if (nuevoNumeroOfertasIngresadasPorMedicamento >= noOfertaRe) {
										vaciadoOfertasALPDao.updateCompletadosPlus(noProcesoCompra);
									} else if (cantMedicamentosCompletados > 0) {
										vaciadoOfertasALPDao.updateCompletadosMinus(noProcesoCompra);
									}
								}
							}
							
							counter = actaAperturaALPDao.productosConOfertas(noProcesoCompra);
							
							vaciadoOfertasALPDao.updateOfferControlByALPNumber(noProcesoCompra, counter, cantidadProveedores);
							
							int desiertos = actaAperturaALPDao.productosSinOfertas(noProcesoCompra);
							
							vaciadoOfertasALPDao.updateDesertedOfferByALPNumber(noProcesoCompra, desiertos);
							
						}
					}
					break;
				default:
					break;
			}
			
			session.removeAttribute("funcion");
			session.removeAttribute("proc");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
		} else {
			
			session.removeAttribute("funcion");
			session.removeAttribute("proc");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
		}
		
		//-----------------------------------------------------------
		
//		if (submit != null && !submit.isEmpty()) {
//			int status = 0;
//			switch (submit) {
//				case "offersControl":
//					int counter = 0;
//					String noProcesoCompra = request.getParameter("buyProcessNumberForModal");
//					String provCant = request.getParameter("provCant");
//					System.out.println(provCant + " provCant");
//					String[] productIds = request.getParameterValues("productId");
//					String[] offerNumbers = request.getParameterValues("recOffer");
//					if (productIds != null && offerNumbers != null && noProcesoCompra != null) {
//						int cantMedicamentosCompletados = vaciadoOfertasALPDao
//								.getCompletadosByALPNumber(noProcesoCompra);
//						for (int i = 0; i < offerNumbers.length; i++) {
//							status = listaRequerimientoConsolidadaALPDao.updateNoOfferReceived(noProcesoCompra,
//									productIds[i], offerNumbers[i]);
//							if (status != 0 && Integer.parseInt(offerNumbers[i]) > 0) {
//								counter++;
//								int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao
//										.getCantMedsByProcAndReqID(Long.parseLong(productIds[i]), noProcesoCompra);
//								if (nuevoNumeroOfertasIngresadasPorMedicamento >= Integer.parseInt(offerNumbers[i])) {
//									vaciadoOfertasALPDao.updateCompletadosPlus(noProcesoCompra);
//								} else if (cantMedicamentosCompletados > 0) {
//									vaciadoOfertasALPDao.updateCompletadosMinus(noProcesoCompra);
//								}
//							}
//						}
//						vaciadoOfertasALPDao.updateOfferControlByALPNumber(noProcesoCompra, counter,Integer.parseInt(provCant) );
//					}
//					break;
//				default:
//					break;
//			}
//			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
//		} else {
//			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
//		}
		
		
		
		//--------------------------------------------------------
		
		
		//		String submit = request.getParameter("submit");
//
//		if (submit != null && !submit.isEmpty()) {
//			int status = 0;
//			switch (submit) {
//				case "offersControl":
//					int counter = 0;
//					String noProcesoCompra = (String)session.getAttribute("proc");
//					String[] productIds = request.getParameterValues("productId");
//					String[] offerNumbers = request.getParameterValues("recOffer");
//					if (productIds != null && offerNumbers != null && noProcesoCompra != null) {
//						
//						int cantMedicamentosCompletados = vaciadoOfertasALPDao.getCompletadosByALPNumber(noProcesoCompra);
//						
//						String autorizedProv = (String)request.getParameter("prov");
//						vaciadoOfertasALP updateEmptying = new vaciadoOfertasALP();
//						updateEmptying.setProcesoCompra(noProcesoCompra);
//						updateEmptying.setProveedorAutorizado(autorizedProv);
//						status = vaciadoOfertasALPDao.updateAutorizedProvider(updateEmptying);
//						
//						if (status != 0) {
//							for (int i = 0; i < offerNumbers.length; i++) {
//								status = listaRequerimientoConsolidadaALPDao.updateNoOfferReceived(noProcesoCompra, productIds[i], offerNumbers[i]);
//								if (status != 0 && Integer.parseInt(offerNumbers[i]) > 0) {
//									counter++;
//									int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqID(Long.parseLong(productIds[i]), noProcesoCompra);
//									if (nuevoNumeroOfertasIngresadasPorMedicamento >= Integer.parseInt(offerNumbers[i])) {
//										vaciadoOfertasALPDao.updateCompletadosPlus(noProcesoCompra);
//									} else if (cantMedicamentosCompletados > 0) {
//										vaciadoOfertasALPDao.updateCompletadosMinus(noProcesoCompra);
//									}
//								}
//							}
//							vaciadoOfertasALPDao.updateOfferControlByALPNumber(noProcesoCompra, counter);
//						}
//					}
//					break;
//				default:
//					break;
//			}
//			
//			session.removeAttribute("funcion");
//			session.removeAttribute("proc");
//			
//			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
//		} else {
//			
//			session.removeAttribute("funcion");
//			session.removeAttribute("proc");
//			
//			request.getRequestDispatcher("vaciadoOfertaALP.jsp").forward(request, response);
//		}

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
