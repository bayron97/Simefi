package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class procesosCompraServlet
 */
@WebServlet("/procesoCompraGeneralServlet")
@MultipartConfig
public class procesoCompraGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public procesoCompraGeneralServlet() {
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

		String submit = request.getParameter("submit");
		String noProcesoCompra = request.getParameter("purchaseNum");
		String horaLimite = request.getParameter("purchaseHourLimit");
		String fechaLimite = request.getParameter("purchaseDateLimit");
		String fechaApertura = request.getParameter("purchaseDateOpen");
		String horaApertura = request.getParameter("purchaseHourOpen");
		String lugar = request.getParameter("purchasePlace");
		String periodoValidez = request.getParameter("purchaseDaysPeriod");
		String fechaPublicacion = request.getParameter("purchaseDatePublished");
		String idioma = request.getParameter("purchaseLanguage");
		String tipoMoneda = request.getParameter("purchaseCurrency");
		String descripcioncompra = request.getParameter("purchaseDescription");
		System.out.println("variable? " +descripcioncompra);
		System.out.println("variable? " +noProcesoCompra);
		
		
		String[] idCriterio = request.getParameterValues("idCriterio");
		String[] nombreCriterio = request.getParameterValues("NombreCriterio");
		String funcion = (String) session.getAttribute("funcion");
		System.out.println("Viene esto "+ funcion);
		request.setAttribute("throughServlet", "true");
		String type = (String) session.getAttribute("type");
		
		CriterioEvaluacionGeneral pc = new CriterioEvaluacionGeneral();	

