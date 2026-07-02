package com.zonajava.semana03;

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
            double precio = Double.parseDouble(request.getParameter("precio"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            if (precio > 0 && cantidad > 0) {
                double importeCompra = precio * cantidad;
                double descuento1 = importeCompra * 0.10;
                double descuento2 = (importeCompra - descuento1) * 0.10;
                double descuentoTotal = descuento1 + descuento2;
                double importePagar = importeCompra - descuentoTotal;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("precio", precio);
                request.setAttribute("cantidad", cantidad);
                request.setAttribute("importeCompra", df.format(importeCompra));
                request.setAttribute("descuento1", df.format(descuento1));
                request.setAttribute("descuento2", df.format(descuento2));
                request.setAttribute("descuentoTotal", df.format(descuentoTotal));
                request.setAttribute("importePagar", df.format(importePagar));
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numericos validos");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}