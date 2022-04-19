package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class pCompraParamRouting
 */
@WebServlet("/pCompraParamRouting")
public class pCompraParamRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pCompraParamRouting() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String submit = request.getParameter("submit");
		String next = "";
		switch (submit) {
			case "backwardApertura":
				next = "paramPurchaseType.jsp";
				break;
			case "forwardApertura":
				next = "paramBenFinal.jsp";
				break;
			case "forwardBeneficiarioFinal":
				next = "paramEnTime.jsp";
				break;
			case "backwardBeneficiarioFinal":
				next = "paramOpeningPlace.jsp";
				break;
			case "forwardEnTime":
				next = "paramPurchaseType.jsp";
				break;
			case "backwardEnTime":
				next = "paramBenFinal.jsp";
				break;
			case "forwardPurchaseT":
				next = "paramOpeningPlace.jsp";
				break;
			case "backwardPurchaseT":
				next = "paramEnTime.jsp";
				break;
			case "paramPurchaseType":
				next = "paramPurchaseType.jsp";
				break;
			case "paramBenFinal":
				next = "paramBenFinal.jsp";
				break;
			case "paramEnTime":
				next = "paramEnTime.jsp";
				break;
			case "paramOpeningPlace":
				next = "paramOpeningPlace.jsp";
				break;
			case "paramALP":
				next = "paramPurchaseDescription.jsp";
				break;
			case "Fabricante":
				next = "paramFabricante.jsp";
				break;
			case "paramCriterioEvaluacionVaciado":
				next = "paramCriterioEvaluacionVaciado.jsp";				
				break;
			default:
				break;
		}
		System.out.println( next +" VISTA");
		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher(next).forward(request, response);
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
