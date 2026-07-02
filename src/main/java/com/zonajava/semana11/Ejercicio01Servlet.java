package com.zonajava.semana11;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Ejercicio01Servlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String capitalStr = request.getParameter("capital");
        String tasaStr = request.getParameter("tasa");
        String tiempoStr = request.getParameter("tiempo");
        
        try {
            double capital = Double.parseDouble(capitalStr);
            double tasa = Double.parseDouble(tasaStr);
            double tiempo = Double.parseDouble(tiempoStr);
            
            if (capital < 0 || tasa < 0 || tiempo < 0) {
                request.setAttribute("error", "Los valores no pueden ser negativos. ¡Ni la deuda maldita permite números negativos!");
                request.getRequestDispatcher("/Semanas/semana11/ejercicio01.jsp").forward(request, response);
                return;
            }
            
            // Fórmula: A = P * e^(r*t)
            // Usando Math.exp() para e^(r*t)
            double exponente = tasa * tiempo;
            double montoFinal = capital * Math.exp(exponente);
            
            // Calcular interés ganado
            double interesGanado = montoFinal - capital;
            
            // Redondear a 4 decimales
            montoFinal = Math.round(montoFinal * 10000.0) / 10000.0;
            interesGanado = Math.round(interesGanado * 10000.0) / 10000.0;
            capital = Math.round(capital * 10000.0) / 10000.0;
            tasa = Math.round(tasa * 10000.0) / 10000.0;
            tiempo = Math.round(tiempo * 10000.0) / 10000.0;
            
            request.setAttribute("capital", String.valueOf(capital));
            request.setAttribute("tasa", String.valueOf(tasa));
            request.setAttribute("tiempo", String.valueOf(tiempo));
            request.setAttribute("montoFinal", String.valueOf(montoFinal));
            request.setAttribute("interesGanado", String.valueOf(interesGanado));
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingresa números válidos en todos los campos. ¡El dinero no entiende letras!");
        }
        
        request.getRequestDispatcher("/Semanas/semana11/ejercicio01.jsp").forward(request, response);
    }
}