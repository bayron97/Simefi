package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
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
@WebServlet("/CriterioEvaluacionServlet")
@MultipartConfig
public class CriterioEvaluacionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CriterioEvaluacionServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String NombreCriterio = request.getParameter("NombreCriterio");		
		String submit = request.getParameter("submit");

		System.out.println(submit + " submit");
		
		CriterioEvaluacion a = new CriterioEvaluacion();
		a.setNombreCriterio(NombreCriterio);
		
		
		if (submit.contentEquals("nuevo")) {
			CriterioEvalucionDao.save(a);
		} else {
			String estado = request.getParameter("activo");
			if (estado != null && !estado.isEmpty()) {
				a.setestado("ACTIVO");
			}
			else {
				a.setestado("INACTIVO");
			}
			int id = -1;
			try {
				id = Integer.parseInt(request.getParameter("idEditar"));
			}
			catch(Exception e) {
				id = -1;
			}
			a.setId(id);
			String motivo = request.getParameter("motivo");
			a.setmotivo(motivo);
			CriterioEvalucionDao.activar(a);
		}
		

		request.setAttribute("throughServlet", "true");
		request.getRequestDispatcher("paramCriterioEvaluacionVaciado.jsp").forward(request, response);

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
