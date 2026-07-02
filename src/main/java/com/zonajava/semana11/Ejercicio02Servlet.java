package com.zonajava.semana11;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ejercicio02Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String x1Str = request.getParameter("x1");
        String y1Str = request.getParameter("y1");
        String x2Str = request.getParameter("x2");
        String y2Str = request.getParameter("y2");
        
        try {
            double x1 = Double.parseDouble(x1Str);
            double y1 = Double.parseDouble(y1Str);
            double x2 = Double.parseDouble(x2Str);
            double y2 = Double.parseDouble(y2Str);
            
            // Diferencias
            double dx = x2 - x1;
            double dy = y2 - y1;
            
            // Fórmula de distancia euclidiana: d = √[(x2-x1)² + (y2-y1)²]
            // Usando Math.pow() para elevar al cuadrado y Math.sqrt() para la raíz
            double distancia = Math.sqrt(Math.pow(dx, 2) + Math.pow(dy, 2));
            
            // Redondear a 4 decimales
            distancia = Math.round(distancia * 10000.0) / 10000.0;
            dx = Math.round(dx * 10000.0) / 10000.0;
            dy = Math.round(dy * 10000.0) / 10000.0;
            x1 = Math.round(x1 * 10000.0) / 10000.0;
            y1 = Math.round(y1 * 10000.0) / 10000.0;
            x2 = Math.round(x2 * 10000.0) / 10000.0;
            y2 = Math.round(y2 * 10000.0) / 10000.0;
            
            request.setAttribute("x1", String.valueOf(x1));
            request.setAttribute("y1", String.valueOf(y1));
            request.setAttribute("x2", String.valueOf(x2));
            request.setAttribute("y2", String.valueOf(y2));
            request.setAttribute("distancia", String.valueOf(distancia));
            request.setAttribute("dx", String.valueOf(dx));
            request.setAttribute("dy", String.valueOf(dy));
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingresa números válidos en todas las coordenadas. ¡Las coordenadas malditas deben ser numéricas!");
        }
        
        request.getRequestDispatcher("/Semanas/semana11/ejercicio02.jsp").forward(request, response);
    }
}