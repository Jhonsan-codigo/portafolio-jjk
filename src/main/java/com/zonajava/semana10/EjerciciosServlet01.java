package com.zonajava.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EjerciciosServlet01 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String gradosStr = request.getParameter("grados");
        
        try {
            double grados = Double.parseDouble(gradosStr);
            
            // Convertir grados a radianes usando Math.toRadians()
            double radianes = Math.toRadians(grados);
            
            // Calcular funciones trigonométricas
            double seno = Math.sin(radianes);
            double coseno = Math.cos(radianes);
            double tangente = Math.tan(radianes);
            
            // Redondear a 4 decimales
            radianes = Math.round(radianes * 10000.0) / 10000.0;
            seno = Math.round(seno * 10000.0) / 10000.0;
            coseno = Math.round(coseno * 10000.0) / 10000.0;
            tangente = Math.round(tangente * 10000.0) / 10000.0;
            
            // Enviar atributos a la JSP
            request.setAttribute("grados", String.valueOf(grados));
            request.setAttribute("radianes", String.valueOf(radianes));
            request.setAttribute("seno", String.valueOf(seno));
            request.setAttribute("coseno", String.valueOf(coseno));
            request.setAttribute("tangente", String.valueOf(tangente));
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingresa un número válido. ¡Los ángulos malditos solo entienden números!");
        }
        
        // RUTA ABSOLUTA para evitar problemas de contexto
        request.getRequestDispatcher("/Semanas/semana10/ejercicio01.jsp").forward(request, response);
    }
}