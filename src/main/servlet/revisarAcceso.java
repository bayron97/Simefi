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
 * Servlet implementation class revisarAcceso
 */
@WebServlet("/revisarAcceso")
public class revisarAcceso extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public revisarAcceso() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usuario = request.getParameter("usuarioRevisar");
		String submit = request.getParameter("submit");
		String disableJstree = "";

		int estado2 = accesosDao.isActive(usuario);
		int estado1 = accesosDao.isAproved(usuario);
		String est2 = "INACTIVO";
		String est1 = "NO APROBADO";
		if (estado1 == 1) {
			est1 = "APROBADO";
		}
		if (estado2 == 1) {
			est2 = "ACTIVO";
		}

		accesos a = accesosDao.getMotivos(usuario);

		String motivo1 = "";
		String motivo2 = "";

		if (a != null) {
			motivo1 = a.getMotivo1();
			motivo2 = a.getMotivo2();
		}

		accesos cA;
		accesos reseteoPass;
		accesos accMod;
		accesos reportH;
		accesos distFab;
		accesos benef;
		accesos med;
		accesos otros;
		accesos param;
		accesos cpcparam;
		accesos criteva;
		accesos corrcomp;
		accesos aperturaProcesoG;
		accesos aclaEnmiendasG;
		accesos vaciadoOfertaG;
		accesos recomendacionesG;
		accesos ratificacionesG;
		accesos aperturaProcesoALP;
		accesos aclaEnmiendasAlp;
		accesos vaciadoOfertAlp;
		accesos recomendacionesALP;
		accesos solicitudCompraALP;
		accesos recomendacionCompraALP;
		accesos ratificacionCtfALP;
		accesos contratacionesALP;
		accesos contratosSuministrosALP;
		accesos controlGarantiasALP;
		accesos controlPagosALP;
		accesos recepcionProduALP;
		
		if (submit.contentEquals("consultar") || submit.contentEquals("revisar")) {
			disableJstree = "true";
		}

		if (submit.contentEquals("consultar")) {
			cA = accesosDao.getAproved(usuario, "crearUsuario");
			reseteoPass = accesosDao.getAproved(usuario, "reseteoPassword");
			accMod = accesosDao.getAproved(usuario, "accesos");
			reportH = accesosDao.getAproved(usuario, "reportes");
			distFab = accesosDao.getAproved(usuario, "distribuidorFabricante");
			benef = accesosDao.getAproved(usuario, "beneficiarios");
			med = accesosDao.getAproved(usuario, "medicamentos");
			otros = accesosDao.getAproved(usuario, "insumos");
			param = accesosDao.getAproved(usuario, "parametrizacion");
			cpcparam = accesosDao.getAproved(usuario, "paramOpeningPlace");
			criteva = accesosDao.getAproved(usuario, "paramCriteriosEvaluation");
			corrcomp = accesosDao.getAproved(usuario, "paramALP");
			aperturaProcesoG = accesosDao.getAproved(usuario, "purchaseProcessesGeneral");
			aclaEnmiendasG = accesosDao.getAproved(usuario, "amendmentsGeneral");
			vaciadoOfertaG = accesosDao.getAproved(usuario, "vaciadoOfertaGeneral");
			recomendacionesG = accesosDao.getAproved(usuario, "recomendacionOfertaGeneral");
			ratificacionesG = accesosDao.getAproved(usuario, "ratificacionOfertaGeneral");
			aperturaProcesoALP = accesosDao.getAproved(usuario, "purchaseProcessesALP");
			aclaEnmiendasAlp = accesosDao.getAproved(usuario, "amendmentsALP");
			vaciadoOfertAlp = accesosDao.getAproved(usuario, "vaciadoOfertaALP");
			recomendacionesALP = accesosDao.getAproved(usuario, "recomendacionOfertaALP");
			solicitudCompraALP = accesosDao.getAproved(usuario, "solicitudCompraALP");
			recomendacionCompraALP = accesosDao.getAproved(usuario, "evaluacionRecomendacionOferta");
			ratificacionCtfALP = accesosDao.getAproved(usuario, "ratificacionCTFOferta");
			contratacionesALP = accesosDao.getAproved(usuario, "contrataciones");
			contratosSuministrosALP = accesosDao.getAproved(usuario, "contratoSuministroALP");
			controlGarantiasALP = accesosDao.getAproved(usuario, "controlGarantiasALP");
			controlPagosALP = accesosDao.getAproved(usuario, "controlPagosALP");
			recepcionProduALP = accesosDao.getAproved(usuario, "recepcionProductos");
		} else {
			cA = accesosDao.getAccess(usuario, "crearUsuario");
			reseteoPass = accesosDao.getAccess(usuario, "reseteoPassword");
			accMod = accesosDao.getAccess(usuario, "accesos");
			reportH = accesosDao.getAccess(usuario, "reportes");
			distFab = accesosDao.getAccess(usuario, "distribuidorFabricante");
			benef = accesosDao.getAccess(usuario, "beneficiarios");
			med = accesosDao.getAccess(usuario, "medicamentos");
			otros = accesosDao.getAccess(usuario, "insumos");
			param = accesosDao.getAccess(usuario, "parametrizacion");
			cpcparam = accesosDao.getAccess(usuario, "paramOpeningPlace");
			criteva = accesosDao.getAccess(usuario, "paramCriteriosEvaluation");
			corrcomp = accesosDao.getAccess(usuario, "paramALP");
			aperturaProcesoG = accesosDao.getAccess(usuario, "purchaseProcessesGeneral");
			aclaEnmiendasG = accesosDao.getAccess(usuario, "amendmentsGeneral");
			vaciadoOfertaG = accesosDao.getAccess(usuario, "vaciadoOfertaGeneral");
			recomendacionesG = accesosDao.getAccess(usuario, "recomendacionOfertaGeneral");
			ratificacionesG = accesosDao.getAccess(usuario, "ratificacionOfertaGeneral");
			aperturaProcesoALP = accesosDao.getAccess(usuario, "purchaseProcessesALP");
			aclaEnmiendasAlp = accesosDao.getAccess(usuario, "amendmentsALP");
			vaciadoOfertAlp = accesosDao.getAccess(usuario, "vaciadoOfertaALP");
			recomendacionesALP = accesosDao.getAccess(usuario, "recomendacionOfertaALP");
			solicitudCompraALP = accesosDao.getAccess(usuario, "solicitudCompraALP");
			recomendacionCompraALP = accesosDao.getAccess(usuario, "evaluacionRecomendacionOferta");
			ratificacionCtfALP = accesosDao.getAccess(usuario, "ratificacionCTFOferta");
			contratacionesALP = accesosDao.getAccess(usuario, "contrataciones");
			contratosSuministrosALP = accesosDao.getAccess(usuario, "contratoSuministroALP");
			controlGarantiasALP = accesosDao.getAccess(usuario, "controlGarantiasALP");
			controlPagosALP = accesosDao.getAccess(usuario, "controlPagosALP");
			recepcionProduALP = accesosDao.getAccess(usuario, "recepcionProductos");
		}

		request.setAttribute("disableJstree", disableJstree);
		request.setAttribute("funcion", submit);
		request.setAttribute("cA", "crearUsuario_" + cA.getTipoAcceso());
		request.setAttribute("reseteoPass", "reseteoPassword_" + reseteoPass.getTipoAcceso());
		request.setAttribute("accMod", "accesos_" + accMod.getTipoAcceso());
		request.setAttribute("reportH", "reportes_" + reportH.getTipoAcceso());
		request.setAttribute("distFab", "distribuidorFabricante_" + distFab.getTipoAcceso());
		request.setAttribute("benef", "beneficiarios_" + benef.getTipoAcceso());
		request.setAttribute("med", "medicamentos_" + med.getTipoAcceso());
		request.setAttribute("otros", "insumos_" + otros.getTipoAcceso());
		request.setAttribute("parame", "parametrizacion_" + param.getTipoAcceso());
		request.setAttribute("cpcparam", "paramOpeningPlace_" + cpcparam.getTipoAcceso());
		request.setAttribute("criteva", "paramCriteriosEvaluation_" + criteva.getTipoAcceso());
		request.setAttribute("corrcomp", "paramALP_" + corrcomp.getTipoAcceso());
		request.setAttribute("aperturaProcesoG", "purchaseProcessesGeneral_" + aperturaProcesoG.getTipoAcceso());
		request.setAttribute("aclaEnmiendasG", "amendmentsGeneral_" + aclaEnmiendasG.getTipoAcceso());
		request.setAttribute("vaciadoOfertaG", "vaciadoOfertaGeneral_" + vaciadoOfertaG.getTipoAcceso());
		request.setAttribute("recomendacionesG", "recomendacionOfertaGeneral_" + recomendacionesG.getTipoAcceso());
		request.setAttribute("ratificacionesG", "ratificacionOfertaGeneral_" + ratificacionesG.getTipoAcceso());
		request.setAttribute("aperturaProcesoALP", "purchaseProcessesALP_" + aperturaProcesoALP.getTipoAcceso());
		request.setAttribute("aclaEnmiendasAlp", "amendmentsALP_" + aclaEnmiendasAlp.getTipoAcceso());
		request.setAttribute("vaciadoOfertAlp", "vaciadoOfertaALP_" + vaciadoOfertAlp.getTipoAcceso());
		request.setAttribute("recomendacionesALP", "recomendacionOfertaALP_" + recomendacionesALP.getTipoAcceso());
		request.setAttribute("solicitudCompraALP", "solicitudCompraALP_" + solicitudCompraALP.getTipoAcceso());
		request.setAttribute("recomendacionCompraALP", "evaluacionRecomendacionOferta_" + recomendacionCompraALP.getTipoAcceso());
		request.setAttribute("ratificacionCtfALP", "ratificacionCTFOferta_" + ratificacionCtfALP.getTipoAcceso());
		request.setAttribute("contratacionesALP", "contrataciones_" + contratacionesALP.getTipoAcceso());
		request.setAttribute("contratosSuministrosALP", "contratoSuministroALP_" + contratosSuministrosALP.getTipoAcceso());
		request.setAttribute("controlGarantiasALP", "controlGarantiasALP_" + controlGarantiasALP.getTipoAcceso());
		request.setAttribute("controlPagosALP", "controlPagosALP_" + controlPagosALP.getTipoAcceso());
		request.setAttribute("recepcionProduALP", "recepcionProductos_" + recepcionProduALP.getTipoAcceso());
		request.setAttribute("estado1", est1);
		request.setAttribute("estado2", est2);
		request.setAttribute("motivo1", motivo1);
		request.setAttribute("motivo2", motivo2);
		request.setAttribute("usuario", usuario);
		request.setAttribute("throughServlet", "true");

		if (usuario != null && !usuario.isEmpty()) {
			request.getRequestDispatcher("accesosPermisos.jsp").forward(request, response);
		} else {
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
