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
 * Servlet implementation class Gral_aperturaProcesoServlet
 */
@WebServlet("/Gral_aperturaProcesoServlet")
@MultipartConfig
public class Gral_aperturaProcesoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_aperturaProcesoServlet() {
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
		Gral_aperturaProceso aperturaProceso = new Gral_aperturaProceso();
		
		try {
			//String submit = request.getParameter("submit");		
			String accion = (String) session.getAttribute("accion");
			
			
			
			aperturaProceso.setNumProcesoCompra(request.getParameter("numProcesoCompra"));
			aperturaProceso.setFechaPublicacion(request.getParameter("fechaPublicacion"));
			aperturaProceso.setFechaLimite(request.getParameter("fechaLimiteView") + "|" + request.getParameter("horaLimiteView"));
			aperturaProceso.setFechaApertura(request.getParameter("fechaAperturaView") +"|"+ request.getParameter("horaAperturaView"));
			aperturaProceso.setLugar(request.getParameter("lugar"));
			aperturaProceso.setPeriodoValidez(request.getParameter("periodoValidez"));			
			aperturaProceso.setObservaciones(request.getParameter("observaciones"));
			aperturaProceso.setDescripcionCompra(request.getParameter("descripcionCompra"));
			aperturaProceso.setIdBeneficiario(Integer.parseInt(request.getParameter("idBeneficiario")));
			aperturaProceso.setbeneficiario(request.getParameter("beneficiario"));
			
			
			if(accion.contentEquals("nuevo")) {
				int idAperturaProceso = Gral_aperturaProcesoDao.save(aperturaProceso);					
				if (idAperturaProceso > 0)  {	
					aperturaProceso.setIdAperturaProceso(idAperturaProceso);
					int Asignado =	numeroProcesoCompraDao.updateNumProcesoGral(aperturaProceso.getNumProcesoCompra());							
					
					String[] Oficios = request.getParameterValues("OficioTB");
					String[] nombreArchivo = request.getParameterValues("nombreArchivoTB");
					if (Oficios != null) {
						for (int i = 0; i < Oficios.length; i++) {
								String inputName = "oficioFiles_" + i;
									Part filePart = request.getPart(inputName);

									if (filePart != null && filePart.getSize() > 0) {

										InputStream fileContent = filePart.getInputStream();
										byte[] buffer = new byte[fileContent.available()];
										fileContent.read(buffer);
										String fileName =  nombreArchivo[i];
										String contextPath = getServletContext().getRealPath("/assets/files/buyProcessGeneralFiles/legalDocumentForBeneficiary/"+ fileName);
										File dest = new File(contextPath);
										if (!dest.exists()) {
											dest.createNewFile();
											OutputStream outStream = new FileOutputStream(dest);
											outStream.write(buffer);
											outStream.close();
											
											Gral_oficioBeneficiario oficioBeneficiaraio = new Gral_oficioBeneficiario();
											oficioBeneficiaraio.setOficio(Oficios[i]);												
											oficioBeneficiaraio.setnombreArchivo(fileName);
											oficioBeneficiaraio.setIdAperturaProceso(idAperturaProceso);
											
											Gral_oficioBeneficiarioDao.save(oficioBeneficiaraio);
											
										}											
									}

						}
					}
					session.removeAttribute("idAperturaProceso");
					session.setAttribute("idAperturaProceso", aperturaProceso.getIdAperturaProceso());
					
				} else {
					//Enviaremos una pantalla de error
				}
			}
			else if(accion.contentEquals("modificar")){
				aperturaProceso.setIdAperturaProceso((int)session.getAttribute("idAperturaProceso"));
				
				 int actualizo = Gral_aperturaProcesoDao.update(aperturaProceso);
				 
				 if(actualizo > 0) {
					 String[] Oficios = request.getParameterValues("OficioTB");
					 String[] nombreArchivo = request.getParameterValues("nombreArchivoTB");
					 if (Oficios != null) {
							for (int i = 0; i < Oficios.length; i++) {
									String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);

										if (filePart != null && filePart.getSize() > 0) {

											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName =  nombreArchivo[i];
											String contextPath = getServletContext().getRealPath("/assets/files/buyProcessGeneralFiles/legalDocumentForBeneficiary/"+ fileName);
											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
												
												Gral_oficioBeneficiario oficioBeneficiaraio = new Gral_oficioBeneficiario();
												oficioBeneficiaraio.setOficio(Oficios[i]);												
												oficioBeneficiaraio.setnombreArchivo(fileName);
												oficioBeneficiaraio.setIdAperturaProceso(aperturaProceso.getIdAperturaProceso());
												
												Gral_oficioBeneficiarioDao.save(oficioBeneficiaraio);
												
											}											
										}
							}
						}
					 
				 }else {
					 
				 }
				 
				 ArrayList<Gral_listaRequerimientoDTO> listaRequerimiento = Gral_listaRequerimientoDao.getListaRequerimiento(aperturaProceso.getIdAperturaProceso());
				 request.setAttribute("listaRequerimiento", listaRequerimiento);
			}else if(accion.contentEquals("revisar") ||  accion.contentEquals("consultar") ) {
				ArrayList<Gral_listaRequerimientoDTO> listaRequerimiento = Gral_listaRequerimientoDao.getListaRequerimiento((int)session.getAttribute("idAperturaProceso"));
				 request.setAttribute("listaRequerimiento", listaRequerimiento);
			}else {
				
			}
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
			
			request.getRequestDispatcher("Gral_listaRequerimiento.jsp").forward(request, response);
		}
		
		ArrayList<Gral_oficioBeneficiario> OfciosByApertura = Gral_oficioBeneficiarioDao.GetOficioByApertura(aperturaProceso.getIdAperturaProceso());
		ArrayList<medicamentos> medicamentos = medicamentosDao.GeMedicamentos();
		
		
		session.setAttribute("numProcesoCompra", aperturaProceso.getNumProcesoCompra());
		session.setAttribute("tipoCompra", aperturaProceso.getDescripcionCompra());
		
		//session.setAttribute("idAperturaProceso", aperturaProceso.getIdAperturaProceso());
		request.setAttribute("beneficiario", aperturaProceso.getbeneficiario());
		request.setAttribute("OfciosByApertura", OfciosByApertura);
		request.setAttribute("medicamentos", medicamentos);
		request.getRequestDispatcher("Gral_listaRequerimiento.jsp").forward(request, response);
		request.setAttribute("throughServlet", "true");

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
