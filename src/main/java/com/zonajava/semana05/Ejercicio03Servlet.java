package com.zonajava.semana05;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio03Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            long numero = Long.parseLong(request.getParameter("numero"));
            long num = Math.abs(numero);

            int cantidadDigitos = 0;
            int sumaPares = 0;
            int sumaImpares = 0;
            StringBuilder digitosPares = new StringBuilder();
            StringBuilder digitosImpares = new StringBuilder();

            if (num == 0) {
                cantidadDigitos = 1;
                sumaPares = 0;
                sumaImpares = 0;
                digitosPares.append("0");
            } else {
                while (num > 0) {
                    int digito = (int) (num % 10);
                    cantidadDigitos++;
                    if (digito % 2 == 0) {
                        sumaPares += digito;
                        if (digitosPares.length() > 0) digitosPares.insert(0, ", ");
                        digitosPares.insert(0, digito);
                    } else {
                        sumaImpares += digito;
                        if (digitosImpares.length() > 0) digitosImpares.insert(0, ", ");
                        digitosImpares.insert(0, digito);
                    }
                    num = num / 10;
                }
            }

            request.setAttribute("numeroOriginal", numero);
            request.setAttribute("cantidadDigitos", cantidadDigitos);
            request.setAttribute("sumaPares", sumaPares);
            request.setAttribute("sumaImpares", sumaImpares);
            request.setAttribute("digitosPares", digitosPares.length() > 0 ? digitosPares.toString() : "Ninguno");
            request.setAttribute("digitosImpares", digitosImpares.length() > 0 ? digitosImpares.toString() : "Ninguno");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un numero entero valido");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio03.jsp");
    }
}