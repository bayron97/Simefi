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
@WebServlet("/contratacionesServlet")
@MultipartConfig
public class contratacionesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contratacionesServlet() {
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
		String func = (String) session.getAttribute("funcion");
		
		System.out.println(func + " func");
		
		int Id = (int) session.getAttribute("Id");
		String idvalidador = String.valueOf(Id);
		System.out.println(Id + " set id");
		String procesocompra = request.getParameter("procesocompra");
		String procesocompracod = request.getParameter("procesocompracod");
		String beneficiario = request.getParameter("beneficiario");
		String nombrebeneficiario = request.getParameter("nombrebeneficiario");
		String solicitudcompra = request.getParameter("solicitudcompra");
		String nombresolicitudcompra= request.getParameter("nombresolicitudcompra");
		String proveedor = request.getParameter("proveedor");
		String nombreproveedor = request.getParameter("nombreproveedor");
		String ordencompra = request.getParameter("ordencompra");
		
		String fechasuscripcion = request.getParameter("fechasuscripcion");
		String observaciones = request.getParameter("observaciones");
		String myfileName = request.getParameter("myfileName");
		
		contrataciones a = new contrataciones();
		contratacionesDetalle b = new contratacionesDetalle();
		listaRequerimientoSolicitudDisponibilidadALP c = new listaRequerimientoSolicitudDisponibilidadALP();
		a.setNombreDocumento(myfileName);
		int statusG=0;
		
		if (func != null && !func.isEmpty()) {
//			String openMode = session.getAttribute("openMode").toString();
//			request.setAttribute("openMode", openMode);
			request.setAttribute("funcion", func);
		
		switch (func) {
		
		
		case "refres":
			break;
		case "nuevo":
			if (idvalidador.contentEquals("-1")) {
				
				
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getSubmittedFileName();
				String contextPath = getServletContext().getRealPath("/assets/files/contractsFiles/" + fileName);
				System.out.println(contextPath);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					
					a.setIdProcesoCompra(Integer.parseInt(procesocompra));
					a.setIdBeneficiario(Integer.parseInt(beneficiario));
					a.setIdProveedor(0);
					a.setIdSolicitudCompra(Integer.parseInt(solicitudcompra));
					a.setProcesoCompra(procesocompracod);
					a.setBeneficiario(nombrebeneficiario);
					a.setProveedor(proveedor);
					a.setSolicitudCompra(nombresolicitudcompra);
//					String codigo=contratacionesDao.getOrdenCompra();
//					if(codigo.contentEquals("")) {
//						codigo="OC2021-1";
//					}
					
					System.out.println(procesocompracod +"------------- "+ nombrebeneficiario);
					
					String codigo = contratacionesDao.getOrdenCompra(procesocompracod, nombrebeneficiario);
					System.out.println("codigo " + codigo);
					if(codigo.contentEquals("")) {
						codigo="OC2021-1";
					}
					System.out.println("codigo " + codigo);
					
					a.setNoOrdenCompra(codigo);
					a.setFechaSuscripcion(fechasuscripcion);
					a.setNombreDocumento(fileName);
					a.setObservaciones(observaciones);
					statusG=contratacionesDao.save(a);
				
				}
			}
			
			contrataciones p = contratacionesDao.getById(statusG);
			
			session.setAttribute("Id", statusG);
			session.setAttribute("procesocompra", p.getIdProcesoCompra());
			session.setAttribute("beneficiario", p.getIdBeneficiario());
			session.setAttribute("solicitudcompra", p.getIdSolicitudCompra());
			session.setAttribute("nombreproveedor", p.getProveedor());
			request.setAttribute("procesocompracod", p.getProcesoCompra());
			request.setAttribute("ordencompra", p.getNoOrdenCompra());
			request.setAttribute("nombreproveedor", p.getProveedor());
			request.setAttribute("nombrebeneficiario", p.getBeneficiario());
			request.setAttribute("nombresolicitudcompra", p.getSolicitudCompra());
			request.setAttribute("fechasuscripcion", p.getFechaSuscripcion());
			request.setAttribute("myfile", p.getNombreDocumento());
			request.setAttribute("observaciones", p.getObservaciones());
			session.setAttribute("funcion", "nuevo");
			}else {
				
				System.out.println("else");
				contrataciones p = contratacionesDao.getById(Id);
				
				session.setAttribute("Id",Id);
				System.out.println(Id + " set id else");
				session.setAttribute("procesocompra", p.getIdProcesoCompra());
				session.setAttribute("beneficiario", p.getIdBeneficiario());
				session.setAttribute("solicitudcompra", p.getIdSolicitudCompra());
				session.setAttribute("nombreproveedor", p.getProveedor());
				request.setAttribute("procesocompracod", p.getProcesoCompra());
				request.setAttribute("ordencompra", p.getNoOrdenCompra());
				request.setAttribute("nombreproveedor", p.getProveedor());
				request.setAttribute("nombrebeneficiario", p.getBeneficiario());
				request.setAttribute("nombresolicitudcompra", p.getSolicitudCompra());
				request.setAttribute("fechasuscripcion", p.getFechaSuscripcion());
				request.setAttribute("myfile", p.getNombreDocumento());
				request.setAttribute("observaciones", p.getObservaciones());
				session.setAttribute("funcion", "nuevo");
				
			}
//			session.setAttribute("type", t);
//			//session.setAttribute("noCompra", cod);
//			session.setAttribute("funcion", "nuevo");
//			session.setAttribute("ogFunc", "nuevo");
//			session.setAttribute("read", read);
//			session.setAttribute("disable", disable);
			
