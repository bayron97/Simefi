package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
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
@WebServlet("/solicitudCompraALPStepRouting")
public class solicitudCompraALPStepRouting extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public solicitudCompraALPStepRouting() {
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
		String func = (String)session.getAttribute("funcion");
		String openMode = (String)session.getAttribute("openMode");
		if (openMode == null)
		{
			openMode = "";
		}

		String step = request.getParameter("submit");

		if (func != null && !func.isEmpty()) {

			request.setAttribute("funcion", func);
			Long codPadre = (Long) session.getAttribute("codPadreSolCompra");
			if (codPadre == null) {
				codPadre = Long.parseLong("0");
			}
			solicitudCompraALP s = solicitudCompraALPDao.getOneByID(codPadre);
			ArrayList<oficioSolicitudCompraALP> oficiosList = oficioSolicitudCompraALPDao.getAllBySCID(codPadre);

			request.setAttribute("codPadreSolCompra", codPadre);

			switch (func) {
				case "NUEVO":
				case "MODIFICAR":
					if (step != null && !step.isEmpty()) {
						switch (step) {
							case "datosGenerales":
								ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
								ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
								ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();

								request.setAttribute("oficiosList", oficiosList);
								request.setAttribute("benfList", benfList);
								request.setAttribute("purchaseActiveList", purchaseActiveList);
								request.setAttribute("purchaseDescList", purchaseDescList);
								if (s.getCodSolicitudCompra() == null || s.getCodSolicitudCompra().isEmpty()) {
									request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
								} else {
									request.setAttribute("noSolCompra", s.getCodSolicitudCompra());
								}
								request.setAttribute("benefGuardado", s.getBeneficiario());
								request.setAttribute("descripcionCompraGuardado", s.getDescripcionCompra());
								request.setAttribute("fecha", s.getFecha());
								request.setAttribute("noProcesoCompraGuardado", s.getNoProcesoCompra());
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
								break;
							case "criteriosEvaluacion":
								request.setAttribute("cantCriterioGuardado", s.getCantCriterio());
								request.setAttribute("regSanCriterioGuardado", s.getRegSanCriterio());
								request.setAttribute("certBPMCriterioGuardado", s.getCertBPMCriterio());
								request.setAttribute("tiempoEntregaCriterioGuardado", s.getTiempoEntregaCriterio());
								request.setAttribute("vidaUtilCriterioGuardado", s.getVidaUtilCriterio());
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nCriteriosEvaluacionSolicitudCompraALP.jsp")
										.forward(request, response);
								break;
							case "listaRequerimiento":
								ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
										.getReqListByBuyRequestId(codPadre);

								request.setAttribute("reqList", reqList);
								request.setAttribute("oficiosList", oficiosList);

								request.setAttribute("noProcesoCompra", s.getNoProcesoCompra());
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nListaRequerimientoSolicitudCompraALP.jsp")
										.forward(request, response);
								break;
							case "preSeleccionItemProveedor":
								request.setAttribute("openMode", openMode);

								ArrayList<listaRequerimientoSolicitudCompraALP> reqProductNames = listaRequerimientoSolicitudCompraALPDao
										.getReqNamesByBuyRequestIdForFilter(codPadre);
								request.setAttribute("reqProductNames", reqProductNames);

								request.getRequestDispatcher("nPreseleccionItemSolicitudCompraALP.jsp").forward(request,
										response);
								break;
							case "solicitudDisponibilidad":
								request.setAttribute("openMode", openMode);
								
								ArrayList<listaRequerimientoSolicitudCompraALP> reqProductSuppliers = listaRequerimientoSolicitudCompraALPDao
										.getReqSuppliersPreselectedByBuyRequestIdForFilter(codPadre);
								request.setAttribute("reqProductSuppliers", reqProductSuppliers);
								request.setAttribute("noSolDisponibilidad", solicitudDisponibilidadALPDao.getNewCod(codPadre));

								request.getRequestDispatcher("nDisponibilidadSolicitudCompraALP.jsp").forward(request,
										response);
								break;
							default:
								session.removeAttribute("funcion");
								session.removeAttribute("openMode");
								session.removeAttribute("codPadreSolCompra");
								session.removeAttribute("purchaseCOD");
								request.setAttribute("openMode", "openError");

								request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
								break;
						}
					} else {
						ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
						ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
						ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("benfList", benfList);
						request.setAttribute("purchaseActiveList", purchaseActiveList);
						request.setAttribute("purchaseDescList", purchaseDescList);
						if (s.getCodSolicitudCompra() == null || s.getCodSolicitudCompra().isEmpty()) {
							request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						} else {
							request.setAttribute("noSolCompra", s.getCodSolicitudCompra());
						}
						request.setAttribute("benefGuardado", s.getBeneficiario());
						request.setAttribute("descripcionCompraGuardado", s.getDescripcionCompra());
						request.setAttribute("fecha", s.getFecha());
						request.setAttribute("noProcesoCompraGuardado", s.getNoProcesoCompra());

						request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						request.setAttribute("openMode", openMode);

						request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
				case "CONSULTAR":
					if (step != null && !step.isEmpty()) {
						// int codPadre =
						// Integer.parseInt(session.getAttribute("codPadreSolCompra").toString());
						switch (step) {
							case "datosGenerales":
								ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
								ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
								ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();

								request.setAttribute("oficiosList", oficiosList);
								request.setAttribute("benfList", benfList);
								request.setAttribute("purchaseActiveList", purchaseActiveList);
								request.setAttribute("purchaseDescList", purchaseDescList);
								if (s.getCodSolicitudCompra() == null || s.getCodSolicitudCompra().isEmpty()) {
									request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
								} else {
									request.setAttribute("noSolCompra", s.getCodSolicitudCompra());
								}
								request.setAttribute("benefGuardado", s.getBeneficiario());
								request.setAttribute("descripcionCompraGuardado", s.getDescripcionCompra());
								request.setAttribute("fecha", s.getFecha());
								request.setAttribute("noProcesoCompraGuardado", s.getNoProcesoCompra());
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
								break;
							case "criteriosEvaluacion":
								request.setAttribute("codPadreSolCompra", codPadre);
								request.setAttribute("cantCriterioGuardado", s.getCantCriterio());
								request.setAttribute("regSanCriterioGuardado", s.getRegSanCriterio());
								request.setAttribute("certBPMCriterioGuardado", s.getCertBPMCriterio());
								request.setAttribute("tiempoEntregaCriterioGuardado", s.getTiempoEntregaCriterio());
								request.setAttribute("vidaUtilCriterioGuardado", s.getVidaUtilCriterio());
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nCriteriosEvaluacionCompraALP.jsp").forward(request,
										response);
								break;
							case "listaRequerimiento":
								ArrayList<listaRequerimientoSolicitudCompraALP> reqList = listaRequerimientoSolicitudCompraALPDao
										.getReqListByBuyRequestId(codPadre);

								request.setAttribute("reqList", reqList);
								request.setAttribute("oficiosList", oficiosList);
								request.setAttribute("openMode", openMode);

								request.getRequestDispatcher("nlistaRequerimientoCompraALP.jsp").forward(request,
										response);
								break;
							case "preSeleccionItemProveedor":
								request.setAttribute("openMode", openMode);

								ArrayList<listaRequerimientoSolicitudCompraALP> reqProductNames = listaRequerimientoSolicitudCompraALPDao
										.getReqNamesByBuyRequestIdForFilter(codPadre);
								request.setAttribute("reqProductNames", reqProductNames);

								request.getRequestDispatcher("nPreseleccionItemSolicitudCompraALP.jsp").forward(request,
										response);
								break;
							case "solicitudDisponibilidad":
								request.setAttribute("openMode", openMode);
								
								ArrayList<listaRequerimientoSolicitudCompraALP> reqProductSuppliers = listaRequerimientoSolicitudCompraALPDao
										.getReqSuppliersPreselectedByBuyRequestIdForFilter(codPadre);
								request.setAttribute("reqProductSuppliers", reqProductSuppliers);

								request.getRequestDispatcher("nDisponibilidadSolicitudCompraALP.jsp").forward(request,
										response);
								break;
							case "DigSolicitudCompra":	
								
								request.getRequestDispatcher("nDigSolicitudCompALP.jsp").forward(request,
										response);
								
							default:
								session.removeAttribute("funcion");
								session.removeAttribute("openMode");
								session.removeAttribute("codPadreSolCompra");
								session.removeAttribute("purchaseCOD");
								request.setAttribute("openMode", "openError");

								request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
								break;
						}
					} else {
						ArrayList<beneficiarioFinal> benfList = beneficiarioFinalDao.getAllActive();
						ArrayList<vaciadoOfertasALP> purchaseActiveList = vaciadoOfertasALPDao.getAll();
						ArrayList<descripcioncompra> purchaseDescList = descripcioncompraDao.getAllActive();

						request.setAttribute("oficiosList", oficiosList);
						request.setAttribute("benfList", benfList);
						request.setAttribute("purchaseActiveList", purchaseActiveList);
						request.setAttribute("purchaseDescList", purchaseDescList);
						if (s.getCodSolicitudCompra() == null || s.getCodSolicitudCompra().isEmpty()) {
							request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						} else {
							request.setAttribute("noSolCompra", s.getCodSolicitudCompra());
						}
						request.setAttribute("benefGuardado", s.getBeneficiario());
						request.setAttribute("descripcionCompraGuardado", s.getDescripcionCompra());
						request.setAttribute("fecha", s.getFecha());
						request.setAttribute("noProcesoCompraGuardado", s.getNoProcesoCompra());

						request.setAttribute("noSolCompra", solicitudCompraALPDao.getNewCod());
						request.setAttribute("openMode", openMode);

						request.getRequestDispatcher("nSolicitudCompraALP.jsp").forward(request, response);
					}
					break;
				default:
					session.removeAttribute("funcion");
					session.removeAttribute("openMode");
					session.removeAttribute("codPadreSolCompra");
					session.removeAttribute("purchaseCOD");
					request.setAttribute("openMode", "openError");

					request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
					break;
			}
		} else {
			session.removeAttribute("funcion");
			session.removeAttribute("openMode");
			session.removeAttribute("codPadreSolCompra");
			session.removeAttribute("purchaseCOD");
			request.setAttribute("openMode", "openError");

			request.getRequestDispatcher("solicitudCompraALP.jsp").forward(request, response);
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
