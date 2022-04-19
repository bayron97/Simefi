package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

/**
 * Servlet implementation class distribuidorServlet
 */
@WebServlet("/distribuidorServlet")
public class distribuidorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public distribuidorServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String submit = request.getParameter("submit");
System.out.println(submit + " submit");
		
		String modifId = request.getParameter("modifId");
		String modifTipo = request.getParameter("modifTipo");

		String isModif = request.getParameter("isModif");

		distribuidor d = new distribuidor();

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		try {
			if (submit.contentEquals("modify")) {
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					d = distribuidorDao.getBenef(modifId, modifTipo);
					request.setAttribute("subMod", "beneficiarios");
					request.setAttribute("modifId", d.getDenominacion());
				} else {
					d = distribuidorDao.getOne(modifId, modifTipo);
					request.setAttribute("subMod", "distribuidorFabricante");
					request.setAttribute("modifId", modifId);
				}
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("modifFecha", d.getFecha());
				request.setAttribute("modifDireccion", d.getDireccion());
				request.setAttribute("modifRtn", d.getRtn());
				request.setAttribute("modifMatricula", d.getMatricula());
				request.setAttribute("modifPais", d.getPais());
				request.setAttribute("modifBanco", d.getBanco());
				request.setAttribute("modifCuenta", d.getNoCuenta());
				request.setAttribute("modifTipoPago", d.getTipoPago());
				request.setAttribute("modifFechaSubs", d.getFechaSubs());
				request.setAttribute("modifFechaCump", d.getFechaCump());
				request.setAttribute("modifBeneficiarioFinal", d.getDenominacion());
				request.setAttribute("persona", d.getPersoneria());
				request.setAttribute("isModif", "true");
				request.setAttribute("isRev", "false");
				String referer = request.getHeader("Referer");
				if (modifId.isEmpty() || modifId == null) {
					request.getRequestDispatcher("authAcceso").forward(request, response);
				} else {
					if (modifTipo.contentEquals("FABRICANTE")) {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("MODIFICAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.getRequestDispatcher("nFabricante.jsp").forward(request, response);
					} else if (modifTipo.contentEquals("BENEFICIARIO")) {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("BENEFICIARIOS");
						h.setFuncion("MODIFICAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("modifFideicomiso", d.getFideicomiso());
						request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
					} else {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("MODIFICAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
					}
				}
			} else if (submit.contentEquals("nDistFab")) {
				request.setAttribute("modifTipo", modifTipo);
				request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
			} else if (submit.contentEquals("consultar")) {
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					d = distribuidorDao.getBenef(modifId, modifTipo);
					request.setAttribute("modifId", d.getDenominacion());
					request.setAttribute("subMod", "beneficiarios");
				} else {
					d = distribuidorDao.getOne(modifId, modifTipo);
					request.setAttribute("modifId", modifId);
					request.setAttribute("subMod", "distribuidorFabricante");
				}

				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("modifFecha", d.getFecha());
				request.setAttribute("modifDireccion", d.getDireccion());
				request.setAttribute("modifRtn", d.getRtn());
				request.setAttribute("modifMatricula", d.getMatricula());
				request.setAttribute("modifPais", d.getPais());
				request.setAttribute("modifBanco", d.getBanco());
				request.setAttribute("modifCuenta", d.getNoCuenta());
				request.setAttribute("modifTipoPago", d.getTipoPago());
				request.setAttribute("modifFechaSubs", d.getFechaSubs());
				request.setAttribute("modifFechaCump", d.getFechaCump());
				request.setAttribute("modifBeneficiarioFinal", d.getDenominacion());
				request.setAttribute("persona", d.getPersoneria());
				request.setAttribute("isModif", "false");
				request.setAttribute("isRev", "true");
				request.setAttribute("isConsultar", "true");
				String referer = request.getHeader("Referer");
				if (modifId.isEmpty() || modifId == null) {
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("authAcceso").forward(request, response);
				} else {
					if (modifTipo.contentEquals("FABRICANTE")) {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("CONSULTAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("tipo", "fabricante");
						request.getRequestDispatcher("nFabricante.jsp").forward(request, response);
					} else if (modifTipo.contentEquals("BENEFICIARIO")) {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("BENEFICIARIOS");
						h.setFuncion("CONSULTAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("modifFideicomiso", d.getFideicomiso());
						request.setAttribute("tipo", "beneficiario");
						request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
					} else {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("CONSULTAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("tipo", "distribuidor");
						request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
					}
				}
			} else if (submit.contentEquals("revisar")) {
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					d = distribuidorDao.getBenef(modifId, modifTipo);
					request.setAttribute("modifId", d.getDenominacion());
					request.setAttribute("subMod", "beneficiarios");
				} else {
					d = distribuidorDao.getOne(modifId, modifTipo);
					request.setAttribute("modifId", modifId);
					request.setAttribute("subMod", "distribuidorFabricante");
				}
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("modifFecha", d.getFecha());
				request.setAttribute("modifDireccion", d.getDireccion());
				request.setAttribute("modifRtn", d.getRtn());
				request.setAttribute("modifMatricula", d.getMatricula());
				request.setAttribute("modifPais", d.getPais());
				request.setAttribute("modifBanco", d.getBanco());
				request.setAttribute("modifCuenta", d.getNoCuenta());
				request.setAttribute("modifTipoPago", d.getTipoPago());
				request.setAttribute("modifFechaSubs", d.getFechaSubs());
				request.setAttribute("modifFechaCump", d.getFechaCump());
				request.setAttribute("modifBeneficiarioFinal", d.getDenominacion());
				request.setAttribute("persona", d.getPersoneria());
				request.setAttribute("isModif", "false");
				request.setAttribute("isRev", "true");
				request.setAttribute("isConsultar", "false");
				String referer = request.getHeader("Referer");
				if (modifId.isEmpty() || modifId == null) {
					request.getRequestDispatcher("authAcceso").forward(request, response);
				} else {
					if (modifTipo.contentEquals("FABRICANTE")) {
						request.setAttribute("tipo", "fabricante");

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("REVISAR Y APROBAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.getRequestDispatcher("nFabricante.jsp").forward(request, response);
					} else if (modifTipo.contentEquals("BENEFICIARIO")) {
						request.setAttribute("modifFideicomiso", d.getFideicomiso());
						request.setAttribute("tipo", "beneficiario");

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("BENEFICIARIOS");
						h.setFuncion("REVISAR Y APROBAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
					} else {

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
						h.setFuncion("REVISAR Y APROBAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("tipo", "distribuidor");
						request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
					}
				}
			} else if (submit.contentEquals("rev")) {
				String activo = request.getParameter("act1");
				String activo2 = request.getParameter("act2");
				String mot1 = request.getParameter("mot1");
				String mot2 = request.getParameter("mot2");
				String cod = request.getParameter("overlayCod");
				String modifTip = request.getParameter("modifTipo");
				String pendienteAprobar = request.getParameter("pendienteAprobar");
				if (activo != null && !activo.isEmpty()) {
					d.setEstado1("APROBADO");
				} else if (pendienteAprobar != null && !pendienteAprobar.isEmpty()){
					d.setEstado1("PENDIENTE DE APROBAR");
				} else {
					d.setEstado1("RECHAZADO");
				}
				
				if (activo2 != null && !activo2.isEmpty()) {
					d.setEstado2("ACTIVO");
				} else {
					d.setEstado2("INACTIVO");
				}

				d.setMotivo1(mot1.toUpperCase());
				d.setMotivo2(mot2.toUpperCase());

				if (modifTip.contentEquals("BENEFICIARIO")) {
					d.setDenominacion(cod);
					distribuidorDao.aprobarBenef(d);
					beneficiarioFinal bf = new beneficiarioFinal();						
					bf.setBeneficiarioFinal(cod);
					//bf.setDireccion(direccion.toUpperCase());
					bf.setEstado(d.getEstado2());
					int bFinal = beneficiarioFinalDao.update(bf);
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("beneficiarios.jsp").forward(request, response);
				} else {
					d.setDenominacion(cod);
					distribuidorDao.aprobar(d);
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("distribuidorFabricante.jsp").forward(request, response);
				}
			} else if (submit.contentEquals("back")) {
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("distribuidorFabricante.jsp").forward(request, response);
			} else {
				String denominacion = request.getParameter("denominacion");
				String direccion = request.getParameter("direccion");
				String rtn = request.getParameter("rtn");
				String fechaConstitucion = request.getParameter("fechaConstitucion");
				String matricula = request.getParameter("matricula");
				String isFabricante = request.getParameter("isFabricante");
				String pais = request.getParameter("pais");
				String tipoPago = request.getParameter("tipoPago");
				String banco = request.getParameter("banco");
				String noCuenta = request.getParameter("noCuenta");
				String isRev = request.getParameter("isRev");
				String isConsultar = request.getParameter("isConsultar");
				String persona = request.getParameter("persona");
				if (denominacion == null || denominacion.isEmpty() || direccion == null || direccion.isEmpty()
						|| rtn == null || rtn.isEmpty() || matricula == null || matricula.isEmpty()) {
					request.setAttribute("modifTipo", modifTipo);
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
				} else {
					if (tipoPago != null && !tipoPago.isEmpty()) {
						d.setTipoPago("TRANSFERENCIA BANCARIA");
						d.setBanco(banco);
						d.setNoCuenta(noCuenta);
					} else {
						d.setTipoPago("CHEQUE");
					}
					d.setDenominacion(denominacion.toUpperCase());
					d.setDireccion(direccion.toUpperCase());
					d.setPais(pais.toUpperCase());
					d.setRtn(rtn);
					d.setMatricula(matricula);
					d.setEstado1("PENDIENTE DE APROBAR");
					d.setEstado2("INACTIVO");
					d.setFecha(fechaConstitucion.toUpperCase());
					d.setPersoneria(persona);

					if (isFabricante != null && !isFabricante.isEmpty()) {
						d.setDistribuidor("DISTRIBUIDOR/FABRICANTE");

					} else {
						d.setDistribuidor("DISTRIBUIDOR");
					}
					if (distribuidorDao.ValidarRTN(rtn, d.getDistribuidor()) && !isModif.contentEquals("true")
							&& !isRev.contentEquals("true")) {
						request.setAttribute("mostrarmensaje", "RTNExiste");
						request.setAttribute("modifTipo", modifTipo);
						//response.sendRedirect("nDistribuidor.jsp");
						request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
					} else {
						if (isModif.contentEquals("true")) {
							distribuidorDao.update(d, modifId);
						} else if (!isRev.contentEquals("true")) {
							distribuidorDao.save(d);

							h.setModulo("ADMINISTRACION DE DATOS");
							h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
							h.setFuncion("CREAR");
							h.setUsuario((String) session.getAttribute("usuario"));
							historialAccesosDao.save(h);

						}
						request.setAttribute("modifTipo", modifTipo);
						request.setAttribute("isRev", isRev);
						request.setAttribute("isModif", isModif);
						request.setAttribute("isConsultar", isConsultar);
						request.setAttribute("padre", denominacion);
						request.setAttribute("tipo", request.getParameter("tipo"));
						request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
					}
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			response.sendRedirect("nDistribuidor.jsp");
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