package com.zonajava.semana02;

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
            double donacion = Double.parseDouble(request.getParameter("donacion"));
            
            if (donacion > 0) {
                double medicinaGeneral = donacion * 0.45;
                double ginecologia = medicinaGeneral * 0.80;
                double pediatria = (medicinaGeneral + ginecologia) * 0.20;
                double traumatologia = donacion - (medicinaGeneral + ginecologia + pediatria);
                
                DecimalFormat df = new DecimalFormat("#,##0.0000");
                
                request.setAttribute("donacion", donacion);
                request.setAttribute("medicinaGeneral", df.format(medicinaGeneral));
                request.setAttribute("ginecologia", df.format(ginecologia));
                request.setAttribute("pediatria", df.format(pediatria));
                request.setAttribute("traumatologia", df.format(traumatologia));
                
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            } else {
                request.setAttribute("error", "La donación debe ser mayor a 0");
                request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            }
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Por favor ingrese un valor numérico válido");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio04.jsp");
    }
}