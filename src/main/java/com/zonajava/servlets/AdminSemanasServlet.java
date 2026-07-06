package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdminSemanasServlet")
public class AdminSemanasServlet extends HttpServlet {

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
            response.sendRedirect("login.jsp?redirect=AdminSemanasServlet");
            return;
        }

        try {
Connection conn = ConexionDB.getConnection();
            
            List<Map<String, Object>> semanas = new ArrayList<>();
            String sql = "SELECT * FROM semanas ORDER BY numero";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Map<String, Object> semana = new HashMap<>();
                semana.put("id", rs.getInt("id"));
                semana.put("numero", rs.getInt("numero"));
                semana.put("titulo", rs.getString("titulo"));
                semana.put("descripcion", rs.getString("descripcion"));
                semana.put("icono", rs.getString("icono"));
                semana.put("imagen", rs.getString("imagen"));
                semana.put("tema", rs.getString("tema"));
                semana.put("poder", rs.getString("poder"));
                semana.put("tiene_ejercicios", rs.getBoolean("tiene_ejercicios"));
                semana.put("estado", rs.getString("estado"));
                semanas.add(semana);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
            request.setAttribute("semanas", semanas);
            request.getRequestDispatcher("admin-semanas.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin.jsp?error=semanas");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        
        try {
Connection conn = ConexionDB.getConnection();

            if ("add".equals(action)) {
                String sql = "INSERT INTO semanas (numero, titulo, descripcion, icono, imagen, tema, poder, tiene_ejercicios, estado) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(request.getParameter("numero")));
                stmt.setString(2, request.getParameter("titulo"));
                stmt.setString(3, request.getParameter("descripcion"));
                stmt.setString(4, request.getParameter("icono"));
                stmt.setString(5, request.getParameter("imagen"));
                stmt.setString(6, request.getParameter("tema"));
                stmt.setString(7, request.getParameter("poder"));
                stmt.setBoolean(8, "on".equals(request.getParameter("tiene_ejercicios")));
                stmt.setString(9, request.getParameter("estado"));
                stmt.executeUpdate();
                stmt.close();
                
            } else if ("update".equals(action)) {
                String sql = "UPDATE semanas SET numero=?, titulo=?, descripcion=?, icono=?, imagen=?, tema=?, poder=?, tiene_ejercicios=?, estado=? WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(request.getParameter("numero")));
                stmt.setString(2, request.getParameter("titulo"));
                stmt.setString(3, request.getParameter("descripcion"));
                stmt.setString(4, request.getParameter("icono"));
                stmt.setString(5, request.getParameter("imagen"));
                stmt.setString(6, request.getParameter("tema"));
                stmt.setString(7, request.getParameter("poder"));
                stmt.setBoolean(8, "on".equals(request.getParameter("tiene_ejercicios")));
                stmt.setString(9, request.getParameter("estado"));
                stmt.setInt(10, Integer.parseInt(request.getParameter("id")));
                stmt.executeUpdate();
                stmt.close();
                
            } else if ("delete".equals(action)) {
                String sql = "DELETE FROM semanas WHERE id=?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setInt(1, Integer.parseInt(request.getParameter("id")));
                stmt.executeUpdate();
                stmt.close();
            }

            conn.close();
            response.sendRedirect("AdminSemanasServlet?success=1");
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("AdminSemanasServlet?error=1");
        }
    }
}