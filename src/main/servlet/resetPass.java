package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class resetPass
 */
@WebServlet("/resetPass")
public class resetPass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public resetPass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String usuario = request.getParameter("overlayUsr");
		String submit = request.getParameter("submit");
		String fecha = request.getParameter("fecha");
		String motivo = request.getParameter("overlayMot");
		String overlayAp = request.getParameter("overlayAp");
		String isRevisar = request.getParameter("isRevisar");
		
		System.out.println(submit + " submit");
		
		HttpSession session = request.getSession(true);
		try {
			if (submit.contentEquals("guardar")) {
				resetP p = new resetP();
				usuario = request.getParameter("overlayUsr");
				p = resetDao.getByUser(usuario);
				p.setMotivo(request.getParameter("overlayMot"));
				p.setObservacion(request.getParameter("overlayObs"));
				if (overlayAp != null && !overlayAp.isEmpty()) {
					p.setEstado1("APROBADO");
				} else {
					p.setEstado1("RECHAZADO");
				}
				resetDao.update(p);

				historialAccesos h = new historialAccesos();
				h.setModulo("PARAMETRIZACION DE USUARIOS");
				h.setSubmodulo("RESETEO DE CONTRASENA");
				if (isRevisar != null && isRevisar.contentEquals("yes")) {
					h.setFuncion("REVISAR Y APROBAR");
				} else {
					h.setFuncion("MODIFICAR");
				}

				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);

				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("reseteoPassword.jsp").forward(request, response);
			} else if (submit.contentEquals("solicitar")) {
				resetP p = new resetP();
				p = resetDao.getByUser((String) session.getAttribute("usuario"));

				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				String d = formatter.format(date);

				p.setFecha(d);
				p.setMotivo("SOLICITUD POR USUARIO");
				resetDao.save(p);

				historialAccesos h = new historialAccesos();
				h.setModulo("PARAMETRIZACION DE USUARIOS");
				h.setSubmodulo("RESETEO DE CONTRASENA");
				h.setFuncion("CREAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("reseteoPassword.jsp").forward(request, response);
			} else {
				resetP p = new resetP();
				p = resetDao.getByUser(usuario);
			
				SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
				Date date = new Date();
				String d = formatter.format(date);
				System.out.println(d + " d");
				p.setFecha(d);
				p.setMotivo(motivo);
				resetDao.save(p);

				historialAccesos h = new historialAccesos();
				h.setModulo("PARAMETRIZACION DE USUARIOS");
				h.setSubmodulo("RESETEO DE CONTRASENA");
				h.setFuncion("SOLICITUD");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
				request.setAttribute("throughServlet", "true");

				request.setAttribute("throughServlet", "true");
				request.getRequestDispatcher("reseteoPassword.jsp").forward(request, response);
			}
		} catch (Exception e) {
			System.out.println(e);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("reseteoPassword.jsp").forward(request, response);
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
