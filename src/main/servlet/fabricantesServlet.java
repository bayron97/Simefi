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
 * Servlet implementation class descripcioncompraServlet
 */
@WebServlet("/fabricantesServlet")
public class fabricantesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public fabricantesServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nombrefabricante = request.getParameter("nombref");
		String submit = request.getParameter("submit");

		System.out.println(submit + " submitsubmit");
		
		fabricantes t = new fabricantes();
		t.setNombreFabricante(nombrefabricante);

		if (submit != null && submit.contentEquals("nuevo")) {
			fabricantesDao.save(t);
		}else {
			String estado = request.getParameter("activo");
			
			if (estado != null && !estado.isEmpty()) {
				t.setestado("ACTIVO");
			}
			else {
				t.setestado("INACTIVO");
			}
			int id = -1;
			try {
				id = Integer.parseInt(request.getParameter("idEditar"));
			}
			catch(Exception e) {
				id = -1;
			}
			
			System.out.println(t.getestado() + " estado ");
			
			t.setNo(id);
			String motivo = request.getParameter("motivo");
			t.setmotivo(motivo);
			fabricantesDao.activar(t);
			
		}

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramFabricante.jsp").forward(request, response);

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
