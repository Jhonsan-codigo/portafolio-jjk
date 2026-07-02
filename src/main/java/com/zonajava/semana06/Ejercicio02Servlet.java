package com.zonajava.semana06;

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
            String ruta = request.getParameter("ruta");
            String calidad = request.getParameter("calidad");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            
            if (ruta == null || ruta.isEmpty() || calidad == null || calidad.isEmpty()) {
                request.setAttribute("error", "Seleccione ruta y calidad");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
                return;
            }
            
            if (cantidad <= 0) {
                request.setAttribute("error", "La cantidad debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
                return;
            }
            
            // Precios según ruta y calidad
            double precioUnitario;
            if (ruta.equals("Lima-Huanuco")) {
                switch (calidad) {
                    case "A": precioUnitario = 45; break;
                    case "B": precioUnitario = 35; break;
                    case "C": precioUnitario = 30; break;
                    default: precioUnitario = 0;
                }
            } else { // Lima-Huancayo
                switch (calidad) {
                    case "A": precioUnitario = 38; break;
                    case "B": precioUnitario = 33; break;
                    case "C": precioUnitario = 28; break;
                    default: precioUnitario = 0;
                }
            }
            
            // Importe de compra
            double importeCompra = precioUnitario * cantidad;
            
            // Descuento: 5% solo para calidad A y cantidad > 4
            double importeDescuento = 0;
            if (calidad.equals("A") && cantidad > 4) {
                importeDescuento = importeCompra * 0.05;
            }
            
            double importePagar = importeCompra - importeDescuento;
            
            DecimalFormat df = new DecimalFormat("#,##0.00");
            
            request.setAttribute("ruta", ruta.replace("-", " - "));
            request.setAttribute("calidad", calidad);
            request.setAttribute("cantidad", cantidad);
            request.setAttribute("importeCompra", df.format(importeCompra));
            request.setAttribute("importeDescuento", df.format(importeDescuento));
            request.setAttribute("importePagar", df.format(importePagar));
            
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores válidos");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}
