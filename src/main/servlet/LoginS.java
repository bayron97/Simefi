package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import java.security.Principal;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginS
 */
@WebServlet("/LoginS")
public class LoginS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginS() {

		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String nextJSP = "";
			Principal p = request.getUserPrincipal();
			User u = UserDao.getUserById(p.getName().toUpperCase());
			HttpSession session = request.getSession(true);
			session.setAttribute("codEmpleado", u.getCodEmp());
			session.setAttribute("usuario", p.getName().toUpperCase());
			session.setAttribute("nombre", u.getNombre());
			if (u.getPassword().contentEquals("TEMPOCCI") && UserDao.checkRst(u)) {

				request.setAttribute("rstUser", u.getUsuario());
				nextJSP = "/crearP.jsp";
				// request.getRequestDispatcher("crearP.jsp").forward(request, response);
			} else {
				if (u.getEstado2().toUpperCase().contentEquals("ACTIVO")) {
					nextJSP = "/mainPage.jsp";
				} else {
					session.invalidate();
					nextJSP = "/index.jsp";
				}
			}
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
			request.setAttribute("usuario", u.getUsuario());
			dispatcher.forward(request, response);
		} catch (Exception e) {
			System.out.println(e);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/index.jsp");
			dispatcher.forward(request, response);
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