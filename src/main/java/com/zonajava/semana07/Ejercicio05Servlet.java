package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio05Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        
        if (nombre == null || nombre.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un nombre");
            request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            return;
        }
        
        nombre = nombre.trim().toLowerCase();
        
        // Separar por espacios con split()
        String[] palabras = nombre.split(" ");
        StringBuilder resultado = new StringBuilder();
        
        for (String palabra : palabras) {
            if (!palabra.isEmpty()) {
                // Primera letra en mayúscula + resto en minúscula
                String capitalizada = palabra.substring(0, 1).toUpperCase() 
                                    + palabra.substring(1);
                resultado.append(capitalizada).append(" ");
            }
        }
        
        request.setAttribute("original", nombre);
        request.setAttribute("capitalizado", resultado.toString().trim());
        
        request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio05.jsp");
    }
}
