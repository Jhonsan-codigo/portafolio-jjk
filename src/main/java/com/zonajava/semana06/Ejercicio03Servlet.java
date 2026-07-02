package com.zonajava.semana06;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio03Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int edad = Integer.parseInt(request.getParameter("edad"));
            String nivel = request.getParameter("nivel");
            
            if (nivel == null || nivel.isEmpty()) {
                request.setAttribute("error", "Seleccione un nivel de beneficio");
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
                return;
            }
            
            if (edad < 18) {
                request.setAttribute("error", "La edad mínima es 18 años");
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
                return;
            }
            
            // Determinar costo base según edad
            double costoOriginal;
            double porcentajeDesc;
            
            if (edad == 18) {
                costoOriginal = 200;
                // Descuentos para jóvenes de 18 años
                switch (nivel) {
                    case "1": porcentajeDesc = 60; break;
                    case "2": porcentajeDesc = 40; break;
                    case "3": porcentajeDesc = 20; break;
                    default: porcentajeDesc = 0; break;
                }
            } else { // Mayores de 18 años
                costoOriginal = 350;
                // Descuentos para mayores de 18
                switch (nivel) {
                    case "1": porcentajeDesc = 40; break;
                    case "2": porcentajeDesc = 30; break;
                    case "3": porcentajeDesc = 15; break;
                    default: porcentajeDesc = 0; break;
                }
            }
            
            double montoDescuento = costoOriginal * (porcentajeDesc / 100);
            double valorFinal = costoOriginal - montoDescuento;
            
            // Texto del nivel para mostrar
            String nivelTexto;
            switch (nivel) {
                case "1": nivelTexto = "Nivel 1"; break;
                case "2": nivelTexto = "Nivel 2"; break;
                case "3": nivelTexto = "Nivel 3"; break;
                default: nivelTexto = "Otro / Sin nivel"; break;
            }
            
            DecimalFormat df = new DecimalFormat("#,##0.00");
            
            request.setAttribute("edad", edad);
            request.setAttribute("nivelTexto", nivelTexto);
            request.setAttribute("costoOriginal", df.format(costoOriginal));
            request.setAttribute("porcentajeDesc", porcentajeDesc);
            request.setAttribute("montoDescuento", df.format(montoDescuento));
            request.setAttribute("valorFinal", df.format(valorFinal));
            
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese una edad válida");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio03.jsp");
    }
}