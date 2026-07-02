package com.zonajava.semana09;

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
            procesarDadoRPG(request, response);
        } else if ("2".equals(ejercicio)) {
            procesarEcuacionCuadratica(request, response);
        } else {
            request.setAttribute("error", "Ejercicio no válido");
            request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
        }
    }
    
    // ========== EJERCICIO 1: SIMULADOR DE DADOS RPG ==========
    private void procesarDadoRPG(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String carasStr = request.getParameter("caras");
        
        try {
            int caras = Integer.parseInt(carasStr);
            
            if (caras < 2) {
                request.setAttribute("ejercicioNum", "1");
                request.setAttribute("error", "Un dado necesita al menos 2 caras. ¡Ni Sukuna juega con monedas!");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            if (caras > 1000) {
                request.setAttribute("ejercicioNum", "1");
                request.setAttribute("error", "Máximo 1000 caras. ¡Ni Gojo controla tanto caos!");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            // Math.random() devuelve [0.0, 1.0)
            // Fórmula: (int)(Math.random() * (max - min + 1)) + min
            // Para dado: min=1, max=caras
            int resultado = (int)(Math.random() * caras) + 1;
            
            request.setAttribute("ejercicioNum", "1");
            request.setAttribute("caras", String.valueOf(caras));
            request.setAttribute("resultado", String.valueOf(resultado));
            
        } catch (NumberFormatException e) {
            request.setAttribute("ejercicioNum", "1");
            request.setAttribute("error", "Ingresa un número válido de caras. ¡La suerte no entiende letras!");
        }
        
        request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
    }
    
    // ========== EJERCICIO 2: ECUACIONES CUADRÁTICAS ==========
    private void procesarEcuacionCuadratica(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String aStr = request.getParameter("coefA");
        String bStr = request.getParameter("coefB");
        String cStr = request.getParameter("coefC");
        
        try {
            double a = Double.parseDouble(aStr);
            double b = Double.parseDouble(bStr);
            double c = Double.parseDouble(cStr);
            
            if (a == 0) {
                request.setAttribute("ejercicioNum", "2");
                request.setAttribute("error", "El coeficiente 'a' no puede ser 0. ¡Eso no es una cuadrática, es una línea!");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            // Discriminante: Δ = b² - 4ac
            // Usando Math.pow() para b²
            double discriminante = Math.pow(b, 2) - 4 * a * c;
            
            request.setAttribute("ejercicioNum", "2");
            request.setAttribute("a", String.valueOf(a));
            request.setAttribute("b", String.valueOf(b));
            request.setAttribute("c", String.valueOf(c));
            request.setAttribute("discriminante", String.valueOf(Math.round(discriminante * 10000.0) / 10000.0));
            
            if (discriminante < 0) {
                request.setAttribute("error", "El discriminante es negativo (Δ = " + 
                    Math.round(discriminante * 10000.0) / 10000.0 + 
                    "). No hay raíces reales en el mundo maldito... solo complejas.");
                request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
                return;
            }
            
            // Fórmula cuadrática: x = (-b ± √Δ) / 2a
            // Usando Math.sqrt() para la raíz cuadrada
            double raizDisc = Math.sqrt(discriminante);
            double x1 = (-b + raizDisc) / (2 * a);
            double x2 = (-b - raizDisc) / (2 * a);
            
            // Redondeamos a 4 decimales
            x1 = Math.round(x1 * 10000.0) / 10000.0;
            x2 = Math.round(x2 * 10000.0) / 10000.0;
            
            request.setAttribute("x1", String.valueOf(x1));
            request.setAttribute("x2", String.valueOf(x2));
            
        } catch (NumberFormatException e) {
            request.setAttribute("ejercicioNum", "2");
            request.setAttribute("error", "Ingresa números válidos en todos los coeficientes. ¡La precisión maldita es absoluta!");
        }
        
        request.getRequestDispatcher("ejercicios.jsp").forward(request, response);
    }
}