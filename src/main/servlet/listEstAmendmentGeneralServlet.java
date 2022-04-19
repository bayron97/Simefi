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
@WebServlet("/listEstAmendmentGeneralServlet")
public class listEstAmendmentGeneralServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public listEstAmendmentGeneralServlet() {
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
		int procesoCompraCod = Integer.parseInt(request.getParameter("purchaseCodNumber"));

		if (saveMode != null) {
			listaRequerimientoConsolidadaGeneral producto = new listaRequerimientoConsolidadaGeneral();
			String productName = request.getParameter("productName");
			String technicDescription = request.getParameter("technicDescription");
			String presentationUnit = request.getParameter("presentationUnit");

			producto.setProcesoCompra(procesoCompraCod);
			producto.setNombreProducto(productName.toUpperCase());
			producto.setDescripcionTecnica(technicDescription.toUpperCase());
			producto.setUnidadPresentacion(presentationUnit.toUpperCase());
			producto.setCantidadRequerida(Float.parseFloat(request.getParameter("requiredCant")));

			switch (saveMode) {
				case "nuevo":
					producto.setCodigoATC((String) request.getParameter("medInsumoCod"));
					producto.setNoOficio((String) request.getParameter("legalID"));
					producto.setBeneficiario((String) request.getParameter("beneficiary"));
					producto.setIdListRequirement(
							listaRequerimientoConsolidadaGeneralDao.getConsolidatedDBListSizeByPurchaseCod(procesoCompraCod)
									+ 1);
					producto.setEstado("ACTIVO");

					listaRequerimientoConsolidadaGeneralDao.save(producto);
					break;
				case "editar":
					producto.setIdListRequirement(Integer.parseInt(request.getParameter("productId")));

					String isActivo = (String) request.getParameter("checkboxActivo");
					if (isActivo != null && !isActivo.isEmpty()) {
						producto.setEstado("ACTIVO");
					} else {
						producto.setEstado("INACTIVO");
					}

					listaRequerimientoConsolidadaGeneralDao.update(producto);
					vaciadoOfertasGeneralDao.updateConsolidatedAnulatedProductsCount(procesoCompraCod);
					break;
			}
			vaciadoOfertasGeneralDao.updateConsolidatedEstimatedProductsCount(procesoCompraCod);
			request.getRequestDispatcher("nAmendmentEstListForGeneral.jsp").forward(request, response);
		} else {
			session.removeAttribute("noProcesoCompra");
			session.removeAttribute("funcion");
			request.getRequestDispatcher("amendmentsGeneral.jsp").forward(request, response);
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
