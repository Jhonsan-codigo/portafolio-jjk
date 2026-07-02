package com.zonajava.semana02;

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
            double ventas = Double.parseDouble(request.getParameter("ventas"));
            
            if (ventas >= 0) {
                double sueldoBasico = 300.00;
                double comision = ventas * 0.09;
                double sueldoBruto = sueldoBasico + comision;
                double descuento = sueldoBruto * 0.11;
                double sueldoNeto = sueldoBruto - descuento;
                
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                
                request.setAttribute("ventas", ventas);
                request.setAttribute("sueldoBasico", df.format(sueldoBasico));
                request.setAttribute("comision", df.format(comision));
                request.setAttribute("sueldoBruto", df.format(sueldoBruto));
                request.setAttribute("descuento", df.format(descuento));
                request.setAttribute("sueldoNeto", df.format(sueldoNeto));
                
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El importe de ventas no puede ser negativo");
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