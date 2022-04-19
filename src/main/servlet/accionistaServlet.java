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

/**
 * Servlet implementation class accionistaServlet
 */
@WebServlet("/accionistaServlet")
public class accionistaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public accionistaServlet() {
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
		String nombre = request.getParameter("nombre");
		String nacionalidad = request.getParameter("nacionalidad");
		String tipoId = request.getParameter("tipoId");
		String pais = request.getParameter("paisResidencia");
		String participacion = request.getParameter("participacion");
		String telefono = request.getParameter("telefono");
		String noId = request.getParameter("noId");
		String tipo = request.getParameter("tipoAccionista");
		String acciones = request.getParameter("cantidadAcciones");
		String padre = request.getParameter("padre");
		String isRev = request.getParameter("isRev");
		String isConsultar = request.getParameter("isConsultar");
		String modifTipo = request.getParameter("modifTipo");
		String escrituraPadre = request.getParameter("escrituraPadre");
		String cargo = request.getParameter("cargo");
		String tipoIntegrante = request.getParameter("tipoIntegrante");
		String correo1 = request.getParameter("correo1");
		String correo2 = request.getParameter("correo2");
		String isModif = request.getParameter("isModif");
		String directo = request.getParameter("directo");
		request.setAttribute("directo", directo);
		float totalDB = 0;
		accionista a = new accionista();
		try {
			switch (submit) {
				case "guardar":
					a.setNombre(nombre);
					a.setNacionalidad(nacionalidad);
					a.setTipo(tipo);
					a.setTipoId(tipoId);
					a.setPais(pais);

					a.setTelefono(telefono);
					a.setNoId(noId);

					a.setCargo(cargo);
					a.setTipoIntegrante(tipoIntegrante);
					a.setCorreo1(correo1);
					a.setCorreo2(correo2);
					escrituraPadre = request.getParameter("escrituraPadre");
					String nombreEscritura = request.getParameter("nombreEscritura");
					System.out.println(nombreEscritura + " nombreEscritura");
					if (escrituraPadre.isEmpty()) {
						escrituraPadre = null;
					}
					a.setPadre(escrituraPadre);
					totalDB = accionistaDao.totalAcciones(escrituraPadre);
					if (modifTipo.contentEquals("BENEFICIARIO")) {
						accionistaDao.save(a);
						request.setAttribute("nombreEscritura", nombreEscritura);
						request.setAttribute("escrituraPadre", escrituraPadre);
						request.setAttribute("padre", padre);
						request.setAttribute("modifTipo", modifTipo);
						request.setAttribute("isConsultar", isConsultar);
						request.setAttribute("isModif", isModif);
						if (modifTipo.contentEquals("BENEFICIARIO")) {
							request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
						} else {
							request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
						}
					} else {
						String nombreEscrituras = request.getParameter("nombreEscritura");
						if (totalDB + a.getParticipacion() > 100) {

							response.setContentType("text/html");
							PrintWriter pw = response.getWriter();
							pw.println("<script type=\"text/javascript\">");
							pw.println("alert('PORCENTAJE DE ACCIONISTAS ES MAYOR QUE 100%');");
							pw.println("</script>");
							request.setAttribute("escrituraPadre", escrituraPadre);
							request.setAttribute("padre", padre);
							request.setAttribute("nombreEscritura", nombreEscrituras);
							request.setAttribute("modifTipo", modifTipo);
							request.setAttribute("isConsultar", isConsultar);
							request.setAttribute("isModif", isModif);
							request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
						} else {
							a.setAcciones(acciones);
							a.setParticipacion(Float.parseFloat(participacion));
							
							int existe = accionistaDao.getAccionista(nombre, noId, tipo);
							
							if(existe == 0 ) {
								accionistaDao.save(a);
							}
							
							
							request.setAttribute("escrituraPadre", escrituraPadre);
							request.setAttribute("nombreEscritura", nombreEscrituras);
							request.setAttribute("padre", padre);
							request.setAttribute("modifTipo", modifTipo);
							request.setAttribute("isConsultar", isConsultar);
							request.setAttribute("isModif", isModif);
							if (modifTipo.contentEquals("BENEFICIARIO")) {
								request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
							} else {
								request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
							}
						}

					}
					break;
				case "editar":
					a.setNombre(nombre);
					a.setNacionalidad(nacionalidad);
					a.setTipo(tipo);
					a.setTipoId(tipoId);
					a.setPais(pais);

					a.setTelefono(telefono);
					a.setNoId(noId);

					a.setPadre(escrituraPadre);
					a.setCargo(cargo);
					a.setTipoIntegrante(tipoIntegrante);
					a.setCorreo1(correo1);
					a.setCorreo2(correo2);
					String nombreEscrituras = request.getParameter("nombreEscritura");
					
					String idAccionistaEscritura = request.getParameter("idAccionistaEscritura");
					
					String oldId = request.getParameter("oldId");
					if (!modifTipo.contentEquals("BENEFICIARIO")) {

						float oldP = Float.parseFloat(request.getParameter("oldP"));
						float total = accionistaDao.totalAcciones(escrituraPadre) - oldP;
						if (total + a.getParticipacion() > 100) {
							request.setAttribute("escrituraPadre", escrituraPadre);
							request.setAttribute("nombreEscritura", nombreEscrituras);
							request.setAttribute("padre", padre);
							request.setAttribute("modifTipo", modifTipo);
							request.setAttribute("isConsultar", isConsultar);
							request.setAttribute("isModif", isModif);
							if (modifTipo.contentEquals("BENEFICIARIO")) {
								request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
							} else {
								request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
							}
						} else {
							a.setAcciones(acciones);
							a.setParticipacion(Float.parseFloat(participacion));
							a.setid(Integer.parseInt(idAccionistaEscritura));
							accionistaDao.update(a, oldId);
							request.setAttribute("escrituraPadre", escrituraPadre);
							request.setAttribute("nombreEscritura", nombreEscrituras);
							request.setAttribute("padre", padre);
							request.setAttribute("modifTipo", modifTipo);
							request.setAttribute("isConsultar", isConsultar);
							request.setAttribute("isModif", isModif);
							if (modifTipo.contentEquals("BENEFICIARIO")) {
								request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
							} else {
								request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
							}
						}
					} else {
						request.setAttribute("escrituraPadre", escrituraPadre);
						request.setAttribute("nombreEscritura", nombreEscrituras);
						a.setid(Integer.parseInt(idAccionistaEscritura));
						accionistaDao.update(a, oldId);
						request.setAttribute("padre", padre);
						request.setAttribute("modifTipo", modifTipo);
						request.setAttribute("isConsultar", isConsultar);
						request.setAttribute("isModif", isModif);
						if (modifTipo.contentEquals("BENEFICIARIO")) {
							request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
						} else {
							request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
						}
					}

					break;
				case "revisar":
					a.setNombre(nombre);
					String aprobado = request.getParameter("ap1");
					String activo = request.getParameter("ap2");
					if (aprobado != null && !aprobado.isEmpty()) {
						a.setEstado1("APROBADO");
					} else {
						a.setEstado1("NO APROBADO");
					}
					if (activo != null && !activo.isEmpty()) {
						a.setEstado2("ACTIVO");
					} else {
						a.setEstado2("INACTIVO");
					}
					accionistaDao.aprov(a);
					request.setAttribute("escrituraPadre", escrituraPadre);
					request.setAttribute("padre", padre);
					request.setAttribute("isConsultar", isConsultar);
					request.setAttribute("modifTipo", modifTipo);
					request.setAttribute("isModif", isModif);
					if (modifTipo.contentEquals("BENEFICIARIO")) {
						request.getRequestDispatcher("comiteTecnico.jsp").forward(request, response);
					} else {
						request.getRequestDispatcher("Accionistas.jsp").forward(request, response);
					}
					break;
				default:
					System.out.println(" entro aqui 1");
					request.setAttribute("escrituraPadre", escrituraPadre);
					request.setAttribute("padre", padre);
					request.setAttribute("modifTipo", modifTipo);
					request.setAttribute("isConsultar", isConsultar);
					request.setAttribute("isRev", isRev);
					request.setAttribute("isModif", isModif);
					if (modifTipo.contentEquals("BENEFICIARIO")) {
						System.out.println(" entro aqui 2");
						request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
					} else {
						totalDB = accionistaDao.totalAcciones(escrituraPadre);
						if (totalDB + a.getParticipacion() < 100) {
							System.out.println(" entro aqui 3");

							response.setContentType("text/html");
							PrintWriter pw = response.getWriter();
							pw.println("<script type=\"text/javascript\">");
							pw.println("alert('PORCENTAJE DE ACCIONISTAS ES MENOR QUE 100%');");
							pw.println("</script>");
							request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
						} else {
							if (directo != null && directo.contains("true")) {
								System.out.println(" entro aqui 5");
								request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
							} else {
								System.out.println(" entro aqui 6");
								request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
							}

						}
					}

					break;
			}
		} catch (Exception e) {
			request.setAttribute("escrituraPadre", escrituraPadre);
			request.setAttribute("padre", padre);
			request.setAttribute("isRev", isRev);
			request.setAttribute("modifTipo", modifTipo);
			request.setAttribute("isConsultar", isConsultar);
			request.setAttribute("isModif", isModif);
			System.out.println(e);
			if (modifTipo.contentEquals("BENEFICIARIO")) {
				request.getRequestDispatcher("nComiteBeneficiario.jsp").forward(request, response);
			} else {
				if (directo != null && directo.contains("true")) {
					request.getRequestDispatcher("nAccionistaDistribuidor.jsp").forward(request, response);
				} else {
					request.getRequestDispatcher("AccionistasIndirectos.jsp").forward(request, response);
				}
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