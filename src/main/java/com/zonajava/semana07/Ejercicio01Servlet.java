package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio01Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String frase = request.getParameter("frase");
        
        if (frase == null || frase.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese una frase");
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            return;
        }
        
        // Convertir a minúsculas
        String fraseLower = frase.toLowerCase();
        
        int totalVocales = 0;
        int vocalA = 0, vocalE = 0, vocalI = 0, vocalO = 0, vocalU = 0;
        
        // Recorrer cada carácter con charAt()
        for (int i = 0; i < fraseLower.length(); i++) {
            char c = fraseLower.charAt(i);
            switch (c) {
                case 'a': vocalA++; totalVocales++; break;
                case 'e': vocalE++; totalVocales++; break;
                case 'i': vocalI++; totalVocales++; break;
                case 'o': vocalO++; totalVocales++; break;
                case 'u': vocalU++; totalVocales++; break;
            }
        }
        
        request.setAttribute("totalVocales", totalVocales);
        request.setAttribute("vocalA", vocalA);
        request.setAttribute("vocalE", vocalE);
        request.setAttribute("vocalI", vocalI);
        request.setAttribute("vocalO", vocalO);
        request.setAttribute("vocalU", vocalU);
        
        request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio01.jsp");
    }
}