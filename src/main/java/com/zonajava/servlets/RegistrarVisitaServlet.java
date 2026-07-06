package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegistrarVisitaServlet")
public class RegistrarVisitaServlet extends HttpServlet {

    private static final String DB_URL = System.getenv("DB_URL") != null ? 
        System.getenv("DB_URL") : "jdbc:mysql://localhost:3306/portafolio_jjk";
    private static final String DB_USER = System.getenv("DB_USER") != null ? 
        System.getenv("DB_USER") : "root";
    private static final String DB_PASSWORD = System.getenv("DB_PASSWORD") != null ? 
        System.getenv("DB_PASSWORD") : "";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pagina = request.getParameter("pagina");
        if (pagina == null) pagina = "index";
        
        String ip = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            
            String sql = "INSERT INTO visitas (pagina, ip, user_agent) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, pagina);
            stmt.setString(2, ip);
            stmt.setString(3, userAgent);
            stmt.executeUpdate();
            
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        response.setContentType("image/gif");
        response.getOutputStream().write(new byte[]{0x47, 0x49, 0x46, 0x38, 0x39, 0x61, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x3B});
    }
}