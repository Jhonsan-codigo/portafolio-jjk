package com.zonajava.semana05;

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
            String producto = request.getParameter("producto");
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));

            if (cantidad > 0 && producto != null) {
                double precio = 0;
                String nombreProducto = "";

                switch(producto) {
                    case "layconsa":
                        precio = 1.50;
                        nombreProducto = "Cuadernos LayConsa";
                        break;
                    case "justus":
                        precio = 1.90;
                        nombreProducto = "Cuadernos Justus";
                        break;
                    case "stanford":
                        precio = 3.50;
                        nombreProducto = "Cuadernos Stanford";
                        break;
                    case "david":
                        precio = 2.50;
                        nombreProducto = "Cuadernos David";
                        break;
                    case "college":
                        precio = 3.00;
                        nombreProducto = "Cuadernos College";
                        break;
                    case "alpha":
                        precio = 4.50;
                        nombreProducto = "Cuadernos Alpha";
                        break;
                }

                double importe = precio * cantidad;
                DecimalFormat df = new DecimalFormat("#,##0.00");

                request.setAttribute("producto", nombreProducto);
                request.setAttribute("precioUnitario", df.format(precio));
                request.setAttribute("cantidad", cantidad);
                request.setAttribute("importe", df.format(importe));
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "Seleccione un producto y cantidad valida");
                request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese valores validos");
            request.getRequestDispatcher("ejercicio05.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio05.jsp");
    }
}
