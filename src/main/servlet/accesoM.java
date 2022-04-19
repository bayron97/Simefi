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
 * Servlet implementation class accesoM
 */
@WebServlet("/accesoM")
public class accesoM extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public accesoM() {
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
		String usuario = request.getParameter("usuario");

		HttpSession session = request.getSession(true);

		String[] acceso = { "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "",
				"", "", "", "", "", "", "" };
		acceso[0] = !request.getParameter("crearUsuario").isEmpty() ? request.getParameter("crearUsuario")
				: "crearUsuario_sin acceso";
		acceso[1] = !request.getParameter("reseteoPass").isEmpty() ? request.getParameter("reseteoPass")
				: "reseteoPassword_sin acceso";
		acceso[2] = !request.getParameter("accMod").isEmpty() ? request.getParameter("accMod") : "accesos_sin acceso";
		acceso[3] = !request.getParameter("reportH").isEmpty() ? request.getParameter("reportH")
				: "reportes_sin acceso";
		acceso[4] = !request.getParameter("distFab").isEmpty() ? request.getParameter("distFab")
				: "distribuidorFabricante_sin acceso";
		acceso[5] = !request.getParameter("benef").isEmpty() ? request.getParameter("benef")
				: "beneficiarios_sin acceso";
		acceso[6] = !request.getParameter("med").isEmpty() ? request.getParameter("med") : "medicamentos_sin acceso";
		acceso[7] = !request.getParameter("otros").isEmpty() ? request.getParameter("otros") : "insumos_sin acceso";
		acceso[8] = !request.getParameter("param").isEmpty() ? request.getParameter("param")
				: "parametrizacion_ sin acceso";
		acceso[9] = !request.getParameter("cpcparam").isEmpty() ? request.getParameter("cpcparam")
				: "paramOpeningPlace_ sin acceso";
		acceso[10] = !request.getParameter("criteva").isEmpty() ? request.getParameter("criteva")
				: "paramCriteriosEvaluation_ sin acceso";
		acceso[11] = !request.getParameter("corrcomp").isEmpty() ? request.getParameter("corrcomp")
				: "paramALP_ sin acceso";
		acceso[12] = !request.getParameter("aperturaProcesoG").isEmpty() ? request.getParameter("aperturaProcesoG")
				: "purchaseProcessesGeneral_ sin acceso";
		acceso[13] = !request.getParameter("aclaEnmiendasG").isEmpty() ? request.getParameter("aclaEnmiendasG")
				: "amendmentsGeneral_ sin acceso";
		acceso[14] = !request.getParameter("vaciadoOfertaG").isEmpty() ? request.getParameter("vaciadoOfertaG")
				: "vaciadoOfertaGeneral_ sin acceso";
		acceso[15] = !request.getParameter("recomendacionesG").isEmpty() ? request.getParameter("recomendacionesG")
				: "recomendacionOfertaGeneral_ sin acceso";
		acceso[16] = !request.getParameter("ratificacionesG").isEmpty() ? request.getParameter("ratificacionesG")
				: "ratificacionOfertaGeneral_ sin acceso";
		acceso[17] = !request.getParameter("aperturaProcesoALP").isEmpty() ? request.getParameter("aperturaProcesoALP")
				: "purchaseProcessesALP_ sin acceso";
		acceso[18] = !request.getParameter("aclaEnmiendasAlp").isEmpty() ? request.getParameter("aclaEnmiendasAlp")
				: "amendmentsALP_ sin acceso";
		acceso[19] = !request.getParameter("vaciadoOfertAlp").isEmpty() ? request.getParameter("vaciadoOfertAlp")
				: "vaciadoOfertaALP_ sin acceso";
		acceso[20] = !request.getParameter("recomendacionesALP").isEmpty() ? request.getParameter("recomendacionesALP")
				: "recomendacionOfertaALP_ sin acceso";
		acceso[21] = !request.getParameter("solicitudCompraALP").isEmpty() ? request.getParameter("solicitudCompraALP")
				: "solicitudCompraALP_ sin acceso";
		acceso[22] = !request.getParameter("recomendacionCompraALP").isEmpty() ? request.getParameter("recomendacionCompraALP")
				: "evaluacionRecomendacionOferta_ sin acceso";
		acceso[23] = !request.getParameter("ratificacionCtfALP").isEmpty() ? request.getParameter("ratificacionCtfALP")
				: "ratificacionCTFOferta_ sin acceso";
		acceso[24] = !request.getParameter("contratacionesALP").isEmpty() ? request.getParameter("contratacionesALP")
				: "contrataciones_ sin acceso";
		acceso[25] = !request.getParameter("contratosSuministrosALP").isEmpty() ? request.getParameter("contratosSuministrosALP")
				: "contratoSuministroALP_ sin acceso";
		acceso[26] = !request.getParameter("controlGarantiasALP").isEmpty() ? request.getParameter("controlGarantiasALP")
				: "controlGarantiasALP_ sin acceso";
		acceso[27] = !request.getParameter("controlPagosALP").isEmpty() ? request.getParameter("controlPagosALP")
				: "controlPagosALP_ sin acceso";
		acceso[28] = !request.getParameter("recepcionProduALP").isEmpty() ? request.getParameter("recepcionProduALP")
				: "recepcionProductos_ sin acceso";
		System.out.println(acceso[12]);
		acceso[29] = request.getParameter("acceso");
		acceso[30] = request.getParameter("nivel");
		acceso[31] = request.getParameter("desc");

