package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class procesosCompraServlet
 */
@WebServlet("/CriterioEvaluacionALPServlet")
@MultipartConfig
public class CriterioEvaluacionALPServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CriterioEvaluacionALPServlet() {
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

		String submit = request.getParameter("submit");
		Integer noCompra = (Integer) session.getAttribute("noCompra");		
		String funcion = (String) session.getAttribute("funcion");
		request.setAttribute("throughServlet", "true");
		String type = (String) session.getAttribute("type");	
		
		String[] idCriterio = request.getParameterValues("idCriterio");
		String[] aplica = request.getParameterValues("aplica");
		

		

		if (submit != null && !submit.contentEquals("cancelar")) {

			CriterioEvaluacionALP p = new CriterioEvaluacionALP();			
			int status = 0;
			String respuesta = "";
			PrintWriter out = response.getWriter();
			switch (funcion) {
				case "modificar":
					p.setCod(noCompra);								
					
					
					ArrayList<Integer> criteriosId = CriterioEvalucionDao.getIdDC(noCompra);
					Integer[] miarray = new Integer[criteriosId.size()];
					miarray = criteriosId.toArray(miarray);
					
					for(Integer s : miarray) {
						System.out.println(s);
						CriterioEvaluacionDTO criterios = CriterioEvalucionDao.getCriteriosByCodAndIdCD(noCompra, s);											
						p.setEstado(false);
						p.setid(criterios.getId());
						p.setidC(s);
						CriterioEvaluacionALPDao.update(noCompra, p);						
					}						
					
					for (int i = 0; i < idCriterio.length; i++){						
						boolean cotiene = criteriosId.contains(Integer.parseInt(idCriterio[i]));															
						if(cotiene) {		
							boolean aplicara = false;
							if(aplica[i].contentEquals("1")) {								
								aplicara = true;
							}
							CriterioEvaluacionDTO criterios = CriterioEvalucionDao.getCriteriosByCodAndIdCD(noCompra, Integer.parseInt(idCriterio[i]));							
							var elemento = criteriosId.indexOf(Integer.parseInt(idCriterio[i])); 
							p.setEstado(true);							
							p.setid(criterios.getId());
							p.setidC(Integer.parseInt(idCriterio[i]));
							CriterioEvaluacionALPDao.update(noCompra, p);							
							criteriosId.remove(elemento); 							
						}else 
						 	{						
							p.setEstado(true);							
							p.setidC(Integer.parseInt(idCriterio[i]));							
		                 	 CriterioEvaluacionALPDao.save(p);							
						 	}						
	                 }
					
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForALP.jsp").forward(request,
							response);
					break;
				case "revisar":

					request.getRequestDispatcher("nPurchaseProcessRequirementsListForALP.jsp").forward(request,
							response);
					break;
				case "consultar":
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForALP.jsp").forward(request,
							response);
					break;
				default:
					
					p.setCod(noCompra);
					
					for (int i = 0; i < idCriterio.length; i++){						
                 	 p.setidC(Integer.parseInt(idCriterio[i]));                 
                 	 CriterioEvaluacionALPDao.save(p);
                 	}
					
					session.setAttribute("noCompra", noCompra);
					request.getRequestDispatcher("nPurchaseProcessRequirementsListForALP.jsp").forward(request,
							response);
					break;
			}
		} else {
			request.getRequestDispatcher("purchaseProcessesALP.jsp").forward(request, response);
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
