package com.zonajava.semana05;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio02Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int n = Integer.parseInt(request.getParameter("n"));
            if (n > 0) {
                StringBuilder serie = new StringBuilder();
                double suma = 0;
                int numerador = 2;
                int denominador = 5;
                for (int i = 1; i <= n; i++) {
                    serie.append(numerador).append("/").append(denominador);
                    if (i < n) serie.append(", ");
                    suma += (double) numerador / denominador;
                    numerador += 3;
                    denominador += 4;
                }
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("n", n);
                request.setAttribute("serie", serie.toString());
                request.setAttribute("suma", df.format(suma));
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El numero de terminos debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un numero valido");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}