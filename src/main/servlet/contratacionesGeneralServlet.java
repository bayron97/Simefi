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
@WebServlet("/contratacionesGeneralServlet")
@MultipartConfig
public class contratacionesGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contratacionesGeneralServlet() {
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
		
		String[] noItem = request.getParameterValues("noItem");
		String[] nombreProducto = request.getParameterValues("nombreProducto");
		String[] cantidadEntregar = request.getParameterValues("cantidadEntregar");
		String[] fechaLimiteEntrega = request.getParameterValues("fechaLimiteEntrega");
		String[] IdDetalle = request.getParameterValues("IdDetalle");
		
		contratacionesGenerales a = new contratacionesGenerales();
		contratacionesDetalleGeneral b = new contratacionesDetalleGeneral();
		listaRequerimientoConsolidadaGeneral c = new listaRequerimientoConsolidadaGeneral();
		a.setNombreDocumento(myfileName);
		int statusG=0;

		if (Id.contentEquals("-1")) {
			
			Part filePart = request.getPart("myfile");
			if (filePart != null && filePart.getSize() > 0) {
				InputStream fileContent = filePart.getInputStream();
				byte[] buffer = new byte[fileContent.available()];
				fileContent.read(buffer);
				String fileName = filePart.getSubmittedFileName();
				String contextPath = getServletContext().getRealPath("/assets/files/contractsFiles/" + fileName);
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
					a.setProveedor(nombreproveedor);
					a.setSolicitudCompra(nombresolicitudcompra);
					String codigo=contratacionesGeneralDao.getOrdenCompra();
					if(codigo.contentEquals("")) {
						codigo="OC2021-1";
					}
					a.setNoOrdenCompra(codigo);
					a.setFechaSuscripcion(fechasuscripcion);
					a.setNombreDocumento(fileName);
					a.setObservaciones(observaciones);
					statusG=contratacionesGeneralDao.save(a);
					
					if(statusG>=0) {
						if (noItem != null) {
							for (int i = 0; i < noItem.length; i++) {	
								b.setId(statusG);
								b.setNoItem(Integer.parseInt(noItem[i]));
								b.setNombreProducto(nombreProducto[i]);
								b.setCantidadComprado(0);
								b.setCantidadEntregaPlazos(Integer.parseInt(cantidadEntregar[i]));
								b.setFechaLimiteEntrega(fechaLimiteEntrega[i]);
								
								c=contratacionesGeneralDao.getByItem(Integer.parseInt(noItem[i]));
								b.setCodigoATC(c.getCodigoATC());
								b.setDescripcionTecnica(c.getDescripcionTecnica());								
								b.setProveedor(nombreproveedor);
								b.setNumeroOdenCompra(ordencompra);
								b.setFechaSuscripcion(fechasuscripcion);
								contratacionesDetalleGeneralDao.save(b);
							}
						}
					}
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
						"/assets/files/ContractsFiles/" + fileName);
				File dest = new File(contextPath);
				if (!dest.exists()) {
					dest.createNewFile();
					OutputStream outStream = new FileOutputStream(dest);
					outStream.write(buffer);
					outStream.close();
					a.setNombreDocumento(fileName);
				}
			}
			a.setId(Integer.parseInt(Id));
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
			contratacionesGeneralDao.update(a);
			
			if (noItem != null) {
				for (int i = 0; i < noItem.length; i++) {	
					System.out.println(IdDetalle[i]);
					if(IdDetalle[i].contentEquals("-1")) {
						b.setId(Integer.parseInt(Id));
						b.setNoItem(Integer.parseInt(noItem[i]));
						b.setNombreProducto(nombreProducto[i]);
						b.setCantidadEntregaPlazos(Integer.parseInt(cantidadEntregar[i]));
						b.setFechaLimiteEntrega(fechaLimiteEntrega[i]);
						
						c=contratacionesGeneralDao.getByItem(Integer.parseInt(noItem[i]));
						b.setCodigoATC(c.getCodigoATC());
						b.setDescripcionTecnica(c.getDescripcionTecnica());						
						b.setProveedor(nombreproveedor);
						b.setNumeroOdenCompra(ordencompra);
						
						contratacionesDetalleGeneralDao.save(b);
					}
					else {
						b.setId(Integer.parseInt(Id));
						b.setNoItem(Integer.parseInt(noItem[i]));
						b.setNombreProducto(nombreProducto[i]);
						b.setCantidadComprado(0);
						b.setCantidadEntregaPlazos(Integer.parseInt(cantidadEntregar[i]));
						b.setFechaLimiteEntrega(fechaLimiteEntrega[i]);
						b.setIdDetalle(Long.parseLong(IdDetalle[i]));
						contratacionesDetalleGeneralDao.update(b);
					}
					
				}
			}
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("ordenCompraGeneral.jsp").forward(request, response);
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
