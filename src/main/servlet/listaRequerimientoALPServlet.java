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
@WebServlet("/listaRequerimientoALPServlet")
public class listaRequerimientoALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listaRequerimientoALPServlet() {
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
		String funcion = (String) session.getAttribute("funcion");

		System.out.println("Testeando");
		
		String respuesta = "";
		listaRequerimientoALP l = new listaRequerimientoALP();
		PrintWriter out = response.getWriter();
		System.out.println("antes " + search);
		if (search != null) {
			switch (search) {
				case "consolidado":
					System.out.println(noCompra);
					respuesta = listaRequerimientoALPDao.getTableConsolidado(noCompra);
					System.out.println("Envio de tabla");
					System.out.println(respuesta);
					response.setContentType("application/json");
					out.println(respuesta.toString());
					out.flush();
					break;
				case "consultar":
					System.out.println(noCompra);
					respuesta = listaRequerimientoALPDao.getTable(noCompra);
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
					l.setCantidadRequerida(Float.parseFloat(cantidadRequerida.replaceAll(",","")));
					l.setBeneficiario(beneficiario);
					System.out.println("Llegue aca x2");
					System.out.println(l);
					listaRequerimientoALPDao.update(l, Integer.parseInt(idp));
//					listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);

					break;
				case "eliminar":
					
					
					//int candidadRequerida = Integer.parseInt(request.getParameter("requiredCant"));	
					int procesoCompra = (Integer) session.getAttribute("noCompra");			
					String productName = request.getParameter("productName");					
					
					int eliminarConsolidado = listaRequerimientoALPDao.validarEliminarConsolidado(procesoCompra,productName);
					
					if(eliminarConsolidado == 1) {
						listaRequerimientoALPDao.delete(Integer.parseInt(idp));
						listaRequerimientoALPDao.deleteProductConsolidado(procesoCompra, productName);
					}else {
						listaRequerimientoALPDao.delete(Integer.parseInt(idp));						
					}
					
					
					
					//listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);
					break;
				default:
					System.out.println("Llegue aca ");
					l.setProcesoCompra(noCompra);
					l.setNoOficio(noOficio);
					l.setCodigoATC(codigoATC);
					l.setNombreMedicamento(nombreMedicamento);
					l.setDescripcionTecnica(descripcionTecnica);
					l.setUnidadPresentacion(unidadPresentacion);
					l.setCantidadRequerida(Float.parseFloat(cantidadRequerida.replaceAll(",","")));
					l.setBeneficiario(beneficiario);
					l.setcodSesal(request.getParameter("codSesal"));
					System.out.println("Llegue aca x2");
					System.out.println(l);
					System.out.println(noOficio + "Oficio");
//					if (listaRequerimientoALPDao.checkIfMedIsUnique(l) == 1
//							&& (noOficio != null && !noOficio.isEmpty())) {
//						System.out.println("LLege------ ");
//						listaRequerimientoALPDao.save(l);
//						listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);
//					}
					
					int existe = listaRequerimientoALPDao.validarMedicamentoBycodSesal(l);
					
					if(existe > 0) {
						String duplicado = String.valueOf(existe);
						response.setContentType("text/plain");
						response.getWriter().write(duplicado);
					}
					else {
						listaRequerimientoALPDao.save(l);
//						listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);
					}
					
					break;
			}
		}
		if (guardar != null) {
			if (funcion.contentEquals("nuevo") || funcion.contentEquals("modificar")) {
				listaRequerimientoConsolidadaALPDao.savelistacon(noCompra);				
			}
			request.getRequestDispatcher("nPurchaseListRequirementALP.jsp").forward(request, response);
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
