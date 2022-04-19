package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ofertasALPRouting
 */
@WebServlet("/evaluacionRecomendacionOfertaALPServlet")
public class evaluacionRecomendacionOfertaALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public evaluacionRecomendacionOfertaALPServlet() {
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
		String func = session.getAttribute("funcion").toString();
		// String openMode = session.getAttribute("openMode").toString();

		String step = request.getParameter("submit");
		String noProcesoCompra = request.getParameter("noProcesoCompra");
		String solicitudCompra = request.getParameter("solicitudCompra");
		String benef = request.getParameter("benef");
		String id = request.getParameter("solicitudDisponibilidad");

		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();

			switch (step) {
				case "Consultar":
					String benfList = evaluacionRecomendacionOfertaALPDao
							.getBeneficiariosSolicitudCompra(noProcesoCompra);
					ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();

					request.setAttribute("benfList", benfList);
					request.setAttribute("purchaseActiveList", purchaseActiveList);
					// request.setAttribute("openMode", openMode);
					System.out.println(benfList);
					response.setContentType("text/plain");

					out.print(benfList);
					out.flush();
					out.close();
					// request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request,
					// response);

					break;
				case "ConsultarBenef":
					String solList = evaluacionRecomendacionOfertaALPDao.getSol(noProcesoCompra, benef);
					System.out.println("Solicitud: ");
					out.print(solList.toString());
					out.flush();
					out.close();
					break;
				case "FillTable":
					String prod = evaluacionRecomendacionOfertaALPDao.getProd(noProcesoCompra);
					
					out.print(prod.toString());
					out.flush();
					out.close();
					break;
				case "ConsultarSolicitud":
					String benfList1 = evaluacionRecomendacionOfertaALPDao
							.getSolicitudesDisponibilidadbySolicitudCompra(Long.parseLong(solicitudCompra));

					request.setAttribute("benfList", benfList1);
					// request.setAttribute("openMode", openMode);
					System.out.println(benfList1);
					response.setContentType("text/plain");

					out.print(benfList1);
					out.flush();
					out.close();
					// request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request,
					// response);

					break;
				case "ConsultarProductos":
					String benfList2 = evaluacionRecomendacionOfertaALPDao
							.getProductosbySolicitudCompra(Long.parseLong(solicitudCompra));

					request.setAttribute("benfList", benfList2);
					// request.setAttribute("openMode", openMode);
					System.out.println(benfList2);
					response.setContentType("text/plain");

					out.print(benfList2);
					out.flush();
					out.close();
					// request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request,
					// response);

					break;
				case "ConsultarProductosInf":
					String benfList3 = evaluacionRecomendacionOfertaALPDao
							.getProductosInfbySolicitudCompra(Long.parseLong(id));

					request.setAttribute("benfList", benfList3);
					// request.setAttribute("openMode", openMode);
					System.out.println(benfList3);
					response.setContentType("text/plain");

					out.print(benfList3);
					out.flush();
					out.close();
					// request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request,
					// response);

					break;
				default:
					request.setAttribute("openMode", "openError");
					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
			}
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
