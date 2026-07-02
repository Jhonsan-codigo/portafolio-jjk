package com.zonajava.semana01;

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
            double radio = Double.parseDouble(request.getParameter("radio"));
            if (radio > 0) {
                double pi = 3.1416;
                double area = pi * Math.pow(radio, 2);
                double circunferencia = 2 * pi * radio;
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("radio", radio);
                request.setAttribute("area", df.format(area));
                request.setAttribute("circunferencia", df.format(circunferencia));
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El radio debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}