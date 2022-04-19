package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class procesosCompraServlet
 */
@WebServlet("/CriterioEvaluacionGeneralServlet")
@MultipartConfig
public class CriterioEvaluacionGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CriterioEvaluacionGeneralServlet() {
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

		String submit = request.getParameter("submit");
		Integer noCompra = (Integer) session.getAttribute("noCompra");
		String Criterio1 = request.getParameter("criterio1");
		String Criterio2 = request.getParameter("criterio2");
		String Criterio3 = request.getParameter("criterio3");
		String Criterio4 = request.getParameter("criterio4");
		String Criterio5 = request.getParameter("criterio5");
		String Criterio6 = request.getParameter("criterio6");
		String Criterio7 = request.getParameter("criterio7");
		String Criterio8 = request.getParameter("criterio8");
		String Criterio9 = request.getParameter("criterio9");
		String Criterio10 = request.getParameter("criterio10");
		String Criterio11 = request.getParameter("criterio11");
		String Criterio12 = request.getParameter("criterio12");
		String Criterio13 = request.getParameter("criterio13");
		String Criterio14 = request.getParameter("criterio14");
		String Criterio15 = request.getParameter("criterio15");
		String funcion = (String) session.getAttribute("funcion");
		request.setAttribute("throughServlet", "true");
		String type = (String) session.getAttribute("type");

		if (submit != null && !submit.contentEquals("cancelar")) {

			CriterioEvaluacionGeneral p = new CriterioEvaluacionGeneral();
			if (Criterio1 == null || Criterio1 == "") {
				Criterio1 = "0";
			}
			if (Criterio2 == null || Criterio2 == "") {
				Criterio2 = "0";
			}
			if (Criterio3 == null || Criterio3 == "") {
				Criterio3 = "0";
			}
			if (Criterio4 == null || Criterio4 == "") {
				Criterio4 = "0";
			}
			if (Criterio5 == null || Criterio5 == "") {
				Criterio5 = "0";
			}
			if (Criterio6 == null || Criterio6 == "") {
				Criterio6 = "0";
			}
			if (Criterio7 == null || Criterio7 == "") {
				Criterio7 = "0";
			}
			if (Criterio8 == null || Criterio8 == "") {
				Criterio8 = "0";
			}
			if (Criterio9 == null || Criterio9 == "") {
				Criterio9 = "0";
			}
			if (Criterio10 == null || Criterio10 == "") {
				Criterio10 = "0";
			}
			if (Criterio11 == null || Criterio11 == "") {
				Criterio11 = "0";
			}
			if (Criterio12 == null || Criterio12 == "") {
				Criterio12 = "0";
			}
			if (Criterio13 == null || Criterio13 == "") {
				Criterio13 = "0";
			}
			if (Criterio14 == null || Criterio14 == "") {
				Criterio14 = "0";
			}
			if (Criterio15 == null || Criterio15 == "") {
				Criterio15 = "0";
			}
			int status = 0;
			String respuesta = "";
			PrintWriter out = response.getWriter();
			switch (funcion) {
				case "modificar":
					p.setCod(noCompra);
					
					CriterioEvaluacionGeneralDao.update(noCompra, p);
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					System.out.println("c1");
					break;
				case "revisar":

					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					System.out.println("c2");
					break;
				case "consultar":
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					System.out.println("c3");
					break;
				default:
					p.setCod(noCompra);
					
					CriterioEvaluacionGeneralDao.save(p);
					session.setAttribute("noCompra", noCompra);
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
							response);
					System.out.println("c4");
					break;
			}
		} else {
			request.getRequestDispatcher("purchaseProcessesGeneral.jsp").forward(request, response);
			System.out.println("c5");
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
