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

@WebServlet("/CrearSesion")
public class crearSesion extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public crearSesion() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        System.out.println(request.getRemoteUser());
        Principal p = request.getUserPrincipal();
        User u = UserDao.getUserById(p.getName());
        String nextJSP = "";
        if (p != null) {
            if (u.getPassword().contentEquals("tempocci") && UserDao.checkRst(u)) {
                request.setAttribute("rstUser", u.getUsuario());
                request.getRequestDispatcher("crearP.jsp").forward(request, response);
            } else {
                System.out.println("Usuario autenticado: " + p.getName());
                System.out.println("Rol admin: " + request.isUserInRole("admin"));
                System.out.println("Rol usuario: " + request.isUserInRole("usuario"));
                nextJSP = "/mainP.html";
                HttpSession sesion = request.getSession(true);
                sesion.setAttribute("usuario", p.getName());
            }
        } else {
            System.out.println("Usuario no autenticado.");
            nextJSP = "index.jsp";
        }
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}