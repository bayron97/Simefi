package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class pcRouting
 */
@WebServlet("/pcGeneralRouting")
public class pcGeneralRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public pcGeneralRouting() {
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

		String nextJsp = request.getParameter("nextJsp");
		// String prevJsp = request.getParameter("prevJsp");
		String func = (String) session.getAttribute("funcion");

		int proc = 0;

		if (session.getAttribute("noCompra") != null) {
			String proce = Integer.toString((int) session.getAttribute("noCompra"));
			proc = Integer.parseInt(proce);
		}

		if (proc > 0) {
			switch (func) {
				case "nuevo":
					if (nextJsp != null) {
						if (nextJsp.contentEquals("apertura")) {
							request.setAttribute("id", proc);
							request.setAttribute("submit", "modificar");
							request.setAttribute("inWizard", "true");
							request.getRequestDispatcher("pCompraGeneralWizardRouting").forward(request, response);
						} else if (nextJsp.contentEquals("digitalizacion")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseProcessDigForGeneral.jsp").forward(request, response);

						} else if (nextJsp.contentEquals("criteria")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseProcessEvaluationCriteriaGeneral.jsp").forward(request,
									response);

						} else if (nextJsp.contentEquals("listaest")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseListRequirementGeneral.jsp").forward(request, response);

						} else if (nextJsp.contentEquals("requerimientos")) {
							request.setAttribute("procesoCompra", procesoCompraGeneralDao.getProcesoCompra(proc));

							String obs = procesoCompraGeneralDao.getObservacions(proc);
							if (obs == null || obs.isBlank()) {
								obs = " ";
							}

							String estado = procesoCompraGeneralDao.getEstado(proc);
							if (estado == null || estado.isBlank()) {
								estado = "INACTIVO";
							}

							request.setAttribute("estado", estado);
							request.setAttribute("observaciones", obs);
							request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
									response);
						}
					}
					break;
				default:
					if (nextJsp != null) {
						if (nextJsp.contentEquals("apertura")) {

							procesoCompraGeneral p = procesoCompraGeneralDao.getById(proc);

							request.setAttribute("id", proc);

							String[] fechaL = p.getFechaLimite().split("\\|");
							String[] fechaA = p.getFechaApertura().split("\\|");

							request.setAttribute("noProcesoCompra", p.getNoProcesoCompra());
							request.setAttribute("horaLimite", fechaL[1]);
							request.setAttribute("fechaLimite", fechaL[0]);
							request.setAttribute("fechaApertura", fechaA[0]);
							request.setAttribute("horaApertura", fechaA[1]);
							request.setAttribute("lugar", p.getLugar());
							request.setAttribute("periodoValidez", p.getPeriodoValidez());
							request.setAttribute("descripcioncompra", p.getDescripcionCompra());

							// request.setAttribute("submit", "modificar");
							request.getRequestDispatcher("nPurchaseProcessGeneral.jsp").forward(request, response);
							System.out.println(10);

						} else if (nextJsp.contentEquals("requerimientos")) {
							request.setAttribute("procesoCompra", procesoCompraGeneralDao.getProcesoCompra(proc));

							String obs = procesoCompraGeneralDao.getObservacions(proc);
							if (obs == null || obs.isBlank()) {
								obs = " ";
							}

							String estado = procesoCompraGeneralDao.getEstado(proc);
							if (estado == null || estado.isBlank()) {
								estado = "INACTIVO";
							}

							request.setAttribute("estado", estado);
							request.setAttribute("observaciones", obs);
							request.getRequestDispatcher("nPurchaseProcessRequirementsListForGeneral.jsp").forward(request,
									response);
							System.out.println(1);

						} else if (nextJsp.contentEquals("listaest")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseListRequirementGeneral.jsp").forward(request, response);
							System.out.println(2);
						} else if (nextJsp.contentEquals("criteria")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseProcessEvaluationCriteriaGeneral.jsp").forward(request,
									response);
							System.out.println(3);
						} else if (nextJsp.contentEquals("digitalizacion")) {
							request.setAttribute("id", proc);
							request.getRequestDispatcher("nPurchaseProcessDigForGeneral.jsp").forward(request, response);
							System.out.println(4);
						}
					}
					break;
			}
		} else {
			request.getRequestDispatcher("nPurchaseProcessGeneral.jsp").forward(request, response);
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
