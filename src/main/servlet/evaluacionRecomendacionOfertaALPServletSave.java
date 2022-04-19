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
@WebServlet("/evaluacionRecomendacionOfertaALPServletSave")
public class evaluacionRecomendacionOfertaALPServletSave extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public evaluacionRecomendacionOfertaALPServletSave() {
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
		String procesocompraform = request.getParameter("procesocompraform");
		String solicitudcompraform = request.getParameter("solicitudcompraform");
		String proveedorform = request.getParameter("proveedorform");
		String productoform = request.getParameter("productoform");
		String unidadform = request.getParameter("unidadform");
		String cantidadform = request.getParameter("cantidadform");
		String tiempoentregaform = request.getParameter("tiempoentregaform");
		String cantidadempaque1form = request.getParameter("cantidadempaque1form");
		String cantidadempaque2form = request.getParameter("cantidadempaque2form");
		String prelacionform = request.getParameter("prelacionform");
		String noItemform = request.getParameter("noItemform");
		String codigoatcform = request.getParameter("codigoatcform");
		String vidautilform = request.getParameter("vidautilform");
		String registroSanitarioform = request.getParameter("registroSanitarioform");
		String certificadopracticasform = request.getParameter("certificadopracticasform");
		String noofertaform = request.getParameter("noofertaform");
		String solicitudform = request.getParameter("solicitudform");
		String textsolicitudform = request.getParameter("textsolicitudform");
		String fechacertificadoform = request.getParameter("fechacertificadoform");
		String registroSanitariofechaform = request.getParameter("registroSanitariofechaform");

		if (step != null && !step.isEmpty()) {
			PrintWriter out = response.getWriter();

			switch (step) {
				case "save":
					evaluacionRecomendacionOfertaALP ero = new evaluacionRecomendacionOfertaALP();
					ero.setNoProcesoCompra(procesocompraform);
					ero.setDistribuidor(proveedorform);
					ero.setNoSolicitudCompra(Long.parseLong(solicitudcompraform));
					ero.setProductoAcordado(productoform);
					ero.setUnidadPresentacionAcordada(unidadform);
					ero.setCantidadOfertada(Float.parseFloat(cantidadform));
					ero.setTiempoEntregaOfertada(tiempoentregaform);
					ero.setCantidadiEmpaquePrimario(cantidadempaque1form);
					ero.setCantidadiEmpaqueSecundario(cantidadempaque2form);
					ero.setPrelacion(prelacionform);
					ero.setNoItem(Integer.parseInt(noItemform));
					ero.setCodigoATC(codigoatcform);
					ero.setVidaUtilOfertada(vidautilform);
					ero.setCerfRegSan(registroSanitarioform);
					ero.setCerfBPM(certificadopracticasform);

					evaluacionRecomendacionOfertaALPDao.save(ero);
					// String benfList =
					// evaluacionRecomendacionOfertaALPDao.getSolicitudesComprabyProcesoCompra(noProcesoCompra);

					// request.setAttribute("benfList", benfList);
					// System.out.println(benfList);
					// response.setContentType("text/plain");

					// out.print(benfList);
					// out.flush();
					// out.close();
					// request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request,
					// response);

					break;
				default:
					request.setAttribute("openMode", "openError");
					request.getRequestDispatcher("nEvaluacionRecomendacionOfertaALP.jsp").forward(request, response);
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
