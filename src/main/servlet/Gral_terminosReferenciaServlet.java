package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.pdf.BarcodeInter25;

/**
 * Servlet implementation class listaRequerimientoServlet
 */
@WebServlet("/Gral_terminosReferenciaServlet")
public class Gral_terminosReferenciaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_terminosReferenciaServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		
		ArrayList<Gral_terminosReferencia> terminos = Gral_terminosReferenciaDao.GerListTerminosReferencia((int)session.getAttribute("idAperturaProceso"));
			
//			ArrayList<Gral_listaRequerimiento> listaRequerimientoConsolidada = Gral_listaRequerimientoDao.GeListaRequerimientoConsolidada((int)session.getAttribute("idAperturaProceso"));
			request.setAttribute("terminos", terminos);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("Gral_terminosReferencia.jsp").forward(request, response);
		
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
