package com.zonajava.semana01;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio07Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int numero = Integer.parseInt(request.getParameter("numero"));
            String numStr = String.valueOf(numero);
            if (numStr.length() == 5) {
                String invertido = new StringBuilder(numStr).reverse().toString();
                request.setAttribute("numero", numStr);
                request.setAttribute("invertido", invertido);
                request.getRequestDispatcher("ejercicio07.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El número debe tener exactamente 5 dígitos");
                request.getRequestDispatcher("ejercicio07.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio07.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio07.jsp");
    }
}
