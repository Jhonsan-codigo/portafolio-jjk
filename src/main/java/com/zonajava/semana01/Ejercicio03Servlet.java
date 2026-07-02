package com.zonajava.semana01;

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
            double baseMayor = Double.parseDouble(request.getParameter("baseMayor"));
            double baseMenor = Double.parseDouble(request.getParameter("baseMenor"));
            double altura = Double.parseDouble(request.getParameter("altura"));
            if (baseMayor > 0 && baseMenor > 0 && altura > 0) {
                double area = ((baseMayor + baseMenor) * altura) / 2;
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("baseMayor", baseMayor);
                request.setAttribute("baseMenor", baseMenor);
                request.setAttribute("altura", altura);
                request.setAttribute("area", df.format(area));
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio03.jsp");
    }
}
