package com.zonajava.semana05;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio04Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int n = Integer.parseInt(request.getParameter("n"));
            if (n > 0) {
                StringBuilder serie = new StringBuilder();
                double suma = 0;
                int i = 1;
                do {
                    long factorial = 1;
                    for (int j = 1; j <= i; j++) {
                        factorial *= j;
                    }
                    double termino = (double) i / factorial;
                    if (i % 2 == 0) {
                        termino = -termino;
                        serie.append(" - ").append(i).append("/").append(i).append("!");
                    } else {
                        if (i > 1) serie.append(" + ");
                        serie.append(i).append("/").append(i).append("!");
                    }
                    suma += termino;
                    i++;
                } while (i <= n);

                DecimalFormat df = new DecimalFormat("#,##0.0000");
                request.setAttribute("n", n);
                request.setAttribute("serie", serie.toString());
                request.setAttribute("suma", df.format(suma));
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El numero de terminos debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un numero valido");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio04.jsp");
    }
}
