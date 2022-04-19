package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ofertasALPRouting
 */
@WebServlet("/ofertasGeneralRouting")
public class ofertasGeneralRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ofertasGeneralRouting() {
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
		String proc = request.getParameter("proc");
		String func = request.getParameter("submit");

		String openMode = "";

		if (proc != null && !proc.isEmpty()) {
			int codPadre = Integer.parseInt(request.getParameter("codPadre"));
			if (func != null && !func.isEmpty()) {
				session.setAttribute("funcion", func);
				session.setAttribute("codPadre", codPadre);
				switch (func) {
					case "actaApertura":
						request.setAttribute("buyProcessNumber", proc);
						request.getRequestDispatcher("actaAperturaALP.jsp").forward(request, response);
						break;
					case "nuevaOferta":
						openMode = "nuevaOferta";
						request.setAttribute("openMode", openMode);
						request.setAttribute("buyProcessNumber", proc);
						request.getRequestDispatcher("nOfertaForGeneral.jsp").forward(request, response);
						break;
					case "consultarOferta":
						openMode = "consultarOferta";
						request.setAttribute("openMode", openMode);
						request.setAttribute("buyProcessNumber", proc);
						request.getRequestDispatcher("nOfertaForGeneral.jsp").forward(request, response);
						break;
					case "nuevaRecomendacionTecnica":
						request.getRequestDispatcher("nRecomendacionTecnicaForALP.jsp").forward(request, response);
						break;
					default:
						openMode = "error";
						request.setAttribute("openMode", openMode);
						request.getRequestDispatcher("vaciadoOfertaGeneral.jsp").forward(request, response);
						break;
				}
			}
		} else {
			openMode = "error";
			request.setAttribute("openMode", openMode);
			request.getRequestDispatcher("vaciadoOfertaGeneral.jsp").forward(request, response);
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
