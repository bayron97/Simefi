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
 * Servlet implementation class otrosServlet
 */
@WebServlet("/otrosServlet")
public class otrosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public otrosServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String submit = request.getParameter("submit");
System.out.println(submit + "CCCC");
		HttpSession session = request.getSession(true);

		historialAccesos h = new historialAccesos();

		try {
			otros o = new otros();
			String overlayCod = request.getParameter("overlayCodSis");
			String cat = request.getParameter("overlayCodAtc");
			String presentacion = request.getParameter("overlayCodSesal");
			String observacion = request.getParameter("overlayObs");
			String ap1 = request.getParameter("ap1");
			String act2 = request.getParameter("act2");
			String motiv1 = request.getParameter("motiv1");
			String motiv2 = request.getParameter("motiv2");
			String nombre = request.getParameter("overlayNombre");
			switch (submit) {
				case "rev":
					String pendienteAprobar = request.getParameter("pendienteAprobar");
					o.setCodigo(overlayCod);
					o.setCategoria(cat);
					o.setUp(presentacion);
					o.setObservacion(observacion);
					o.setMotivo1(motiv1);
					o.setMotivo2(motiv2);
					o.setNombre(request.getParameter("nombreGenerico"));
					o.setNum(Integer.parseInt(request.getParameter("modifId")));
					
					ap1 = request.getParameter("activ1");
					act2 = request.getParameter("activ2");
					if (ap1 != null && !ap1.isEmpty()) {
						o.setEstado1("APROBADO");
					}else if (pendienteAprobar != null && !pendienteAprobar.isEmpty()){
						o.setEstado1("PENDIENTE DE APROBAR");
					}
					else {
						o.setEstado1("RECHAZADO");
					}
					if (act2 != null && !act2.isEmpty()) {
						o.setEstado2("ACTIVO");
					} else {
						o.setEstado2("INACTIVO");
					}
					otrosDao.revisar(o);

					h.setModulo("MEDICAMENTOS Y OTROS");
					h.setSubmodulo("OTROS");
					h.setFuncion("REVISAR Y APROBAR");
					h.setUsuario((String) session.getAttribute("usuario"));
					historialAccesosDao.save(h);

					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("insumos.jsp").forward(request, response);
					break;
				case "consultar":
					if (request.getParameter("modifyId") == null || request.getParameter("modifyId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("insumos.jsp").forward(request, response);
					} else {
						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("OTROS");
						h.setFuncion("CONSULTAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);

						o = otrosDao.getOne(Integer.parseInt(request.getParameter("modifyId")));
						request.setAttribute("modifId", request.getParameter("modifyId"));
						request.setAttribute("modifNombre", o.getNombre());
						request.setAttribute("modifDesc", o.getDescripcion());
						request.setAttribute("modifObs", o.getArticulo());
						request.setAttribute("modifCat", o.getCategoria());
						request.setAttribute("modifUp", o.getUp());
						request.setAttribute("isModify", "false");
						request.setAttribute("isRev", "false");
						request.setAttribute("isConsulta", "true");
						request.getRequestDispatcher("nOtros.jsp").forward(request, response);
					}
					break;
				case "ConsultarFicha":
					if (request.getParameter("modifId") == null || request.getParameter("modifId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("insumos.jsp").forward(request, response);
					} else {

						o = otrosDao.getOne(Integer.parseInt(request.getParameter("modifId")));
						request.setAttribute("id", request.getParameter("modifId"));
						request.setAttribute("modifNombre", o.getNombre());
						request.setAttribute("modifDesc", o.getDescripcion());
						request.setAttribute("modifObs", o.getArticulo());
						request.setAttribute("modifCat", o.getCategoria());
						request.setAttribute("modifUp", o.getUp());
						request.setAttribute("isModify", "false");
						request.setAttribute("isRev", "false");
						request.setAttribute("isConsultar", "true");
						request.getRequestDispatcher("nOtrosOficios.jsp").forward(request, response);
					}
					break;
				case "revisarFicha":
					o = otrosDao.getOne(Integer.parseInt(request.getParameter("modifId")));
					request.setAttribute("id", request.getParameter("modifId"));
					request.setAttribute("modifNombre", o.getNombre());
					request.setAttribute("modifDesc", o.getDescripcion());
					request.setAttribute("modifObs", o.getArticulo());
					request.setAttribute("modifCat", o.getCategoria());
					request.setAttribute("modifUp", o.getUp());
					request.setAttribute("isModify", "false");
					request.setAttribute("isRev", "true");
					request.setAttribute("isConsulta", "false");
					request.getRequestDispatcher("nOtrosOficios.jsp").forward(request, response);
					break;
				case "revisar":
					if (request.getParameter("modifyId") == null || request.getParameter("modifyId").isEmpty()) {
						request.setAttribute("throughServlet", "true");
						request.getRequestDispatcher("insumos.jsp").forward(request, response);
					} else {
						o = otrosDao.getOne(Integer.parseInt(request.getParameter("modifyId")));
						request.setAttribute("modifId", request.getParameter("modifyId"));
						request.setAttribute("modifNombre", o.getNombre());
						request.setAttribute("modifDesc", o.getDescripcion());
						request.setAttribute("modifObs", o.getArticulo());
						request.setAttribute("modifCat", o.getCategoria());
						request.setAttribute("modifUp", o.getUp());
						request.setAttribute("isModify", "false");
						request.setAttribute("isRev", "true");
						request.setAttribute("isConsulta", "false");
						request.getRequestDispatcher("nOtros.jsp").forward(request, response);
					}
					break;
				case "back":
					request.setAttribute("throughServlet", "true");
					request.getRequestDispatcher("insumos.jsp").forward(request, response);
					break;
				case "modify":
					o = otrosDao.getOne(Integer.parseInt(request.getParameter("modifyId")));
					request.setAttribute("modifId", request.getParameter("modifyId"));
					request.setAttribute("modifNombre", o.getNombre());
					request.setAttribute("modifDesc", o.getDescripcion());
					request.setAttribute("modifObs", o.getArticulo());
					request.setAttribute("modifCat", o.getCategoria());
					request.setAttribute("modifUp", o.getUp());
					request.setAttribute("isModify", "true");
					request.setAttribute("isRev", "false");
					request.setAttribute("isConsulta", "false");
					request.getRequestDispatcher("nOtros.jsp").forward(request, response);
					break;
				default:
					String isModify = request.getParameter("isModify");
					String isRev = request.getParameter("isRev");

					String categoria = request.getParameter("categoria");
					String up = request.getParameter("up");
					nombre = request.getParameter("nombre");
					String descripcion = request.getParameter("overlayObs");
					String articulo = request.getParameter("articulo");

					o.setCategoria(categoria);
					o.setUp(up);
					o.setNombre(nombre);
					o.setDescripcion(descripcion);
					o.setArticulo(articulo);
					o.setEstado1("PENDIENTE DE APROBAR");
					o.setEstado2("INACTIVO");
					o.setCodigo(o.getCategoria() + o.getNombre());
					if (isModify.contentEquals("true")) {
						o.setNum(Integer.parseInt(request.getParameter("modifId")));
						otrosDao.update(o);
						request.setAttribute("id",request.getParameter("modifId"));
						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("OTROS");
						h.setFuncion("MODIFICAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);
					} else if (isRev.contentEquals("true")) {

					} else {
						int idGenerado  = otrosDao.save(o);
						request.setAttribute("id", String.valueOf(idGenerado));
						h.setModulo("MEDICAMENTOS Y OTROS");
						h.setSubmodulo("OTROS");
						h.setFuncion("CREAR");
						h.setUsuario((String) session.getAttribute("usuario"));
						historialAccesosDao.save(h);
					}
					
					
					
					request.setAttribute("isModify", isModify);
					request.setAttribute("isRev", isRev);
					request.setAttribute("throughServlet", "true");
					
					request.getRequestDispatcher("nOtrosOficios.jsp").forward(request, response);
					break;
			}
		} catch (Exception e) {
			System.out.println(e);
			request.setAttribute("throughServlet", "true");
			request.getRequestDispatcher("insumos.jsp").forward(request, response);
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