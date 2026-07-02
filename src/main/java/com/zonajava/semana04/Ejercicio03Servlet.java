package com.zonajava.semana04;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio03Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String dia = request.getParameter("dia");
            int horaEntrada = Integer.parseInt(request.getParameter("horaEntrada"));
            int minEntrada = Integer.parseInt(request.getParameter("minEntrada"));
            int horaSalida = Integer.parseInt(request.getParameter("horaSalida"));
            int minSalida = Integer.parseInt(request.getParameter("minSalida"));

            if (dia != null && horaEntrada >= 0 && horaEntrada < 24 && minEntrada >= 0 && minEntrada < 60
                && horaSalida >= 0 && horaSalida < 24 && minSalida >= 0 && minSalida < 60) {

                double tarifa = 0;
                switch(dia) {
                    case "lunes": case "martes": case "miercoles": case "jueves":
                        tarifa = 3.5;
                        break;
                    case "viernes": case "sabado":
                        tarifa = 4.5;
                        break;
                    case "domingo":
                        tarifa = 2.5;
                        break;
                }

                int minEntradaTotal = horaEntrada * 60 + minEntrada;
                int minSalidaTotal = horaSalida * 60 + minSalida;
                int minutos = minSalidaTotal - minEntradaTotal;
                if (minutos < 0) minutos += 24 * 60;

                double horas = Math.ceil(minutos / 60.0);
                double montoPagar = horas * tarifa;

                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("dia", dia.substring(0,1).toUpperCase() + dia.substring(1));
                request.setAttribute("horaEntrada", String.format("%02d:%02d", horaEntrada, minEntrada));
                request.setAttribute("horaSalida", String.format("%02d:%02d", horaSalida, minSalida));
                request.setAttribute("minutos", minutos);
                request.setAttribute("horas", df.format(horas));
                request.setAttribute("tarifa", df.format(tarifa));
                request.setAttribute("montoPagar", df.format(montoPagar));
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores de hora deben ser validos (0-23 para horas, 0-59 para minutos)");
                request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numericos validos");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio03.jsp");
    }
}