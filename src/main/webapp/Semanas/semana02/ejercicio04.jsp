<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 04 - Donación Hospital | Jhon Contreras</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #070b15, #0f172a, #1e293b); min-height: 100vh; display: flex; justify-content: center; align-items: center; padding: 20px; color: #fff; }
        .container { background: linear-gradient(145deg, #131d30, #1a2744); border-radius: 24px; padding: 40px; max-width: 500px; width: 100%; box-shadow: 0 25px 50px rgba(0,0,0,0.3); border: 1px solid rgba(0,198,255,0.1); }
        .back-link { display: inline-flex; align-items: center; gap: 8px; color: #00c6ff; text-decoration: none; font-size: 0.9rem; margin-bottom: 25px; transition: all 0.3s; }
        .back-link:hover { color: #fff; transform: translateX(-5px); }
        .header { text-align: center; margin-bottom: 35px; }
        .header .numero { color: #00c6ff; font-size: 0.9rem; font-weight: 600; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 10px; }
        .header h1 { font-size: 1.8rem; color: #fff; margin-bottom: 15px; }
        .header .descripcion { color: #94a3b8; font-size: 1rem; line-height: 1.7; }
        .formulas { background: rgba(0,198,255,0.05); border: 1px solid rgba(0,198,255,0.15); border-radius: 12px; padding: 20px; margin-bottom: 25px; }
        .formulas h3 { color: #00c6ff; font-size: 1rem; margin-bottom: 15px; text-transform: uppercase; letter-spacing: 2px; }
        .formula { color: #7dd3fc; font-size: 1.1rem; margin: 8px 0; font-family: 'Courier New', monospace; }
        .form-group { margin-bottom: 25px; }
        .form-group label { display: block; color: #94a3b8; font-size: 0.95rem; margin-bottom: 10px; font-weight: 500; }
        .form-group input { width: 100%; padding: 14px 18px; border: 2px solid rgba(0,198,255,0.2); border-radius: 12px; background: rgba(0,0,0,0.2); color: #fff; font-size: 1rem; transition: all 0.3s; }
        .form-group input:focus { outline: none; border-color: #00c6ff; box-shadow: 0 0 15px rgba(0,198,255,0.2); }
        .btn-calcular { width: 100%; padding: 16px; border: none; border-radius: 12px; background: linear-gradient(135deg, #00c6ff, #0072ff); color: #fff; font-size: 1.1rem; font-weight: 600; cursor: pointer; transition: all 0.3s; text-transform: uppercase; letter-spacing: 2px; }
        .btn-calcular:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,198,255,0.4); }
        .resultados { margin-top: 30px; animation: fadeIn 0.5s ease; }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .result-card { background: linear-gradient(145deg, rgba(0,198,255,0.1), rgba(0,119,255,0.05)); border: 1px solid rgba(0,198,255,0.2); border-radius: 12px; padding: 20px; margin-bottom: 15px; text-align: center; }
        .result-card .label { color: #94a3b8; font-size: 0.9rem; text-transform: uppercase; letter-spacing: 2px; margin-bottom: 8px; }
        .result-card .valor { color: #00c6ff; font-size: 2.5rem; font-weight: 800; }
        .result-card .unidad { color: #7dd3fc; font-size: 1rem; margin-top: 5px; }
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid rgba(239,68,68,0.3); color: #ef4444; padding: 15px; border-radius: 12px; margin-top: 20px; text-align: center; }
        .footer-pagina { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid rgba(0,198,255,0.1); color: #64748b; font-size: 0.85rem; }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al inicio</a>
        
        <div class="header">
            <div class="numero">Ejercicio 04</div>
            <h1>Donación al Hospital</h1>
            <p class="descripcion">Un hospital recibe una donación que se reparte entre Pediatría, Medicina General, Ginecología y Traumatología.</p>
        </div>
        
        <div class="formulas">
            <h3><i class="fas fa-calculator"></i> Distribución</h3>
            <div class="formula">Medicina General = 45% de la donación</div>
            <div class="formula">Ginecología = 80% de Medicina General</div>
            <div class="formula">Pediatría = 20% de (Medicina General + Ginecología)</div>
            <div class="formula">Traumatología = Lo que resta de la donación</div>
        </div>
        
        <form action="${pageContext.request.contextPath}/Semanas/semana02/calcular04" method="POST">
            <div class="form-group">
                <label for="donacion"><i class="fas fa-hand-holding-heart"></i> Monto de la donación (S/)</label>
                <input type="number" id="donacion" name="donacion" step="0.01" min="0" required placeholder="Ingrese el monto de la donación">
            </div>
            <button type="submit" class="btn-calcular"><i class="fas fa-calculator"></i> Calcular</button>
        </form>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-msg"><i class="fas fa-exclamation-circle"></i> <%= request.getAttribute("error") %></div>
        <% } %>
        
        <% if (request.getAttribute("medicinaGeneral") != null) { %>
            <div class="resultados">
                <div class="result-card">
                    <div class="label">Medicina General (45%)</div>
                    <div class="valor">S/ <%= request.getAttribute("medicinaGeneral") %></div>
                </div>
                <div class="result-card">
                    <div class="label">Ginecología (80% de M.G.)</div>
                    <div class="valor">S/ <%= request.getAttribute("ginecologia") %></div>
                </div>
                <div class="result-card">
                    <div class="label">Pediatría (20% de M.G.+Gin.)</div>
                    <div class="valor">S/ <%= request.getAttribute("pediatria") %></div>
                </div>
                <div class="result-card">
                    <div class="label">Traumatología (Resto)</div>
                    <div class="valor">S/ <%= request.getAttribute("traumatologia") %></div>
                </div>
            </div>
        <% } %>
        
        <div class="footer-pagina">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
        </div>
    </div>
</body>
</html>