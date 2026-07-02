package com.zonajava.semana01;

import java.io.IOException;
import java.text.DecimalFormat;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio09Servlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            double monto = Double.parseDouble(request.getParameter("monto"));
            if (monto > 0) {
                double jose = monto * 0.27;
                double daniel = monto * 0.25;
                double tamar = jose * 0.85;
                double caleb = (jose + daniel) * 0.23;
                double david = monto - (tamar + jose + caleb + daniel);
                DecimalFormat df = new DecimalFormat("#,##0.00");
                request.setAttribute("monto", monto);
                request.setAttribute("tamar", df.format(tamar));
                request.setAttribute("jose", df.format(jose));
                request.setAttribute("caleb", df.format(caleb));
                request.setAttribute("daniel", df.format(daniel));
                request.setAttribute("david", df.format(david));
                request.getRequestDispatcher("ejercicio09.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "El monto debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio09.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio09.jsp").forward(request, response);
        }
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio09.jsp");
    }
}
