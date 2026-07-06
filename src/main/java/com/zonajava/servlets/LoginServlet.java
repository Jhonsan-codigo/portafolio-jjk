package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.SQLException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private static final String DB_URL = System.getenv("DB_URL") != null ? 
        System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/portafolio_jjk";
    private static final String DB_USER = System.getenv("DB_USER") != null ? 
        System.getenv("DB_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD") != null ? 
        System.getenv("DB_PASSWORD") : "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String redirect = request.getParameter("redirect");

        // Validar campos vacíos
        if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
            response.sendRedirect("login.jsp?error=empty");
            return;
        }

        try {
Connection conn = ConexionDB.getConnection();

            // Buscar por EMAIL (tu tabla usa 'email', no 'username')
            String sql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email.trim());
            stmt.setString(2, password.trim());
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession();
                session.setAttribute("admin", rs.getString("nombre"));
                session.setAttribute("email", rs.getString("email"));
                session.setAttribute("rol", rs.getString("rol"));

                if (redirect != null && !redirect.isEmpty()) {
                    response.sendRedirect(redirect);
                } else {
                    response.sendRedirect("admin.jsp");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

            rs.close();
            stmt.close();
            conn.close();

} catch (Exception e) {
    e.printStackTrace();
    HttpSession session = request.getSession();
    session.setAttribute("errorDetalle", e.getClass().getSimpleName() + ": " + e.getMessage());
    response.sendRedirect("login.jsp?error=2");
}
    }
}