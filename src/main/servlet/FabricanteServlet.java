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
 * Servlet implementation class FabricanteServlet
 */
@WebServlet("/FabricanteServlet")
public class FabricanteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FabricanteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String denominacion = request.getParameter("denominacion");
		String pais = request.getParameter("pais");
		String direccion = request.getParameter("direccion");
		String isDist = request.getParameter("isDistribuidor");
		String rtn = request.getParameter("rtn");
		String fechaConstitucion = request.getParameter("fechaConstitucion");
		String matricula = request.getParameter("matricula");
		String modifTipo = request.getParameter("modifTipo");
		String isRev = request.getParameter("isRev");
		String modifId = request.getParameter("modifId");
		String isModif = request.getParameter("isModif");
		String tipoPago = request.getParameter("tipoPago");
		String banco = request.getParameter("banco");
		String noCuenta = request.getParameter("noCuenta");
		String isConsultar = request.getParameter("isConsultar");
		String persona = request.getParameter("persona");
		distribuidor d = new distribuidor();
		String submit = request.getParameter("submit");
		System.out.println(submit);

		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		if (submit.contentEquals("back")) {
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("distribuidorFabricante.jsp").forward(request, response);
		} else {
			if (isDist != null && !isDist.isEmpty()) {
				d.setDistribuidor("DISTRIBUIDOR/FABRICANTE");
			} else {
				d.setDistribuidor("FABRICANTE");
			}
			if (tipoPago != null && !tipoPago.isEmpty()) {
				d.setTipoPago("TRANSFERENCIA BANCARIA");
				d.setBanco(banco.toUpperCase());
				d.setNoCuenta(noCuenta);
			} else {
				d.setTipoPago("CHEQUE");
			}
			if (distribuidorDao.existsD(denominacion, d.getDistribuidor()) && !isModif.contentEquals("true")
					&& !isRev.contentEquals("true")) {
				response.sendRedirect("nFabricante.jsp");
			} else {
				d.setDenominacion(denominacion.toUpperCase());
				d.setDireccion(direccion.toUpperCase());
				d.setPais(pais.toUpperCase());
				d.setRtn(rtn);
				d.setMatricula(matricula);
				d.setEstado1("PENDIENTE DE APROBAR");
				d.setEstado2("INACTIVO");
				d.setFecha(fechaConstitucion.toUpperCase());
				d.setPersoneria(persona);
				
				if (distribuidorDao.ValidarDenominacionSocial(denominacion, d.getDistribuidor()) && !isModif.contentEquals("true")
						&& !isRev.contentEquals("true")) {
					System.out.println("YA EXISTE "   );
					request.setAttribute("mostrarmensaje", "RTNExiste");
					request.setAttribute("modifTipo", modifTipo);
					//response.sendRedirect("nDistribuidor.jsp");
					request.getRequestDispatcher("nFabricante.jsp").forward(request, response);
				} else {
				
				if (isModif != null && !isModif.isEmpty()) {
					if (isModif.contentEquals("true")) {
						distribuidorDao.update(d, modifId);
					}
				} else if (!isRev.contentEquals("true")) {
					distribuidorDao.save(d);

					h.setModulo("ADMINISTRACION DE DATOS");
					h.setSubmodulo("DISTRIBUIDOR/FABRICANTE");
					h.setFuncion("CREAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);
				}
				request.setAttribute("isConsultar", isConsultar);
				request.setAttribute("padre", denominacion);
				request.setAttribute("isRev", isRev);
				request.setAttribute("modifTipo", modifTipo);
				request.setAttribute("tipo", request.getParameter("tipo"));
				request.getRequestDispatcher("representanteLegal.jsp").forward(request, response);
			}
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