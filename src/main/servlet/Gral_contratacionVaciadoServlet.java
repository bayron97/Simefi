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
@WebServlet("/Gral_contratacionVaciadoServlet")
@MultipartConfig
public class Gral_contratacionVaciadoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratacionVaciadoServlet() {
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
		String accion = (String) session.getAttribute("accion");
		
		Gral_contratacion contratacion = new Gral_contratacion();			
		contratacion.setObservacion(request.getParameter("observaciones"));
		
		if (accion.contentEquals("nuevo")) {			
			contratacion.setIdcontratoOrdenCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
			contratacion.setMonedaCompra(request.getParameter("monedaCompra"));
			contratacion.setIdContratacion(Gral_contratacionDao.save(contratacion));	
			session.removeAttribute("idContratacion");
			session.setAttribute("idContratacion", contratacion.getIdContratacion());
			
		}else if (accion.contentEquals("modificar")) {
			contratacion.setIdContratacion((int)session.getAttribute("idContratacion"));
			Gral_contratacionDao.update(contratacion);			
		}
		
		if (accion.contentEquals("nuevo") || accion.contentEquals("modificar")) {	
			ArrayList<distribuidor> fabricantes = distribuidorDao.fabricante();
			ArrayList<Gral_listaRequerimientoConsolidada>  consolidadaList  =  Gral_listaRequerimientoDao.getListConsolidadaBycontratoOrden(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
			ArrayList<String> paises = helpersDao.paises();	
			request.setAttribute("fabricantes", fabricantes);
			request.setAttribute("consolidadaList", consolidadaList);
			request.setAttribute("paises", paises);
			
		}
		
		if(accion.contentEquals("modificar") || accion.contentEquals("consultar")) {
			ArrayList<Gral_contratacionVaciado>	vaciadoList = Gral_contratacionDao.getVaciadoXContratacion((int)session.getAttribute("idContratacion"));
			request.setAttribute("vaciadoList", vaciadoList);
		}
		
		System.out.println("idcontratoOrdenCompra "+Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
		String tipoCompra = Gral_aperturaProcesoDao.getTipoCompra(Integer.parseInt(request.getParameter("idcontratoOrdenCompra")));
		request.setAttribute("tipoCompra", tipoCompra);
		System.out.println("tipoCompra "+tipoCompra);
		
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("Gral_contratacionVaciado.jsp").forward(request, response);
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
