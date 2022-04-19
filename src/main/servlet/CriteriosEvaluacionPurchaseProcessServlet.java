package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class procesoALPServlet
 */
@WebServlet("/CriteriosEvaluacionPurchaseProcessServlet")
public class CriteriosEvaluacionPurchaseProcessServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CriteriosEvaluacionPurchaseProcessServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String CrEvaluacion = request.getParameter("CrEvaluacion");
		String CrEvaluacionDetalle = request.getParameter("CrEvaluacionDetalle");
		String CrEvaluacionN = request.getParameter("CrEvaluacionN");

		CriteriosEvaluacionPurchaseProcess p = new CriteriosEvaluacionPurchaseProcess();
		if (CrEvaluacion != null && CrEvaluacionDetalle != null) {

			p.setIdCE(Integer.parseInt(CrEvaluacion));
			p.setNombreCriterioDetalle(CrEvaluacionDetalle);
			p.setNombreCriterio(CrEvaluacionN);

			CriteriosEvaluacionPurchaseProcessDao.save(p);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramCriteriosEvaluationPurchaseProcess.jsp").forward(request, response);
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
