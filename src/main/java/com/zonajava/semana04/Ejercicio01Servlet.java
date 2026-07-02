package com.zonajava.semana04;

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
            String tipoAuto = request.getParameter("tipoAuto");
            int dias = Integer.parseInt(request.getParameter("dias"));
            double km = Double.parseDouble(request.getParameter("km"));

            if (dias > 0 && km >= 0 && tipoAuto != null) {
                double tarifaDia = 0, tarifaKm = 0;
                String nombreAuto = "";

                switch(tipoAuto) {
                    case "pequeno":
                        tarifaDia = 15;
                        tarifaKm = 0.20;
                        nombreAuto = "Auto Pequeno";
                        break;
                    case "mediano":
                        tarifaDia = 20;
                        tarifaKm = 0.30;
                        nombreAuto = "Auto Mediano";
                        break;
                    case "grande":
                        tarifaDia = 30;
                        tarifaKm = 0.40;
                        nombreAuto = "Auto Grande";
                        break;
                }

                double montoAlquiler = tarifaDia * dias;
                double montoKm = tarifaKm * km;
                double montoBase = montoAlquiler + montoKm;

                double kmPromedio = km / dias;
                double recargo = 0;
                if (kmPromedio > 10) {
                    recargo = montoBase * 0.025;
                }

                double montoPagar = montoBase + recargo;
                DecimalFormat df = new DecimalFormat("#,##0.00");

                request.setAttribute("tipoAuto", nombreAuto);
                request.setAttribute("dias", dias);
                request.setAttribute("km", km);
                request.setAttribute("montoAlquiler", df.format(montoAlquiler));
                request.setAttribute("montoKm", df.format(montoKm));
                request.setAttribute("montoBase", df.format(montoBase));
                request.setAttribute("kmPromedio", df.format(kmPromedio));
                request.setAttribute("recargo", df.format(recargo));
                request.setAttribute("montoPagar", df.format(montoPagar));
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Los valores deben ser validos y mayores a 0");
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores numericos validos");
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio01.jsp");
    }
}