package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class solicitudCompraALPServlet
 */
@WebServlet("/solicitudCompraALPServlet")
@MultipartConfig
public class solicitudCompraALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public solicitudCompraALPServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		// Servlet de Guardado, Edicion y Consulta: Datos Generales

		HttpSession session = request.getSession(true);
		String func = (String)session.getAttribute("funcion");
		String[] idCriterio = request.getParameterValues("idCriterio");
		
		
		if (func != null && !func.isEmpty()) {
			String openMode = session.getAttribute("openMode").toString();
			request.setAttribute("openMode", openMode);
			request.setAttribute("funcion", func);

			switch (func) {
				case "NUEVO":
					solicitudCompraALP nuevaSolicitud1 = new solicitudCompraALP();
					//String newCod1 = solicitudCompraALPDao.getNewCod();
					String newCod1 = request.getParameter("noCorrelativoSolicitud");

					nuevaSolicitud1.setBeneficiario(request.getParameter("benef"));
					nuevaSolicitud1.setCodSolicitudCompra(newCod1);
					nuevaSolicitud1.setFecha(request.getParameter("fechaSolicitud"));
					nuevaSolicitud1.setNoProcesoCompra(request.getParameter("noProcesoCompraRecomendado"));
					nuevaSolicitud1.setDescripcionCompra(request.getParameter("descripcionCompra"));
					nuevaSolicitud1.setEstado("EN PROCESO");

					int status1 = solicitudCompraALPDao.save(nuevaSolicitud1);

					if (status1 >= 0) {
						//Oficios
						String[] noOficio = request.getParameterValues("noOficio");
						
						if (noOficio != null) {
							File directorio = new File(getServletContext().getRealPath("/assets/files/purchaseRequestALPFiles/" + newCod1 + "/legalFiles"));
							System.out.println(directorio);
							if (!directorio.exists()) {
					            if (directorio.mkdirs()) {
					                System.out.println("Directorio creado");
					                for (int i = 0; i < noOficio.length; i++) {	
										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);

										if (filePart != null && filePart.getSize() > 0) {
											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = newCod1 + "_" + noOficio[i] + ".pdf";

											String contextPath = getServletContext().getRealPath("/assets/files/purchaseRequestALPFiles/" + newCod1 + "/legalFiles/" + fileName);

											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
											}
											oficioSolicitudCompraALP o = new oficioSolicitudCompraALP();
											o.setIdSolicitudCompra(status1);
											o.setNoOficio(noOficio[i]);
											o.setNoItem(i+1);
											o.setNombreDocumento(fileName);
											oficioSolicitudCompraALPDao.save(o);
										}
									}
					                
					                CriterioEvaluacionSolicitudCompraALP p = new CriterioEvaluacionSolicitudCompraALP();
					                long codPadre = solicitudCompraALPDao.getIDByPurchaseRequestCod(newCod1);
					                p.setCod(codPadre);
									for (int i = 0; i < idCriterio.length; i++){						
				                 	 p.setidC(Integer.parseInt(idCriterio[i]));                 
				                 	CriterioEvaluacionSolicitudCompraALPDao.save(p);
				                 
				                 	}
					                
					            } else {
					                System.out.println("Error al crear directorio");
					            }
					        }
						}
						
						//Oficios
						
						long codPadre = solicitudCompraALPDao.getIDByPurchaseRequestCod(newCod1);		
						
						ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
								.getAllBySCID(codPadre);
						ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
								.getReqListByBuyRequestId(codPadre);
						
						session.setAttribute("codPadreSolCompra", codPadre);
						session.setAttribute("purchaseCOD", nuevaSolicitud1.getNoProcesoCompra());
						session.setAttribute("noSolCompra", nuevaSolicitud1.getCodSolicitudCompra());
						request.setAttribute("noProcesoCompra", nuevaSolicitud1.getNoProcesoCompra());
						
						
						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("reqList", reqList);
						
						request.setAttribute("cantCriterioGuardado", "-");
						request.setAttribute("regSanCriterioGuardado", "-");
						request.setAttribute("certBPMCriterioGuardado", "-");
						request.setAttribute("tiempoEntregaCriterioGuardado", "-");
						request.setAttribute("vidaUtilCriterioGuardado", "-");

						request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request, response);
						
					} else {
						ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
						ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
						ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();
						
						request.setAttribute("funcion", "NUEVO");
						request.setAttribute("openMode", "");
						request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						request.setAttribute("benfList", benfList);
						request.setAttribute("purchaseActiveList", purchaseActiveList);
						request.setAttribute("purchaseDescList", purchaseDescList);

						request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
				case "MODIFICAR":
					long codPadre1 = (Long)session.getAttribute("codPadreSolCompra");
					solicitudCompraALP s = solicitudCompraALPDao.getOneByID(codPadre1);

					s.setBeneficiario(request.getParameter("benef"));
					s.setFecha(request.getParameter("fechaSolicitud"));
					s.setNoProcesoCompra(request.getParameter("noProcesoCompraRecomendado"));
					s.setDescripcionCompra(request.getParameter("descripcionCompra"));

					int status2 = solicitudCompraALPDao.updateGeneralData(s);
					
					
					CriterioEvaluacionSolicitudCompraALP pc = new CriterioEvaluacionSolicitudCompraALP();
					
					ArrayList<Integer> criteriosId = CriterioEvaluacionSolicitudCompraALPDao.getIdDC(codPadre1);
					Integer[] miarray = new Integer[criteriosId.size()];
					miarray = criteriosId.toArray(miarray);
					
					for(Integer C : miarray) {
						System.out.println(s);
						CriterioEvaluacionDTO criterios = CriterioEvaluacionSolicitudCompraALPDao.getCriteriosByCodAndIdCD(codPadre1, C);											
						pc.setEstado(false);
						pc.setid(criterios.getId());
						pc.setidC(C);
						CriterioEvaluacionSolicitudCompraALPDao.update(codPadre1, pc);
						
					}						
					
					for (int i = 0; i < idCriterio.length; i++){						
						boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
						if(cotiene) {		
							
							CriterioEvaluacionDTO criterios = CriterioEvaluacionSolicitudCompraALPDao.getCriteriosByCodAndIdCD(codPadre1, Integer.parseInt(idCriterio[i]));							
							 
							pc.setEstado(true);							
							pc.setid(criterios.getId());
							pc.setidC(Integer.parseInt(idCriterio[i]));
							CriterioEvaluacionSolicitudCompraALPDao.update(codPadre1, pc);							
													
						}else 
						 	{			
							pc.setCod(codPadre1);
							pc.setEstado(true);							
							pc.setidC(Integer.parseInt(idCriterio[i]));							
							CriterioEvaluacionSolicitudCompraALPDao.save(pc);							
						 	}		
					
	                }

					if (status2 != 0) {
						
						//Oficios
						String[] idArchivo = request.getParameterValues("idArchivo");
						String[] noOficio = request.getParameterValues("noOficio");
						
						if (noOficio != null) {            
			                for (int i = 0; i < noOficio.length; i++) {	
			                	for(int j = 0; j < idArchivo.length; j++) {
			                		if(idArchivo[j].contentEquals(String.valueOf(i))){
			                			String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);
			
										if (filePart != null && filePart.getSize() > 0) {
											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = s.getCodSolicitudCompra() + "_" + noOficio[j] + ".pdf";
			
											String contextPath = getServletContext().getRealPath("/assets/files/purchaseRequestALPFiles/" + s.getCodSolicitudCompra() + "/legalFiles/" + fileName);
			
											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
											}
											oficioSolicitudCompraALP o = new oficioSolicitudCompraALP();
											o.setIdSolicitudCompra(s.getId());
											o.setNoOficio(noOficio[j]);
											o.setNoItem(j+1);
											o.setNombreDocumento(fileName);
											oficioSolicitudCompraALPDao.save(o);
										}
			                		}
									
			                	}
			                }					        
						}
						
						
						
						//Oficios
						
						ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao
								.getAllBySCID(codPadre1);
