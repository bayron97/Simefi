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
 * Servlet implementation class garantiasServlet
 */
@WebServlet("/garantiasServlet")
public class garantiasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public garantiasServlet() {
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

		int ProcesoCompra = (Integer) session.getAttribute("noCompra");

		String mantenimientoOferta = request.getParameter("offerGuaranteeYes");
		String manifiestoMantenimiento = request.getParameter("manifestGuaranteeYes");
		String porcentajeMantenimiento = request.getParameter("offerManteinancePercent");
		String tiempoMantenimiento = request.getParameter("offerManteinanceDaysPeriod");

		String garantiaCumplimiento = request.getParameter("complianceGuaranteeYes");
		String manifiestoCumplimiento = request.getParameter("manifestComplianceGuaranteeYes");
		String porcentajeCumplimiento = request.getParameter("offerCompliancePercent");
		String tiempoCumplimiento = request.getParameter("offerComplianceDaysPeriod");
		String tiempoManifiesto = request.getParameter("offerComplianceManifestDaysPeriod");

		String garantiaCalidad = request.getParameter("qualityGuaranteeYes");
		String manifiestoCalidad = request.getParameter("manifestQualityGuaranteeYes");
		String porcentajeCalidad = request.getParameter("qualityGuaranteePercent");
		String tiempoCalidad = request.getParameter("qualityGuaranteePeriod");
		String unidadTiempo = request.getParameter("qualityGuaranteePeriodType");

		String garantiaMixta = request.getParameter("mixGuaranteeYes");

		String funcion = (String) session.getAttribute("funcion");

		garantias g = new garantias();

