package com.zonajava.semana01;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio05Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double lado = Double.parseDouble(request.getParameter("lado"));
            if (lado > 0) {
                double area = 6 * Math.pow(lado, 2);
                double volumen = Math.pow(lado, 3);
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("lado", lado);
                request.setAttribute("area", df.format(area));
                request.setAttribute("volumen", df.format(volumen));
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El lado debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio05.jsp");
    }
}
