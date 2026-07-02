package com.zonajava.semana03;

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
            double precioPasaje = Double.parseDouble(request.getParameter("precioPasaje"));
            int cantidadPasajes = Integer.parseInt(request.getParameter("cantidadPasajes"));
            if (precioPasaje > 0 && cantidadPasajes > 0) {
                double importeCompra = precioPasaje * cantidadPasajes;
                double importeDescuento = importeCompra * 0.07;
                double importePagar = importeCompra - importeDescuento;
                int chocolates = cantidadPasajes * 3;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("precioPasaje", precioPasaje);
                request.setAttribute("cantidadPasajes", cantidadPasajes);
                request.setAttribute("importeCompra", df.format(importeCompra));
                request.setAttribute("importeDescuento", df.format(importeDescuento));
                request.setAttribute("importePagar", df.format(importePagar));
                request.setAttribute("chocolates", chocolates);
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
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
