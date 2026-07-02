package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio10Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String parrafo = request.getParameter("parrafo");
        
        if (parrafo == null || parrafo.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un párrafo");
            request.getRequestDispatcher("ejercicio10.jsp").forward(request, response);
            return;
        }
        
        // Limpiar espacios con trim()
        String limpio = parrafo.trim();
        
        // Dividir en palabras con split()
        String[] palabras = limpio.split("\\s+");
        
        int totalPalabras = palabras.length;
        String primeraPalabra = palabras[0];
        String ultimaPalabra = palabras[totalPalabras - 1];
        
        request.setAttribute("totalPalabras", totalPalabras);
        request.setAttribute("primeraPalabra", primeraPalabra);
        request.setAttribute("ultimaPalabra", ultimaPalabra);
        
        request.getRequestDispatcher("ejercicio10.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio10.jsp");
    }
}