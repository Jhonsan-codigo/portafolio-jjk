package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    // Configuración de la base de datos (usar variables de entorno en Render)
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

        // Si no hay redirect, ir al admin por defecto
        if (redirect == null || redirect.isEmpty()) {
            redirect = "admin.jsp";
        }

        try {
            // Cargar driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Conectar a la base de datos
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Consulta para verificar credenciales
            String sql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password); // En producción usar hash

            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Login exitoso - crear sesión como admin
                HttpSession session = request.getSession();
                session.setAttribute("admin", email);
                session.setAttribute("rol", rs.getString("rol"));
                session.setAttribute("nombre", rs.getString("nombre"));

                // Redirigir a la página solicitada
                response.sendRedirect(redirect);
            } else {
                // Login fallido
                request.setAttribute("error", "Correo o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp?redirect=" + redirect).forward(request, response);
            }

            rs.close();
            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error de conexión: " + e.getMessage());
            request.getRequestDispatcher("login.jsp?redirect=" + redirect).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Si ya está logueado, redirigir al admin
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("admin") != null) {
            response.sendRedirect("admin.jsp");
        } else {
            response.sendRedirect("login.jsp");
        }
    }
}