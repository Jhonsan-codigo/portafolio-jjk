package com.zonajava.semana04;

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
            double nota1 = Double.parseDouble(request.getParameter("nota1"));
            double nota2 = Double.parseDouble(request.getParameter("nota2"));
            double nota3 = Double.parseDouble(request.getParameter("nota3"));

            if (nota1 >= 0 && nota1 <= 20 && nota2 >= 0 && nota2 <= 20 && nota3 >= 0 && nota3 <= 20) {

                double nota3Original = nota3;
                boolean aplicoBonus = false;

                if (nota3 >= 10) {
                    nota3 = nota3 + 2;
                    if (nota3 > 20) nota3 = 20;
                    aplicoBonus = true;
                }

                double promedio = (nota1 + nota2 + nota3) / 3;

                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("nota1", nota1);
                request.setAttribute("nota2", nota2);
                request.setAttribute("nota3Original", nota3Original);
                request.setAttribute("nota3Final", nota3);
                request.setAttribute("aplicoBonus", aplicoBonus);
                request.setAttribute("promedio", df.format(promedio));
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Las notas deben estar entre 0 y 20");
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numericos validos");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio04.jsp");
    }
}