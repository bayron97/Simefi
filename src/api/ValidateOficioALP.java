package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import main.dao.contratacionesDao;
import main.dao.contratacionesDetalleDao;
import main.dao.contratoSuministroDao;
import main.dao.evaluacionRecomendacionOfertaALPDao;
import main.dao.listaRequerimientoALPDao;
import main.dao.listaRequerimientoConsolidadaALPDao;
import main.dao.medicamentosDao;
import main.dao.vaciadoOfertasALPDao;
import main.model.contratacionesDetalle;
import main.model.listaRequerimientoALP;
import main.model.vaciadoOfertasALP;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/ValidateOficioALP")
public class ValidateOficioALP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ValidateOficioALP() {
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
		
		String Oficio = request.getParameter("Oficio");
		String Beneficiario = request.getParameter("Beneficiario");
		String Valor = "";
				
		listaRequerimientoALP b = new listaRequerimientoALP();		
		System.out.println(Oficio +" "+ Beneficiario);
		b.setBeneficiario(Beneficiario);
		b.setNoOficio(Oficio);				
		
		int result = listaRequerimientoALPDao.checkIfMedIsUnique(b);
		
		String j = "";					
		j += result  ;	
		j = j.substring(0, j.length());
		j += "";		
		Valor = j;		
		
		response.setContentType("text/plain");
		response.getWriter().write(Valor);
		System.out.print(Valor);		
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
