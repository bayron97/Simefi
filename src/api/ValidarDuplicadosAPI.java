package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.CriterioEvaluacionALPDao;
import main.dao.medicamentosDao;
import main.dao.ofertaALPDao;
import main.dao.upDao;



/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ValidarDuplicadosAPI")
public class ValidarDuplicadosAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidarDuplicadosAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String duplicado = "";	
		
	
		String validar = request.getParameter("validar");
		
		
		switch (validar) {
		case "ValidarOpcionCriterio": 
			
			String CrEvaluacion = request.getParameter("CrEvaluacion");
			String CrEvaluacionDetalle = request.getParameter("CrEvaluacionDetalle");
			
			int Existe = CriterioEvaluacionALPDao.validarOpcionCriterioNew(CrEvaluacion, CrEvaluacionDetalle);				
			duplicado = String.valueOf(Existe) ;
			response.setContentType("text/plain");
			response.getWriter().write(duplicado);
			System.out.print(duplicado);
		break;
		case "ValidarNoOfertaIngByProveedor": 
			
			String purchaseProc = request.getParameter("purchaseProc");
			String noOferta = request.getParameter("noOferta");
			String noOfertador = request.getParameter("noOfertaIngresada");
			String distributor = request.getParameter("distributor");
			String reqID = request.getParameter("reqID");
			
			int finalizado = 0;
			
			if(noOferta.equals(null) || noOferta == "" || noOferta.isEmpty()) {
				finalizado = ofertaALPDao.validarNewNumOferta(purchaseProc, noOfertador, distributor, reqID);		
				;
				System.out.println("finalizado " + finalizado);
			}else {
				
//				Existe = ofertaALPDao.validarUpdateNumOferta(purchaseProc, noOferta,noOfertador, distributor);										
//				duplicado = String.valueOf(Existe) ;
				finalizado = 0;
			}
			PrintWriter out = response.getWriter();		
			response.setContentType("text/plain");
			out.print(finalizado);
			out.flush();
			out.close();
		
		break;
		case "ValidarCriterio": 
					
					CrEvaluacion = request.getParameter("CrEvaluacion");
					
					Existe = CriterioEvaluacionALPDao.validarCriterioNew(CrEvaluacion);				
					duplicado = String.valueOf(Existe) ;
					response.setContentType("text/plain");
					response.getWriter().write(duplicado);
					System.out.print(duplicado);
				break;
		default:
			break;
		}
		
			
			
			
		
		//request.setAttribute("throughServlet", "true");
		//request.getRequestDispatcher("recepcionProductos.jsp").forward(request, response);
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
