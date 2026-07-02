package com.zonajava.semana01;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio04Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double radio = Double.parseDouble(request.getParameter("radio"));
            double altura = Double.parseDouble(request.getParameter("altura"));
            if (radio > 0 && altura > 0) {
                double pi = Math.PI;
                double area = 2 * pi * radio * (radio + altura);
                double volumen = pi * Math.pow(radio, 2) * altura;
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("radio", radio);
                request.setAttribute("altura", altura);
                request.setAttribute("area", df.format(area));
                request.setAttribute("volumen", df.format(volumen));
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio04.jsp");
    }
}
