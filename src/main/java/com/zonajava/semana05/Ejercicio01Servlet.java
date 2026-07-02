package com.zonajava.semana05;

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
            int n = Integer.parseInt(request.getParameter("n"));
            if (n > 0) {
                StringBuilder serie = new StringBuilder();
                int suma = 0;
                int termino = 3;
                for (int i = 1; i <= n; i++) {
                    serie.append(termino);
                    if (i < n) serie.append(", ");
                    suma += termino;
                    termino += 7;
                }
                DecimalFormat df = new DecimalFormat("#,##0");
                request.setAttribute("n", n);
                request.setAttribute("serie", serie.toString());
                request.setAttribute("suma", df.format(suma));
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El numero de terminos debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un numero valido");
            request.getRequestDispatcher("ejercicio01.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio01.jsp");
    }
}