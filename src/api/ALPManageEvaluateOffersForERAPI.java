package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.bouncycastle.math.ec.ScaleYNegateXPointMap;

import main.model.CriterioEvaluacionDTO;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.dao.CriterioEvaluacionAndOpcionesALPDao;
import main.dao.listaRequerimientoSolicitudDisponibilidadALPDao;

/**
 * Servlet implementation class ALPManageEmptyingOffersForERAPI
 */
@WebServlet("/ALPManageEvaluateOffersForERAPI")
public class ALPManageEvaluateOffersForERAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPManageEvaluateOffersForERAPI() {
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
		String mode = request.getParameter("mode");			
		Long codDisponibilidadER = Long.parseLong(session.getAttribute("SDID").toString());		
		
		int idPadre = Integer.parseInt(session.getAttribute("codPadreVaciadoER").toString());
		
		
		String data = "";

		if (mode != null && !mode.isBlank()) {
			int status = 0;

			switch (mode) {
				case "new":
					int noItem;
					try {
						noItem = Integer.parseInt(request.getParameter("noItem"));
					}catch(Exception e) {
						noItem = -1;
						data = "inputError";
					}
					
					//String cantidadCriterio = request.getParameter("cantidadCriterio");
//					String regSanCriterio = request.getParameter("regSanCriterio");
//					String certBPMCriterio = request.getParameter("certBPMCriterio");
//					String tiempoEntregaCriterio = request.getParameter("tiempoEntregaCriterio");
//					String vidaUtilCriterio = request.getParameter("vidaUtilCriterio");
					String estadoCompra = "EVALUACION REALIZADA";
					
					listaRequerimientoSolicitudDisponibilidadALP ul = new listaRequerimientoSolicitudDisponibilidadALP();
					
					ul.setIdSolicitudDisponibilidad(codDisponibilidadER);
					ul.setNoItem(noItem);
					//ul.setCantCriterio(cantidadCriterio.toUpperCase());
					//ul.setRegSanCriterio(regSanCriterio.toUpperCase());
					//ul.setCertBPMCriterio(certBPMCriterio.toUpperCase());
					//ul.setTiempoEntregaCriterio(tiempoEntregaCriterio.toUpperCase());
					//ul.setVidaUtilCriterio(vidaUtilCriterio.toUpperCase());
					ul.setEstadoCompra(estadoCompra);
					
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("MM/dd/yyyy");
					ul.setFechaEvaluacion(simpleDateFormat.format(new Date()).toString());
					
					status = listaRequerimientoSolicitudDisponibilidadALPDao.updateEvaluateOffer(ul);
					
					String opcionSeleccionada[] = request.getParameterValues("opcionSeleccionada");
					String SDID = request.getParameter("SDID");
					String idCriterio[] = request.getParameterValues("idCriterio");									
					CriterioEvaluacionDTO p = new CriterioEvaluacionDTO();
					p.setidSolicitud(Integer.parseInt(SDID));
					int canUpdateCriterios = CriterioEvaluacionAndOpcionesALPDao.updateCriterioOpcionesByIdSolicitud(Integer.parseInt(SDID));									
					if(canUpdateCriterios == 0) {
						
						for (int i = 0; i < idCriterio.length; i++){						
	                 	p.setidC(Integer.parseInt(idCriterio[i]));   
	                 	p.setidCD(Integer.parseInt(opcionSeleccionada[i]));   
	                 	CriterioEvaluacionAndOpcionesALPDao.saveCriterioOpcionsByIdS(p, idPadre);					                 
	                 	}										
					} else {
						
						ArrayList<Integer> criteriosId = CriterioEvaluacionAndOpcionesALPDao.getIdByidSolicitudOpciones(Integer.parseInt(SDID));
						
						for (int i = 0; i < idCriterio.length; i++){	
							System.out.println(idCriterio[i]);
							boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
							if(cotiene) {		
								//CriterioEvaluacionDTO criterios = CriterioEvaluacionAndOpcionesALPDao.getCriteriosByidSolicitudAndIdCD(Integer.parseInt(SDID), Integer.parseInt(idCriterio[i]));							
								 System.out.print(idCriterio[i] + " cRITERIO");
								p.setEstado(true);																
								p.setidC(Integer.parseInt(idCriterio[i]));	
								p.setidCD(Integer.parseInt(opcionSeleccionada[i])); 
								CriterioEvaluacionAndOpcionesALPDao.updateCriterioOpcion(p,idPadre);							
														
							}else 
							 	{			
								p.setEstado(true);							
								p.setidC(Integer.parseInt(idCriterio[i]));	
								p.setidCD(Integer.parseInt(opcionSeleccionada[i])); 
								CriterioEvaluacionAndOpcionesALPDao.saveCriterioOpcionsByIdS(p, idPadre);									
							 	}											
		                }										
					}
					
					
					if (status != 0)
					{
						data = "successful";
					}
					else
					{
						data = "DBError";
					}
					break;
				default:
					data = "modeError";
					break;
			}
			response.setContentType("text/plain");
			System.out.println("Request status: " + data);
		} else {
			response.setContentType("application/json");
			data = listaRequerimientoSolicitudDisponibilidadALPDao.getAllBySDID_JSON(codDisponibilidadER);
			System.out.println("Get all Req Med data");
		}

		PrintWriter out = response.getWriter();
		out.print(data.toString());
		out.flush();
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
