<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ejercicio 04 - Transporte | Jhon Contreras</title>
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
        .formula { color: #7dd3fc; font-size: 1.1rem; margin: 8px 0; font-family: 'Courier New', monospace; }
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
        .error-msg { background: rgba(239,68,68,0.1); border: 1px solid rgba(239,68,68,0.3); color: #ef4444; padding: 15px; border-radius: 12px; margin-bottom: 20px; text-align: center; }
        .footer-pagina { text-align: center; margin-top: 30px; padding-top: 20px; border-top: 1px solid rgba(0,198,255,0.1); color: #475569; font-size: 0.85rem; }
    </style>
</head>
<body>
    <div class="container">
        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al menu</a>
        <div class="header">
            <div class="numero">Ejercicio 04</div>
            <h1><i class="fas fa-bus"></i> Transporte</h1>
            <p class="descripcion">Una empresa de transportes aplica 7% de descuento sobre el importe de la compra. Ademas, obsequia 3 chocolates por cada pasaje adquirido.</p>
        </div>
        <div class="formulas">
            <h3><i class="fas fa-function"></i> Formulas</h3>
            <div class="formula">Importe Compra = Precio Pasaje x Cantidad Pasajes</div>
            <div class="formula">Descuento = Importe Compra x 0.07</div>
            <div class="formula">Importe a Pagar = Importe Compra - Descuento</div>
            <div class="formula">Chocolates = Cantidad Pasajes x 3</div>
        </div>
        <form action="calcular04" method="POST">
            <div class="form-group">
                <label for="precioPasaje"><i class="fas fa-ticket-alt"></i> Precio del pasaje (S/)</label>
                <input type="number" name="precioPasaje" id="precioPasaje" step="any" min="0" placeholder="Ejemplo: 35.00" required>
            </div>
            <div class="form-group">
                <label for="cantidadPasajes"><i class="fas fa-users"></i> Cantidad de pasajes</label>
                <input type="number" name="cantidadPasajes" id="cantidadPasajes" min="1" placeholder="Ejemplo: 2" required>
            </div>
            <button type="submit" class="btn-calcular"><i class="fas fa-calculator"></i> Calcular con Java</button>
        </form>
        <% if (request.getAttribute("error") != null) { %>
        <div class="error-msg" style="margin-top:20px"><i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("error") %></div>
        <% } %>
        <% if (request.getAttribute("importeCompra") != null) { %>
        <div class="resultados">
            <div class="result-card">
                <div class="label"><i class="fas fa-receipt"></i> Importe de la Compra</div>
                <div class="valor">S/ <%= request.getAttribute("importeCompra") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-percent"></i> Descuento (7%)</div>
                <div class="valor">S/ <%= request.getAttribute("importeDescuento") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-money-bill-wave"></i> Importe a Pagar</div>
                <div class="valor">S/ <%= request.getAttribute("importePagar") %></div>
            </div>
            <div class="result-card">
                <div class="label"><i class="fas fa-cookie-bite"></i> Chocolates de Obsequio</div>
                <div class="valor"><%= request.getAttribute("chocolates") %></div>
                <div class="unidad">chocolates</div>
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
