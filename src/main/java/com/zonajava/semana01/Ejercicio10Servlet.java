package com.zonajava.semana01;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio10Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double monto = Double.parseDouble(request.getParameter("monto"));
            if (monto > 0) {
                double alquiler = monto * 0.23;
                double publicidad = monto * 0.07;
                double transporte = monto * 0.26;
                double servicios = monto * 0.12;
                double decoracion = monto * 0.21;
                double gastosVarios = monto * 0.11;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("monto", monto);
                request.setAttribute("alquiler", df.format(alquiler));
                request.setAttribute("publicidad", df.format(publicidad));
                request.setAttribute("transporte", df.format(transporte));
                request.setAttribute("servicios", df.format(servicios));
                request.setAttribute("decoracion", df.format(decoracion));
                request.setAttribute("gastosVarios", df.format(gastosVarios));
                request.getRequestDispatcher("ejercicio10.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El monto debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio10.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio10.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio10.jsp");
    }
}