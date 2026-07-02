package com.zonajava.semana04;

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
            double horasTrabajadas = Double.parseDouble(request.getParameter("horasTrabajadas"));
            double tarifaNormal = Double.parseDouble(request.getParameter("tarifaNormal"));

            if (horasTrabajadas >= 0 && tarifaNormal > 0) {
                double horasExtras = 0;
                double pagoHorasNormales = 0;
                double pagoHorasExtras = 0;
                double pagoTotal = 0;

                if (horasTrabajadas <= 40) {
                    pagoHorasNormales = horasTrabajadas * tarifaNormal;
                    pagoTotal = pagoHorasNormales;
                } else {
                    horasExtras = horasTrabajadas - 40;
                    pagoHorasNormales = 40 * tarifaNormal;

                    if (horasExtras <= 8) {
                        pagoHorasExtras = horasExtras * (tarifaNormal * 2);
                    } else {
                        double extrasDoble = 8 * (tarifaNormal * 2);
                        double extrasTriple = (horasExtras - 8) * (tarifaNormal * 3);
                        pagoHorasExtras = extrasDoble + extrasTriple;
                    }
                    pagoTotal = pagoHorasNormales + pagoHorasExtras;
                }

                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("horasTrabajadas", horasTrabajadas);
                request.setAttribute("tarifaNormal", tarifaNormal);
                request.setAttribute("horasExtras", df.format(horasExtras));
                request.setAttribute("pagoHorasNormales", df.format(pagoHorasNormales));
                request.setAttribute("pagoHorasExtras", df.format(pagoHorasExtras));
                request.setAttribute("pagoTotal", df.format(pagoTotal));
                request.getRequestDispatcher("ejercicio02.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser validos");
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