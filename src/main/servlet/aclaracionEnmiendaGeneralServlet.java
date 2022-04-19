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
 * Servlet implementation class aclaracionesEnmiendasServlet
 */
@WebServlet("/aclaracionEnmiendaGeneralServlet")
@MultipartConfig
public class aclaracionEnmiendaGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public aclaracionEnmiendaGeneralServlet() {
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

		String id = request.getParameter("id");

		String noProcesoCompra = request.getParameter("processNum");
		String fecha = request.getParameter("amendmentDate");
		String tipo = request.getParameter("amendmentType");
		String horaLimite = request.getParameter("deadlineHour");
		String fechaLimite = request.getParameter("deadlineDate");
		String diaApertura = request.getParameter("apertDate");
		String horaApertura = request.getParameter("apertHour");
		String lugarApertura = request.getParameter("apertLocation");
		String observacion = request.getParameter("amendmentObs");

		long correlativo = aclaracionEnmiendaGeneralDao.getNewCorrelative(tipo, noProcesoCompra);
		String amendmentProduct = (String) request.getParameter("amendmentProductCheck");

		String wizardMode = request.getParameter("submit");
		if (wizardMode == null) {
			wizardMode = "guardar";
		}

		if (funcion != null && !funcion.isEmpty()) {
			switch (funcion) {
				case "nuevo":
					aclaracionEnmiendaGeneral a = new aclaracionEnmiendaGeneral();

					a.setProcesoCompra(noProcesoCompra);
					a.setFecha(fecha);
					a.setTipo(tipo);
					a.setHoraLimite(horaLimite);
					a.setDiaLimite(fechaLimite);
					a.setDiaApertura(diaApertura);
					a.setHoraApertura(horaApertura);
					a.setLugarApertura(lugarApertura);
					a.setObservaciones(observacion);
					a.setCorrelativoDocumento(correlativo);

//					if (amendmentProduct != null && !amendmentProduct.isEmpty()) {
//						a.setModificacionProductos("SI");
//					} else {
//						a.setModificacionProductos("NO");
//					}

					Part filePart = request.getPart("documentFile");

					if (filePart != null && filePart.getSize() > 0) {
						a.setDocumento(tipo + "_" + noProcesoCompra + "_" + fecha + ".pdf");
						InputStream fileContent = filePart.getInputStream();
						byte[] buffer = new byte[fileContent.available()];
						fileContent.read(buffer);

						String contextPath = getServletContext().getRealPath("/assets/files/amendmentsGeneralFiles/" + tipo
								+ "_" + noProcesoCompra + "_" + fecha + ".pdf");

						File dest = new File(contextPath);
						if (!dest.exists()) {
							dest.createNewFile();
							OutputStream outStream = new FileOutputStream(dest);
							outStream.write(buffer);
							outStream.close();

							aclaracionEnmiendaGeneralDao.save(a);
						}
					}

					if (wizardMode.equalsIgnoreCase("continuar")) {
						session.setAttribute("noProcesoCompra", noProcesoCompra);
						request.getRequestDispatcher("nAmendmentEstListForGeneral.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
					}
					break;
				case "modificar":
					aclaracionEnmiendaGeneral ma = new aclaracionEnmiendaGeneral();
					ma.setProcesoCompra(noProcesoCompra);
					ma.setFecha(fecha);
					ma.setHoraLimite(horaLimite);
					ma.setDiaLimite(fechaLimite);
					ma.setDiaApertura(diaApertura);
					ma.setHoraApertura(horaApertura);
					ma.setLugarApertura(lugarApertura);
					ma.setObservaciones(observacion);

//					if (amendmentProduct != null && !amendmentProduct.isEmpty()) {
//						ma.setModificacionProductos("SI");
//					} else {
//						ma.setModificacionProductos("NO");
//					}

					Part mfilePart = request.getPart("documentFile");

					if (mfilePart != null && mfilePart.getSize() > 0) {
						ma.setDocumento(tipo + "_" + noProcesoCompra + "_" + fecha + ".pdf");
						InputStream fileContent = mfilePart.getInputStream();
						byte[] buffer = new byte[fileContent.available()];
						fileContent.read(buffer);

						String contextPath = getServletContext().getRealPath("/assets/files/amendmentsGeneralFiles/" + tipo
								+ "_" + noProcesoCompra + "_" + fecha + ".pdf");

						File dest = new File(contextPath);
						dest.createNewFile();
						OutputStream outStream = new FileOutputStream(dest);
						outStream.write(buffer);
						outStream.close();
						aclaracionEnmiendaGeneralDao.updateWithDocument(Integer.parseInt(id), ma);
					} else {
						aclaracionEnmiendaGeneralDao.updateWithOutDocument(Integer.parseInt(id), ma);
					}

					if (wizardMode.equalsIgnoreCase("continuar")) {
						session.setAttribute("noProcesoCompra", noProcesoCompra);
						request.getRequestDispatcher("nAmendmentEstListForGeneral.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
					}
					break;
				default:
					String openMode = "disabled";
					request.setAttribute("openMode", openMode);

					if (wizardMode.equalsIgnoreCase("continuar")) {
						session.setAttribute("noProcesoCompra", noProcesoCompra);
						request.getRequestDispatcher("nAmendmentEstListForGeneral.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
					}
					break;
			}
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
