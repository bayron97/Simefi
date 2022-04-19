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
@WebServlet("/controlGarantiasGeneralServlet")
@MultipartConfig
public class controlGarantiasGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controlGarantiasGeneralServlet() {
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
		String tipogarantia = request.getParameter("tipogarantia");
		String nogarantia = request.getParameter("nogarantia");
		String fechaemision = request.getParameter("fechaemision");
		String fechacaducidad = request.getParameter("fechacaducidad");
		String fecha = request.getParameter("fecha");
		String myfileName = request.getParameter("myfileName");
		String diasanticipacion = request.getParameter("diasanticipacion");
		
		String beneficiario = request.getParameter("beneficiario");
		String tipoProcesoCompra = request.getParameter("tipoProcesoCompra");
		String valorGarantia = request.getParameter("valorGarantia");
		String correo1 = request.getParameter("correo1");
		String correo2 = request.getParameter("correo2");
		String correo3 = request.getParameter("correo3");

		System.out.println(Id + "----------------------");
		
		controlGarantiasGeneral a = new controlGarantiasGeneral();
		a.setDocumentName(myfileName);

		if (Id.contentEquals("-1")) {
			System.out.println("----------------------");
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				System.out.println(Id + "----------------------");
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getSubmittedFileName();
				String contextPath = getServletContext().getRealPath("/assets/files/warrantyControlFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					System.out.println("----------------------");
					a.setBuyProcessId(Integer.parseInt(procesocompra));
					a.setBuyOrderId(ordencompra);
					a.setBuyProcessCod(procesocompracod);
					a.setWarrantytype(tipogarantia);
					a.setWarrantyNo(nogarantia);
					a.setFechaemision(fechaemision);
					a.setFechacaducidad(fechacaducidad);
					a.setFecha(fecha);
					a.setDiasanticipacion(Integer.parseInt(diasanticipacion));
					a.setDocumentName(fileName);
					a.setEstado("GARANTIA VIGENTE");
					a.setbeneficiario(beneficiario);
					a.settipoProcesoCompra(tipoProcesoCompra);
					a.setvalorGarantia(valorGarantia);
					a.setcorreo1(correo1);
					a.setcorreo2(correo2);
					a.setcorreo3(correo3);
					
					controlGarantiasGeneralDao.save(a);
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
						"/assets/files/warrantyControlFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					a.setDocumentName(fileName);
				}
			}
			a.setBuyProcessId(Integer.parseInt(procesocompra));
			a.setBuyOrderId(ordencompra);
			a.setBuyProcessCod(procesocompracod);
			a.setWarrantytype(tipogarantia);
			a.setWarrantyNo(nogarantia);
			a.setFechaemision(fechaemision);
			a.setFechacaducidad(fechacaducidad);
			a.setFecha(fecha);
			a.setDiasanticipacion(Integer.parseInt(diasanticipacion));
			a.setEstado("GARANTIA VIGENTE");
			a.setbeneficiario(beneficiario);
			a.settipoProcesoCompra(tipoProcesoCompra);
			a.setvalorGarantia(valorGarantia);
			a.setcorreo1(correo1);
			a.setcorreo2(correo2);
			a.setcorreo3(correo3);
			a.setId(Integer.parseInt(Id));
			controlGarantiasGeneralDao.update(a);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("controlGarantiasGeneral.jsp").forward(request, response);
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
