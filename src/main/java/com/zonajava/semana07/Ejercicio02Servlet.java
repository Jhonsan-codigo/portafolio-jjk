package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio02Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String texto = request.getParameter("texto");
        
        if (texto == null || texto.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un texto");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            return;
        }
        
        // Invertir usando charAt() desde la última posición hasta la primera
        StringBuilder invertido = new StringBuilder();
        for (int i = texto.length() - 1; i >= 0; i--) {
            invertido.append(texto.charAt(i));
        }
        
        request.setAttribute("original", texto);
        request.setAttribute("invertido", invertido.toString());
        
        request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}
