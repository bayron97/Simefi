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
 * Servlet implementation class accionistaDistribuidorServlet
 */

@WebServlet("/escrituraServlet")
public class escrituraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public escrituraServlet() {
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
		System.out.println(submit + " Accion a realizar");
		String naturalN = request.getParameter("naturalN");
		String nombre = request.getParameter("nombre");
		String nombreEscritura = request.getParameter("nombreEscritura");
		String directo = request.getParameter("directo");
		String tipoA = request.getParameter("tipoA");
		String matricula;
		String m = request.getParameter("matricula");
		if (m != null && !m.isEmpty()) {
			String[] mat = m.split("-");
			matricula = mat[2] + '/' + mat[1] + '/' + mat[0];
		} else {
			matricula = "";
		}
		String nacionalidad = request.getParameter("nacionalidad");
		String tipoId = request.getParameter("tipoId");
		String telefono = request.getParameter("telefono");
		String noId = request.getParameter("noId");
		String padre = request.getParameter("padre");
		String paisResidencia = request.getParameter("paisResidencia");
		String tipoAccionista = request.getParameter("tipoAccionista");
		String participacion = request.getParameter("participacion");
		String cantidadAcciones = request.getParameter("cantidadAcciones");
		String isRev = request.getParameter("isRev");
		String isConsultar = request.getParameter("isConsultar");
		String isModif = request.getParameter("isModif");
		String modifTipo = request.getParameter("modifTipo");
		String act1 = request.getParameter("act1");
		String act2 = request.getParameter("act2");
		if (submit.contentEquals("contactos")) {
			escritura a = new escritura();
			a.setNaturalN(naturalN);
			a.setNombre(nombre);
			a.setNacionalidad(nacionalidad);
			a.setMatricula(matricula);
			a.setTipoId(tipoId);
			a.setTelefono(telefono);
			a.setNoId(noId);
			a.setPadre(padre);
			a.setPaisResidencia(paisResidencia);
			a.setTipoAccionista(tipoAccionista);
			a.setTipoAccionista(tipoA);
			
			int existe = escrituraDao.getAccionista(nombre, padre, tipoAccionista);
			
			if(existe == 0 ) {
				escrituraDao.save(a);
			}
			
			System.out.println(existe + " accionista");
			
			
			request.setAttribute("padre", padre);
			request.setAttribute("isRev", isRev);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			if (modifTipo.contentEquals("BENEFICIARIO")) {
				request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
			} else if (directo != null && directo.contentEquals("true")) {
				request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
			}
		} else if (submit.contentEquals("rev")) {
			escritura a = new escritura();
//			a.setNaturalN(naturalN);
			a.setNombre(nombre);
			a.setNacionalidad(nacionalidad);
			a.setMatricula(matricula);
			a.setTipoId(tipoId);
			a.setTelefono(telefono);
			a.setNoId(noId);
			a.setPadre(padre);
			a.setPaisResidencia(paisResidencia);
			a.setTipoAccionista(tipoAccionista);
			a.setTipoAccionista(tipoA);
			a.setNum(Integer.parseInt(request.getParameter("modifId")));
			if (act1 != null && !act1.isEmpty()) {
				a.setEstado1("APROBADO");
			} else {
				a.setEstado1("NO APROBADO");
			}
			if (act2 != null && !act2.isEmpty()) {
				a.setEstado2("ACTIVO");
			} else {
				a.setEstado2("INACTIVO");
			}
			escrituraDao.rev(a);
			request.setAttribute("padre", padre);
			request.setAttribute("isRev", isRev);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			if (modifTipo.contentEquals("BENEFICIARIO")) {
				request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
			} else if (directo != null && directo.contentEquals("true")) {
				request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
			}
		} else if (submit.contentEquals("back")) {
			request.setAttribute("padre", padre);
			request.setAttribute("isRev", isRev);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("tipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			if (modifTipo != null && modifTipo.contentEquals("BENEFICIARIO")) {
				request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
			} else if (directo != null && directo.contentEquals("true")) {
				request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);

			} else {
				request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
			}
		} else if (submit.contentEquals("agregarAccionista")) {
			String escrituraPadre = request.getParameter("escrituraPadre");

			request.setAttribute("padre", padre);
			request.setAttribute("escrituraPadre", escrituraPadre);
			request.setAttribute("nombreEscritura", nombreEscritura);
			request.setAttribute("isRev", isRev);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isModif", isModif);
			if (escrituraPadre != null && !escrituraPadre.isEmpty()) {
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
				} else {
					request.setAttribute("directo", directo);
					request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
				}
			} else {
				if (modifTipo.contentEquals("BENEFICIARIO")) {
					request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
				} else if (directo != null && directo.contentEquals("true")) {
					request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
				}
			}

		} else if (submit.contentEquals("mod")) {
			escritura a = new escritura();
			a.setNaturalN(naturalN);
			a.setNombre(nombre);
			a.setNacionalidad(nacionalidad);
			a.setMatricula(matricula);
			a.setTipoId(tipoId);
			a.setTelefono(telefono);
			a.setNoId(noId);
			a.setPadre(padre);
			a.setPaisResidencia(paisResidencia);
			a.setTipoAccionista(tipoA);

			escrituraDao.update(a, request.getParameter("modifId"));
			request.setAttribute("padre", padre);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			if (modifTipo.contentEquals("BENEFICIARIO")) {
				request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
			} else if (directo != null && directo.contentEquals("true")) {
				request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
			}
		} else if (submit.contentEquals("apr")) {
			escritura a = new escritura();
			a.setNaturalN(naturalN);
			a.setNombre(nombre);
			a.setNacionalidad(nacionalidad);
			a.setMatricula(matricula);
			a.setTipoId(tipoId);
			a.setTelefono(telefono);
			a.setNoId(noId);
			a.setPadre(padre);
			a.setPaisResidencia(paisResidencia);
			a.setTipoAccionista(tipoAccionista);

			if (modifTipo.contentEquals("BENEFICIARIO")) {

				escrituraDao.update(a, request.getParameter("modifId"));
				request.setAttribute("padre", padre);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isModif", isModif);
				request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
			} else {
				a.setParticipacion(Integer.parseInt(participacion));
				a.setCantidadAcciones(Integer.parseInt(cantidadAcciones));
				escrituraDao.update(a, request.getParameter("modifId"));
				request.setAttribute("padre", padre);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("isModif", isModif);
				if (directo != null && directo.contentEquals("true")) {
					request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
				}
			}
		} else if (submit.contentEquals("ct")) {
			System.out.println("ct entro aqui ");
			request.setAttribute("padre", padre);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isRev", isRev);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			request.getRequestDispatcher("nContactos.jsp").forward(request, response);
		} else {
			request.setAttribute("padre", padre);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isRev", isRev);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			if (directo != null && !directo.contentEquals("true")) {
				request.getRequestDispatcher("nContactos.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
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