package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class listaRequerimientoServlet
 */
@WebServlet("/listaRequerimientoGeneralServlet")
public class listaRequerimientoGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listaRequerimientoGeneralServlet() {
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

		String type = (String) session.getAttribute("type");
		String search = request.getParameter("search");
		String guardar = request.getParameter("guardar");
		Integer noCompra = (Integer) session.getAttribute("noCompra");
		String idp = request.getParameter("idp");
		String noOficio = request.getParameter("legalNumber");
		String codigoATC = request.getParameter("medInsumoCod");
		String nombreMedicamento = request.getParameter("productName");
		String descripcionTecnica = request.getParameter("technicDescription");
		String unidadPresentacion = request.getParameter("presentationUnit");
		String cantidadRequerida = request.getParameter("requiredCant");
		String beneficiario = request.getParameter("benfName");
		String plazoEntrega = request.getParameter("deliveryTime");
		String vidaUtil = request.getParameter("usefulLife");
		String observaciones = request.getParameter("observation");
		String moneda = request.getParameter("currency");
		String funcion = (String) session.getAttribute("funcion");

		System.out.println("Testeando");
		
		String respuesta = "";
		listaRequerimientoGeneral l = new listaRequerimientoGeneral();
		PrintWriter out = response.getWriter();
		if (search != null) {
			switch (search) {
				case "consolidado":
					System.out.println(noCompra);
					respuesta = listaRequerimientoGeneralDao.getTableConsolidado(noCompra);
					System.out.println("Envio de tabla");
					System.out.println(respuesta);
					response.setContentType("application/json");
					out.println(respuesta.toString());
					out.flush();
					break;
				case "consultar":
					System.out.println(noCompra);
					respuesta = listaRequerimientoGeneralDao.getTable(noCompra);
					System.out.println("Envio de tabla");
					System.out.println(respuesta);
					response.setContentType("application/json");
					out.println(respuesta.toString());
					out.flush();
					break;
				case "editar":
					l.setProcesoCompra(noCompra);
					l.setNoOficio(noOficio);
					l.setCodigoATC(codigoATC);
					l.setNombreMedicamento(nombreMedicamento);
					l.setDescripcionTecnica(descripcionTecnica);
					l.setUnidadPresentacion(unidadPresentacion);
					l.setCantidadRequerida(Float.parseFloat(cantidadRequerida));
					l.setBeneficiario(beneficiario);
					l.setCantidadEntregaPlazos(plazoEntrega);
					l.setVidaUtil(vidaUtil);
					l.setObservaciones(observaciones);
					l.setMoneda(moneda);
					System.out.println("Llegue aca x2");
					System.out.println(l);
					listaRequerimientoGeneralDao.update(l, Integer.parseInt(idp));
					listaRequerimientoConsolidadaGeneralDao.savelistacon(noCompra);

					break;
				case "eliminar":
					listaRequerimientoGeneralDao.delete(Integer.parseInt(idp));
					listaRequerimientoConsolidadaGeneralDao.savelistacon(noCompra);
					break;
				default:
					System.out.println("Llegue aca ");
					l.setProcesoCompra(noCompra);
					l.setNoOficio(noOficio);
					l.setCodigoATC(codigoATC);
					l.setNombreMedicamento(nombreMedicamento);
					l.setDescripcionTecnica(descripcionTecnica);
					l.setUnidadPresentacion(unidadPresentacion);
					l.setCantidadRequerida(Float.parseFloat(cantidadRequerida));
					l.setBeneficiario(beneficiario);
					l.setCantidadEntregaPlazos(plazoEntrega);
					l.setVidaUtil(vidaUtil);
					l.setObservaciones(observaciones);
					l.setMoneda(moneda);
					System.out.println("Llegue aca x2");
					System.out.println(l);
					System.out.println(noOficio + "Oficio");
//					if (listaRequerimientoGeneralDao.checkIfMedIsUnique(l) == 1
//							&& (noOficio != null && !noOficio.isEmpty())) {
//						System.out.println("LLege------ ");
//						listaRequerimientoALPDao.save(l);
//						listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);
//					}
					listaRequerimientoGeneralDao.save(l);
					listaRequerimientoConsolidadaGeneralDao.savelistacon(noCompra);
					break;
			}
		}
		if (guardar != null) {
			if (guardar.contentEquals("guardar")) {
				request.getRequestDispatcher("nPurchaseListRequirementGeneral.jsp").forward(request, response);
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
