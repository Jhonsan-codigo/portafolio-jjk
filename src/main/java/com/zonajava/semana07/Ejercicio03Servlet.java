package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio03Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String correo = request.getParameter("correo");
        
        if (correo == null || correo.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese un correo electrónico");
            request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
            return;
        }
        
        correo = correo.trim();
        
        // Validaciones básicas
        boolean sinEspacios = !correo.contains(" ");
        boolean tieneArroba = correo.contains("@");
        boolean arrobaUnica = correo.indexOf("@") == correo.lastIndexOf("@");
        boolean terminaCorrecto = correo.endsWith(".com") || correo.endsWith(".es");
        boolean arrobaNoInicio = correo.indexOf("@") > 0;
        boolean puntoDespuesArroba = correo.lastIndexOf(".") > correo.indexOf("@");
        
        boolean esValido = sinEspacios && tieneArroba && arrobaUnica && terminaCorrecto 
                         && arrobaNoInicio && puntoDespuesArroba;
        
        StringBuilder detalle = new StringBuilder();
        detalle.append("<p><i class='fas ").append(sinEspacios ? "fa-check valido" : "fa-times invalido").append("'></i> Sin espacios: ").append(sinEspacios ? "Sí" : "No").append("</p>");
        detalle.append("<p><i class='fas ").append(tieneArroba ? "fa-check valido" : "fa-times invalido").append("'></i> Contiene @: ").append(tieneArroba ? "Sí" : "No").append("</p>");
        detalle.append("<p><i class='fas ").append(arrobaUnica ? "fa-check valido" : "fa-times invalido").append("'></i> Solo un @: ").append(arrobaUnica ? "Sí" : "No").append("</p>");
        detalle.append("<p><i class='fas ").append(terminaCorrecto ? "fa-check valido" : "fa-times invalido").append("'></i> Termina en .com o .es: ").append(terminaCorrecto ? "Sí" : "No").append("</p>");
        detalle.append("<p><i class='fas ").append(arrobaNoInicio ? "fa-check valido" : "fa-times invalido").append("'></i> @ no está al inicio: ").append(arrobaNoInicio ? "Sí" : "No").append("</p>");
        detalle.append("<p><i class='fas ").append(puntoDespuesArroba ? "fa-check valido" : "fa-times invalido").append("'></i> Punto después del @: ").append(puntoDespuesArroba ? "Sí" : "No").append("</p>");
        
        request.setAttribute("correo", correo);
        request.setAttribute("esValido", String.valueOf(esValido));
        request.setAttribute("detalle", detalle.toString());
        
        request.getRequestDispatcher("ejercicio03.jsp").forward(request, response);
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio03.jsp");
    }
}