//						ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
//								.getReqListByBuyRequestId(codPadre);
						
						ArrayList<productoSolicitudCompraALP> reqList = productoSolicitudCompraALPDao
								.getReqListByBuyRequestId(codPadre1);

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("reqList", reqList);

						request.setAttribute("noProcesoCompra", s.getNoProcesoCompra());
						request.setAttribute("cantCriterioGuardado", s.getCantCriterio());
						request.setAttribute("regSanCriterioGuardado", s.getRegSanCriterio());
						request.setAttribute("certBPMCriterioGuardado", s.getCertBPMCriterio());
						request.setAttribute("tiempoEntregaCriterioGuardado", s.getTiempoEntregaCriterio());
						request.setAttribute("vidaUtilCriterioGuardado", s.getVidaUtilCriterio());

						request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request, response);
					} else {
						solicitudCompraALP mr = solicitudCompraALPDao.getOneByID(codPadre1);
						ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
						ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
						ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();

						request.setAttribute("funcion", "NUEVO");
						request.setAttribute("openMode", "");
						request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						request.setAttribute("benfList", benfList);
						request.setAttribute("purchaseActiveList", purchaseActiveList);
						request.setAttribute("purchaseDescList", purchaseDescList);

						request.setAttribute("codPadreSolCompra", mr.getId());
						request.setAttribute("noSolCompra", mr.getCodSolicitudCompra());
						request.setAttribute("benefGuardado", mr.getBeneficiario());
						request.setAttribute("descripcionCompraGuardado", mr.getDescripcionCompra());
						request.setAttribute("fecha", mr.getFecha());
						request.setAttribute("noProcesoCompraGuardado", mr.getNoProcesoCompra());

						request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
				case "CONSULTAR":
					long codPadre2 = (Long) session.getAttribute("codPadreSolCompra");
					solicitudCompraALP s2 = solicitudCompraALPDao.getOneByID(codPadre2);
					
					
					
					ArrayList<productoSolicitudCompraALP> reqList = productoSolicitudCompraALPDao
							.getReqListByBuyRequestId(codPadre2);

					
					request.setAttribute("reqList", reqList);

					request.setAttribute("cantCriterioGuardado", s2.getCantCriterio());
					request.setAttribute("regSanCriterioGuardado", s2.getRegSanCriterio());
					request.setAttribute("certBPMCriterioGuardado", s2.getCertBPMCriterio());
					request.setAttribute("tiempoEntregaCriterioGuardado", s2.getTiempoEntregaCriterio());
					request.setAttribute("vidaUtilCriterioGuardado", s2.getVidaUtilCriterio());

					request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp").forward(request, response);
					break;
				default:
					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
			}
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreSolCompra");
			request.setAttribute("openMode", "openError");

			request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
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