		switch (funcion) {
			case "modificar":
				garantiasDao.deleteAll(ProcesoCompra);

				// Hay que crear funciones que hagan todo esto de abajo para no estar repitiendo
				// codigo

				if (mantenimientoOferta != null && !mantenimientoOferta.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE MANTENIMINETO DE LA OFERTA");
				}

				if (manifiestoMantenimiento != null && !manifiestoMantenimiento.isEmpty()) {
					g.setTipoManifiesto("SI");
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeMantenimiento);
				System.out.println(tiempoMantenimiento);
				if (tiempoMantenimiento != null && !tiempoMantenimiento.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoMantenimiento));
				}
				g.setTiempoManifiesto(0);
				g.setUnidadTiempo("DIAS");

				garantiasDao.save(g);

				if (garantiaCumplimiento != null && !garantiaCumplimiento.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE CUMPLIMIENTO");
				}

				if (manifiestoCumplimiento != null && !manifiestoCumplimiento.isEmpty()) {
					g.setTipoManifiesto("SI");
					if (tiempoManifiesto != null && !tiempoManifiesto.isEmpty()) {
						g.setTiempoManifiesto(Integer.parseInt(tiempoManifiesto));
					}
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeCumplimiento);

				if (tiempoCumplimiento != null && !tiempoCumplimiento.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoCumplimiento));
				}

				g.setUnidadTiempo("DIAS");

				garantiasDao.save(g);

				if (garantiaCalidad != null && !garantiaCalidad.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE CALIDAD");
				}

				if (manifiestoCalidad != null && !manifiestoCalidad.isEmpty()) {
					g.setTipoManifiesto("SI");
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeCalidad);

				if (tiempoCalidad != null && !tiempoCalidad.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoCalidad));
				}
				g.setTiempoManifiesto(0);
				g.setUnidadTiempo(unidadTiempo);

				garantiasDao.save(g);

				if (garantiaMixta != null && !garantiaMixta.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA MIXTA");
					garantiasDao.save(g);
				}

				/*
				 * request.setAttribute("mantenimientoOferta", mantenimientoOferta);
				 * request.setAttribute("porcentajeMO", porcentajeMantenimiento);
				 * request.setAttribute("tiempoMO", tiempoMantenimiento);
				 * request.setAttribute("manifiestoMO", manifiestoMantenimiento);
				 * 
				 * request.setAttribute("cumplimiento", garantiaCumplimiento);
				 * request.setAttribute("porcentajeC", porcentajeCumplimiento);
				 * request.setAttribute("tiempoC", tiempoCumplimiento);
				 * request.setAttribute("manifiestoC", tiempoManifiesto);
				 * request.setAttribute("tiempoManifiestoC", manifiestoCumplimiento);
				 * 
				 * request.setAttribute("calidad", garantiaCalidad);
				 * request.setAttribute("porcentajeCal", porcentajeCalidad);
				 * request.setAttribute("tiempoCal", tiempoCalidad);
				 * request.setAttribute("unidadTiempoCal", unidadTiempo);
				 * request.setAttribute("manifiestoCal", manifiestoCalidad);
				 * 
				 * request.setAttribute("mixta", garantiaMixta);
				 */

				request.getRequestDispatcher("nPurchaseProcessRequirementsList.jsp").forward(request, response);
				break;
			case "revisar":
				request.setAttribute("procesoCompra", procesoCompraALPDao.getProcesoCompra(ProcesoCompra));

				String obs = procesoCompraALPDao.getObservacions(ProcesoCompra);
				if (obs == null || obs.isBlank()) {
					obs = " ";
				}

				String estado = procesoCompraALPDao.getEstado(ProcesoCompra);
				if (estado == null || estado.isBlank()) {
					estado = "INACTIVO";
				}

				request.setAttribute("estado", estado);
				request.setAttribute("observaciones", obs);
				request.getRequestDispatcher("nPurchaseProcessRequirementsList.jsp").forward(request, response);
				break;
			case "consultar":
				request.setAttribute("procesoCompra", procesoCompraALPDao.getProcesoCompra(ProcesoCompra));
				request.getRequestDispatcher("nPurchaseProcessRequirementsList.jsp").forward(request, response);
				break;
			default:
				if (mantenimientoOferta != null && !mantenimientoOferta.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE MANTENIMINETO DE LA OFERTA");

				}

				if (manifiestoMantenimiento != null && !manifiestoMantenimiento.isEmpty()) {
					g.setTipoManifiesto("SI");
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeMantenimiento);
				if (tiempoMantenimiento != null && !tiempoMantenimiento.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoMantenimiento));
				}
				g.setTiempoManifiesto(0);
				g.setUnidadTiempo("DIAS");

				garantiasDao.save(g);

				if (garantiaCumplimiento != null && !garantiaCumplimiento.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE CUMPLIMIENTO");
				}

				if (manifiestoCumplimiento != null && !manifiestoCumplimiento.isEmpty()) {
					g.setTipoManifiesto("SI");
					if (tiempoManifiesto != null && !tiempoManifiesto.isEmpty()) {
						g.setTiempoManifiesto(Integer.parseInt(tiempoManifiesto));
					}
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeCumplimiento);
				if (tiempoCumplimiento != null && !tiempoCumplimiento.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoCumplimiento));
				}

				g.setUnidadTiempo("DIAS");

				garantiasDao.save(g);

				if (garantiaCalidad != null && !garantiaCalidad.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA DE CALIDAD");
				}

				if (manifiestoCalidad != null && !manifiestoCalidad.isEmpty()) {
					g.setTipoManifiesto("SI");
				} else {
					g.setTipoManifiesto("NO");
				}

				g.setPorcentaje(porcentajeCalidad);
				if (tiempoCalidad != null && !tiempoCalidad.isEmpty()) {
					g.setTiempo(Integer.parseInt(tiempoCalidad));
				}
				g.setTiempoManifiesto(0);
				g.setUnidadTiempo(unidadTiempo);

				garantiasDao.save(g);

				if (garantiaMixta != null && !garantiaMixta.isEmpty()) {
					g.setProcesoCompra(ProcesoCompra);
					g.setTipoGarantia("GARANTIA MIXTA");
					garantiasDao.save(g);
				}

				request.getRequestDispatcher("nPurchaseProcessRequirementsList.jsp").forward(request, response);
				break;
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
