package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;        // ← CAMBIADO
import jakarta.servlet.annotation.WebServlet;   // ← CAMBIADO
import jakarta.servlet.http.HttpServlet;        // ← CAMBIADO
import jakarta.servlet.http.HttpServletRequest; // ← CAMBIADO
import jakarta.servlet.http.HttpServletResponse;  // ← CAMBIADO
import jakarta.servlet.http.HttpSession;        // ← CAMBIADO

@WebServlet(name = "LogoutServlet", urlPatterns = {"/LogoutServlet"})
public class LogoutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null) session.invalidate();
        response.sendRedirect("login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}