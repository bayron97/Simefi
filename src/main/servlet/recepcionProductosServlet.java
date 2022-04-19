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
@WebServlet("/recepcionProductosServlet")
@MultipartConfig
public class recepcionProductosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public recepcionProductosServlet() {
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
		String noReferencia = request.getParameter("noReferencia");
		String fechaPago = request.getParameter("fecha");

		
		String[] IdDetalle = request.getParameterValues("idDetalleinput");
		String[] noItem = request.getParameterValues("noIteminput");
		String[] codigoatc = request.getParameterValues("codigoatc");
		String[] nombreProducto = request.getParameterValues("nombreProducto");
		String[] descripcionTecnica = request.getParameterValues("descripcionTecnica");
		String[] unidadprecentacio = request.getParameterValues("unidadprecentacio");
		String[] proveedor = request.getParameterValues("proveedor");
		String[] laboratoriofabricante = request.getParameterValues("laboratoriofabricante");
		String[] observaciones = request.getParameterValues("observaciones");
		String[] tiempoEntrega = request.getParameterValues("tiempoEntrega");
		String[] cantidadComprado = request.getParameterValues("cantidadComprado");
		String[] precioUnitario = request.getParameterValues("precioUnitario");
		String[] valorTotalCompra = request.getParameterValues("valorTotalCompra");
		String[] nordencompra = request.getParameterValues("nordencompra");	
		String[] fechasuscripcion = request.getParameterValues("fechasuscripcion");	
		String[] cantidadentregadaplazo = request.getParameterValues("cantidadentregarinput");
		String[] fechaLimiteEntrega = request.getParameterValues("fechaLimiteEntrega");
		String[] moneda = request.getParameterValues("monedainput");			
		String[] fechasolicitudcita = request.getParameterValues("fechasolicitudcitainput");
		String[] lugarrecepcion = request.getParameterValues("lugarrecepcioninput");		
		String[] fecharecepcion = request.getParameterValues("fecharecepcioninput");
		String[] lugarRecepcion = request.getParameterValues("lugarRecepcioninput");		
		String[] nofactura = request.getParameterValues("nofacturainput");
		String[] cantidadEntrega = request.getParameterValues("cantidadentregadainput");	
		
		String[] totalentregado = request.getParameterValues("totalentregadoinput");
		String[] diasatraso = request.getParameterValues("diasatrasoinput");
		String[] multaentrega = request.getParameterValues("multaentregainput");
		String[] valorneto = request.getParameterValues("valornetoinput");
		String[] vidautil = request.getParameterValues("vidautilinput");
		String[] nogarantia = request.getParameterValues("nogarantiainput");
		String[] informeanalisis = request.getParameterValues("informeanalisisinput");
		String[] noactarecepcion = request.getParameterValues("noactarecepcioninput");
		String[] nolotefabricacion = request.getParameterValues("nolotefabricacioninput");		
		String[] estadocompra = request.getParameterValues("estadocompra");			
				
		
		
		contratacionesDetalle b = new contratacionesDetalle();
		
			if (noItem != null) {				
				
				for (int i = 0; i < noItem.length; i++) {
					
					boolean estadodecompra = false;
					if(estadocompra[i] == "0"){
						estadodecompra =  false;
						System.out.println("----------- "+ estadodecompra +"---------------");	
						
					}
										
					System.out.println("ENTRE AL FOR "+ cantidadEntrega[i] +" "+ estadocompra[i]);
					if(Integer.parseInt(cantidadEntrega[i])  > 0 && Integer.parseInt(estadocompra[i]) == 0) {
						System.out.println("aplique " + IdDetalle[i] + " eSTADO " + estadocompra[i] );						
						System.out.println("--------------------------");								
						
						b.setFechaSolicitudCita(fechasolicitudcita[i]);
						b.setFechaRecepcion(fecharecepcion[i]);
						b.setLugarRecepcion(lugarrecepcion[i]);
						b.setNoFactura(nofactura[i]);						
						b.setCantidadEntrega(Integer.parseInt(cantidadEntrega[i]));
						b.setTotalEntrega(totalentregado[i]);
						b.setDiasAtraso(Float.parseFloat(diasatraso[i]));
						b.setMulta(Float.parseFloat(multaentrega[i]));
						b.setValorNetoPagar(Float.parseFloat(valorneto[i]));
						b.setVidaUtil(vidautil[i]);
						b.setNoGarantia(nogarantia[i]);
						b.setInformeResultadoAnalisis(informeanalisis[i]);
						b.setNoActaRecepcion(noactarecepcion[i]);
						b.setNoLoteFabricacion(nolotefabricacion[i]);
						b.setIdDetalle(Long.parseLong(IdDetalle[i]));
						b.setEstadoEntrega(true);
						contratacionesDetalleDao.updateRecepcion(b);				
										
						System.out.println(Integer.parseInt(cantidadEntrega[i]) + " " + Integer.parseInt(cantidadentregadaplazo[i]));
						
						if(Integer.parseInt(cantidadEntrega[i]) != Integer.parseInt(cantidadentregadaplazo[i])) {
							System.out.println("Nuevo creado");	
							System.out.println(i);	
							b.setCantidadEntregaPlazos(Integer.parseInt(cantidadentregadaplazo[i])-Integer.parseInt(cantidadEntrega[i]));
							b.setCantidadEntrega(0);
							b.setId(Long.parseLong(Id));
							b.setNoItem(Integer.parseInt(noItem[i]));
							b.setFechaSolicitudCita(fechasolicitudcita[i]);
							b.setFechaRecepcion(fecharecepcion[i]);
							b.setLugarRecepcion(lugarrecepcion[i]);
							b.setNoFactura(nofactura[i]);
							b.setTotalEntrega(totalentregado[i]);
							b.setDiasAtraso(Float.parseFloat(diasatraso[i]));
							b.setMulta(Float.parseFloat(multaentrega[i]));
							b.setValorNetoPagar(Float.parseFloat(valorneto[i]));
							b.setVidaUtil(vidautil[i]);
							b.setNoGarantia(nogarantia[i]);
							b.setInformeResultadoAnalisis(informeanalisis[i]);
							b.setNoActaRecepcion(noactarecepcion[i]);
							b.setNoLoteFabricacion(nolotefabricacion[i]);
							b.setNombreProducto(nombreProducto[i]);
							b.setTiempoEntrega(tiempoEntrega[i]);
							b.setFechaLimiteEntrega(fechaLimiteEntrega[i]);						
							b.setCodigoATC(codigoatc[i]);
							b.setProveedor(proveedor[i]);
							b.setUnidadPresentacion(unidadprecentacio[i]);
							b.setFabricante_PaisOrigen(laboratoriofabricante[i]);
							b.setNumeroOdenCompra(nordencompra[i]);
							b.setFechaSuscripcion(fechasuscripcion[i]);						
							contratacionesDetalleDao.saveall(b);							
							}									
					}						
				}
			}
			else {
				//a.setNoReferencia(noReferencia);
				//a.setFechaPago(fechaPago);
				//a.setId(Integer.parseInt(Id));
				//contratacionesDao.update(a);
			}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("recepcionProductos.jsp").forward(request, response);
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
