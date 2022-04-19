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
@WebServlet("/CriteriosEvaluacionDetalleServlet")
public class CriteriosEvaluacionDetalleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CriteriosEvaluacionDetalleServlet() {
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

		CriteriosEvaluacionDetalle p = new CriteriosEvaluacionDetalle();
		if (CrEvaluacion != null && CrEvaluacionDetalle != null) {

			p.setIdCE(Integer.parseInt(CrEvaluacion));
			p.setNombreCriterioDetalle(CrEvaluacionDetalle);
			p.setNombreCriterio(CrEvaluacionN);

			CriteriosEvaluacionDetalleDao.save(p);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramCriteriosEvaluation.jsp").forward(request, response);
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
