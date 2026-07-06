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

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/portafolio_jjk";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        request.getRequestDispatcher("admin-config.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String currentPassword = request.getParameter("currentPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");
        
        if (currentPassword == null || newPassword == null || confirmPassword == null) {
            request.setAttribute("error", "Complete todos los campos");
            request.getRequestDispatcher("admin-config.jsp").forward(request, response);
            return;
        }
        
        if (!newPassword.equals(confirmPassword)) {
            request.setAttribute("error", "Las contraseñas nuevas no coinciden");
            request.getRequestDispatcher("admin-config.jsp").forward(request, response);
            return;
        }
        
        String email = (String) session.getAttribute("email");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            // Verificar contraseña actual
            String verifySql = "SELECT * FROM usuarios WHERE email = ? AND password = ?";
            PreparedStatement verifyStmt = conn.prepareStatement(verifySql);
            verifyStmt.setString(1, email);
            verifyStmt.setString(2, currentPassword);
            ResultSet rs = verifyStmt.executeQuery();
            
            if (!rs.next()) {
                request.setAttribute("error", "Contraseña actual incorrecta");
                request.getRequestDispatcher("admin-config.jsp").forward(request, response);
                rs.close();
                verifyStmt.close();
                conn.close();
                return;
            }
            
            // Actualizar contraseña
            String updateSql = "UPDATE usuarios SET password = ? WHERE email = ?";
            PreparedStatement updateStmt = conn.prepareStatement(updateSql);
            updateStmt.setString(1, newPassword);
            updateStmt.setString(2, email);
            updateStmt.executeUpdate();
            
            updateStmt.close();
            rs.close();
            verifyStmt.close();
            conn.close();
            
            request.setAttribute("success", "Contraseña cambiada correctamente");
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al cambiar la contraseña");
        }
        
        request.getRequestDispatcher("admin-config.jsp").forward(request, response);
    }
}