package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class newPassS
 */
@WebServlet("/newPassS")
public class newPassS extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public newPassS() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String user = request.getParameter("un");
		String pass = request.getParameter("pw");
		String pass1 = request.getParameter("pw1");
		String nextJSP = "";
		if (pass.contentEquals(pass1)) {
			User tmp = new User();
			tmp = UserDao.getUserById(user.toUpperCase());
			tmp.setPassword(pass);
			UserDao.updatePass(tmp);
			resetP p = resetDao.getByUser(user.toUpperCase());
			resetDao.delete(p);
			HttpSession sesion = request.getSession();
			sesion.invalidate();
			nextJSP = "index.jsp";
		} else {
			nextJSP = "crearP.jsp";
		}
		response.sendRedirect(nextJSP);

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
