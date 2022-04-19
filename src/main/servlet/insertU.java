package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class insertU
 */
@WebServlet("/insertU")
public class insertU extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public insertU() {
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
		String activ1 = request.getParameter("activ1");
		String activ2 = request.getParameter("activ2");
		HttpSession session = request.getSession(true);
		try {
			User u = new User();

			accesos tipoAcceso = accesosDao.getAccess((String) session.getAttribute("usuario"), "crearUsuario");
			if (tipoAcceso.getTipoAcceso().contentEquals("administrar")
					|| tipoAcceso.getTipoAcceso().contentEquals("digitar")) {
				if (submit.contentEquals("guardar")) {
					u = UserDao.getUserById(request.getParameter("overlayUsuario"));
					u.setCodEmp(Integer.parseInt(request.getParameter("overlayCod")));
					u.setPassword(u.getPassword());
					u.setUsuario(request.getParameter("overlayUsuario"));
					u.setCorreo(request.getParameter("overlayCorreo"));
					u.setPuesto(request.getParameter("overlayPuesto"));
					u.setNombre(request.getParameter("overlayNombre"));
					u.setIdentidad(request.getParameter("overlayId"));
					u.setFuncion(request.getParameter("overlayFunc"));
					String obser = request.getParameter("overlayObs");
					if (request.getParameter("m1") != null && !request.getParameter("m1").isEmpty()) {
						obser += "/" + request.getParameter("m1");
					}

					if (request.getParameter("m2") != null && !request.getParameter("m2").isEmpty()) {
						obser += "/" + request.getParameter("m2");
					}

					u.setObs(obser);

					if (activ1 != null && !activ1.isEmpty()) {
						u.setEstado1("APROBADO");
					} else {
						u.setEstado1("RECHAZADO");
					}
					if (activ2 != null && !activ2.isEmpty()) {
						u.setEstado2("Activo");
					} else {
						u.setEstado2("Inactivo");
					}
					historialAccesos h = new historialAccesos();
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("CREAR USUARIO");
					h.setFuncion("MODIFICAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);
					UserDao.updateUsr(u);
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
				} else if (submit.contentEquals("rev")) {
					u = UserDao.getUserById(request.getParameter("overlayUsuario"));
					u.setCodEmp(Integer.parseInt(request.getParameter("overlayCod")));
					u.setPassword(u.getPassword());
					u.setUsuario(request.getParameter("overlayUsuario"));
					u.setCorreo(request.getParameter("overlayCorreo").toUpperCase());
					u.setPuesto(request.getParameter("overlayPuesto"));
					u.setNombre(request.getParameter("overlayNombre"));
					u.setIdentidad(request.getParameter("overlayId"));
					u.setFuncion(request.getParameter("overlayFunc"));
					String obser = request.getParameter("overlayObs");
					if (request.getParameter("m1") != null && !request.getParameter("m1").isEmpty()) {
						obser += "/" + request.getParameter("m1");
					}

					if (request.getParameter("m2") != null && !request.getParameter("m2").isEmpty()) {
						obser += "/" + request.getParameter("m2");
					}

					u.setObs(obser);

					if (activ1 != null && !activ1.isEmpty()) {
						u.setEstado1("APROBADO");
					} else {
						u.setEstado1("RECHAZADO");
					}
					if (activ2 != null && !activ2.isEmpty()) {
						u.setEstado2("Activo");
					} else {
						u.setEstado2("Inactivo");
					}

					UserDao.rev(u);
					historialAccesos h = new historialAccesos();
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("CREAR USUARIO");
					h.setFuncion("REVISAR Y APROBAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
				} else if (submit.contentEquals("enviar")) {
					u.setCodEmp(Integer.parseInt(request.getParameter("overlayCod")));

					u.setUsuario(request.getParameter("overlayUsuario"));
					u.setCorreo(request.getParameter("overlayCorreo").toUpperCase());
					u.setPassword("tempocci");
					u.setPuesto(request.getParameter("overlayPuesto"));
					u.setNombre(request.getParameter("overlayNombre"));
					u.setIdentidad(request.getParameter("overlayId"));
					u.setFuncion(request.getParameter("overlayFunc"));
					u.setObs(request.getParameter("overlayObs"));

					int v = UserDao.save(u);

					if (v == 0) {
						response.setContentType("text/html");
						PrintWriter pw = response.getWriter();
						pw.println("<script type=\"text/javascript\">");
						pw.println("alert('ERROR AL CREAR USUARIO');");
						pw.println("</script>");
						request.setAttribute("throughServlet", "true");
						RequestDispatcher rd = request.getRequestDispatcher("crearUsuario.jsp");
						rd.include(request, response);
					} else {
						historialAccesos h = new historialAccesos();
						h.setModulo("PARAMETRIZACION DE USUARIOS");
						h.setSubmodulo("CREAR USUARIO");
						h.setFuncion("CREAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						accesos a = new accesos();
						a.setUsuario(u.getUsuario().toUpperCase());
						a.setTipoAcceso("nuevoUsuario");
						a.setSubModulo("reseteoPassword");
						a.setEstado1("PENDIENTE APROBAR");
						a.setEstado2("INACTIVO");
						accesosDao.save(a);

						a.setSubModulo("crearUsuario");
						accesosDao.save(a);

						a.setSubModulo("accesos");
						accesosDao.save(a);

						a.setSubModulo("reportes");
						accesosDao.save(a);

						a.setSubModulo("distribuidorFabricante");
						accesosDao.save(a);

						a.setSubModulo("beneficiarios");
						accesosDao.save(a);

						a.setSubModulo("medicamentos");
						accesosDao.save(a);

						a.setSubModulo("insumos");
						accesosDao.save(a);

						a.setSubModulo("parametrizacion");
						accesosDao.save(a);
						
						a.setSubModulo("paramOpeningPlace");
						accesosDao.save(a);
						
						a.setSubModulo("paramCriteriosEvaluation");
						accesosDao.save(a);
						
						a.setSubModulo("paramALP");
						accesosDao.save(a);
						
						a.setSubModulo("purchaseProcessesGeneral");
						accesosDao.save(a);
						
						a.setSubModulo("amendmentsGeneral");
						accesosDao.save(a);
						
						a.setSubModulo("vaciadoOfertaGeneral");
						accesosDao.save(a);
						
						a.setSubModulo("recomendacionOfertaGeneral");
						accesosDao.save(a);
						
						a.setSubModulo("ratificacionOfertaGeneral");
						accesosDao.save(a);
						
						a.setSubModulo("purchaseProcessesALP");
						accesosDao.save(a);

						a.setSubModulo("amendmentsALP");
						accesosDao.save(a);

						a.setSubModulo("vaciadoOfertaALP");
						accesosDao.save(a);

						a.setSubModulo("recomendacionOfertaALP");
						accesosDao.save(a);

						a.setSubModulo("solicitudCompraALP");
						accesosDao.save(a);

						a.setSubModulo("evaluacionRecomendacionOferta");
						accesosDao.save(a);

						a.setSubModulo("ratificacionCTFOferta");
						accesosDao.save(a);

						a.setSubModulo("contrataciones");
						accesosDao.save(a);

						a.setSubModulo("contratoSuministroALP");
						accesosDao.save(a);

						a.setSubModulo("controlGarantiasALP");
						accesosDao.save(a);

						a.setSubModulo("controlPagosALP");
						accesosDao.save(a);

						a.setSubModulo("recepcionProductos");
						accesosDao.save(a);

						
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
						System.out.println(u.getUsuario() + " user created");
					}
				}
			} else {
				historialAccesos h = new historialAccesos();
				h.setModulo("PARAMETRIZACION DE USUARIOS");
				h.setSubmodulo("CREAR USUARIO");
				h.setFuncion("OPERACION SIN PERMISO");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				UserDao.updateUsr(u);
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("crearUsuario.jsp").forward(request, response);
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
