package servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;        // ← CAMBIADO
import jakarta.servlet.annotation.WebServlet;   // ← CAMBIADO
import jakarta.servlet.http.HttpServlet;        // ← CAMBIADO
import jakarta.servlet.http.HttpServletRequest; // ← CAMBIADO
import jakarta.servlet.http.HttpServletResponse;  // ← CAMBIADO
import jakarta.servlet.http.HttpSession;        // ← CAMBIADO

@WebServlet(name = "ChangePasswordServlet", urlPatterns = {"/ChangePasswordServlet"})
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("usuario") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String currentPass = request.getParameter("currentPassword");
        String newPass = request.getParameter("newPassword");
        String confirmPass = request.getParameter("confirmPassword");

        String storedPass = (String) session.getAttribute("storedPass");
        if (storedPass == null) storedPass = "1234";

        if (currentPass == null || currentPass.trim().isEmpty() ||
            newPass == null || newPass.trim().isEmpty() ||
            confirmPass == null || confirmPass.trim().isEmpty()) {
            request.setAttribute("error", "Todos los campos son obligatorios.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (!currentPass.equals(storedPass)) {
            request.setAttribute("error", "La contraseña actual es incorrecta.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (!newPass.equals(confirmPass)) {
            request.setAttribute("error", "Las contraseñas no coinciden.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        if (newPass.length() < 4) {
            request.setAttribute("error", "Mínimo 4 caracteres.");
            request.getRequestDispatcher("change-password.jsp").forward(request, response);
            return;
        }

        session.setAttribute("storedPass", newPass);
        request.setAttribute("success", "¡Contraseña actualizada! Tu energía maldita ha sido renovada.");
        request.getRequestDispatcher("change-password.jsp").forward(request, response);
    }
}