package api;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import main.dao.contratacionesDetalleDao;

/**
 * Servlet implementation class controlSuministros
 */
@WebServlet("/RecepcionProductosCanceladosApi")
public class RecepcionProductosCanceladosApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RecepcionProductosCanceladosApi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String step = request.getParameter("submit");
		String id = request.getParameter("id");
		
		if (step != null && !step.isEmpty()) {
			
			PrintWriter out = response.getWriter();

			switch (step) {
				case "Consultar":
					System.out.println("Get all reception data");
					String benfList = "";
					benfList = contratacionesDetalleDao.getTableCancelados(Integer.parseInt(id));
					response.setContentType("application/json");
					out.print(benfList.toString());
					out.flush();
					break;
				default:
					break;
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
