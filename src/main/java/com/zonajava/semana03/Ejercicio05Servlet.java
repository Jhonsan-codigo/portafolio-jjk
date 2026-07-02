package com.zonajava.semana03;

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
            double importeVendido = Double.parseDouble(request.getParameter("importeVendido"));
            if (importeVendido >= 0) {
                double sueldoBasico = 300.0;
                double comision = importeVendido * 0.09;
                double sueldoBruto = sueldoBasico + comision;
                double descuento = sueldoBruto * 0.11;
                double sueldoNeto = sueldoBruto - descuento;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("importeVendido", importeVendido);
                request.setAttribute("sueldoBasico", df.format(sueldoBasico));
                request.setAttribute("comision", df.format(comision));
                request.setAttribute("sueldoBruto", df.format(sueldoBruto));
                request.setAttribute("descuento", df.format(descuento));
                request.setAttribute("sueldoNeto", df.format(sueldoNeto));
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El importe vendido no puede ser negativo");
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numerico valido");
            request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio05.jsp");
    }
}
