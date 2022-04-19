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
@WebServlet("/Gral_contratacionDetalleServlet")
@MultipartConfig
public class Gral_contratacionDetalleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_contratacionDetalleServlet() {
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
		
		ArrayList<Gral_contratacionDetalleDTO> detalle = Gral_contratacionDao.getDetalleContratacion((int)session.getAttribute("idContratacion"));
; 		ArrayList<Gral_contratacionVaciado> ItemProducto = Gral_contratacionDao.getVaciadoItemProducto((int)session.getAttribute("idContratacion"));
		Gral_contratacionDTO contratacion  = Gral_contratacionDao.Getcontratacion((int)session.getAttribute("idContratacion"));
		request.setAttribute("numProcesoCompra", contratacion.getNumProcesoCompra());
		request.setAttribute("monedaCompra", contratacion.getMonedaCompra());
		request.setAttribute("beneficiario", contratacion.getBeneficiario());
		request.setAttribute("nombreProveedor", contratacion.getNombreProveedor());
		request.setAttribute("tipoDocuemnto", contratacion.getTipoDocuemnto());
		request.setAttribute("numDocumento", contratacion.getNumDocumento());
		request.setAttribute("fechaSuscripcion", contratacion.getFechaSuscripcion());
		request.setAttribute("observacion", contratacion.getObservacion());
		request.setAttribute("myfile", contratacion.getDocumento());
		request.setAttribute("ItemProducto", ItemProducto);
		request.setAttribute("detalle", detalle);
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("Gral_contratacionDetalle.jsp").forward(request, response);
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