		if (submit != null && !submit.contentEquals("cancelar")) {

			procesoCompraGeneral p = new procesoCompraGeneral();
			p.setNoProcesoCompra(noProcesoCompra);
			String fecha_l = fechaLimite + "|" + horaLimite;
			p.setFechaLimite(fecha_l);
			String fecha_a = fechaApertura + "|" + horaApertura;
			p.setFechaApertura(fecha_a);
			p.setLugar(lugar);
			p.setPeriodoValidez(periodoValidez);
			p.setFechaPublicacion(fechaPublicacion);
			p.setIdioma(idioma);
			p.setTipoMoneda(tipoMoneda);
			p.setDescripcionCompra(descripcioncompra);

			int status = 0;
			switch (funcion) {
				case "modificar":
					int cod = (Integer) session.getAttribute("noCompra");
					p.setidProcesoCompraGeneral(cod);
					status = procesoCompraGeneralDao.update(cod, p);

					if (status == 0)  {
						System.out.println("Actualiza 0");

						String[] oficios = request.getParameterValues("oficiosTabla");
						String[] beneficiariosFinales = request.getParameterValues("beneficiariosFinales");
						String[] iddoficios = request.getParameterValues("iddoficios");
										
						if (oficios != null && beneficiariosFinales != null) {
							for (int i = 0; i < oficios.length; i++) {
								for (int j = 0; j < iddoficios.length; j++) {
									if (iddoficios[j].contentEquals(String.valueOf(i))) {
										procesoCompraGeneralDao.addOficio(oficios[j], p.getidProcesoCompraGeneral());

										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);

										if (filePart != null && filePart.getSize() > 0) {

											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = noProcesoCompra + "_" + oficios[j] + ".pdf";

											String contextPath = getServletContext().getRealPath(
													"/assets/files/buyProcessGeneralFiles/legalDocumentForBeneficiary/"
															+ fileName);

											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
											}
											procesoCompraGeneralDao.addBenefGeneral(oficios[j],
													Integer.parseInt(beneficiariosFinales[j]), fileName);
										}

									}
								}

							}
						}

						String[] fechaL = p.getFechaLimite().split("\\|");
						String[] fechaA = p.getFechaApertura().split("\\|");

						request.setAttribute("noProcesoCompra", noProcesoCompra);
						request.setAttribute("horaLimite", fechaL[1]);
						request.setAttribute("fechaLimite", fechaL[0]);
						request.setAttribute("fechaApertura", fechaA[0]);
						request.setAttribute("horaApertura", fechaA[1]);
						request.setAttribute("lugar", p.getLugar());
						request.setAttribute("periodoValidez", p.getPeriodoValidez());
						request.setAttribute("fechaPublicacion", p.getFechaPublicacion());
						request.setAttribute("idioma", p.getIdioma());
						request.setAttribute("tipoMoneda", p.getTipoMoneda());
						request.setAttribute("descripcioncompra", descripcioncompra);

						request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
								response);
					} else {

						System.out.println("Actualiza 1");
						String[] oficios = request.getParameterValues("oficiosTabla");
						String[] beneficiariosFinales = request.getParameterValues("beneficiariosFinales");
						String[] iddoficios = request.getParameterValues("iddoficios");

						if (oficios != null && beneficiariosFinales != null && iddoficios != null) {
							for (int i = 0; i < oficios.length; i++) {
								for (int j = 0; j < iddoficios.length; j++) {
									if (iddoficios[j].contentEquals(String.valueOf(i))) {
										procesoCompraGeneralDao.addOficio(oficios[j], p.getidProcesoCompraGeneral());

										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);

										if (filePart != null && filePart.getSize() > 0) {

											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = noProcesoCompra + "_" + oficios[j] + ".pdf";

											String contextPath = getServletContext().getRealPath(
													"/assets/files/buyProcessGeneralFiles/legalDocumentForBeneficiary/"
															+ fileName);

											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
											}
											procesoCompraGeneralDao.addBenefGeneral(oficios[j],
													Integer.parseInt(beneficiariosFinales[j]), fileName);

										}

									}
								}

							}
						}
						
						ArrayList<Integer> criteriosId = CriterioEvaluacionGeneralDao.getIdDC(cod);
						Integer[] miarray = new Integer[criteriosId.size()];
						miarray = criteriosId.toArray(miarray);
						
						for(Integer s : miarray) {
							System.out.println(s);
							CriterioEvaluacionDTO criterios = CriterioEvaluacionGeneralDao.getCriteriosByCodAndIdCD(cod, s);											
							pc.setEstado(false);
							pc.setid(criterios.getId());
							pc.setidC(s);
							CriterioEvaluacionGeneralDao.update(cod, pc);						
						}						
						
						for (int i = 0; i < idCriterio.length; i++){						
							boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
							if(cotiene) {		
								
								CriterioEvaluacionDTO criterios = CriterioEvaluacionGeneralDao.getCriteriosByCodAndIdCD(cod, Integer.parseInt(idCriterio[i]));							
								 
								pc.setEstado(true);							
								pc.setid(criterios.getId());
								pc.setidC(Integer.parseInt(idCriterio[i]));
								CriterioEvaluacionGeneralDao.update(cod, pc);							
														
							}else 
							 	{			
								pc.setCod(cod);
								pc.setEstado(true);							
								pc.setidC(Integer.parseInt(idCriterio[i]));							
			                 	 CriterioEvaluacionGeneralDao.save(pc);							
							 	}						
		                 }

						request.setAttribute("noProcesoCompra", noProcesoCompra);
						request.setAttribute("descripcioncompra", descripcioncompra);
					session.setAttribute("idCriterio",idCriterio);	
					session.setAttribute("nombreCriterio",nombreCriterio);
						request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
								response);
					}
					break;
				case "revisar":
					request.setAttribute("tipoMoneda", p.getTipoMoneda());
					request.setAttribute("descripcioncompra", descripcioncompra);
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					break;
				case "consultar":
					 cod = (Integer) session.getAttribute("noCompra");
					p.setidProcesoCompraGeneral(cod);
					status = procesoCompraGeneralDao.update(cod, p);
					
					System.out.println("Si entro");
					request.setAttribute("noProcesoCompra", noProcesoCompra);		
					request.setAttribute("lugar", p.getLugar());
					request.setAttribute("periodoValidez", p.getPeriodoValidez());
					request.setAttribute("fechaPublicacion", p.getFechaPublicacion());
					request.setAttribute("idioma", p.getIdioma());
					request.setAttribute("tipoMoneda", p.getTipoMoneda());
					request.setAttribute("descripcioncompra", descripcioncompra);
