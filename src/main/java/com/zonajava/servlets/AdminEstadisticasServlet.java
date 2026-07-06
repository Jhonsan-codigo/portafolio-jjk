package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AdminEstadisticasServlet")
public class AdminEstadisticasServlet extends HttpServlet {

    private static final String DB_URL = System.getenv("DB_URL") != null ? 
        System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/portafolio_jjk";
    private static final String DB_USER = System.getenv("DB_USER") != null ? 
        System.getenv("DB_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD") != null ? 
        System.getenv("DB_PASSWORD") : "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?redirect=AdminEstadisticasServlet");
            return;
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            Map<String, Object> stats = new HashMap<>();
            
            // Total visitas
            PreparedStatement stmt = conn.prepareStatement("SELECT COUNT(*) as total FROM visitas");
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) stats.put("total_visitas", rs.getInt("total"));
            rs.close(); stmt.close();
            
            // Visitas hoy
            stmt = conn.prepareStatement("SELECT COUNT(*) as total FROM visitas WHERE DATE(fecha) = CURDATE()");
            rs = stmt.executeQuery();
            if (rs.next()) stats.put("visitas_hoy", rs.getInt("total"));
            rs.close(); stmt.close();
            
            // Total ejercicios completados
            stmt = conn.prepareStatement("SELECT COUNT(*) as total FROM ejercicios_completados");
            rs = stmt.executeQuery();
            if (rs.next()) stats.put("total_ejercicios", rs.getInt("total"));
            rs.close(); stmt.close();
            
            // Total semanas activas
            stmt = conn.prepareStatement("SELECT COUNT(*) as total FROM semanas WHERE estado = 'activo'");
            rs = stmt.executeQuery();
            if (rs.next()) stats.put("semanas_activas", rs.getInt("total"));
            rs.close(); stmt.close();
            
            // Total usuarios
            stmt = conn.prepareStatement("SELECT COUNT(*) as total FROM usuarios");
            rs = stmt.executeQuery();
            if (rs.next()) stats.put("total_usuarios", rs.getInt("total"));
            rs.close(); stmt.close();
            
            // Visitas por página
            stmt = conn.prepareStatement("SELECT pagina, COUNT(*) as total FROM visitas GROUP BY pagina ORDER BY total DESC LIMIT 10");
            rs = stmt.executeQuery();
            Map<String, Integer> visitasPorPagina = new HashMap<>();
            while (rs.next()) {
                visitasPorPagina.put(rs.getString("pagina"), rs.getInt("total"));
            }
            stats.put("visitasPorPagina", visitasPorPagina);
            rs.close(); stmt.close();
            
            conn.close();
            
            request.setAttribute("stats", stats);
            request.getRequestDispatcher("admin-estadisticas.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=stats");
        }
    }
}