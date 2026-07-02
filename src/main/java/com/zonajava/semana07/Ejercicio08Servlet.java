package com.zonajava.semana07;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class Ejercicio08Servlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String urlsTexto = request.getParameter("urls");
        
        if (urlsTexto == null || urlsTexto.trim().isEmpty()) {
            request.setAttribute("error", "Por favor ingrese al menos una URL");
            request.getRequestDispatcher("ejercicio08.jsp").forward(request, response);
            return;
        }
        
        String[] urls = urlsTexto.split("\\n");
        StringBuilder dominiosHtml = new StringBuilder();
        
        for (String url : urls) {
            url = url.trim();
            if (url.isEmpty()) continue;
            
            // Extraer dominio usando indexOf() y substring()
            String dominio = extraerDominio(url);
            
            dominiosHtml.append("<div class='url-item'>");
            dominiosHtml.append("<div class='url-original'><i class='fas fa-link'></i> ").append(url).append("</div>");
            dominiosHtml.append("<div class='url-dominio'><i class='fas fa-globe'></i> ").append(dominio).append("</div>");
            dominiosHtml.append("</div>");
        }
        
        request.setAttribute("dominios", dominiosHtml.toString());
        
        request.getRequestDispatcher("ejercicio08.jsp").forward(request, response);
    }
    
    private String extraerDominio(String url) {
        // Quitar protocolo (http:// o https://)
        int inicio = url.indexOf("://");
        if (inicio != -1) {
            url = url.substring(inicio + 3);
        }
        
        // Quitar www. si existe
        if (url.startsWith("www.")) {
            url = url.substring(4);
        }
        
        // Quitar path después del primer /
        int fin = url.indexOf("/");
        if (fin != -1) {
            url = url.substring(0, fin);
        }
        
        return url;
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("ejercicio08.jsp");
    }
}
