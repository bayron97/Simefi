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
@WebServlet("/listEstAmendmentALPServlet")
public class listEstAmendmentALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listEstAmendmentALPServlet() {
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

		String saveMode = request.getParameter("submit");
	

		if (saveMode != null) {
		
			
			
			System.out.println("purchaseCodNumber "+request.getParameter("purchaseCodNumber"));
			
			switch (saveMode) {
				case "nuevo":
//					System.out.println("nuevo");
//					producto.setIdListRequirement(listaRequerimientoConsolidadaALPDao.getConsolidatedDBListSizeByPurchaseCod(procesoCompraCod)+ 1);
//					producto.setEstado("ACTIVO");
//					producto.setcodSesal(request.getParameter("codsesal"));
//
//					//listaRequerimientoConsolidadaALPDao.save(producto);
//					listaRequerimientoConsolidadaALPDao.savelistConsolidadaAclarcionEnmienda(producto);
					listaRequerimientoALP l = new listaRequerimientoALP();
					l.setProcesoCompra(Integer.parseInt(request.getParameter("purchaseCodNumber")));
					l.setNoOficio(request.getParameter("productName"));
					l.setCodigoATC(request.getParameter("codatc"));
					l.setNombreMedicamento(request.getParameter("productName"));
					l.setDescripcionTecnica(request.getParameter("technicDescription"));
					l.setUnidadPresentacion(request.getParameter("presentationUnit"));
					l.setCantidadRequerida(Integer.parseInt(request.getParameter("requiredCant")));
					l.setBeneficiario(request.getParameter("productName"));
					l.setNoOfertasRecibidas(0);
					l.setcodSesal(request.getParameter("codsesal"));
//					
					listaRequerimientoALPDao.saveRequerimeintoEnmienda(l);
					//listaRequerimientoConsolidadaALPDao.savelistacon(l.getProcesoCompra());
					listaRequerimientoConsolidadaALPDao.newRequerimientoEnmienda(l);
					
					vaciadoOfertasALPDao.updateConsolidatedEstimatedProductsCount(Integer.parseInt(request.getParameter("purchaseCodNumber")));
					break;
				case "editar":
					//producto.setIdListRequirement(Integer.parseInt(request.getParameter("productId")));
					listaRequerimientoConsolidadaALP producto = new listaRequerimientoConsolidadaALP();
					System.out.println("editar");
					String isActivo = (String) request.getParameter("checkboxActivo");
					if (isActivo != null && !isActivo.isEmpty()) {
						producto.setEstado("ACTIVO");
					} else {
						producto.setEstado("INACTIVO");
					}					
					producto.setIdListRequirement(Integer.parseInt(request.getParameter("productId")));
					producto.setCantidadRequerida(Float.parseFloat(request.getParameter("requiredCant")));
					producto.setProcesoCompra(Integer.parseInt(request.getParameter("purchaseCodNumber")));

					listaRequerimientoConsolidadaALPDao.updateConsolidado(producto);
					
					
					//listaRequerimientoConsolidadaALPDao.savelistConsolidadaAclarcionEnmienda(producto);
					vaciadoOfertasALPDao.updateConsolidatedAnulatedProductsCount(Integer.parseInt(request.getParameter("purchaseCodNumber")));
				break;
			}
			//vaciadoOfertasALPDao.updateConsolidatedEstimatedProductsCount(procesoCompraCod);
			request.getRequestDispatcher("nAmendmentEstListForALP.jsp").forward(request, response);
		} else {
			session.removeAttribute("noProcesoCompra");
			session.removeAttribute("funcion");
			request.getRequestDispatcher("amendmentsALP.jsp").forward(request, response);
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
