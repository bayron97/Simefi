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
@WebServlet("/contratoSuministroServlet")
@MultipartConfig
public class contratoSuministroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contratoSuministroServlet() {
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
		//String func = (String) session.getAttribute("funcion");
		
		String Id = request.getParameter("Id");
		String procesocompra = request.getParameter("procesocompra");
		String procesocompracod = request.getParameter("procesocompracod");
		String ordencompra = request.getParameter("ordencompra");
		String proveedor = request.getParameter("proveedor");
		String fechasuscripcion = request.getParameter("fechasuscripcion");
		String myfileName = request.getParameter("myfileName");
		String observaciones = request.getParameter("observaciones");
		
		String[] iddocumentos = request.getParameterValues("iddocumentos");
		String[] nombresarchivos = request.getParameterValues("nombresarchivos");
		String[] descripcionesarchivos = request.getParameterValues("descripcionesarchivos");

		contratoSuministro a = new contratoSuministro();
		a.setDocumentName(myfileName);

		if (Id.contentEquals("-1")) {
			
//			Part filePart = request.getPart("myfile");
//			if (filePart != null && filePart.getSize() > 0) {
//				a.setDocumentName(ordencompra + "_" + proveedor + "_" +  ".pdf");
//				InputStream fileContent = filePart.getInputStream();
//				byte[] buffer = new byte[fileContent.available()];
//				fileContent.read(buffer);
//				String fileName = filePart.getSubmittedFileName();
//				String contextPath = getServletContext().getRealPath("/assets/files/contractSupplyFiles/" + ordencompra + "_" + proveedor + "_" +  ".pdf");
//				File dest = new File(contextPath);
//				if (!dest.exists()) {
//					dest.createNewFile();
//					OutputStream outStream = new FileOutputStream(dest);
//					outStream.write(buffer);
//					outStream.close();
//					
//					a.setBuyProcessId(Integer.parseInt(procesocompra));
//					a.setBuyOrderId(ordencompra);
//					a.setBuyProcessCod(procesocompracod);
//					a.setDistribuidor(proveedor);
//					a.setFecha(fechasuscripcion);
//					a.setDocumentName(ordencompra + "_" + proveedor + "_" +  ".pdf");
//					a.setObservaciones(observaciones);
//					System.out.println("fiel" + contextPath);
//					contratoSuministroDao.save(a);
//				}
//			}
			
			a.setBuyProcessId(Integer.parseInt(procesocompra));
			a.setBuyOrderId(ordencompra);
			a.setBuyProcessCod(procesocompracod);
			a.setDistribuidor(proveedor);
			a.setFecha(fechasuscripcion);
			a.setDocumentName( "_");
			a.setObservaciones(observaciones);
		int idcontrato =  contratoSuministroDao.save(a);
		
		System.out.println(idcontrato);
		System.out.println(iddocumentos[0]);
		System.out.println(nombresarchivos[0]);
		System.out.println(descripcionesarchivos[0]);
			
			if (idcontrato > 0) {
				System.out.println("AQUI VIENE" + idcontrato);
				for (int i = 0; i < nombresarchivos.length; i++) {
					System.out.println("AQUI VIENE" + nombresarchivos[i]);
					for (int j = 0; j < iddocumentos.length; j++) {
						System.out.println("AQUI VIENE" + iddocumentos[j]);
						if (iddocumentos[j].contentEquals("NO DISPONIBLE")) {
							String inputName = "contratoSuministrosFiles_" + i;
							Part filePart = request.getPart(inputName);
							System.out.println("FILEPARTAQUI " + filePart);
							if (filePart != null && filePart.getSize() > 0) {
								System.out.println("ruta");
								InputStream fileContent = filePart.getInputStream();
								byte[] buffer = new byte[fileContent.available()];
								fileContent.read(buffer);
								String fileName = nombresarchivos[i];
								String contextPath = getServletContext().getRealPath(
										"/assets/files/contractSupplyFiles/" + idcontrato + "_" + fileName);
								File dest = new File(contextPath);
								if (!dest.exists()) {
									dest.createNewFile();
									OutputStream outStream = new FileOutputStream(dest);
									outStream.write(buffer);
									outStream.close();

									contratosuministrodocumento newDocument = new contratosuministrodocumento();
									newDocument.setdescripcionesArchivos(descripcionesarchivos[i]);
									newDocument.setnombresArchivos(fileName);
									newDocument.setidDocumentos(String.valueOf(i));
									newDocument.setidContrato(idcontrato);
									contratoSuministroDao.savedocument(newDocument);
									System.out.println(descripcionesarchivos[i]);
									System.out.println(nombresarchivos[i]);
									System.out.println(iddocumentos[i]);
									System.out.println(idcontrato);
								}
							}

						}
					}

				}
			}
			
			
		} else {
			a.setBuyOrderId(ordencompra);
			a.setFecha(fechasuscripcion);
			a.setObservaciones(observaciones);
			int idcontrato =  contratoSuministroDao.update(a);
			
			System.out.println(idcontrato);
			System.out.println(iddocumentos[0]);
			System.out.println(nombresarchivos[0]);
			System.out.println(descripcionesarchivos[0]);
				
				if (idcontrato > 0) {
					System.out.println("AQUI VIENE" + idcontrato);
					for (int i = 0; i < nombresarchivos.length; i++) {
						System.out.println("AQUI VIENE" + nombresarchivos[i]);
						for (int j = 0; j < iddocumentos.length; j++) {
							System.out.println("AQUI VIENE" + iddocumentos[j]);
							if (iddocumentos[j].contentEquals("NO DISPONIBLE")) {
								String inputName = "contratoSuministrosFiles_" + i;
								Part filePart = request.getPart(inputName);
								System.out.println("FILEPARTAQUI " + filePart);
								if (filePart != null && filePart.getSize() > 0) {
									System.out.println("ruta");
									InputStream fileContent = filePart.getInputStream();
									byte[] buffer = new byte[fileContent.available()];
									fileContent.read(buffer);
									String fileName = nombresarchivos[i];
									String contextPath = getServletContext().getRealPath(
											"/assets/files/contractSupplyFiles/" + idcontrato + "_" + fileName);
									File dest = new File(contextPath);
									if (!dest.exists()) {
										dest.createNewFile();
										OutputStream outStream = new FileOutputStream(dest);
										outStream.write(buffer);
										outStream.close();

										contratosuministrodocumento newDocument = new contratosuministrodocumento();
										newDocument.setdescripcionesArchivos(descripcionesarchivos[i]);
										newDocument.setnombresArchivos(fileName);
										newDocument.setidDocumentos(String.valueOf(i));
										newDocument.setidContrato(idcontrato);
										contratoSuministroDao.updatedocument(newDocument);
										System.out.println(descripcionesarchivos[i]);
										System.out.println(nombresarchivos[i]);
										System.out.println(iddocumentos[i]);
										System.out.println(idcontrato);
									}
								}

							}
						}

					}
				}
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("contratoSuministroALP.jsp").forward(request, response);
//		request.getRequestDispatcher("nContratoSuministroDigForALP.jsp").forward(request, response);
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
