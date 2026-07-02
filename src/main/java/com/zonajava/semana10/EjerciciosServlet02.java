package com.zonajava.semana10;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class EjerciciosServlet02 extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String numeroStr = request.getParameter("numero");
        
        try {
            int numero = Integer.parseInt(numeroStr);
            
            List<String> secuencia = new ArrayList<>();
            int potencia = 1;
            long valorActual = numero;
            
            // Primera iteración: numero^1 = numero
            secuencia.add("n^" + potencia + ":" + valorActual);
            potencia++;
            
            boolean overflowDetectado = false;
            
            while (!overflowDetectado) {
                try {
                    long siguiente = Math.multiplyExact((long) valorActual, (long) numero);
                    
                    if (siguiente > Integer.MAX_VALUE || siguiente < Integer.MIN_VALUE) {
                        throw new ArithmeticException("Overflow detectado");
                    }
                    
                    valorActual = siguiente;
                    secuencia.add("n^" + potencia + ":" + valorActual);
                    potencia++;
                    
                } catch (ArithmeticException e) {
                    overflowDetectado = true;
                    
                    request.setAttribute("numeroInicial", String.valueOf(numero));
                    request.setAttribute("secuencia", secuencia);
                    request.setAttribute("ultimoValido", String.valueOf(valorActual));
                    request.setAttribute("potenciaMaxima", "n^" + (potencia - 1));
                    request.setAttribute("mensajeWarning", 
                        "¡OVERFLOW DETECTADO en n^" + potencia + "! " +
                        "El valor " + valorActual + " × " + numero + " excede los límites de un int (" + 
                        Integer.MIN_VALUE + " a " + Integer.MAX_VALUE + "). " +
                        "¡La maldición del desbordamiento ha sido contenida!");
                }
            }
            
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Ingresa un número entero válido. ¡Solo los enteros pueden resistir la maldición del overflow!");
        }
        
        // RUTA ABSOLUTA para evitar problemas de contexto
        request.getRequestDispatcher("/Semanas/semana10/ejercicio02.jsp").forward(request, response);
    }
}