package com.zonajava.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
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

@WebServlet("/DatabaseServlet")
public class DatabaseServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        String action = request.getParameter("action");
        String tabla = request.getParameter("tabla");
        
        // Cargar lista de tablas siempre
        List<Map<String, String>> tablas = cargarTablas();
        request.setAttribute("tablas", tablas);
        
        // Si quiere ver contenido de una tabla
        if ("ver".equals(action) && tabla != null) {
            List<String> columnas = new ArrayList<>();
            List<List<String>> filas = new ArrayList<>();
            cargarContenidoTabla(tabla, columnas, filas);
            request.setAttribute("tablaSeleccionada", tabla);
            request.setAttribute("columnas", columnas);
            request.setAttribute("filas", filas);
        }
        
        request.getRequestDispatcher("admin-database.jsp").forward(request, response);
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
        
        if ("sql".equals(action)) {
            // Ejecutar consulta SQL
            String consulta = request.getParameter("consulta");
            if (consulta != null && !consulta.trim().isEmpty()) {
                ejecutarSQL(request, consulta.trim());
            }
        } else if ("vaciar".equals(action)) {
            // Vaciar tabla
            String tabla = request.getParameter("tabla");
            if (tabla != null) {
                vaciarTabla(tabla);
            }
        }
        
        // Recargar
        doGet(request, response);
    }
    
    private List<Map<String, String>> cargarTablas() {
        List<Map<String, String>> tablas = new ArrayList<>();
        try {
            Connection conn = ConexionDB.getConnection();
            DatabaseMetaData meta = conn.getMetaData();
            ResultSet rs = meta.getTables(null, null, "%", new String[]{"TABLE"});
            
            while (rs.next()) {
                Map<String, String> t = new HashMap<>();
                t.put("nombre", rs.getString("TABLE_NAME"));
                t.put("tipo", rs.getString("TABLE_TYPE"));
                tablas.add(t);
            }
            
            rs.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tablas;
    }
    
    private void cargarContenidoTabla(String tabla, List<String> columnas, List<List<String>> filas) {
        try {
            Connection conn = ConexionDB.getConnection();
            
            String sql = "SELECT * FROM " + tabla + " LIMIT 100";
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            ResultSetMetaData meta = rs.getMetaData();
            
            // Obtener nombres de columnas
            int numColumnas = meta.getColumnCount();
            for (int i = 1; i <= numColumnas; i++) {
                columnas.add(meta.getColumnName(i));
            }
            
            // Obtener filas
            while (rs.next()) {
                List<String> fila = new ArrayList<>();
                for (int i = 1; i <= numColumnas; i++) {
                    String valor = rs.getString(i);
                    fila.add(valor != null ? valor : "NULL");
                }
                filas.add(fila);
            }
            
            rs.close();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private void ejecutarSQL(HttpServletRequest request, String consulta) {
        List<String> columnas = new ArrayList<>();
        List<List<String>> filas = new ArrayList<>();
        String mensaje = null;
        boolean esSelect = consulta.toUpperCase().startsWith("SELECT");
        
        try {
            Connection conn = ConexionDB.getConnection();
            
            if (esSelect) {
                PreparedStatement stmt = conn.prepareStatement(consulta);
                ResultSet rs = stmt.executeQuery();
                ResultSetMetaData meta = rs.getMetaData();
                
                int numColumnas = meta.getColumnCount();
                for (int i = 1; i <= numColumnas; i++) {
                    columnas.add(meta.getColumnName(i));
                }
                
                while (rs.next()) {
                    List<String> fila = new ArrayList<>();
                    for (int i = 1; i <= numColumnas; i++) {
                        String valor = rs.getString(i);
                        fila.add(valor != null ? valor : "NULL");
                    }
                    filas.add(fila);
                }
                
                rs.close();
                stmt.close();
                mensaje = "Consulta ejecutada. Filas encontradas: " + filas.size();
            } else {
                PreparedStatement stmt = conn.prepareStatement(consulta);
                int filasAfectadas = stmt.executeUpdate();
                stmt.close();
                mensaje = "Consulta ejecutada. Filas afectadas: " + filasAfectadas;
            }
            
            conn.close();
        } catch (Exception e) {
            mensaje = "Error: " + e.getMessage();
        }
        
        request.setAttribute("sqlColumnas", columnas);
        request.setAttribute("sqlFilas", filas);
        request.setAttribute("sqlMensaje", mensaje);
        request.setAttribute("sqlConsulta", consulta);
        request.setAttribute("sqlEsSelect", esSelect);
    }
    
    private void vaciarTabla(String tabla) {
        try {
            Connection conn = ConexionDB.getConnection();
            String sql = "TRUNCATE TABLE " + tabla;
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.executeUpdate();
            stmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}