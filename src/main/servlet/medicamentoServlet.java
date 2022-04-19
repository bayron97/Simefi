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
 * Servlet implementation class medicamentoServlet
 */
@WebServlet("/medicamentoServlet")
public class medicamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public medicamentoServlet() {
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
		String accion = request.getParameter("accion");
		String codSist = request.getParameter("codSist");
		System.out.println("CodSist:"+codSist);
		String codAtc = request.getParameter("codAtc");
		String codSesal = request.getParameter("codSesal");
		String modifId = "";

		System.out.println(submit + " Accion");
		
		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		try {
			medicamentos m = new medicamentos();
			switch (submit) {
				case "rev":
					String activ1 = request.getParameter("activ1");
					String pendienteAprobar = request.getParameter("pendienteAprobar");
					String in1 = request.getParameter("in1");
					String activ2 = request.getParameter("activ2");
					if (activ1 != null && !activ1.isEmpty()) {
						m.setEstado1("APROBADO");
					} else if (pendienteAprobar != null && !pendienteAprobar.isEmpty()){
						m.setEstado1("PENDIENTE DE APROBAR");
					} else  {
						m.setEstado1("RECHAZADO");
					}
					if (activ2 != null && !activ2.isEmpty()) {
						m.setEstado2("ACTIVO");
					} else {
						m.setEstado2("NO ACTIVO");
					}
					String motivo1 = request.getParameter("motiv1");
					String motivo2 = request.getParameter("motiv2");
					m.setCodSist(Integer.parseInt(codSist));
					m.setCodSesal(codSesal);
					m.setCodAtc(codAtc);
					m.setMovimiento1(motivo1);
					m.setMovimiento2(motivo2);

					medicamentosDao.aprov(m);

					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("MEDICAMENTOS");
					h.setFuncion("REVISAR Y APROBAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);

					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
					break;
				case "nuevo":
					modifId = "0";
					request.setAttribute("modifId", modifId);
					request.setAttribute("titulo", "NUEVO");
					request.getRequestDispatcher("nMedicamento.jsp").forward(request, response);
					break;
				case "modify":
					m = medicamentosDao.getById(Integer.parseInt(request.getParameter("modifId")));
					request.setAttribute("titulo", "MODIFICAR");
					request.setAttribute("modifId", request.getParameter("modifId"));
					request.setAttribute("modifAtc", m.getCodAtc());
					request.setAttribute("modifSesal", m.getCodSesal());
					request.setAttribute("modifGrupo", m.getGrupo());
					request.setAttribute("modifSubGrupo", m.getSubGrupo());
					request.setAttribute("modifUp", m.getUp());
					request.setAttribute("modifNombre", m.getNombre());
					request.setAttribute("modifDesc", m.getDescripcion());
					request.setAttribute("modifNivel", m.getAtencion());
					request.setAttribute("modifVia", m.getViaAdmin());
					request.setAttribute("modifBenef", m.getBeneficiario());
					request.setAttribute("modifObs", m.getObservacion());
					request.setAttribute("isModif", "true");
					request.setAttribute("isRev", "false");
					request.getRequestDispatcher("nMedicamento.jsp").forward(request, response);
					System.out.println("via " + m.getViaAdmin());
					break;
				case "consultarFicha":
					if (request.getParameter("modifId") == null || request.getParameter("modifId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
					} else {

						request.setAttribute("titulo", "CONSULTAR");
						request.setAttribute("codSist",request.getParameter("codSist"));
						request.setAttribute("isModif", "false");
						request.setAttribute("isRev", "false");
						request.setAttribute("isConsultar", "true");
						request.getRequestDispatcher("nMedicamentosOficios.jsp").forward(request, response);
					}
					break;
				case "consultar":
					if (request.getParameter("modifId") == null || request.getParameter("modifId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
					} else {

						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("MEDICAMENTOS");
						h.setFuncion("CONSULTAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						m = medicamentosDao.getById(Integer.parseInt(request.getParameter("modifId")));
						request.setAttribute("titulo", "CONSULTAR");
						request.setAttribute("modifId", request.getParameter("modifId"));
						request.setAttribute("modifAtc", m.getCodAtc());
						request.setAttribute("modifSesal", m.getCodSesal());
						request.setAttribute("modifGrupo", m.getGrupo());
						request.setAttribute("modifSubGrupo", m.getSubGrupo());
						request.setAttribute("modifUp", m.getUp());
						request.setAttribute("modifNombre", m.getNombre());
						request.setAttribute("modifDesc", m.getDescripcion());
						request.setAttribute("modifNivel", m.getAtencion());
						request.setAttribute("modifVia", m.getViaAdmin());
						request.setAttribute("modifBenef", m.getBeneficiario());
						request.setAttribute("modifObs", m.getObservacion());
						request.setAttribute("isModif", "false");
						request.setAttribute("isRev", "false");
						request.setAttribute("isConsultar", "true");
						request.getRequestDispatcher("nMedicamento.jsp").forward(request, response);
					}
					break;
				case "revisarFicha":
					m = medicamentosDao.getById(Integer.parseInt(request.getParameter("modifId")));
					request.setAttribute("titulo", "REVISAR Y APROBAR");
					request.setAttribute("modifId", request.getParameter("modifId"));
					request.setAttribute("modifAtc", m.getCodAtc());
					request.setAttribute("modifSesal", m.getCodSesal());
					request.setAttribute("modifGrupo", m.getGrupo());
					request.setAttribute("modifSubGrupo", m.getSubGrupo());
					request.setAttribute("modifUp", m.getUp());
					request.setAttribute("modifNombre", m.getNombre());
					request.setAttribute("modifDesc", m.getDescripcion());
					request.setAttribute("modifNivel", m.getAtencion());
					request.setAttribute("modifVia", m.getViaAdmin());
					request.setAttribute("modifBenef", m.getBeneficiario());
					request.setAttribute("modifObs", m.getObservacion());
					request.setAttribute("isModif", "false");
					request.setAttribute("isRev", "true");
					request.setAttribute("codSist", codSist);
					request.getRequestDispatcher("nMedicamentosOficios.jsp").forward(request, response);
					break;
				case "revisar":
					if (request.getParameter("modifId") == null || request.getParameter("modifId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
					} else {
						m = medicamentosDao.getById(Integer.parseInt(request.getParameter("modifId")));
						request.setAttribute("titulo", "REVISAR Y APROBAR");
						request.setAttribute("modifId", request.getParameter("modifId"));
						request.setAttribute("modifAtc", m.getCodAtc());
						request.setAttribute("modifSesal", m.getCodSesal());
						request.setAttribute("modifGrupo", m.getGrupo());
						request.setAttribute("modifSubGrupo", m.getSubGrupo());
						request.setAttribute("modifUp", m.getUp());
						request.setAttribute("modifNombre", m.getNombre());
						request.setAttribute("modifDesc", m.getDescripcion());
						request.setAttribute("modifNivel", m.getAtencion());
						request.setAttribute("modifVia", m.getViaAdmin());
						request.setAttribute("modifBenef", m.getBeneficiario());
						request.setAttribute("modifObs", m.getObservacion());
						request.setAttribute("isModif", "false");
						request.setAttribute("isRev", "true");
						request.getRequestDispatcher("nMedicamento.jsp").forward(request, response);
					}
					break;
				case "cancelarN":
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
					break;
				default:
					
				
					
					String nombre = request.getParameter("nombre");
					String grupo = request.getParameter("grupo");
					String subGrupo = request.getParameter("subGrupo");
					String observacion = request.getParameter("observacion");
					String beneficiario = request.getParameter("inputBeneficiarios");
					String[] viaAdmin = request.getParameterValues("viaAdmin");
					String up = request.getParameter("up");
					String[] atencion = request.getParameterValues("atencion");
					String descripcion = request.getParameter("descripcion");
					String listado = request.getParameter("listado");

					String vAdmin = "";
					String at = "";
					if (viaAdmin != null) {
						for (int i = 0; i < viaAdmin.length; i++) {
							if (i > 0) {
								vAdmin = vAdmin + "-" + viaAdmin[i];
							} else {
								vAdmin = vAdmin + viaAdmin[i];
							}
						}
					}
					if (atencion != null) {
						for (int i = 0; i < atencion.length; i++) {
							if (i > 0) {
								at = at + " - " + atencion[i] + " ";
							} else {
								at = at + atencion[i] + " ";
							}
						}
					}

					m.setCodSist(Integer.parseInt(codSist));
					m.setCodAtc(codAtc.toUpperCase());
					m.setCodSesal(codSesal.toUpperCase());
					m.setNombre(nombre.toUpperCase());
					m.setAtencion(at.toUpperCase());
					m.setViaAdmin(vAdmin.toUpperCase());
					m.setDescripcion(descripcion.toUpperCase().stripLeading().stripTrailing());
					m.setObservacion(observacion.toUpperCase());
					m.setSubGrupo(subGrupo.toUpperCase());
					m.setGrupo(grupo.toUpperCase());
					m.setBeneficiario(beneficiario);
					//m.setEstado1("NO APROBADO");
					m.setMovimiento1(" ");
					m.setEstado2("INACTIVO");
					m.setMovimiento2(" ");
					m.setUp(up.toUpperCase());
					
					if (listado.contentEquals("lnme")) {
						m.setListado("Listado Nacional de Medicamentos Esenciales (LNME)");
					} else {
						m.setListado("Listado Complementario");
					}
					String isModif = request.getParameter("isModif");
					modifId = request.getParameter("modifId");
					if (isModif.contentEquals("true")) {
						m.setEstado1("PENDIENTE DE APROBAR");
						medicamentosDao.update(m, Integer.parseInt(modifId));
						System.out.println("Accion modificar");
						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("MEDICAMENTOS");
						h.setFuncion("MODIFICAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

					} else {					
						
						m.setEstado1("PENDIENTE DE APROBAR");
						if(Integer.parseInt(codSist) == 0) {							
							codSist=String.valueOf(medicamentosDao.save(m));
						}											
						
						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("MEDICAMENTOS");
						h.setFuncion("CREAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);
					}
				
					request.setAttribute("titulo", accion);
					request.setAttribute("codSist", codSist);
					request.setAttribute("nombre", nombre);
					request.setAttribute("openMode", "guardando");
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("nMedicamentosOficios.jsp").forward(request, response);					
					
					break;
			}
		} catch (Exception e) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("medicamentos.jsp").forward(request, response);
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
