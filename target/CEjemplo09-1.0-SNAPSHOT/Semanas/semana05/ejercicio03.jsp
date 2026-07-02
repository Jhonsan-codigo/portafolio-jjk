<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 03 - Digitos de Numero | Jhon Contreras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #070b15, #0f172a, #1e293b); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 40px 20px; color: #e2e8f0; }
        .container { background: linear-gradient(145deg, #131d30, #1a2744); border-radius: 24px; padding: 50px; max-width: 600px; width: 100%; border: 1px solid rgba(0,198,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.5); }
        .back-link { display: inline-flex; align-items: center; gap: 8px; color: #00c6ff; text-decoration: none; font-size: 0.95rem; margin-bottom: 30px; transition: 0.3s; }
        .back-link:hover { color: #fff; transform: translateX(-5px); }
        .header { text-align: center; margin-bottom: 35px; }
        .header .numero { color: #00c6ff; font-size: 0.9rem; font-weight: 600; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 10px; }
        .header h1 { font-size: 1.8rem; color: #fff; margin-bottom: 15px; }
        .header .descripcion { color: #94a3b8; font-size: 1rem; line-height: 1.7; }
        .formulas { background: rgba(0,198,255,0.05); border: 1px solid rgba(0,198,255,0.15); border-radius: 16px; padding: 25px; margin-bottom: 30px; text-align: center; }
        .formulas h3 { color: #00c6ff; font-size: 1rem; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 2px; }
        .formula { color: #7dd3fc; font-size: 1.1rem; margin: 6px 0; font-family: 'Courier New', monospace; }
        .form-group { margin-bottom: 25px; }
        .form-group label { display: block; color: #94a3b8; font-size: 0.95rem; margin-bottom: 10px; font-weight: 500; }
        .form-group input { width: 100%; padding: 14px 18px; border: 2px solid rgba(0,198,255,0.2); border-radius: 12px; background: rgba(0,0,0,0.2); color: #fff; font-size: 1rem; transition: 0.3s; }
        .form-group input:focus { outline: none; border-color: #00c6ff; box-shadow: 0 0 15px rgba(0,198,255,0.2); }
        .btn-calcular { width: 100%; padding: 16px; border: none; border-radius: 12px; background: linear-gradient(135deg, #00c6ff, #0077ff); color: #fff; font-size: 1.1rem; font-weight: 700; cursor: pointer; transition: 0.3s; }
        .btn-calcular:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,198,255,0.4); }
        .resultados { margin-top: 30px; animation: fadeIn 0.5s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .result-card { background: linear-gradient(145deg, rgba(0,198,255,0.1), rgba(0,119,255,0.05)); border: 1px solid rgba(0,198,255,0.3); border-radius: 16px; padding: 25px; margin-bottom: 15px; text-align: center; }
        .result-card .label { color: #94a3b8; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; }
        .result-card .valor { color: #00c6ff; font-size: 2rem; font-weight: 800; }
        .result-card .unidad { color: #7dd3fc; font-size: 0.95rem; margin-top: 5px; }
        .digitos-texto { color: #7dd3fc; font-size: 1rem; word-break: break-all; }
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid rgba(239,68,68,0.3); color: #ef4444; padding: 15px; border-radius: 12px; margin-bottom: 20px; text-align: center; }
        .footer-pagina { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid rgba(0,198,255,0.1); color: #475569; font-size: 0.85rem; }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al menu</a>
        <div class="header">
            <div class="numero">Ejercicio 03</div>
            <h1><i class="fas fa-sort-numeric-up"></i> Digitos de Numero</h1>
            <p class="descripcion">Determina la cantidad de digitos, la suma de digitos pares y la suma de digitos impares de un numero entero.</p>
        </div>
        <div class="formulas">
            <h3><i class="fas fa-function"></i> Reglas</h3>
            <div class="formula">El cero se considera digito par</div>
        </div>
        <form action="calcular03" method="POST">
            <div class="form-group">
                <label for="numero"><i class="fas fa-hashtag"></i> Numero entero</label>
                <input type="number" name="numero" id="numero" placeholder="Ejemplo: 123456" required>
            </div>
            <button type="submit" class="btn-calcular"><i class="fas fa-calculator"></i> Calcular con Java</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="error-msg" style="margin-top:20px"><i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("cantidadDigitos") != null) { %>
        <div class="resultados">
            <div class="result-card">
                <div class="label"><i class="fas fa-hashtag"></i> Numero Ingresado</div>
                <div class="valor"><%= request.getAttribute("numeroOriginal") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-calculator"></i> Cantidad de Digitos</div>
                <div class="valor"><%= request.getAttribute("cantidadDigitos") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-dice-two"></i> Digitos Pares</div>
                <div class="digitos-texto"><%= request.getAttribute("digitosPares") %></div>
                <div class="unidad">Suma: <%= request.getAttribute("sumaPares") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-dice-one"></i> Digitos Impares</div>
                <div class="digitos-texto"><%= request.getAttribute("digitosImpares") %></div>
                <div class="unidad">Suma: <%= request.getAttribute("sumaImpares") %></div>
            </div>
        </div>
        <% } %>
        <div class="footer-pagina">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
            <p>Diseno y Programacion Web - IESTP</p>
        </div>
    </div>
</body>
</html>