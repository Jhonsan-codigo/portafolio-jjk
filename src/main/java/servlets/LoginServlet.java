package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;        // ← CAMBIADO
import jakarta.servlet.annotation.WebServlet;   // ← CAMBIADO
import jakarta.servlet.http.HttpServlet;        // ← CAMBIADO
import jakarta.servlet.http.HttpServletRequest; // ← CAMBIADO
import jakarta.servlet.http.HttpServletResponse;  // ← CAMBIADO
import jakarta.servlet.http.HttpSession;        // ← CAMBIADO

@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final String DEFAULT_USER = "admin";
    private static final String DEFAULT_PASS = "1234";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("usuario") != null) {
            response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() ||
            password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Completa todos los campos hechicero.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }

        HttpSession session = request.getSession();
        String storedUser = (String) session.getAttribute("storedUser");
        String storedPass = (String) session.getAttribute("storedPass");

        if (storedUser == null) storedUser = DEFAULT_USER;
        if (storedPass == null) storedPass = DEFAULT_PASS;

        boolean usuarioValido = email.equalsIgnoreCase(storedUser) ||
                                 email.toLowerCase().contains(storedUser.toLowerCase());
        boolean passValida = password.equals(storedPass);

        if (usuarioValido && passValida) {
            session.setAttribute("usuario", storedUser);
            session.setAttribute("email", email);
            session.setAttribute("rol", "admin");
            session.setAttribute("loginTime", new java.util.Date().toString());
            session.setAttribute("storedUser", storedUser);
            session.setAttribute("storedPass", storedPass);
            response.sendRedirect("index.jsp");
        } else {
            request.setAttribute("error", "Energía maldita incorrecta. Verifica tus credenciales.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}