package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.CriterioEvaluacionAndOpcionesALPDao;
import main.dao.CriterioEvaluacionAndOpcionesProCompraALPDao;
import main.dao.listaRequerimientoALPDao;
import main.dao.listaRequerimientoConsolidadaALPDao;
import main.model.CriterioEvaluacionDTO;
import main.model.listaRequerimientoALP;
import main.model.ofertaALP;
import main.dao.ofertaALPDao;
import main.dao.vaciadoOfertasALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPManageOffersAPI")
public class ALPManageOffersAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageOffersAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String mode = request.getParameter("mode");
		String proc = request.getParameter("purchaseProc");
		String itemID = request.getParameter("itemID");
		
		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;
			String reqID = request.getParameter("reqID");
			int noOfertasRecibidasPorReqConsolidado = listaRequerimientoConsolidadaALPDao.getNoOfferReceivedForOne(proc, reqID);

			switch (mode) {
				case "new":

					int noOfertasIngresadas = ofertaALPDao.getCantMedsByProcAndReqID(Long.parseLong(reqID), proc);

					if (noOfertasIngresadas < noOfertasRecibidasPorReqConsolidado) {
						listaRequerimientoALP reqMed = listaRequerimientoALPDao.getOneConsolidatedReqForALP(Long.parseLong(reqID), proc);
												
						String noOfertaIngresada = request.getParameter("noOfertaIngresada");
						String date = request.getParameter("date");
						String distribuidor = request.getParameter("distributor");
						String currency = request.getParameter("currency");
						String up = request.getParameter("presentationUnit");
						String precio = request.getParameter("price");
						String medicamentoOfertado = request.getParameter("offeredMed");
						String descripcionTecnica = request.getParameter("technicDescriptionOffered");
						String fabricante = request.getParameter("nombreFabricante");
						String paisOrigen = request.getParameter("paisOrigen");
						String registroSanitario = request.getParameter("tipo1");
						String fechaVencSan = request.getParameter("dateVencimiento1");
						String fechaEmisionSan = request.getParameter("dateEmision1");
						String certificadoManufactura = request.getParameter("tipo2");
						String fechaVencManufactura = request.getParameter("dateVencimiento2");
						String fechaEmisionManufactura = request.getParameter("dateEmision2");
						String cantestimadaofer = request.getParameter("cantestimadaofer").replaceAll(",","");

						String etiquetadoPrimario = request.getParameter("primario");
						String razonEtiquetadoPrimario = request.getParameter("razonPrimario");
						if (etiquetadoPrimario.equalsIgnoreCase("CUMPLE")) {
							razonEtiquetadoPrimario = etiquetadoPrimario;
						}

						String etiquetadoSecundario = request.getParameter("secundario");
						String razonEtiquetadoSecundario = request.getParameter("razonSecundario");
						if (etiquetadoSecundario.equalsIgnoreCase("CUMPLE")) {
							razonEtiquetadoSecundario = etiquetadoSecundario;
						}

						String etiquetadoTerciario = request.getParameter("terciario");
						String razonEtiquetadoTerciario = request.getParameter("razonTerciario");
						if (etiquetadoTerciario.equalsIgnoreCase("CUMPLE")) {
							razonEtiquetadoTerciario = etiquetadoTerciario;
						}

						String numSanitario = request.getParameter("numSanitario");
						String numCertif = request.getParameter("numCertif");

						String muestraPresentada = request.getParameter("muestraPresentada");
						String noFoliosOferta = request.getParameter("noFolios").replaceAll(",","");
						String obsOfertasProv = request.getParameter("obsOferProv");
						String consultasArsa = request.getParameter("consultaArsa");
						String consultasBenef = request.getParameter("consultaBenef");
						String obsOfertaCEO = request.getParameter("obsOfertaCEO");
						String solicitudesAclaracionCheck = request.getParameter("solicitudAclaracion");
						String solicitudesAclaracion = "NO HAY SOLICITUD";
						if (solicitudesAclaracionCheck != null) {
							solicitudesAclaracion = "VER SOLICITUD DE ACLARACIÓN / SUBSANACIÓN";
						}

						String respuestaSolicitudesAclaracionCheck = request.getParameter("resSolicitudAclaracion");
						String respuestaSolicitudesAclaracion = "NO HAY RESPUESTA A LA SOLICITUD DE ACLARACION / SUBSANACION";
						if (respuestaSolicitudesAclaracionCheck != null) {
							respuestaSolicitudesAclaracion = "VER RESPUESTA A LA SOLICITUD DE ACLARACIÓN / SUBSANACIÓN";
						}

						//String registroProveedor = request.getParameter("regProveedor");
						//String descTecnicaCriterio = request.getParameter("descTecnicaCumple");
						//String historialContrato = request.getParameter("historialContratos");
						//String cantidadCriterio = request.getParameter("cantidadCumple");
						//String icotermCriterio = request.getParameter("icoterm");
						//String regSanitarioCriterio = request.getParameter("regSanitarioCumple");
						//String garantiaOfertaCriterio = request.getParameter("garantOfertaCumple");
						//String tiempoEntrega = request.getParameter("tiemposEntrega");
						//String vidaUtil = request.getParameter("vidaUtil");
						//String garantiaFabrica = request.getParameter("garantFabr");
						//String cartaCompromisoCriterio = request.getParameter("cartaRespuestos");
						//String aseguramientoCalidad = request.getParameter("aseguramientoCalidad");
						//String razonabilidadPrecios = request.getParameter("razonPrec");
						//String certificadoCriterio = request.getParameter("cppIso");
						//String manCapCriterio = request.getParameter("manCap");
						String estado = request.getParameter("offerState").toUpperCase();
						if (!estado.equalsIgnoreCase("FINALIZADO")) {
							estado = "EN PROCESO";
						}
						ofertaALP o = new ofertaALP();
						o.setnoOfertaIngresada(Integer.parseInt(noOfertaIngresada));
						o.setDistribuidor(distribuidor.toUpperCase());
						o.setIdItem(Integer.parseInt(request.getParameter("reqID")));
						o.setCodATC(reqMed.getCodigoATC());
						o.setcodSesal(reqMed.getcodSesal());
						o.setMedicamentoEstimado(reqMed.getNombreMedicamento().toUpperCase());
						o.setMedicamentoOfertado(medicamentoOfertado.toUpperCase());
						o.setDescripcionTecnicaRequerida(reqMed.getDescripcionTecnica().toUpperCase());
						o.setDescripcionTecnica(descripcionTecnica.toUpperCase());
						o.setUnidadPresentacionRequerida(reqID);
						o.setUnidadPresentacionRequerida(reqMed.getUnidadPresentacion().toUpperCase());	
						o.setUp(up.toUpperCase());
						o.setcanEstimadaOferta(Integer.parseInt(cantestimadaofer));
						o.setcantidadRequerida(reqMed.getCantidadRequerida());
						o.setPrecio(precio);
						o.setNombreFabricante(fabricante.toUpperCase());
						o.setPaisOrigen(paisOrigen);
						o.setRegistroSanitario(registroSanitario.toUpperCase());
						o.setNumSanitario(numSanitario);
						o.setFechaVencSan(fechaVencSan.toUpperCase());
						o.setFechaEmisionSan(fechaEmisionSan.toUpperCase());
						o.setCertificadoManufactura(certificadoManufactura.toUpperCase());
						o.setNumCertif(numCertif);
						o.setFechaVencManufactura(fechaVencManufactura.toUpperCase());
						o.setFechaEmisionManufactura(fechaEmisionManufactura.toUpperCase());
						o.setEtiquetadoPrimario(razonEtiquetadoPrimario.toUpperCase());
						o.setEtiquetadoSecundario(razonEtiquetadoSecundario.toUpperCase());
						o.setEtiquetadoTerciario(razonEtiquetadoTerciario.toUpperCase());
						o.setObsOfertaProv(obsOfertasProv.toUpperCase());
						o.setNoFoliosOferta(noFoliosOferta.toUpperCase());
						o.setMuestraPresentada(muestraPresentada.toUpperCase());
						o.setSolicitudesAclaracion(solicitudesAclaracion.toUpperCase());
						o.setRespuestaSolicitudesAclaracion(respuestaSolicitudesAclaracion.toUpperCase());
						o.setConsultasArsa(consultasArsa.toUpperCase());
						o.setConsultasBenef(consultasBenef.toUpperCase());
						
						o.setProcesoCompra(proc.toUpperCase());
						o.setFechaOferta(date.toUpperCase());														
						o.setMoneda(currency.toUpperCase());
						o.setNoOfertasRecibidas(1);																	
						o.setCodPadre(ofertaALPDao.getBuyProcessCod(proc));				
												
						//o.setRegistroProveedor(registroProveedor.toUpperCase());
						//o.setDescTecnicaCriterio(descTecnicaCriterio.toUpperCase());
						//o.setHistorialContrato(historialContrato.toUpperCase());
						//o.setCantidadCriterio(cantidadCriterio.toUpperCase());
						//o.setIcotermCriterio(icotermCriterio.toUpperCase());
						//o.setRegSanitarioCriterio(regSanitarioCriterio.toUpperCase());
						//o.setGarantiaOfertaCriterio(garantiaOfertaCriterio.toUpperCase());
						//o.setTiempoEntrega(tiempoEntrega.toUpperCase());
						//o.setVidaUtil(vidaUtil.toUpperCase());
						//o.setGarantiaFabrica(garantiaFabrica.toUpperCase());
						//o.setCartaCompromisoCriterio(cartaCompromisoCriterio.toUpperCase());
						//o.setAseguramientoCalidad(aseguramientoCalidad.toUpperCase());
						//o.setRazonabilidadPrecios(razonabilidadPrecios.toUpperCase());
						//o.setCertificadoCriterio(certificadoCriterio.toUpperCase());
						//o.setMantenimientoCapCriterio(manCapCriterio.toUpperCase());
						o.setIdConsolidado(Long.valueOf(reqID));
						o.setEstado(estado);
						o.setobsOfertaCEO(obsOfertaCEO);
						
						//o.setIdItem(ofertaALPDao.getLastMedIDByProc(proc) + 1);
						

						status = ofertaALPDao.save(o);
						
						System.out.println(status + " id NuEVO");
						
						String[] opcion = request.getParameterValues("opcion");							
						String[] idCriterio = request.getParameterValues("idCriterio");									
						CriterioEvaluacionDTO p = new CriterioEvaluacionDTO();
						p.setidProceso(status);
						
						for (int i = 0; i < idCriterio.length; i++){						
		                 	 p.setidC(Integer.parseInt(idCriterio[i])); 
		                 	 p.setidCD(Integer.parseInt(opcion[i]));
		                 	CriterioEvaluacionAndOpcionesProCompraALPDao.saveCriterioByIdS(p);					                 
		                 	}	
						
						if (status != 0) {
							data = "successful";
							//int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqID(Long.parseLong(reqID), proc);
							
							//System.out.println("aa " + nuevoNumeroOfertasIngresadasPorMedicamento);
							System.out.println("bb " + noOfertasRecibidasPorReqConsolidado);
							
							
							System.out.println("bproc " + proc);

							vaciadoOfertasALPDao.productoConOfertas(proc);
							vaciadoOfertasALPDao.productoCompletados(proc);
							
//							if (nuevoNumeroOfertasIngresadasPorMedicamento >= noOfertasRecibidasPorReqConsolidado) {
//								vaciadoOfertasALPDao.updateCompletadosPlus(proc);
//							}
						} else {
							data = "DBError";
						}
					} else if (noOfertasIngresadas == -1 || noOfertasRecibidasPorReqConsolidado == -1) {
						data = "DBError";
					} else {
						data = "maxRequiredError";
					}
					break;
				case "edit":
					listaRequerimientoALP reqMed = listaRequerimientoALPDao.getOneConsolidatedReqForALP(Long.parseLong(reqID), proc);
					
					String noOfertaIngresada = request.getParameter("noOfertaIngresada");
					String date = request.getParameter("date");
					String distribuidor = request.getParameter("distributor");
					String currency = request.getParameter("currency");
					String up = request.getParameter("presentationUnit");
					String precio = request.getParameter("price");
					String medicamentoOfertado = request.getParameter("offeredMed");
					String descripcionTecnica = request.getParameter("technicDescriptionOffered");
					String fabricante = request.getParameter("nombreFabricante");
					String paisOrigen = request.getParameter("paisOrigen");
					String registroSanitario = request.getParameter("tipo1");
					String fechaVencSan = request.getParameter("dateVencimiento1");
					String fechaEmisionSan = request.getParameter("dateEmision1");
					String certificadoManufactura = request.getParameter("tipo2");
					String fechaVencManufactura = request.getParameter("dateVencimiento2");
					String fechaEmisionManufactura = request.getParameter("dateEmision2");
					String cantestimadaofer = request.getParameter("cantestimadaofer").replaceAll(",","");

					String etiquetadoPrimario = request.getParameter("primario");
					String razonEtiquetadoPrimario = request.getParameter("razonPrimario");
					if (etiquetadoPrimario.equalsIgnoreCase("CUMPLE")) {
						razonEtiquetadoPrimario = etiquetadoPrimario;
					}

					String etiquetadoSecundario = request.getParameter("secundario");
					String razonEtiquetadoSecundario = request.getParameter("razonSecundario");
					if (etiquetadoSecundario.equalsIgnoreCase("CUMPLE")) {
						razonEtiquetadoSecundario = etiquetadoSecundario;
					}

					String etiquetadoTerciario = request.getParameter("terciario");
					String razonEtiquetadoTerciario = request.getParameter("razonTerciario");
					if (etiquetadoTerciario.equalsIgnoreCase("CUMPLE")) {
						razonEtiquetadoTerciario = etiquetadoTerciario;
					}
					
					String numSanitario = request.getParameter("numSanitario");
					String numCertif = request.getParameter("numCertif");

					String muestraPresentada = request.getParameter("muestraPresentada");
					String noFoliosOferta = request.getParameter("noFolios").replaceAll(",","");
					String obsOfertasProv = request.getParameter("obsOferProv");
					String consultasArsa = request.getParameter("consultaArsa");
					String consultasBenef = request.getParameter("consultaBenef");
					String obsOfertaCEO = request.getParameter("obsOfertaCEO");
					String solicitudesAclaracionCheck = request.getParameter("solicitudAclaracion");
					String solicitudesAclaracion = "NO HAY SOLICITUD";
					if (solicitudesAclaracionCheck != null) {
						solicitudesAclaracion = "VER SOLICITUD DE ACLARACIÓN / SUBSANACIÓN";
					}

					String respuestaSolicitudesAclaracionCheck = request.getParameter("resSolicitudAclaracion");
					String respuestaSolicitudesAclaracion = "NO HAY RESPUESTA A LA SOLICITUD DE ACLARACION / SUBSANACION";
					if (respuestaSolicitudesAclaracionCheck != null) {
						respuestaSolicitudesAclaracion = "VER RESPUESTA A LA SOLICITUD DE ACLARACIÓN / SUBSANACIÓN";
					}

					//String registroProveedor = request.getParameter("regProveedor");
					//String descTecnicaCriterio = request.getParameter("descTecnicaCumple");
					//String historialContrato = request.getParameter("historialContratos");
					//String cantidadCriterio = request.getParameter("cantidadCumple");
					//String icotermCriterio = request.getParameter("icoterm");
					//String regSanitarioCriterio = request.getParameter("regSanitarioCumple");
					//String garantiaOfertaCriterio = request.getParameter("garantOfertaCumple");
					//String tiempoEntrega = request.getParameter("tiemposEntrega");
					//String vidaUtil = request.getParameter("vidaUtil");
					//String garantiaFabrica = request.getParameter("garantFabr");
					//String cartaCompromisoCriterio = request.getParameter("cartaRespuestos");
					//String aseguramientoCalidad = request.getParameter("aseguramientoCalidad");
					//String razonabilidadPrecios = request.getParameter("razonPrec");
					//String certificadoCriterio = request.getParameter("cppIso");
					//String manCapCriterio = request.getParameter("manCap");
					String estado = request.getParameter("offerState");
					if (!estado.equalsIgnoreCase("FINALIZADO")) {
						estado = "EN PROCESO";
					}

					ofertaALP o = new ofertaALP();

					o.setnoOfertaIngresada(Integer.parseInt(noOfertaIngresada));
					o.setDistribuidor(distribuidor.toUpperCase());
					o.setIdItem(Integer.parseInt(request.getParameter("reqID")));
					o.setCodATC(reqMed.getCodigoATC());
					o.setcodSesal(reqMed.getcodSesal());
					o.setMedicamentoEstimado(reqMed.getNombreMedicamento().toUpperCase());
					o.setMedicamentoOfertado(medicamentoOfertado.toUpperCase());
					o.setDescripcionTecnicaRequerida(reqMed.getDescripcionTecnica().toUpperCase());
					o.setDescripcionTecnica(descripcionTecnica.toUpperCase());
					o.setUnidadPresentacionRequerida(reqID);
					o.setUnidadPresentacionRequerida(reqMed.getUnidadPresentacion().toUpperCase());	
					o.setUp(up.toUpperCase());
					o.setcanEstimadaOferta(Integer.parseInt(cantestimadaofer));
					o.setPrecio(precio);
					o.setNombreFabricante(fabricante.toUpperCase());
					o.setPaisOrigen(paisOrigen);
					o.setRegistroSanitario(registroSanitario.toUpperCase());
					o.setNumSanitario(numSanitario);
					o.setFechaVencSan(fechaVencSan.toUpperCase());
					o.setFechaEmisionSan(fechaEmisionSan.toUpperCase());
					o.setCertificadoManufactura(certificadoManufactura.toUpperCase());
					o.setNumCertif(numCertif);
					o.setFechaVencManufactura(fechaVencManufactura.toUpperCase());
					o.setFechaEmisionManufactura(fechaEmisionManufactura.toUpperCase());
					o.setEtiquetadoPrimario(razonEtiquetadoPrimario.toUpperCase());
					o.setEtiquetadoSecundario(razonEtiquetadoSecundario.toUpperCase());
					o.setEtiquetadoTerciario(razonEtiquetadoTerciario.toUpperCase());
					o.setObsOfertaProv(obsOfertasProv.toUpperCase());
					o.setNoFoliosOferta(noFoliosOferta.toUpperCase());
					o.setMuestraPresentada(muestraPresentada.toUpperCase());
					o.setSolicitudesAclaracion(solicitudesAclaracion.toUpperCase());
					o.setRespuestaSolicitudesAclaracion(respuestaSolicitudesAclaracion.toUpperCase());
					o.setConsultasArsa(consultasArsa.toUpperCase());
					o.setConsultasBenef(consultasBenef.toUpperCase());
					
					o.setProcesoCompra(proc.toUpperCase());
					o.setFechaOferta(date.toUpperCase());														
					o.setMoneda(currency.toUpperCase());
					o.setNoOfertasRecibidas(1);																	
					o.setCodPadre(ofertaALPDao.getBuyProcessCod(proc));			
					o.setobsOfertaCEO(obsOfertaCEO);
											
					//o.setRegistroProveedor(registroProveedor.toUpperCase());
					//o.setDescTecnicaCriterio(descTecnicaCriterio.toUpperCase());
					//o.setHistorialContrato(historialContrato.toUpperCase());
					//o.setCantidadCriterio(cantidadCriterio.toUpperCase());
					//o.setIcotermCriterio(icotermCriterio.toUpperCase());
					//o.setRegSanitarioCriterio(regSanitarioCriterio.toUpperCase());
					//o.setGarantiaOfertaCriterio(garantiaOfertaCriterio.toUpperCase());
					//o.setTiempoEntrega(tiempoEntrega.toUpperCase());
					//o.setVidaUtil(vidaUtil.toUpperCase());
					//o.setGarantiaFabrica(garantiaFabrica.toUpperCase());
					//o.setCartaCompromisoCriterio(cartaCompromisoCriterio.toUpperCase());
					//o.setAseguramientoCalidad(aseguramientoCalidad.toUpperCase());
					//o.setRazonabilidadPrecios(razonabilidadPrecios.toUpperCase());
					//o.setCertificadoCriterio(certificadoCriterio.toUpperCase());
					//o.setMantenimientoCapCriterio(manCapCriterio.toUpperCase());
					o.setIdConsolidado(Long.valueOf(reqID));
					o.setEstado(estado);
					o.setnoOferta(request.getParameter("noOferta"));
					status = ofertaALPDao.updateOfferData(o, proc, Long.valueOf(itemID));	
					
					vaciadoOfertasALPDao.productoCompletados(proc);
					
					String[] opcion = request.getParameterValues("opcion");										
					String[] idCriterio = request.getParameterValues("idCriterio");
					//System.out.println("cccccccccc");
					System.out.println(opcion);
					for (int i = 0; i < idCriterio.length; i++){
						CriterioEvaluacionDTO p = new CriterioEvaluacionDTO();						
						String noOferta = request.getParameter("noOferta");
						p.setidProceso(Integer.parseInt(noOferta));
						int existe = CriterioEvaluacionAndOpcionesProCompraALPDao.validarOpcion(noOferta, Integer.parseInt(idCriterio[i]));															
						if(existe > 0) {				
							System.out.println(opcion[i] + " opcion");
							p.setidC(Integer.parseInt(idCriterio[i])); 
		                 	p.setidCD(Integer.parseInt(opcion[i]));
		                 	CriterioEvaluacionAndOpcionesProCompraALPDao.updateCriteriosBynoOferta(noOferta, Integer.parseInt(opcion[i]), Integer.parseInt(idCriterio[i]) );																		
						}
						else 
						 {			
							p.setidC(Integer.parseInt(idCriterio[i])); 
		                 	p.setidCD(Integer.parseInt(opcion[i]));
		                 	CriterioEvaluacionAndOpcionesProCompraALPDao.saveCriterioByIdS(p);									
						 }											
	                }					
					if (status != 0) {
						data = "successful";

					} else {
						data = "DBError";
					}
					break;
				case "delete":
					if (Integer.parseInt(request.getParameter("noOferta")) >0)
					{
						ofertaALP oferta = ofertaALPDao.SelectDataDetele(Integer.parseInt(request.getParameter("noOferta")));
						
						//int cantMedicamentosCompletados = vaciadoOfertasALPDao.getCompletadosByALPNumber(oferta.getProcesoCompra());
						status = ofertaALPDao.deleteOne(Integer.parseInt(request.getParameter("noOferta")));
						//status = ofertaALPDao.deleteOne(proc, Long.valueOf(itemID));
						if (status != 0) {
							data = "successful";
//							int nuevoNumeroOfertasIngresadasPorMedicamento = ofertaALPDao.getCantMedsByProcAndReqID(oferta.getIdConsolidado(), oferta.getProcesoCompra());
//							if (nuevoNumeroOfertasIngresadasPorMedicamento < noOfertasRecibidasPorReqConsolidado && cantMedicamentosCompletados > 0) {
//								vaciadoOfertasALPDao.updateCompletadosMinus(oferta.getProcesoCompra());
//							}
							vaciadoOfertasALPDao.productoConOfertas(proc);
							vaciadoOfertasALPDao.productoCompletados(proc);
						} else {
							data = "DBError";
						}
					}
					else
					{
						data = "inputError";
					}
					break;
				default:
					break;
			}
			response.setContentType("text/plain");
			System.out.println("Request status: " + data);
		} else {
			response.setContentType("application/json");
			data = ofertaALPDao.getofferListByPurchaseNumber(proc);
			System.out.println("Get all offer data");
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