		historialAccesos h = new historialAccesos();

		try {
			switch (submit) {
				case "nuevo":
					for (int i = 0; i < 32; i++) {
						if (acceso[i] != null && !acceso[i].isEmpty()) {
							String[] builder = acceso[i].split("_");
							accesos a = new accesos();
							a.setSubModulo(builder[0]);
							a.setTipoAcceso(builder[1]);
							System.out.println(builder[0]);							
							System.out.println(builder[1]);
							a.setUsuario(usuario.toUpperCase());
							System.out.println("--------");
							a.setEstado1("PENDIENTE APROBAR");
							a.setEstado2("INACTIVO");
							accesosDao.save(a);
						}
					}

					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("ACCESO/MODULO");
					h.setFuncion("CREAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);

					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("accesos.jsp").forward(request, response);
					break;
				case "editar":
					for (int i = 0; i < 32; i++) {
						if (acceso[i] != null && !acceso[i].isEmpty()) {
							
							String[] builder = acceso[i].split("_");
							accesos a = new accesos();
							int addacces = accesosDao.validarPermisosUsuario(usuario, String.valueOf(builder[0]));
							a.setSubModulo(builder[0]);
							a.setTipoAcceso(builder[1]);
							
							a.setUsuario(usuario.toUpperCase());
							a.setUsuario(usuario.toUpperCase());
							a.setEstado1("PENDIENTE APROBAR");
							a.setEstado2("INACTIVO");
							System.out.println(addacces);
							if(addacces == 0) {
								System.out.println(builder[0] + " INSERTAR");							
								System.out.println(builder[1] + " INSERTAR");
							accesosDao.save(a);
							
							}
							else {
								System.out.println(builder[0] + " ACTUALIZAR");							
								System.out.println(builder[1] + " ACTUALIZAR");
							accesosDao.update(a);
							}
							
						}
					}

					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("ACCESO/MODULO");
					h.setFuncion("MODIFICAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);

					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("accesos.jsp").forward(request, response);
					break;
				case "revAprov":
					String motiv1 = request.getParameter("motiv1");
					String motiv2 = request.getParameter("motiv2");

					String ap1 = request.getParameter("ap1");
					String ap2 = request.getParameter("ap2");
					String pendie1 = request.getParameter("pendie1");
					String re1 = request.getParameter("re1");

					String estado1 = "";
					String estado2 = "";
					

					if (ap1 != null && !ap1.isEmpty()) {
						estado1 = "APROBADO";
					} 
					
					if (pendie1 != null && !pendie1.isEmpty()) {
						estado1 = "PENDIENTE APROBAR";
					}
					
					if (re1 != null && !re1.isEmpty()) {
						estado1 = "RECHAZADO";
					} 

					if (ap2 != null && !ap2.isEmpty()) {
						estado2 = "ACTIVO";
					} else {
						estado2 = "INACTIVO";
					}

					accesos a = new accesos();
					a.setEstado1(estado1);
					a.setEstado2(estado2);
					a.setMotivo1(motiv1);
					a.setMotivo2(motiv2);
					a.setUsuario(usuario.toUpperCase());
					accesosDao.aprove(a);

					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("ACCESO/MODULO");
					h.setFuncion("REVISAR Y APROBAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);

					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("accesos.jsp").forward(request, response);
					break;
				default:
					break;
			}
		} catch (Exception e) {
			System.out.println(e);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("accesos.jsp").forward(request, response);
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
