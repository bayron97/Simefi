package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

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
@WebServlet("/Gral_indexAperturaProcesoServlet")
@MultipartConfig
public class Gral_indexAperturaProcesoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_indexAperturaProcesoServlet() {
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

		String accion = (String) session.getAttribute("accion");

		String submit = request.getParameter("submit");
		String[] iddocumentos = request.getParameterValues("iddocumentos");
		String[] nombresarchivos = request.getParameterValues("nombresarchivos");
		String[] descripcionesarchivos = request.getParameterValues("descripcionesarchivos");
	
		
		Gral_aperturaProceso apertura = new Gral_aperturaProceso();	
		
		apertura.setIdAperturaProceso((int)session.getAttribute("idAperturaProceso"));
		apertura.setEstado(request.getParameter("estado"));		
		
		
		apertura.setObservaciones(request.getParameter("observaciones"));
		if(request.getParameter("observaciones") == null) {
			apertura.setObservaciones("NINGUNA");
		}
		
		

		if (submit != null && !submit.contentEquals("cancelar")) {
			
			Gral_terminosReferencia terminoReferencia = new Gral_terminosReferencia();

			switch (accion) {
				case "nuevo":
					
					int update = Gral_aperturaProcesoDao.updateEstado(apertura);
					if(update > 0) {
						if (iddocumentos != null) {							
								for (int i = 0; i < iddocumentos.length; i++) {
									if (iddocumentos[i].contentEquals(String.valueOf(i))) {
										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);
										if (filePart != null && filePart.getSize() > 0) {
											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = nombresarchivos[i];
											String contextPath = getServletContext().getRealPath(
													"/assets/files/buyProcessGeneralFiles/digitizedDocument/" + fileName);
											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
												
												terminoReferencia.setIdAperturaProceso(apertura.getIdAperturaProceso());
												terminoReferencia.setNombreDocumento(fileName);
												terminoReferencia.setDescripcion(descripcionesarchivos[i]);												
												Gral_terminosReferenciaDao.save(terminoReferencia);

											}
										}

									}
								}							
						}
					}
				
					
					break;
				case "modificar":
					 update = Gral_aperturaProcesoDao.updateEstado(apertura);
					if(update > 0) {
						if (iddocumentos != null) {							
								for (int i = 0; i < iddocumentos.length; i++) {
									
										String inputName = "oficioFiles_" + i;
										Part filePart = request.getPart(inputName);
										if (filePart != null && filePart.getSize() > 0) {
											InputStream fileContent = filePart.getInputStream();
											byte[] buffer = new byte[fileContent.available()];
											fileContent.read(buffer);
											String fileName = nombresarchivos[i];
											String contextPath = getServletContext().getRealPath(
													"/assets/files/buyProcessGeneralFiles/digitizedDocument/" + fileName);
											File dest = new File(contextPath);
											if (!dest.exists()) {
												dest.createNewFile();
												OutputStream outStream = new FileOutputStream(dest);
												outStream.write(buffer);
												outStream.close();
												
												terminoReferencia.setIdAperturaProceso(apertura.getIdAperturaProceso());
												terminoReferencia.setNombreDocumento(fileName);
												terminoReferencia.setDescripcion(descripcionesarchivos[i]);												
												Gral_terminosReferenciaDao.save(terminoReferencia);

											}
										}

								}							
						}
					}
				
					break;
				case "consultar":
					break;
				case "revisar":
					 update = Gral_aperturaProcesoDao.updateEstado(apertura);					
					break;
				case "eliminar":
					break;
				default:
					break;
			}
			session.removeAttribute("numProcesoCompra");
			session.removeAttribute("tipoCompra");
			session.removeAttribute("idAperturaProceso");
			session.removeAttribute("read");
			session.removeAttribute("disable");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("purchaseProcessesGeneral.jsp").forward(request, response);
		} else {
			session.removeAttribute("numProcesoCompra");
			session.removeAttribute("tipoCompra");
			session.removeAttribute("idAperturaProceso");
			session.removeAttribute("read");
			session.removeAttribute("disable");
			request.setAttribute("throughServlet", "true");
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
