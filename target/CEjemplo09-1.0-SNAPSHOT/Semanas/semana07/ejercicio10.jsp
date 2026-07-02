<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 10 - Contador de Palabras | Jhon Contreras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #070b15, #0f172a, #1e293b); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 40px 20px; color: #e2e8f0; }
        .container { background: linear-gradient(145deg, #131d30, #1a2744); border-radius: 24px; padding: 50px; max-width: 700px; width: 100%; border: 1px solid rgba(0,198,255,0.2); box-shadow: 0 25px 50px rgba(0,0,0,0.5); }
        .back-link { display: inline-flex; align-items: center; gap: 8px; color: #00c6ff; text-decoration: none; font-size: 0.95rem; margin-bottom: 30px; transition: 0.3s; }
        .back-link:hover { color: #fff; transform: translateX(-5px); }
        .header { text-align: center; margin-bottom: 35px; }
        .header .numero { color: #00c6ff; font-size: 0.9rem; font-weight: 600; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 10px; }
        .header h1 { font-size: 1.8rem; color: #fff; margin-bottom: 15px; }
        .header .descripcion { color: #94a3b8; font-size: 1rem; line-height: 1.7; }
        .metodos { background: rgba(0,198,255,0.05); border: 1px solid rgba(0,198,255,0.15); border-radius: 16px; padding: 20px; margin-bottom: 25px; text-align: center; }
        .metodos h3 { color: #00c6ff; font-size: 0.9rem; margin-bottom: 10px; text-transform: uppercase; letter-spacing: 2px; }
        .metodos .tag { display: inline-block; background: rgba(0,198,255,0.1); color: #7dd3fc; padding: 5px 12px; border-radius: 20px; font-size: 0.8rem; margin: 3px; border: 1px solid rgba(0,198,255,0.2); }
        .form-group { margin-bottom: 25px; }
        .form-group label { display: block; color: #94a3b8; font-size: 0.95rem; margin-bottom: 10px; font-weight: 500; }
        .form-group textarea { width: 100%; padding: 14px 18px; border: 2px solid rgba(0,198,255,0.2); border-radius: 12px; background: rgba(0,0,0,0.2); color: #fff; font-size: 1rem; transition: 0.3s; resize: vertical; min-height: 120px; }
        .form-group textarea:focus { outline: none; border-color: #00c6ff; box-shadow: 0 0 15px rgba(0,198,255,0.2); }
        .btn-calcular { width: 100%; padding: 16px; border: none; border-radius: 12px; background: linear-gradient(135deg, #00c6ff, #0077ff); color: #fff; font-size: 1.1rem; font-weight: 700; cursor: pointer; transition: 0.3s; }
        .btn-calcular:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,198,255,0.4); }
        .resultados { margin-top: 30px; animation: fadeIn 0.5s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .result-card { background: linear-gradient(145deg, rgba(0,198,255,0.1), rgba(0,119,255,0.05)); border: 1px solid rgba(0,198,255,0.3); border-radius: 16px; padding: 25px; margin-bottom: 15px; text-align: center; }
        .result-card .label { color: #94a3b8; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 10px; }
        .result-card .valor { color: #00c6ff; font-size: 2.5rem; font-weight: 800; }
        .result-card .valor-sec { color: #7dd3fc; font-size: 1.3rem; font-weight: 600; }
        .palabras-grid { display: flex; justify-content: center; gap: 15px; flex-wrap: wrap; margin-top: 15px; }
        .palabra-item { background: rgba(0,198,255,0.1); border: 1px solid rgba(0,198,255,0.2); border-radius: 12px; padding: 15px 20px; text-align: center; min-width: 100px; }
        .palabra-item .tipo { color: #94a3b8; font-size: 0.8rem; margin-bottom: 5px; }
        .palabra-item .palabra { color: #00c6ff; font-size: 1.2rem; font-weight: 700; }
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid rgba(239,68,68,0.3); color: #ef4444; padding: 15px; border-radius: 12px; margin-bottom: 20px; text-align: center; }
        .footer-pagina { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid rgba(0,198,255,0.1); color: #475569; font-size: 0.85rem; }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al menu</a>
        <div class="header">
            <div class="numero">Ejercicio 10</div>
            <h1><i class="fas fa-calculator"></i> Contador de Palabras</h1>
            <p class="descripcion">Ingresa un párrafo y cuenta las palabras, mostrando la primera y la última.</p>
        </div>
        <div class="metodos">
            <h3><i class="fas fa-code"></i> Métodos Utilizados</h3>
            <span class="tag">trim()</span>
            <span class="tag">split()</span>
            <span class="tag">length</span>
        </div>
        <form action="calcular10" method="POST">
            <div class="form-group">
                <label for="parrafo"><i class="fas fa-paragraph"></i> Ingrese un párrafo</label>
                <textarea name="parrafo" id="parrafo" placeholder="Escribe un párrafo completo aquí..." required></textarea>
            </div>
            <button type="submit" class="btn-calcular"><i class="fas fa-calculator"></i> Contar Palabras</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="error-msg" style="margin-top:20px"><i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("totalPalabras") != null) { %>
        <div class="resultados">
            <div class="result-card">
                <div class="label"><i class="fas fa-hashtag"></i> Total de Palabras</div>
                <div class="valor"><%= request.getAttribute("totalPalabras") %></div>
            </div>
            <div class="palabras-grid">
                <div class="palabra-item">
                    <div class="tipo"><i class="fas fa-step-backward"></i> Primera Palabra</div>
                    <div class="palabra"><%= request.getAttribute("primeraPalabra") %></div>
                </div>
                <div class="palabra-item">
                    <div class="tipo"><i class="fas fa-step-forward"></i> Última Palabra</div>
                    <div class="palabra"><%= request.getAttribute("ultimaPalabra") %></div>
                </div>
            </div>
        </div>
        <% } %>
        <div class="footer-pagina">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
            <p>Diseño y Programación Web - IESTP</p>
        </div>
    </div>
</body>
</html>