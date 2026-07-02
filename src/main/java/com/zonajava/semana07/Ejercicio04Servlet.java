package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio04Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String tarjeta = request.getParameter("tarjeta");
        
        if (tarjeta == null || tarjeta.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un número de tarjeta");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            return;
        }
        
        // Eliminar espacios
        tarjeta = tarjeta.trim().replaceAll("\\s", "");
        
        // Validar que sean 16 dígitos numéricos
        if (!tarjeta.matches("\\d{16}")) {
            request.setAttribute("error", "Debe ingresar exactamente 16 dígitos numéricos");
            request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
            return;
        }
        
        // Extraer últimos 4 dígitos con substring
        String ultimos4 = tarjeta.substring(12);
        
        // Crear 12 asteriscos con repeat()
        String asteriscos = "*".repeat(12);
        
        // Formato visual con espacios cada 4 dígitos
        String originalFormateado = tarjeta.substring(0, 4) + " " + 
                                    tarjeta.substring(4, 8) + " " + 
                                    tarjeta.substring(8, 12) + " " + 
                                    tarjeta.substring(12);
        
        request.setAttribute("original", originalFormateado);
        request.setAttribute("ultimos4", ultimos4);
        request.setAttribute("asteriscos", asteriscos);
        request.setAttribute("mascara", asteriscos + ultimos4);
        
        request.getRequestDispatcher("ejercicio04.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio04.jsp");
    }
}