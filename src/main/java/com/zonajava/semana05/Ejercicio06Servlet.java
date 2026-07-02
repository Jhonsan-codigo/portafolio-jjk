package com.zonajava.semana05;

import java.io.IOException;
import java.util.Random;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio06Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int cantidadProductos = Integer.parseInt(request.getParameter("cantidadProductos"));
            if (cantidadProductos > 0) {
                Random random = new Random();
                int[] stocks = new int[cantidadProductos];

                int rangoA = 0; // stock < 50
                int rangoB = 0; // 50 <= stock < 100
                int rangoC = 0; // 100 <= stock < 150
                int rangoD = 0; // stock >= 150

                StringBuilder listaStocks = new StringBuilder();
                for (int i = 0; i < cantidadProductos; i++) {
                    stocks[i] = random.nextInt(201); // 0 a 200
                    if (i > 0) listaStocks.append(", ");
                    listaStocks.append(stocks[i]);

                    if (stocks[i] < 50) rangoA++;
                    else if (stocks[i] < 100) rangoB++;
                    else if (stocks[i] < 150) rangoC++;
                    else rangoD++;
                }

                request.setAttribute("cantidadProductos", cantidadProductos);
                request.setAttribute("listaStocks", listaStocks.toString());
                request.setAttribute("rangoA", rangoA);
                request.setAttribute("rangoB", rangoB);
                request.setAttribute("rangoC", rangoC);
                request.setAttribute("rangoD", rangoD);
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "La cantidad de productos debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un numero valido");
            request.getRequestDispatcher("ejercicio06.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio06.jsp");
    }
}
