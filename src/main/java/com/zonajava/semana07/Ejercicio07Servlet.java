package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio07Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String mensaje = request.getParameter("mensaje");
        String prohibidas = request.getParameter("prohibidas");
        
        if (mensaje == null || mensaje.trim().isEmpty() || prohibidas == null || prohibidas.trim().isEmpty()) {
            request.setAttribute("error", "Por favor complete ambos campos");
            request.getRequestDispatcher("ejercicio07.jsp").forward(request, response);
            return;
        }
        
        String mensajeOriginal = mensaje;
        String[] palabrasProhibidas = prohibidas.split(",");
        
        // Censurar cada palabra prohibida usando replaceAll()
        for (String palabra : palabrasProhibidas) {
            palabra = palabra.trim().toLowerCase();
            if (!palabra.isEmpty()) {
                String censura = "*".repeat(palabra.length());
                // Reemplazar sin importar mayúsculas/minúsculas
                mensaje = mensaje.replaceAll("(?i)\\b" + palabra + "\\b", censura);
            }
        }
        
        request.setAttribute("mensajeOriginal", mensajeOriginal);
        request.setAttribute("mensajeCensurado", mensaje);
        
        request.getRequestDispatcher("ejercicio07.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio07.jsp");
    }
}