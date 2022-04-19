package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.beneficiarioDao;
import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoSolicitudDisponibilidadALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ContratacionesDetalle")
public class ContratacionesDetalle extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ContratacionesDetalle() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//String step = request.getParameter("submit");
		
		
		
			PrintWriter out = response.getWriter();
			String benfList="";
			
					String data = "";
					int Resultado = 0;
					contratacionesDetalle b = new contratacionesDetalle();
					
					String[] Item = request.getParameterValues("json[]");	
					
					
					System.out.println("--------");
					System.out.println(Item[0]);
					System.out.println(Item[1]);
					System.out.println(Item[2]);
					System.out.println(Item[3]);
					System.out.println("-------");
					
						//int idListarequerimientoSolicitudDisponibilidad = Integer.parseInt(request.getParameter("idListarequerimientoSolicitudDisponibilidad"));
						b.setTiempoEntrega(Item[3]);
						//b.setCantidadComprado(Float.parseFloat(request.getParameter("cantidadComprada")));
						b.setCantidadEntregaPlazos(Integer.parseInt(Item[1]));
						b.setFechaLimiteEntrega(Item[2]);
						int IdDetalle = Integer.parseInt(Item[0]);
						
						Resultado = contratacionesDetalleDao.update(b, IdDetalle);
//						
//					
					
					
					if (Resultado != 0) {
						data = "success";
					} else {
						data = "DBError";
					}
					
					
					response.setContentType("text/plain");
					System.out.println("Request successful: " + data);							
					out.print(data.toString());
					out.flush();
					
					//response.setContentType("text/plain");
					//response.getWriter().write(data);
					
//					response.setContentType("text/plain");
//					System.out.println("Request status: " + data);		
//					
//					out.print(data);
//					out.flush();
//					out.close();
//				
		
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
