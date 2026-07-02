package com.zonajava.semana02;

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
                double importe = precio * cantidad;
                double descuento1 = importe * 0.07;
                double descuento2 = (importe - descuento1) * 0.07;
                double descuentoTotal = descuento1 + descuento2;
                double aPagar = importe - descuentoTotal;
                
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                
                request.setAttribute("precio", precio);
                request.setAttribute("cantidad", cantidad);
                request.setAttribute("importe", df.format(importe));
                request.setAttribute("descuento1", df.format(descuento1));
                request.setAttribute("descuento2", df.format(descuento2));
                request.setAttribute("descuentoTotal", df.format(descuentoTotal));
                request.setAttribute("aPagar", df.format(aPagar));
                
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El precio y la cantidad deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numéricos válidos");
            request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio02.jsp");
    }
}