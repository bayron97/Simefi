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
 * Servlet implementation class representanteLegalServlet
 */
@WebServlet("/representanteLegalServlet")
public class representanteLegalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public representanteLegalServlet() {
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
		String nombre = request.getParameter("overlayNombre");
		String tipoId = request.getParameter("tipoId");
		String noId = request.getParameter("noId");
		String nacionalidad = request.getParameter("nacionalidad");
		String telefono = request.getParameter("telefono");
		String telefono2 = request.getParameter("telefono2");
		String correo = request.getParameter("correo");
		String correo2 = request.getParameter("correo2");
		String activo = request.getParameter("activo");
		String obs = request.getParameter("obs");
		String matricula = request.getParameter("padre");
		String isRev = request.getParameter("isRev");
		String modifTipo = request.getParameter("modifTipo");
		String isModif = request.getParameter("isModif");
		String isConsultar = request.getParameter("isConsultar");
		String extension = request.getParameter("ext");
		try {
			if (submit.contentEquals("contactos")) {
				representanteLegal r = new representanteLegal();

				r.setNombre(nombre);
				r.setTipoId(tipoId);
				r.setNoId(noId);
				r.setNacionalidad(nacionalidad);
				r.setTelefono(telefono);
				r.setTelefono2(telefono2);
				;
				r.setCorreo(correo);
				r.setCorreo2(correo2);
				r.setExtension(extension);
				if (activo != null && !activo.isEmpty()) {
					r.setEstado("Activo");
				} else {
					r.setEstado("Inactivo");
				}
				r.setObservacion(obs);
				r.setMatricula(matricula);
				
				int existe = representantaLegalDao.getRepresentanteLegal(matricula, noId);
				
				if(existe == 0 ) {
					representantaLegalDao.save(r);
					representantaLegalDao.setActiv(matricula, representantaLegalDao.getActiv(matricula));
				}
				
				
			
				
				request.setAttribute("isRev", isRev);
				request.setAttribute("padre", matricula);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isModif", isModif);
				request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
			} else if (submit.contentEquals("back")) {
				String tipo = request.getParameter("modifTipo");
				request.setAttribute("isRev", isRev);
				request.setAttribute("padre", matricula);
				distribuidor d = new distribuidor();
				if (tipo.contentEquals("BENEFICIARIO")) {
					d = distribuidorDao.getBenef(matricula, modifTipo);
				} else {
					d = distribuidorDao.getOne(matricula, modifTipo);
				}
				request.setAttribute("modifId", d.getDenominacion());
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("modifFecha", d.getFecha());
				request.setAttribute("modifDireccion", d.getDireccion());
				request.setAttribute("modifRtn", d.getRtn());
				request.setAttribute("modifMatricula", d.getMatricula());
				request.setAttribute("modifPais", d.getPais());
				request.setAttribute("modifBanco", d.getBanco());
				request.setAttribute("modifCuenta", d.getNoCuenta());
				request.setAttribute("modifTipoPago", d.getTipoPago());
				request.setAttribute("modifFideicomiso", d.getFideicomiso());
				request.setAttribute("modifFechaSubs", d.getFechaSubs());
				request.setAttribute("modifFechaCump", d.getFechaCump());
				request.setAttribute("modifBeneficiarioFinal", d.getDenominacion());
				request.setAttribute("isModif", "true");
				request.setAttribute("isConsultar", isConsultar);
				if (tipo.contentEquals("DISTRIBUIDOR")) {
					request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
				} else if (tipo.contentEquals("FABRICANTE")) {
					request.getRequestDispatcher("nFabricante.jsp").forward(request, response);
				} else if (tipo.contentEquals("DISTRIBUIDOR/FABRICANTE")) {
					request.getRequestDispatcher("nDistribuidor.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("nBeneficiarios.jsp").forward(request, response);
				}

			} else if (submit.contentEquals("apr")) {
				representanteLegal r = new representanteLegal();

				if (activo != null && !activo.isEmpty()) {
					r.setEstado("Activo");
				} else {
					r.setEstado("Inactivo");
				}

				r.setNombre(nombre);
				r.setTipoId(tipoId);
				r.setNoId(noId);
				r.setNacionalidad(nacionalidad);
				r.setTelefono(telefono);
				r.setTelefono2(telefono2);
				r.setCorreo(correo);
				r.setCorreo2(correo2);
				r.setObservacion(obs);
				r.setMatricula(matricula);
				r.setExtension(extension);
				representantaLegalDao.update(r);
				representantaLegalDao.setActiv(matricula, representantaLegalDao.getActiv(matricula));
				request.setAttribute("isRev", isRev);
				request.setAttribute("padre", matricula);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isModif", isModif);
				request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
			} else {
				representantaLegalDao.setActiv(matricula, representantaLegalDao.getActiv(matricula));
				request.setAttribute("isRev", isRev);
				request.setAttribute("padre", matricula);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isModif", isModif);
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
				}

			}
		} catch (Exception e) {
			System.out.println(e);
			request.setAttribute("isRev", isRev);
			request.setAttribute("padre", matricula);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
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