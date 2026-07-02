package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio06Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String frase = request.getParameter("frase");
        
        if (frase == null || frase.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese una frase");
            request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            return;
        }
        
        // Eliminar espacios y convertir a minúsculas
        String procesado = frase.replace(" ", "").toLowerCase();
        
        // Verificar palíndromo: comparar primera mitad con segunda mitad invertida
        boolean esPalindromo = true;
        int longitud = procesado.length();
        
        for (int i = 0; i < longitud / 2; i++) {
            if (procesado.charAt(i) != procesado.charAt(longitud - 1 - i)) {
                esPalindromo = false;
                break;
            }
        }
        
        request.setAttribute("procesado", procesado);
        request.setAttribute("esPalindromo", String.valueOf(esPalindromo));
        
        request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio06.jsp");
    }
}