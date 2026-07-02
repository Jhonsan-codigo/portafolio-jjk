package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio09Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String texto = request.getParameter("texto");
        
        if (texto == null || texto.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un texto");
            request.getRequestDispatcher("ejercicio09.jsp").forward(request, response);
            return;
        }
        
        String textoOriginal = texto;
        
        // Limpiar: trim() para bordes + replaceAll() para múltiples espacios internos
        String textoLimpio = texto.trim().replaceAll("\\s+", " ");
        
        request.setAttribute("textoOriginal", textoOriginal);
        request.setAttribute("textoLimpio", textoLimpio);
        
        request.getRequestDispatcher("ejercicio09.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio09.jsp");
    }
}
