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
@WebServlet("/ReturViewServlet")
@MultipartConfig
public class ReturViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturViewServlet() {
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
		String func = request.getParameter("vistaARetornar");
		
		
		
		if (func != null && !func.isEmpty()) {
//			String openMode = session.getAttribute("openMode").toString();
//			request.setAttribute("openMode", openMode);
			request.setAttribute("funcion", func);
		
		switch (func) {		
		
		case "contratacionesIndex":
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("contrataciones.jsp").forward(request, response);
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
