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
@WebServlet("/Gral_controlGarantiasServlet")
@MultipartConfig
public class Gral_controlGarantiasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_controlGarantiasServlet() {
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
		
		try {
		
			String accion = (String) session.getAttribute("accion");
			System.out.println("----------------------"+ accion);
			Gral_controlGarantias controlGarantias = new Gral_controlGarantias();
		controlGarantias.setIdcontratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
		System.out.println("---idcontrato "+ controlGarantias.getIdcontratoOrdenCompra());
		controlGarantias.setTipoGarantia(request.getParameter("tipoGarantia"));
		System.out.println("---tipoGarantia "+ controlGarantias.getTipoGarantia());
		
		controlGarantias.setTipoDocumento(request.getParameter("tipoDocumento"));
		System.out.println("---tipoDocumento "+ controlGarantias.getTipoDocumento());
		controlGarantias.setMonedaCompra(request.getParameter("monedaCompra"));
		System.out.println("---monedaCompra "+ controlGarantias.getMonedaCompra());
		controlGarantias.setFechaFirma(request.getParameter("fechaFirma"));
		System.out.println("---fechaFirma "+ controlGarantias.getFechaFirma());
		controlGarantias.setPrecioTotal(Float.parseFloat(request.getParameter("precioTotal")));
		System.out.println("---precioTotal "+ controlGarantias.getPrecioTotal());
		controlGarantias.setNombreInstitucionFinanciera(request.getParameter("nombreInstitucionFinanciera"));
		System.out.println("---nombreInstitucionFinanciera "+ controlGarantias.getNombreInstitucionFinanciera());
		controlGarantias.setNumGarantia(request.getParameter("numGarantia"));
		System.out.println("---numGarantia "+ controlGarantias.getNumGarantia());
		controlGarantias.setNumGarantiaEnmienda(request.getParameter("numGarantiaEnmienda"));
		System.out.println("---numGarantiaEnmienda "+ controlGarantias.getNumGarantiaEnmienda());
		controlGarantias.setMonedaGarantia(request.getParameter("monedaGarantia"));
		System.out.println("---monedaGarantia "+ controlGarantias.getMonedaGarantia());
		controlGarantias.setTasaCambio(Float.parseFloat(request.getParameter("tasaCambio")));
		System.out.println("---tasaCambio "+ controlGarantias.getTasaCambio());
		controlGarantias.setValorGarantia(request.getParameter("valorGarantia"));
		System.out.println("---valorGarantia "+ controlGarantias.getValorGarantia());
		controlGarantias.setUsuarioResponsable(request.getParameter("usuarioResponsable"));
		System.out.println("---usuarioResponsable "+ controlGarantias.getUsuarioResponsable());
		controlGarantias.setFechaEmision(request.getParameter("fechaEmision"));
		System.out.println("---getFechaEmision "+ controlGarantias.getFechaEmision());
		controlGarantias.setFechaInicioValidez(request.getParameter("fechaInicioValidez"));
		System.out.println("---getFechaInicioValidez "+ controlGarantias.getFechaInicioValidez());
		controlGarantias.setFechaFinValidez(request.getParameter("fechaFinValidez"));
		System.out.println("---getFechaFinValidez "+ controlGarantias.getFechaFinValidez());
		controlGarantias.setHoraVencimiento(request.getParameter("horaVencimiento"));
		System.out.println("---getHoraVencimiento "+ controlGarantias.getHoraVencimiento());
		controlGarantias.setDiasAnticipacion(Integer.parseInt(request.getParameter("diasAnticipacion")));
		System.out.println("---getDiasanticipacion "+ controlGarantias.getDiasAnticipacion());
		controlGarantias.setCorreo1(request.getParameter("correo1"));
		System.out.println("---getCorreo1 "+ controlGarantias.getCorreo1());
		controlGarantias.setCorreo2(request.getParameter("correo2"));
		controlGarantias.setCorreo3(request.getParameter("correo3"));
		controlGarantias.setCorreo4(request.getParameter("correo4"));
		controlGarantias.setCorreo5(request.getParameter("correo5"));
		controlGarantias.setCorreo6(request.getParameter("correo6"));
		controlGarantias.setNombreDocumento(request.getParameter("nombreDocumento"));
		System.out.println("---nombreDocumento "+ controlGarantias.getNombreDocumento());
		controlGarantias.setEstado1("GARANTIA VIGENTE");
		controlGarantias.setEstado2(" ");
		controlGarantias.setObservaciones(request.getParameter("observaciones"));
		System.out.println("---getObservaciones "+ controlGarantias.getObservaciones());
		

		
		if (accion != null && !accion.contentEquals("cancelar")) {
			
			int status = 0;
			switch (accion) {
			case "nuevo":
			System.out.println("----------------------2"+ accion);
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				controlGarantias.setNombreDocumento(controlGarantias.getNumGarantia() + "_" + controlGarantias.getIdcontratoOrdenCompra() + "_" + controlGarantias.getFechaFirma() + ".pdf");
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getSubmittedFileName();
				String contextPath = getServletContext().getRealPath("/assets/files/warrantyControlFiles/" + controlGarantias.getNumGarantia() + "_" + 
				controlGarantias.getIdcontratoOrdenCompra() + "_" + controlGarantias.getFechaFirma() + ".pdf");
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					controlGarantias.setIdControlGarantias(Gral_controlGarantiasDao.save(controlGarantias));
					
					
				}
			}
			
			break;
			
		}
	}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("controlGarantiasGeneral.jsp").forward(request, response);
	}
		catch (Exception e) {
			
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
