package api;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.solicitudDisponibilidadALPDao;

/**
 * Servlet implementation class medicamentosAPI
 */
@WebServlet("/ALPAvailabilityRequestListBySCIDAPI")
public class ALPAvailabilityRequestListBySCIDAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ALPAvailabilityRequestListBySCIDAPI() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String arlList = "";
		String empty = "-";
		
		if (id != null && !id.isBlank()) {
			try {
				arlList = solicitudDisponibilidadALPDao.getARListByBuyRequestIdJSON(Long.parseLong(id));
			} catch (Exception e) {
				arlList = "{ \"data\":[" +  "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"]" + "]}";
			}
		}
		else
		{
			arlList = "{ \"data\":[" +  "[" + "\"" + empty + "\"," + "\"" + empty + "\"," + "\"" + empty + "\"]" + "]}";
		}
		PrintWriter out = response.getWriter();
		response.setContentType("application/json");
		out.print(arlList.toString());
		out.flush();
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
