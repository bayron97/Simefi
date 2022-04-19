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
@WebServlet("/digitizedDocumentALPServlet")
@MultipartConfig
public class digitizedDocumentALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public digitizedDocumentALPServlet() {
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

		String funcion = (String) session.getAttribute("funcion");

		String submit = request.getParameter("submit");
		String[] iddocumentos = request.getParameterValues("iddocumentos");
		String[] nombresarchivos = request.getParameterValues("nombresarchivos");
		String[] descripcionesarchivos = request.getParameterValues("descripcionesarchivos");
		String Estado = request.getParameter("estado");
		String observaciones = request.getParameter("observaciones");
		String noProcCompra = request.getParameter("noProcCompra");
		String fecha = request.getParameter("fecha");

		int idProcesoCompra = 0;

		if (session.getAttribute("noCompra") != null) {
			String proce = Integer.toString((int) session.getAttribute("noCompra"));
			idProcesoCompra = Integer.parseInt(proce);
		}
		if (observaciones == null) {
			observaciones = "NINGUNA";
		}

		if (submit != null && !submit.contentEquals("cancelar")) {

			switch (funcion) {
				case "nuevo":
					System.out.println("NUEVO " );
					procesoCompraALPDao.updateEstado(Estado, idProcesoCompra, observaciones);
					if (iddocumentos != null && nombresarchivos != null && descripcionesarchivos != null) {
						for (int i = 0; i < nombresarchivos.length; i++) {
							System.out.println("narchivo " + nombresarchivos[i]);
							for (int j = 0; j < iddocumentos.length; j++) {
								System.out.println("idocumento " + iddocumentos[i]);
								if (iddocumentos[j].contentEquals(String.valueOf(i))) {
									System.out.println("idocumento2 " + iddocumentos[i]);
									String inputName = "oficioFiles_" + i;
									Part filePart = request.getPart(inputName);
									System.out.println("filepart " + filePart);
									if (filePart != null && filePart.getSize() > 0) {
										InputStream fileContent = filePart.getInputStream();
										byte[] buffer = new byte[fileContent.available()];
										fileContent.read(buffer);
										String fileName = nombresarchivos[j];
										String contextPath = getServletContext().getRealPath(
												"/assets/files/buyProcessALPFiles/digitizedDocument/" + fileName);
										File dest = new File(contextPath);
										if (!dest.exists()) {
											dest.createNewFile();
											OutputStream outStream = new FileOutputStream(dest);
											outStream.write(buffer);
											outStream.close();

											digitizedDocumentALP newDocument = new digitizedDocumentALP();
											newDocument.setBuyProcessID(idProcesoCompra);
											newDocument.setDocumentName(fileName);
											newDocument.setDocumentDescription(descripcionesarchivos[j]);
											digitizedDocumentALPDao.save(newDocument);
										}
									}

								}
							}

						}
					}
					break;
				case "modificar":
					procesoCompraALPDao.updateEstado(Estado, idProcesoCompra, observaciones);
					if (iddocumentos != null && nombresarchivos != null && descripcionesarchivos != null) {
						for (int i = 0; i < nombresarchivos.length; i++) {
							for (int j = 0; j < iddocumentos.length; j++) {
								if (iddocumentos[j].contentEquals(String.valueOf(i))) {
									String inputName = "oficioFiles_" + i;
									Part filePart = request.getPart(inputName);
									if (filePart != null && filePart.getSize() > 0) {
										InputStream fileContent = filePart.getInputStream();
										byte[] buffer = new byte[fileContent.available()];
										fileContent.read(buffer);
										String fileName = nombresarchivos[j];
										String contextPath = getServletContext().getRealPath(
												"/assets/files/buyProcessALPFiles/digitizedDocument/" + fileName);
										File dest = new File(contextPath);
										if (!dest.exists()) {
											dest.createNewFile();
											OutputStream outStream = new FileOutputStream(dest);
											outStream.write(buffer);
											outStream.close();

											digitizedDocumentALP newDocument = new digitizedDocumentALP();
											newDocument.setBuyProcessID(idProcesoCompra);
											newDocument.setDocumentName(fileName);
											newDocument.setDocumentDescription(descripcionesarchivos[j]);
											digitizedDocumentALPDao.save(newDocument);
										}
									}

								}
							}

						}
					}
					break;
				case "consultar":
					break;
				case "revisar":
					procesoCompraALPDao.updateEstado(Estado, idProcesoCompra, observaciones);
					if (Estado.contentEquals("APROBADO")) {
						vaciadoOfertasALP v = new vaciadoOfertasALP();
						v.setProcesoCompra(noProcCompra);
						v.setFecha(fecha);
						v.setProductosConOfertas(0);
						v.setProductosRecomendados(0);
						v.setProductosEstimados(0);
						v.setProductosCompletados(0);
						v.setProductosAnulados(0);
						v.setProductosDesiertos(0);
						vaciadoOfertasALPDao.save(v);
						vaciadoOfertasALPDao.updateProductEstimate(idProcesoCompra);

					}
					break;
				case "eliminar":
					break;
				default:
					break;
			}
			session.removeAttribute("noCompra");
			session.removeAttribute("read");
			session.removeAttribute("disable");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("purchaseProcessesALP.jsp").forward(request, response);
		} else {
			session.removeAttribute("noCompra");
			session.removeAttribute("read");
			session.removeAttribute("disable");
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("purchaseProcessesALP.jsp").forward(request, response);
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