			request.getRequestDispatcher("nOrdenDeCompraDetalle.jsp").forward(request, response);
			
			break;
		case "modificar":
			//Part filePart = request.getPart("myfile");
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getName();
				String contextPath = getServletContext().getRealPath(
						"/assets/files/contractsFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					a.setNombreDocumento(fileName);
				}
			}
			a.setId(Id);
			a.setIdProcesoCompra(Integer.parseInt(procesocompra));
			a.setIdBeneficiario(Integer.parseInt(beneficiario));
			a.setIdProveedor(0);
			a.setIdSolicitudCompra(Integer.parseInt(solicitudcompra));
			a.setProcesoCompra(procesocompracod);
			a.setBeneficiario(nombrebeneficiario);
			a.setProveedor(nombreproveedor);
			a.setSolicitudCompra(nombresolicitudcompra);
			a.setNoOrdenCompra(ordencompra);
			a.setFechaSuscripcion(fechasuscripcion);
			a.setObservaciones(observaciones);
			contratacionesDao.update(a);
			
			
			contrataciones p = contratacionesDao.getById(Id);
			
			session.setAttribute("Id", Id);
			session.setAttribute("procesocompra", p.getIdProcesoCompra());
			session.setAttribute("beneficiario", p.getIdBeneficiario());
			session.setAttribute("solicitudcompra", p.getIdSolicitudCompra());
			session.setAttribute("nombreproveedor", p.getProveedor());
			request.setAttribute("procesocompracod", p.getProcesoCompra());
			request.setAttribute("ordencompra", p.getNoOrdenCompra());
			request.setAttribute("nombreproveedor", p.getProveedor());
			request.setAttribute("nombrebeneficiario", p.getBeneficiario());
			request.setAttribute("nombresolicitudcompra", p.getSolicitudCompra());
			request.setAttribute("fechasuscripcion", p.getFechaSuscripcion());
			request.setAttribute("myfile", p.getNombreDocumento());
			request.setAttribute("observaciones", p.getObservaciones());
			session.setAttribute("funcion", "modificar");
			
			request.getRequestDispatcher("nOrdenDeCompraDetalle.jsp").forward(request, response);
			break;
		default:
			request.getRequestDispatcher("nOrdenDeCompra.jsp").forward(request, response);
			break;
	
		}
	}else {
		//session.removeAttribute("funcion");
		//session.removeAttribute("openMode");
		//session.removeAttribute("Id");
		//request.setAttribute("openMode", "openError");
		//request.getRequestDispatcher("nOrdenDeCompra.jsp").forward(request, response);
		}
		//request.setAttribute("throughServlet", "true");
		//request.getRequestDispatcher("nOrdenDeCompraDetalle.jsp").forward(request, response);
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
