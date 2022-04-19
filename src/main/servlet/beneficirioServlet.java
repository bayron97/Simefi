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
 * Servlet implementation class beneficirioServlet
 */
@WebServlet("/beneficirioServlet")
public class beneficirioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public beneficirioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String denominacion = request.getParameter("denominacion");
		String pais = request.getParameter("pais");
		String direccion = request.getParameter("direccion");
		String fideicomiso = request.getParameter("fideicomiso");
		distribuidor b = new distribuidor();
		String isRev = request.getParameter("isRev");
		String modifTipo = request.getParameter("modifTipo");
		String isModif = request.getParameter("isModif");
		String isConsultar = request.getParameter("isConsultar");
		String FechaSubs = "0000-00-00";//request.getParameter("FechaSubs");
		String FechaCump = "0000-00-00";//request.getParameter("FechaCump");
		String BeneficiarioFinal = "-";//request.getParameter("BeneficiarioFinal");
		String submit = request.getParameter("submitBtn");

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		if (submit != null && submit.contentEquals("back")) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("beneficiarios.jsp").forward(request, response);
		} else {
			try {
				System.out.println(submit + " accion");
				if (isModif.contentEquals("true") || isRev.contentEquals("true")) {
					b = distribuidorDao.getOne(request.getParameter("modifId"), "BENEFICIARIO");
					b.setDenominacion(denominacion.toUpperCase());
					b.setPais(pais.toUpperCase());
					b.setDireccion(direccion.toUpperCase());
					b.setFideicomiso(fideicomiso.toUpperCase());
					b.setEstado1("NO APROBADO");
					b.setEstado2("INACTIVO");
					b.setFechaCump(FechaCump);
					b.setFechaSubs(FechaSubs.toUpperCase());
					b.setBeneficiarioFinal(BeneficiarioFinal.toUpperCase());
					distribuidorDao.updateBenef(b, denominacion);
					beneficiarioFinal bf = new beneficiarioFinal();	
					bf.setBeneficiarioFinal(denominacion);
					bf.setDireccion(direccion.toUpperCase());
					bf.setEstado("INACTIVO");
					//int bFinal = beneficiarioFinalDao.save(bf)
					
					String[] fechasSus = request.getParameterValues("fsCont");
					String[] fechaVenc = request.getParameterValues("fvCont");
					String[] obs = request.getParameterValues("obsCont");
					suscripcionContratos s = new suscripcionContratos();
					fechaSuscripcionDao.deleteSus(denominacion);
					if (fechasSus != null && fechasSus.length != 0) {
						for (int i = 0; i < fechasSus.length; i++) {
							s.setFechaSubs(fechasSus[i]);
							s.setFechaVenc(fechaVenc[i]);
							s.setObservacion(obs[i]);
							s.setPadre(denominacion);

							fechaSuscripcionDao.insertSus(s);
						}
					}
					request.setAttribute("padre", denominacion);
					request.setAttribute("isConsultar", isConsultar);
					request.setAttribute("isRev", isRev);
					request.setAttribute("modifTipo", modifTipo);
					request.setAttribute("isModif", isModif);
					request.setAttribute("tipo", request.getParameter("tipo"));
					request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
				} else {
					b.setDenominacion(denominacion.toUpperCase());
					b.setPais(pais.toUpperCase());
					b.setDireccion(direccion.toUpperCase());
					b.setFideicomiso(fideicomiso.toUpperCase());
					b.setDistribuidor("BENEFICIARIO");
					b.setFechaCump(FechaCump.toUpperCase());
					b.setFechaSubs(FechaSubs.toUpperCase());
					b.setBeneficiarioFinal(BeneficiarioFinal.toUpperCase());
					b.setEstado1("PENDIENTE DE APROBAR");
					b.setEstado2("INACTIVO");
					boolean exists = distribuidorDao.exists(b.getDenominacion(), b.getDistribuidor());
					if (exists) {
						request.setAttribute("padre", denominacion);
						request.setAttribute("isConsultar", isConsultar);
						request.setAttribute("isRev", isRev);
						request.setAttribute("modifTipo", modifTipo);
						request.setAttribute("tipo", request.getParameter("tipo"));
						request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
					} else {
						System.out.println("vamos a guardar");
						int estadovalidador = distribuidorDao.save(b);
						beneficiarioFinal bf = new beneficiarioFinal();						
						bf.setBeneficiarioFinal(denominacion);
						bf.setDireccion(direccion.toUpperCase());
						bf.setEstado("INACTIVO");
						int bFinal = beneficiarioFinalDao.save(bf);
						
						if(estadovalidador == 0) {
							request.setAttribute("mostrarmensaje", "mostrarmensaje");
							request.setAttribute("throughServlet", "true");
							request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
						}else {
						
						String[] fechasSus = request.getParameterValues("fsCont");
						String[] fechaVenc = request.getParameterValues("fvCont");
						String[] obs = request.getParameterValues("obsCont");
						suscripcionContratos s = new suscripcionContratos();
						if (fechasSus != null && fechasSus.length != 0) {
							for (int i = 0; i < fechasSus.length; i++) {
								s.setFechaSubs(fechasSus[i]);
								s.setFechaVenc(fechaVenc[i]);
								s.setObservacion(obs[i]);
								s.setPadre(denominacion);
								fechaSuscripcionDao.insertSus(s);
							}
						}

						h.setModulo("ADMINISTRACION DE DATOS");
						h.setSubmodulo("BENEFICIARIO");
						h.setFuncion("CREAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						request.setAttribute("padre", denominacion);
						request.setAttribute("isConsultar", isConsultar);
						request.setAttribute("isRev", isRev);
						request.setAttribute("modifTipo", modifTipo);
						request.setAttribute("tipo", request.getParameter("tipo"));
						request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
						}
					}
				}
			} catch (Exception e) {
				System.out.println(e);
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