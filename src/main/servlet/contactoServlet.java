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
 * Servlet implementation class contactoServlet
 */
@WebServlet("/contactoServlet")
public class contactoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public contactoServlet() {
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
		String id = request.getParameter("id");
		String nombre = request.getParameter("nombre");
		String cargo = request.getParameter("cargo");
		String correo = request.getParameter("correo");
		String correo2 = request.getParameter("correo2");
		String departamento = request.getParameter("departamento");
		String telefono = request.getParameter("tMovil");
		String telefono2 = request.getParameter("tMovil2");
		String fijo = request.getParameter("tFijo");
		String extension = request.getParameter("extension");
		String activ = request.getParameter("activo");
		String obs = request.getParameter("obs");
		String padre = request.getParameter("padre");
		String isRev = request.getParameter("isRev");
		String isConsultar = request.getParameter("isConsultar");
		String modifTipo = request.getParameter("modifTipo");
System.out.print(submit + " Accion contacto");
		try {
			if (submit.contentEquals("enviar")) {
				contacto c = new contacto();
				c.setNombre(nombre);
				c.setCargo(cargo);
				c.setCorreo(correo);
				c.setCorreo2(correo2);
				c.setDepartamento(departamento);
				c.setTelefono(telefono);
				c.setTelefono2(telefono2);
				c.setTelefonoFijo(fijo);
				c.setExtension(extension);
				c.setObservacion(obs);
				if (activ != null && !activ.isEmpty()) {
					c.setEstado("ACTIVO");
				} else {
					c.setEstado("INACTIVO");
				}
				c.setPadre(padre);
				
				int existe = contactosDao.getContacto(nombre, padre);
				
				if(existe == 0 ) {
					contactosDao.save(c);
				}
				
				
				request.setAttribute("padre", padre);
				request.setAttribute("isRev", isRev);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("modifTipo", modifTipo);
				request.getRequestDispatcher("nContactos.jsp").forward(request, response);
			} else if (submit.contentEquals("apr")) {
				String viejoNombre = request.getParameter("oldName");
				contacto c = new contacto();
				c.setId(Integer.parseInt(id));
				c.setNombre(nombre);
				c.setCargo(cargo);
				c.setCorreo(correo);
				c.setCorreo2(correo2);
				c.setDepartamento(departamento);
				c.setTelefono(telefono);
				c.setTelefono2(telefono2);
				c.setTelefonoFijo(fijo);
				c.setExtension(extension);
				c.setObservacion(obs);
				if (activ != null && !activ.isEmpty()) {
					c.setEstado("ACTIVO");
				} else {
					c.setEstado("INACTIVO");
				}
				c.setPadre(padre);
				contactosDao.update(c);
				contactosDao.updateEstado(c);
				request.setAttribute("padre", padre);
				request.setAttribute("isRev", isRev);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("modifTipo", modifTipo);

				request.getRequestDispatcher("nContactos.jsp").forward(request, response);
			} else if (submit.contentEquals("back")) {
				request.setAttribute("padre", padre);
				request.setAttribute("isRev", isRev);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("modifTipo", modifTipo);
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
				}
			} else {
				distribuidor d = new distribuidor();
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					d = distribuidorDao.getBenef(padre, "BENEFICIARIO");
				} else {
					d = distribuidorDao.getById(padre);
				}

				request.setAttribute("padre", padre);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isRev", isRev);
				request.setAttribute("modifTipo", modifTipo);
				if (d.getDistribuidor().contains("BENEFICIARIO")) {
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("beneficiarios.jsp").forward(request, response);
				} else {
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("distribuidorFabricante.jsp").forward(request, response);
				}

			}
		} catch (Exception e) {
			System.out.println(e);
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