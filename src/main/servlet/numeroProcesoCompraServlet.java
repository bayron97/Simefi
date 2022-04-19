package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class procesoALPServlet
 */
@WebServlet("/numeroProcesoCompraServlet")
public class numeroProcesoCompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public numeroProcesoCompraServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String tipoCompra = request.getParameter("purchaseType");
		numeroProcesoCompra p = new numeroProcesoCompra();
		if (tipoCompra != null) {
			int year = Calendar.getInstance().get(Calendar.YEAR);
			String cod = tipoCompra;
			cod = cod + " " + year;
			//cod = cod + "-" + year;
			int next = numeroProcesoCompraDao.count(cod) + 1;
			int canDigit = (int) (Math.log10(next) + 1); 			
			if(canDigit == 1) {				
				cod = cod + "-00" + next;
			}
			else if(canDigit == 2) {
				cod = cod + "-0" + next;
			}else {
				cod = cod + "-" + next;
			}			
			
			p.setCod(cod.toUpperCase());
			p.setEstado("DISPONIBLE");
			p.setIdIncremental(next);

			numeroProcesoCompraDao.save(p);
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramALP.jsp").forward(request, response);
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
