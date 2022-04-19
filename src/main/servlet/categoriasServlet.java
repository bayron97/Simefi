package main.servlet;

import main.dao.*;
import main.model.*;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class categoriasServlet
 */
@WebServlet("/categoriasServlet")
public class categoriasServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public categoriasServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String observacion = request.getParameter("overlayObs");
		String categoria = request.getParameter("overlayCat");
		String descripcion = request.getParameter("overlayDesc");
		String estado = request.getParameter("activ2");
		String modifId = request.getParameter("modifId");
		String submit = request.getParameter("submit");
		String isRevisar = request.getParameter("isRevisar");

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();
		if(submit == null) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("categorias.jsp").forward(request, response);
		}else {
		if (submit.contentEquals("modif")) {
			if (estado != null && !estado.isEmpty()) {
				estado = "ACTIVO";
			} else {
				estado = "INACTIVO";
			}
			categorias v = new categorias();
			v.setCategorias(categoria.toUpperCase());
			v.setDescripcion(descripcion.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setEstado(estado);
			categoriasDao.update(v, Integer.parseInt(modifId) );

			if (isRevisar != null && isRevisar.contains("yes")) {
				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(CATEGORIAS)");
				h.setFuncion("REVISAR Y APROBAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
			} else {
				h.setModulo("MEDICAMENTOS Y OTROS");
				h.setSubmodulo("PARAMETRIZACION(CATEGORIAS)");
				h.setFuncion("MODIFICAR");
				h.setUsuario((String) session.getAttribute("usuario"));
				historialAccesosDao.save(h);
			}

			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("categorias.jsp").forward(request, response);
		} else if (submit.contentEquals("nuevo")){
			categorias v = new categorias();
			v.setCategorias(categoria.toUpperCase());
			v.setDescripcion(descripcion.toUpperCase());
			v.setObservacion(observacion.toUpperCase());
			v.setEstado("");
			categoriasDao.save(v);

			h.setModulo("MEDICAMENTOS Y OTROS");
			h.setSubmodulo("PARAMETRIZACION(CATEGORIAS)");
			h.setFuncion("CREAR");
			h.setUsuario((String) session.getAttribute("usuario"));
			historialAccesosDao.save(h);

			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("categorias.jsp").forward(request, response);
		}else{
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("categorias.jsp").forward(request, response);
		}
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
