package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.Gral_listaRequerimientoDao;
import main.dao.medicamentosDao;
import main.dao.ofertaALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/Gral_aclaracionEnmiendaAPI")
public class Gral_aclaracionEnmiendaAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Gral_aclaracionEnmiendaAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String accion = request.getParameter("accion");
		PrintWriter out = response.getWriter();
		
		///// vista nAmendmentsEstListForGeneral.jsp
		
		switch (accion) {
		case "autoCompletado":
			

			String ProductoList = "";
			ProductoList = Gral_listaRequerimientoDao.getMedicamentoLista();
			
			System.out.println(request);
			
			
			response.setContentType("application/json");
			out.print(ProductoList.toString());
			out.flush();
			break;
			
		case "llenardatos":
			
			 ProductoList = "";
			ProductoList = Gral_listaRequerimientoDao.getProductoSeleccionado( request.getParameter("nombreMedicamento"));
	
		
			response.setContentType("text/plain");
			response.getWriter().write(ProductoList);
			
			break;
			
		case "insert":
			System.out.println("Viene");
			String data = "";
			int Guardado = Gral_listaRequerimientoDao.getMedicamentoExiste(Integer.parseInt(request.getParameter("idAperturaProceso")), 
					Integer.parseInt(request.getParameter("idMedicamento")), Integer.parseInt(request.getParameter("cantidad"))); 
			if (Guardado > 0) {
	            data = "successful";
	          } else {
	            data = "DBError";
	          }

	          response.setContentType("text/plain");
	          out.print(data.toString());
	          out.flush();
			
			break;
			
		case "GetlistaRequerimientoConsolidadoTB":
			data = Gral_listaRequerimientoDao.getListConsolidadaAEjson(Integer.parseInt(request.getParameter("idAperturaProceso")));
			response.setContentType("text/plain");
			out.print(data);
			out.flush();
			//out.close();
			break;
			
		case "update":
			System.out.println("Viene");
			 data = "";
			int update = Gral_listaRequerimientoDao.updateConsolidadoItemAe(Integer.parseInt(request.getParameter("idAperturaProceso")), 
					request.getParameter("nombreMedicamento"), Integer.parseInt(request.getParameter("cantidad")),Boolean.parseBoolean(request.getParameter("estado"))); 
			if (update > 0) {
	            data = "successful";
	          } else {
	            data = "DBError";
	          }

	          response.setContentType("text/plain");
	          out.print(data.toString());
	          out.flush();
			
			break;
		
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
