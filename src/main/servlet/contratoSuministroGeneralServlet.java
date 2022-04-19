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
@WebServlet("/contratoSuministroGeneralServlet")
@MultipartConfig
public class contratoSuministroGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contratoSuministroGeneralServlet() {
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

		contratoSuministroGeneral a = new contratoSuministroGeneral();
		a.setDocumentName(myfileName);

		if (Id.contentEquals("-1")) {
			
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
					
					a.setBuyProcessId(Integer.parseInt(procesocompra));
					a.setBuyOrderId(ordencompra);
					a.setBuyProcessCod(procesocompracod);
					a.setDistribuidor(proveedor);
					a.setFecha(fechasuscripcion);
					a.setDocumentName(fileName);
					a.setObservaciones(observaciones);
					contratoSuministroGeneralDao.save(a);
				}
			}
			
		} else {
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
					a.setDocumentName(fileName);
				}
			}
			a.setId(Integer.parseInt(Id));
			a.setBuyProcessId(Integer.parseInt(procesocompra));
			a.setBuyOrderId(ordencompra);
			a.setBuyProcessCod(procesocompracod);
			a.setDistribuidor(proveedor);
			a.setFecha(fechasuscripcion);
			a.setObservaciones(observaciones);
			contratoSuministroGeneralDao.update(a);
		}

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
