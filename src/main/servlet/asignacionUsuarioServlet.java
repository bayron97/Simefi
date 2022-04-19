package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class asignacionUsuarioServlet
 */
@WebServlet("/asignacionUsuarioServlet")
public class asignacionUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public asignacionUsuarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String submit = request.getParameter("submit");
		if (submit.contentEquals("nuevo")) {
			String usuario = request.getParameter("usuario");
			String modulo = request.getParameter("modulo");
			String subModulo = request.getParameter("subModulo");
			String acceso = request.getParameter("acceso");
			String nivel = request.getParameter("nivel");

			asignacionUsuario a = new asignacionUsuario();
			a.setEmpleadoSubModulo(usuario + subModulo);
			a.setUsuario(usuario);
			a.setModulo(modulo);
			a.setSubModulo(subModulo);
			a.setAccesso(acceso);
			a.setNivel(nivel);
			a.setEstado1("PENDIENTE APROBAR");
			asignacionUsuarioDao.save(a);
			response.sendRedirect("asignacionUsuario.jsp");
		} else if (submit.contentEquals("editar")) {
			asignacionUsuario a = new asignacionUsuario();
			String usuario = request.getParameter("usuario");
			String modulo = request.getParameter("moduloModif");
			String subModulo = request.getParameter("subModif");
			String acceso = request.getParameter("accesoModif");
			String nivel = request.getParameter("nivelModif");

			a.setUsuario(usuario);
			a.setEmpleadoSubModulo(usuario + subModulo);
			a.setSubModulo(subModulo);
			a.setModulo(modulo);
			a.setAccesso(acceso);
			a.setNivel(nivel);
			a.setEstado1(a.getEstado1());
			a.setEstado2(a.getEstado2());
			asignacionUsuarioDao.updateSimple(a, request.getParameter("oldId") + subModulo);
			response.sendRedirect("asignacionUsuario.jsp");
		} else {
			asignacionUsuario a = new asignacionUsuario();

			String usuario = request.getParameter("usuario");
			String modulo = request.getParameter("moduloModif");
			String subModulo = request.getParameter("subModif");
			String acceso = request.getParameter("accesoModif");
			String nivel = request.getParameter("nivelModif");
			String motiv1 = request.getParameter("motiv1");
			String motiv2 = request.getParameter("motiv2");
			String es1 = request.getParameter("ap1");
			String es2 = request.getParameter("ap2");

			if (es1 != null && !es1.isEmpty()) {
				a.setEstado1("APROBADO");
			} else {
				a.setEstado1("RECHAZADO");
			}

			if (es2 != null && !es2.isEmpty()) {
				a.setEstado2("ACTIVO");
			} else {
				a.setEstado2("INACTIVO");
			}

			a.setUsuario(usuario);
			a.setEmpleadoSubModulo(usuario + subModulo);
			a.setSubModulo(subModulo);
			a.setModulo(modulo);
			a.setAccesso(acceso);
			a.setNivel(nivel);
			a.setMotivo1(motiv1);
			a.setMotivo2(motiv2);
			asignacionUsuarioDao.update(a);
			response.sendRedirect("asignacionUsuario.jsp");
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
