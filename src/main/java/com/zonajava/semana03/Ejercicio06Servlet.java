package com.zonajava.semana03;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio06Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double horas = Double.parseDouble(request.getParameter("horas"));
            double tarifa = Double.parseDouble(request.getParameter("tarifa"));
            if (horas > 0 && tarifa > 0) {
                double sueldoBruto = horas * tarifa;
                double descuentoEssalud = sueldoBruto * 0.09;
                double descuentoAfp = sueldoBruto * 0.10;
                double descuentoTotal = descuentoEssalud + descuentoAfp;
                double sueldoNeto = sueldoBruto - descuentoTotal;
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("horas", horas);
                request.setAttribute("tarifa", tarifa);
                request.setAttribute("sueldoBruto", df.format(sueldoBruto));
                request.setAttribute("descuentoEssalud", df.format(descuentoEssalud));
                request.setAttribute("descuentoAfp", df.format(descuentoAfp));
                request.setAttribute("descuentoTotal", df.format(descuentoTotal));
                request.setAttribute("sueldoNeto", df.format(sueldoNeto));
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser mayores a 0");
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numericos validos");
            request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio06.jsp");
    }
}
