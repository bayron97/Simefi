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
@WebServlet("/Gral_contratoOrdenCompraIndexServlet")
@MultipartConfig
public class Gral_contratoOrdenCompraIndexServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratoOrdenCompraIndexServlet() {
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
		
		Gral_contratoOrdenCompra contratoOrdenCompra = new Gral_contratoOrdenCompra();
			
		contratoOrdenCompra.setIdAperturaProceso(Integer.parseInt(request.getParameter("idAperturaProceso")));
		contratoOrdenCompra.setIdProveedor(Integer.parseInt(request.getParameter("idProveedor")));
		contratoOrdenCompra.setNombreProveedor(request.getParameter("nombreProveedor"));
		contratoOrdenCompra.setTipoDocuemnto(request.getParameter("tipoDocuemnto"));
		contratoOrdenCompra.setNumDocumento(request.getParameter("numDocumento"));
		contratoOrdenCompra.setFechaSuscripcion(request.getParameter("fechaSuscripcion"));
		contratoOrdenCompra.setObservaciones(request.getParameter("observaciones"));
		contratoOrdenCompra.setDocumento(request.getParameter("myfileName"));
		
		String accion = (String) session.getAttribute("accion");
		

		if (accion.contentEquals("nuevo")) {
			
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getSubmittedFileName();
				String contextPath = getServletContext().getRealPath("/assets/files/contractSupplyFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();					
					contratoOrdenCompra.setDocumento(fileName);					
					Gral_contratoOrdenCompraDao.save(contratoOrdenCompra);
				}
			}
			
		} else if (accion.contentEquals("modificar")) {
			contratoOrdenCompra.setIdcontratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
			
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getName();
				String contextPath = getServletContext().getRealPath(
						"/assets/files/contractSupplyFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();					
				}
				contratoOrdenCompra.setDocumento(fileName);		
				Gral_contratoOrdenCompraDao.update(contratoOrdenCompra);
			}else {
				Gral_contratoOrdenCompraDao.updateNoDocumwnto(contratoOrdenCompra);
			}			
		}

		session.removeAttribute("idcontratoOrdenCompra");
		session.removeAttribute("type");
		//session.removeAttribute("accion");
		session.removeAttribute("read");
		session.removeAttribute("disable");
		session.removeAttribute("proveedoresList");
		session.removeAttribute("numProcesoAperturaList");
		
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("contratoSuministroGeneral.jsp").forward(request, response);
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
