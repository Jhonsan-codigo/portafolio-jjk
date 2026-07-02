package com.zonajava.semana06;

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
            String tipo = request.getParameter("tipo");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            
            if (tipo == null || tipo.isEmpty()) {
                request.setAttribute("error", "Seleccione un tipo de chocolate");
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
                return;
            }
            
            if (cantidad <= 0) {
                request.setAttribute("error", "La cantidad debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
                return;
            }
            
            // Precios unitarios
            double precioUnitario;
            switch (tipo) {
                case "Primor": precioUnitario = 8.50; break;
                case "Dulzura": precioUnitario = 10.00; break;
                case "Tentacion": precioUnitario = 7.00; break;
                case "Explosion": precioUnitario = 12.50; break;
                default: precioUnitario = 0;
            }
            
            // Importe de compra
            double importeCompra = precioUnitario * cantidad;
            
            // Descuento según cantidad
            double porcentajeDesc;
            if (cantidad < 5) {
                porcentajeDesc = 4.0;
            } else if (cantidad >= 5 && cantidad < 10) {
                porcentajeDesc = 6.5;
            } else if (cantidad >= 10 && cantidad < 15) {
                porcentajeDesc = 9.0;
            } else {
                porcentajeDesc = 11.5;
            }
            
            double importeDescuento = importeCompra * (porcentajeDesc / 100);
            double importePagar = importeCompra - importeDescuento;
            
            // Caramelos de obsequio
            int caramelos;
            if (importePagar >= 250) {
                caramelos = 3 * cantidad;
            } else {
                caramelos = 2 * cantidad;
            }
            
            DecimalFormat df = new DecimalFormat("#,##0.00");
            
            request.setAttribute("tipo", tipo);
            request.setAttribute("cantidad", cantidad);
            request.setAttribute("importeCompra", df.format(importeCompra));
            request.setAttribute("porcentajeDesc", porcentajeDesc);
            request.setAttribute("importeDescuento", df.format(importeDescuento));
            request.setAttribute("importePagar", df.format(importePagar));
            request.setAttribute("caramelos", caramelos);
            
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores válidos");
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio01.jsp");
    }
}
