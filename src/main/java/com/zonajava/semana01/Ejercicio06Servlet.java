package com.zonajava.semana01;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio06Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int num1 = Integer.parseInt(request.getParameter("num1"));
            int num2 = Integer.parseInt(request.getParameter("num2"));
            if (num2 != 0) {
                int cociente = num1 / num2;
                int residuo = num1 % num2;
                request.setAttribute("num1", num1);
                request.setAttribute("num2", num2);
                request.setAttribute("cociente", cociente);
                request.setAttribute("residuo", residuo);
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El divisor no puede ser 0");
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos");
            request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio06.jsp");
    }
}
