package com.zonajava.semana08;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EjerciciosServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String ejercicio = request.getParameter("ejercicio");
        
        if ("1".equals(ejercicio)) {
            // ========== EJERCICIO 1: ÁREA DE CÍRCULO ==========
            procesarEjercicio1(request, response);
            
        } else if ("2".equals(ejercicio)) {
            // ========== EJERCICIO 2: PITÁGORAS EXPRESS ==========
            procesarEjercicio2(request, response);
            
        } else {
            request.setAttribute("error", "Ejercicio no válido");
            request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
        }
    }
    
    // ========== EJERCICIO 1: ÁREA DE CÍRCULO ==========
    private void procesarEjercicio1(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String radioStr = request.getParameter("radio");
        
        try {
            double radio = Double.parseDouble(radioStr);
            
            if (radio < 0) {
                request.setAttribute("ejercicioNum", "1");
                request.setAttribute("error", "El radio no puede ser negativo. ¡Ni Sukuna acepta círculos malditos!");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            // Usando Math.PI y Math.pow()
            double area = Math.PI * Math.pow(radio, 2);
            
            // Redondeamos a 4 decimales
            area = Math.round(area * 10000.0) / 10000.0;
            
            request.setAttribute("ejercicioNum", "1");
            request.setAttribute("radio", String.valueOf(radio));
            request.setAttribute("area", String.valueOf(area));
            
        } catch (NumberFormatException e) {
            request.setAttribute("ejercicioNum", "1");
            request.setAttribute("error", "Ingresa un número válido. ¡La energía maldita no entiende letras!");
        }
        
        request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
    }
    
    // ========== EJERCICIO 2: PITÁGORAS EXPRESS ==========
    private void procesarEjercicio2(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String catetoAStr = request.getParameter("catetoA");
        String catetoBStr = request.getParameter("catetoB");
        
        try {
            double catetoA = Double.parseDouble(catetoAStr);
            double catetoB = Double.parseDouble(catetoBStr);
            
            if (catetoA < 0 || catetoB < 0) {
                request.setAttribute("ejercicioNum", "2");
                request.setAttribute("error", "Los catetos no pueden ser negativos. ¡Ni en el mundo maldito!");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            // Usando Math.hypot() - previene desbordamiento intermedio
            double hipotenusa = Math.hypot(catetoA, catetoB);
            
            // Redondeamos a 4 decimales
            hipotenusa = Math.round(hipotenusa * 10000.0) / 10000.0;
            
            request.setAttribute("ejercicioNum", "2");
            request.setAttribute("catetoA", String.valueOf(catetoA));
            request.setAttribute("catetoB", String.valueOf(catetoB));
            request.setAttribute("hipotenusa", String.valueOf(hipotenusa));
            
        } catch (NumberFormatException e) {
            request.setAttribute("ejercicioNum", "2");
            request.setAttribute("error", "Ingresa números válidos en ambos catetos. ¡La geometría maldita exige precisión!");
        }
        
        request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
    }
}