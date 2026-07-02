package com.zonajava.semana01;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio08Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int segundosTotales = Integer.parseInt(request.getParameter("segundos"));
            if (segundosTotales >= 0) {
                int horas = segundosTotales / 3600;
                int minutos = (segundosTotales % 3600) / 60;
                int segundos = segundosTotales % 60;
                request.setAttribute("segundosTotales", segundosTotales);
                request.setAttribute("horas", horas);
                request.setAttribute("minutos", minutos);
                request.setAttribute("segundos", segundos);
                request.getRequestDispatcher("ejercicio08.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los segundos deben ser mayores o iguales a 0");
                request.getRequestDispatcher("ejercicio08.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio08.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio08.jsp");
    }
}
