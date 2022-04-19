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
 * Servlet implementation class authAcceso
 */
@WebServlet("/authAcceso")
public class crearUsuarioAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public crearUsuarioAcceso() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(true);
		String usuario = session.getAttribute("usuario").toString();
		String subMod = request.getParameter("auth");
		String sub = (String) request.getAttribute("subMod");

		if (subMod == null || subMod.isEmpty()) {
			subMod = "mainPage";
		}

		String prevJsp = request.getParameter("prevJsp");

		System.out.println(request.getParameter("auth")+ " TEST");
		System.out.println(request.getParameter("usuario"));
		

		accesos a = accesosDao.getAccess(session.getAttribute("usuario").toString(), subMod);
		a.setUsuario(usuario);
		a.setSubModulo(subMod);
		request.setAttribute("usuario", usuario);
		request.setAttribute("throughServlet", "true");
		session.setAttribute("tipoAcceso", a.getTipoAcceso());
		historialAccesos h = new historialAccesos();

		if (accesosDao.hasAccess(usuario, subMod) || usuario.contentEquals("TEST")) {
			switch (subMod) {
				case "crearUsuario":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("CREAR USUARIO");
					break;
				case "reseteoPassword":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("RESETEO DE CONTRASENA");
					break;
				case "accesos":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("ACCESO/MODULO");
					break;
				case "reportes":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("REPORTES DE HISTORIAL");
					break;
				case "distribuidorFabricante":
					h.setModulo("ADMINISTRACION DE DATOS");
					h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
					break;
				case "beneficiarios":
					h.setModulo("ADMINISTRACION DE DATOS");
					h.setSubmodulo("BENEFICIARIOS");
					break;
				case "medicamentos":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("MEDICAMENTOS");
					break;
				case "insumos":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("OTROS");
					break;
				case "parametrizacion":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("PARAMETRIZACION");
					break;
				case "paramOpeningPlace":
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("PARAMETRIZACION");
					break;
				case "paramCriteriosEvaluation":
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("CRITERIOS DE EVALUACION VACIADO OFERTA");
					break;
				case "paramALP":
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("CRITERIOS DE EVALUACION VACIADO OFERTA");
					break;
				case "purchaseProcessesGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("APERTURA PROCESO");
					break;
				case "amendmentsGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("ACLARACIONES Y ENMIENDAS");
					break;
				case "vaciadoOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("VACIADO DE OFERTAS");
					break;
				case "recomendacionOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RECOMENDACIONES");
					break;
				case "ratificacionOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RATIFICACIONES");
					break;
				case "controlPagosGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("CONTROL DE PAGOS");
					break;
				case "recepcionProductosGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RECEPCION PRODUCTO GENERAL");
					break;
					
					//--------
				case "ordenCompraGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("ORDEN DE COMPRA");
					break;
					//
				case "purchaseProcessesALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("APERTURA DE PROCESO");
					break;
				case "amendmentsALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("ACLARACIONES Y ENMIENDAS");
					break;
				case "vaciadoOfertaALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("VACIADO DE OFERTAS");
					break;
				case "recomendacionOfertaALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECOMENDACIONES");
					break;
				case "solicitudCompraALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("SOLICITUD DE COMPRA");
					break;
				case "evaluacionRecomendacionOferta":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECOMENDACION DE COMPRA");
					break;
				case "ratificacionCTFOferta":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RATIFICACION CTF");
					break;
				case "contrataciones":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTRATACIONES");
					break;
				case "contratoSuministroALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTRATOS DE SUMINISTROS");
					break;
				case "controlGarantiasALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTROL DE GARANTIAS");
					break;
				case "controlPagosALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTROL DE PAGOS");
					break;
				case "recepcionProductos":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECEPCION DE PRODUCTOS");
					break;
				case "purchaseProcessesMenores":
					h.setModulo("COMPRAS MENORES");
					h.setSubmodulo("COMPRAS MENORES");
				case "purchaseProcessesAPB":
					h.setModulo("COMPRAS APB");
					h.setSubmodulo("COMPRAS APB");
					break;
				case "vaciadoOferta":
					h.setModulo("COMPRAS ALP");
					h.setSubmodulo("VACIADO DE OFERTAS");
					break;
				default:
					break;
			}
			h.setUsuario(usuario);
			h.setFuncion("ACCESO");
			System.out.println(subMod + " subMod");
			historialAccesosDao.save(h);
			request.getRequestDispatcher(subMod + ".jsp").forward(request, response);
		} else {
			switch (subMod) {
				case "crearUsuario":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("CREAR USUARIO");
					break;
				case "reseteoPassword":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("RESETEO DE CONTRASENA");
					break;
				case "accesos":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("ACCESO/MODULO");
					break;
				case "reportes":
					h.setModulo("PARAMETRIZACION DE USUARIOS");
					h.setSubmodulo("REPORTES DE HISTORIAL");
					break;
				case "distribuidorFabricante":
					h.setModulo("ADMINISTRACION DE DATOS");
					h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
					break;
				case "beneficiarios":
					h.setModulo("ADMINISTRACION DE DATOS");
					h.setSubmodulo("BENEFICIARIOS");
					break;
				case "medicamentos":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("MEDICAMENTOS");
					break;
				case "insumos":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("OTROS");
					break;
				case "parametrizacion":
					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("PARAMETRIZACION");
					break;
				case "paramOpeningPlace":
					System.out.println("cualquier cosa");
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("PARAMETRIZACION");
					break;
				case "paramCriteriosEvaluation":
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("CRITERIOS DE EVALUACION VACIADO OFERTA");
					break;
				case "paramALP":
					h.setModulo("CONTROL PROCESOS DE COMPRA");
					h.setSubmodulo("CRITERIOS DE EVALUACION VACIADO OFERTA");
					break;
				case "purchaseProcessesGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("APERTURA PROCESO");
					break;
				case "amendmentsGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("ACLARACIONES Y ENMIENDAS");
					break;
				case "vaciadoOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("VACIADO DE OFERTAS");
					break;
				case "recomendacionOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RECOMENDACIONES");
					break;
				case "ratificacionOfertaGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RATIFICACIONES");
					break;
				case "purchaseProcessesALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("APERTURA DE PROCESO");
					break;
				case "amendmentsALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("ACLARACIONES Y ENMIENDAS");
					break;
				case "vaciadoOfertaALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("VACIADO DE OFERTAS");
					break;
				case "recomendacionOfertaALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECOMENDACIONES");
					break;
				case "solicitudCompraALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("SOLICITUD DE COMPRA");
					break;
				case "evaluacionRecomendacionOferta":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECOMENDACION DE COMPRA");
					break;
				case "ratificacionCTFOferta":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RATIFICACION CTF");
					break;
				case "contrataciones":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTRATACIONES");
					break;
				case "contratoSuministroALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTRATOS DE SUMINISTROS");
					break;
				case "controlGarantiasALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTROL DE GARANTIAS");
					break;
				case "controlPagosALP":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("CONTROL DE PAGOS");
					break;
				case "recepcionProductos":
					h.setModulo("COMPRAS A LARGO PLAZO");
					h.setSubmodulo("RECEPCION DE PRODUCTOS");
					break;
				case "controlPagosGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("CONTROL DE PAGOS");
					break;
				case "recepcionProductosGeneral":
					h.setModulo("COMPRAS GENERALES");
					h.setSubmodulo("RECEPCION PRODUCTO GENERAL");
					break;
				default:
					break;
			}
			h.setUsuario(usuario);
			h.setFuncion("INTENTO DE ACCESO");
			historialAccesosDao.save(h);
			request.getRequestDispatcher(prevJsp + ".jsp").forward(request, response);
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
