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
@WebServlet("/controlPagosGeneralServlet")
@MultipartConfig
public class controlPagosGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public controlPagosGeneralServlet() {
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
		String cuentabancaria = request.getParameter("cuentabancaria");
		String banco = request.getParameter("banco");
		String noItem = request.getParameter("noItem");
		String noFactura = request.getParameter("noFactura");
		String fechalimiteentrega = request.getParameter("fechalimiteentrega");
		String fechasolicitudcita = request.getParameter("fechasolicitudcita");
		String diasAtraso = request.getParameter("diasAtraso");
		String totalPagado = request.getParameter("totalPagado");
		String multa = request.getParameter("multa");
		String PagoTotal = request.getParameter("PagoTotal");
		String step = request.getParameter("step");
		String noReferencia = request.getParameter("noReferencia");
		String fecha = request.getParameter("fecha");
		String informeCalidad = request.getParameter("informeCalidad");
		String actaRecepcion = request.getParameter("actaRecepcion");

		controlPagosGeneral a = new controlPagosGeneral();

		if (Id.contentEquals("-1")) {
			
			a.setBuyProcessId(Integer.parseInt(procesocompra));
			a.setBuyProcessCod(procesocompracod);
			a.setBuyOrderId(ordencompra);
			a.setProveedor(proveedor);
			a.setCuentaBancaria(cuentabancaria);
			a.setBanco(banco);
			a.setNoItem(Integer.parseInt(noItem));
			a.setNoFactura(noFactura);
			a.setFechaLimiteEntrega(fechalimiteentrega);
			a.setFechaSolicitudCita(fechasolicitudcita);
			a.setDiasAtraso(Integer.parseInt(diasAtraso));
			a.setTotalPagado(Float.parseFloat(totalPagado));
			a.setMulta(Float.parseFloat(multa));
			a.setPagoTotal(Float.parseFloat(PagoTotal));
			a.setEstado("EN PROCESO");
			a.setinformeCalidad(informeCalidad);
			a.setactaRecepcion(actaRecepcion);				
			
			
			controlPagosGeneralDao.save(a);
			
		} else {
			System.out.print(step);
			if(step!=null){
				a = controlPagosGeneralDao.getById(Integer.parseInt(Id));
				a.setNoReferencia(noReferencia);
				a.setFecha(fecha);
			}
			else {
				a.setId(Integer.parseInt(Id));
				a.setBuyProcessId(Integer.parseInt(procesocompra));
				a.setBuyProcessCod(procesocompracod);
				a.setBuyOrderId(ordencompra);
				a.setProveedor(proveedor);
				a.setCuentaBancaria(cuentabancaria);
				a.setBanco(banco);
				a.setNoItem(Integer.parseInt(noItem));
				a.setNoFactura(noFactura);
				a.setFechaLimiteEntrega(fechalimiteentrega);
				a.setFechaSolicitudCita(fechasolicitudcita);
				a.setDiasAtraso(Integer.parseInt(diasAtraso));
				a.setTotalPagado(Float.parseFloat(totalPagado));
				a.setMulta(Float.parseFloat(multa));
				a.setPagoTotal(Float.parseFloat(PagoTotal));
				a.setEstado("EN PROCESO");	
				a.setinformeCalidad(informeCalidad);
				a.setactaRecepcion(actaRecepcion);		
			}
			controlPagosGeneralDao.update(a);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("controlPagosGeneral.jsp").forward(request, response);
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
