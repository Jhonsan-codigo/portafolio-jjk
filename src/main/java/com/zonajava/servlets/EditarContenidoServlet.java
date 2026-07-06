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

@WebServlet("/EditarContenidoServlet")
public class EditarContenidoServlet extends HttpServlet {
    
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
        
        // Cargar configuración
        Map<String, String> configMap = cargarConfiguracion();
        request.setAttribute("config", configMap);
        
        // Cargar semanas
        List<Map<String, String>> semanas = cargarSemanas();
        request.setAttribute("semanas", semanas);
        
        request.getRequestDispatcher("admin-contenido.jsp").forward(request, response);
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
            
            if ("guardarConfig".equals(action)) {
                // Guardar configuración general
                guardarConfig(conn, "titulo", request.getParameter("titulo"));
                guardarConfig(conn, "nombre", request.getParameter("nombre"));
                guardarConfig(conn, "descripcion", request.getParameter("descripcion"));
                guardarConfig(conn, "email", request.getParameter("email"));
                guardarConfig(conn, "frase", request.getParameter("frase"));
                guardarConfig(conn, "subtitulo", request.getParameter("subtitulo"));
                guardarConfig(conn, "footer_texto", request.getParameter("footer_texto"));
                guardarConfig(conn, "footer_frase", request.getParameter("footer_frase"));
                
            } else if ("agregarSemana".equals(action)) {
                // Agregar nueva semana
                String numero = request.getParameter("numero");
                String titulo = request.getParameter("tituloSemana");
                String descripcion = request.getParameter("descripcionSemana");
                
                String sql = "INSERT INTO semanas (numero, titulo, descripcion) VALUES (?, ?, ?)";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, numero);
                stmt.setString(2, titulo);
                stmt.setString(3, descripcion);
                stmt.executeUpdate();
                stmt.close();
                
            } else if ("eliminarSemana".equals(action)) {
                // Eliminar semana
                String id = request.getParameter("id");
                String sql = "DELETE FROM semanas WHERE id = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, id);
                stmt.executeUpdate();
                stmt.close();
            }
            
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error: " + e.getMessage());
        }
        
        // Recargar y mostrar
        doGet(request, response);
    }
    
    private Map<String, String> cargarConfiguracion() {
        Map<String, String> config = new HashMap<>();
        try {
Connection conn = ConexionDB.getConnection();
            
            String sql = "SELECT clave, valor FROM configuracion";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                config.put(rs.getString("clave"), rs.getString("valor"));
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return config;
    }
    
    private List<Map<String, String>> cargarSemanas() {
        List<Map<String, String>> semanas = new ArrayList<>();
        try {
Connection conn = ConexionDB.getConnection();
            
            String sql = "SELECT id, numero, titulo, descripcion, activa FROM semanas ORDER BY numero";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                Map<String, String> semana = new HashMap<>();
                semana.put("id", String.valueOf(rs.getInt("id")));
                semana.put("numero", rs.getString("numero"));
                semana.put("titulo", rs.getString("titulo"));
                semana.put("descripcion", rs.getString("descripcion"));
                semana.put("activa", String.valueOf(rs.getBoolean("activa")));
                semanas.add(semana);
            }
            
            rs.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return semanas;
    }
    
    private void guardarConfig(Connection conn, String clave, String valor) throws Exception {
        if (valor == null) return;
        
        String updateSql = "UPDATE configuracion SET valor = ? WHERE clave = ?";
        PreparedStatement updateStmt = conn.prepareStatement(updateSql);
        updateStmt.setString(1, valor);
        updateStmt.setString(2, clave);
        int filas = updateStmt.executeUpdate();
        updateStmt.close();
        
        if (filas == 0) {
            String insertSql = "INSERT INTO configuracion (clave, valor) VALUES (?, ?)";
            PreparedStatement insertStmt = conn.prepareStatement(insertSql);
            insertStmt.setString(1, clave);
            insertStmt.setString(2, valor);
            insertStmt.executeUpdate();
            insertStmt.close();
        }
    }
}