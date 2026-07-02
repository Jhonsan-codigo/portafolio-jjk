package com.zonajava.semana01;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio01Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double base = Double.parseDouble(request.getParameter("base"));
            double altura = Double.parseDouble(request.getParameter("altura"));
            if (base > 0 && altura > 0) {
                double area = base * altura;
                double perimetro = 2 * (base + altura);
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("base", base);
                request.setAttribute("altura", altura);
                request.setAttribute("area", df.format(area));
                request.setAttribute("perimetro", df.format(perimetro));
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos");
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio01.jsp");
    }
}