//					request.setAttribute("noProcesoCompra", noProcesoCompra);
//					request.setAttribute("descripcioncompra", descripcioncompra);
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					
					System.out.println("Viene? " +descripcioncompra);
					break;
				default:
					p.setEstado1("EN PROCESO");
					
					int estadoProceso = numeroProcesoCompraDao.procesoEstado(noProcesoCompra);
					
					if(estadoProceso == 0) {
						String[] fechaL = p.getFechaLimite().split("\\|");
						String[] fechaA = p.getFechaApertura().split("\\|");

						ArrayList<CriterioEvaluacion> criterios = CriterioEvalucionDao.getCriterios();											
						ArrayList<CriterioEvaluacionDTO> NewCriterios = new ArrayList<CriterioEvaluacionDTO>();	
						session.setAttribute("nombreCriterio",nombreCriterio);
						for(CriterioEvaluacion cri : criterios) {
							CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();
						
							crit.setIdCE(cri.getId());
							crit.setNombreCriterio(cri.getNombreCriterio());
							crit.setEstado(false);
							NewCriterios.add(crit);
						}				
						request.setAttribute("criterios", NewCriterios);
						request.setAttribute("mostrarmensaje", "PROCESOFALSE");
						request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
						request.setAttribute("horaLimite", fechaL[1]);
						request.setAttribute("fechaLimite", fechaL[0]);
						request.setAttribute("fechaApertura", fechaA[0]);
						request.setAttribute("horaApertura", fechaA[1]);
						request.setAttribute("lugar", p.getLugar());
						request.setAttribute("periodoValidez", p.getPeriodoValidez());
						request.setAttribute("fechaPublicacion", p.getFechaPublicacion());
						request.setAttribute("idioma", p.getIdioma());
						request.setAttribute("tipoMoneda", p.getTipoMoneda());
						request.setAttribute("descripcioncompra", p.getDescripcionCompra());
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("nPurchaseProcessGeneral.jsp").forward(request, response);
						
					}else {
					
					status = procesoCompraGeneralDao.save(p);

					if (status == 0) {

						String[] fechaL = p.getFechaLimite().split("\\|");
						String[] fechaA = p.getFechaApertura().split("\\|");

						session.setAttribute("nombreCriterio",nombreCriterio);
						
						ArrayList<CriterioEvaluacion> criterios = CriterioEvalucionDao.getCriterios();											
						ArrayList<CriterioEvaluacionDTO> NewCriterios = new ArrayList<CriterioEvaluacionDTO>();	
						
						for(CriterioEvaluacion cri : criterios) {
							CriterioEvaluacionDTO crit= new CriterioEvaluacionDTO();
						
							crit.setIdCE(cri.getId());
							crit.setNombreCriterio(cri.getNombreCriterio());
							crit.setEstado(false);
							NewCriterios.add(crit);
						}				
						request.setAttribute("criterios", NewCriterios);
						request.setAttribute("mostrarmensaje", "NOGUARDO");
						request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
						request.setAttribute("horaLimite", fechaL[1]);
						request.setAttribute("fechaLimite", fechaL[0]);
						request.setAttribute("fechaApertura", fechaA[0]);
						request.setAttribute("horaApertura", fechaA[1]);
						request.setAttribute("lugar", p.getLugar());
						request.setAttribute("periodoValidez", p.getPeriodoValidez());
						request.setAttribute("idioma", p.getIdioma());
						request.setAttribute("tipoMoneda", p.getTipoMoneda());

						request.getRequestDispatcher("nPurchaseProcessGeneral.jsp").forward(request, response);
					} else {
						p.setidProcesoCompraGeneral(procesoCompraGeneralDao.getCodProcesoCompra(p.getNoProcesoCompra()));

						numeroProcesoCompra pGeneral = new numeroProcesoCompra();
						pGeneral.setCod(noProcesoCompra);
						pGeneral.setEstado("NO DISPONIBLE");
						pGeneral.setIdProc(p.getidProcesoCompraGeneral());

						numeroProcesoCompraDao.update(pGeneral, noProcesoCompra);

						String[] oficios = request.getParameterValues("oficiosTabla");
						String[] beneficiariosFinales = request.getParameterValues("beneficiariosFinales");
						String[] iddoficios = request.getParameterValues("iddoficios");
						
						
						int codP = procesoCompraGeneralDao.getCodProcesoCompra(p.getNoProcesoCompra());
						pc.setCod(codP);						
						for (int i = 0; i < idCriterio.length; i++){						
						pc.setidC(Integer.parseInt(idCriterio[i]));                 
	                 	 CriterioEvaluacionGeneralDao.save(pc);
	                 	}

						if (oficios != null && beneficiariosFinales != null) {
							for (int i = 0; i < oficios.length; i++) {
								for (int j = 0; j < iddoficios.length; j++) {
									if (iddoficios[j].contentEquals(String.valueOf(i))) {
										procesoCompraGeneralDao.addOficio(oficios[j], p.getidProcesoCompraGeneral());

										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);

										if (filePart != null && filePart.getSize() > 0) {

											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = noProcesoCompra + "_" + oficios[j] + ".pdf";

											String contextPath = getServletContext().getRealPath(
													"/assets/files/buyProcessGeneralFiles/legalDocumentForBeneficiary/"
															+ fileName);

											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
											}
											procesoCompraGeneralDao.addBenefGeneral(oficios[j],
													Integer.parseInt(beneficiariosFinales[j]), fileName);
										}

									}
								}

							}
						}
						
						session.setAttribute("idCriterio",idCriterio);	
						session.setAttribute("nombreCriterio",nombreCriterio);	
						session.setAttribute("noCompra",procesoCompraGeneralDao.getCodProcesoCompra(p.getNoProcesoCompra()));
						request.setAttribute("noProcesoCompra", noProcesoCompra);
						request.setAttribute("descripcioncompra", descripcioncompra);
						request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
								response);
					}
				}
					break;
					
			}
			
			System.out.println(submit +" consu");
		} else {
			request.getRequestDispatcher("purchaseProcessesGeneral.jsp").forward(request, response);
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
