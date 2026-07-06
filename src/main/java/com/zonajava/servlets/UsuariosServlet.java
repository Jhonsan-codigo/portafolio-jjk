package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UsuariosServlet")
public class UsuariosServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/portafolio_jjk";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Verificar login
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        List<String[]> usuarios = new ArrayList<>();
        
        try {
Connection conn = ConexionDB.getConnection();
            
            String sql = "SELECT id, nombre, email, rol, created_at FROM usuarios";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                String[] u = new String[5];
                u[0] = String.valueOf(rs.getInt("id"));
                u[1] = rs.getString("nombre");
                u[2] = rs.getString("email");
                u[3] = rs.getString("rol");
                u[4] = rs.getString("created_at");
                usuarios.add(u);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        request.setAttribute("usuarios", usuarios);
        request.getRequestDispatcher("admin-usuarios.jsp").forward(request, response);
    }
}