<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 03 - Rombo | JJK</title>
    <link rel="stylesheet" href="../../css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }

        body { 
            background: var(--jjk-bg);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
            color: var(--jjk-text);
            font-family: 'Noto Sans JP', 'Inter', sans-serif;
            padding-left: 70px;
        }

        .container { 
            background: linear-gradient(145deg, rgba(17,17,17,0.95), rgba(10,10,10,0.98));
            border-radius: 24px;
            padding: 50px;
            max-width: 600px;
            width: 100%;
            border: 1px solid var(--jjk-border);
            box-shadow: 0 25px 50px rgba(0,0,0,0.5), 0 0 100px rgba(139,0,0,0.05);
            position: relative;
            overflow: hidden;
        }

        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 4px;
            background: linear-gradient(90deg, var(--jjk-sukuna), var(--jjk-gold), var(--jjk-sukuna-bright));
        }

        .container::after {
            content: '呪';
            position: absolute;
            top: 20px;
            right: 25px;
            font-family: 'Noto Sans JP', sans-serif;
            font-size: 3.5rem;
            color: var(--jjk-sukuna-bright);
            opacity: 0.08;
        }

        .back-link { 
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: var(--jjk-text-dim);
            text-decoration: none;
            font-size: 0.95rem;
            margin-bottom: 30px;
            transition: all 0.3s ease;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        .back-link:hover { 
            color: var(--jjk-sukuna-bright);
            transform: translateX(-5px);
            text-shadow: 0 0 10px var(--jjk-sukuna-glow);
        }

        .header { 
            text-align: center;
            margin-bottom: 35px;
            position: relative;
            z-index: 1;
        }

        .header .numero { 
            color: var(--jjk-sukuna-bright);
            font-size: 0.9rem;
            font-weight: 600;
            letter-spacing: 5px;
            text-transform: uppercase;
            margin-bottom: 10px;
            font-family: 'Orbitron', sans-serif;
        }

        .header h1 { 
            font-size: 1.8rem;
            color: var(--jjk-text);
            margin-bottom: 15px;
            font-family: 'Cinzel', serif;
            letter-spacing: 3px;
        }

        .header .descripcion { 
            color: var(--jjk-text-dim);
            font-size: 1rem;
            line-height: 1.7;
        }

        .formulas { 
            background: rgba(139, 0, 0, 0.08);
            border: 1px solid rgba(139, 0, 0, 0.2);
            border-radius: 16px;
            padding: 25px;
            margin-bottom: 30px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .formulas h3 { 
            color: var(--jjk-sukuna-bright);
            font-size: 1rem;
            margin-bottom: 15px;
            text-transform: uppercase;
            letter-spacing: 4px;
            font-family: 'Orbitron', sans-serif;
        }

        .formula { 
            color: var(--jjk-text-dim);
            font-size: 1.3rem;
            margin: 8px 0;
            font-family: 'Courier New', monospace;
        }

        .form-group { 
            margin-bottom: 25px;
            position: relative;
            z-index: 1;
        }

        .form-group label { 
            display: block;
            color: var(--jjk-text-dim);
            font-size: 0.9rem;
            margin-bottom: 10px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-family: 'Orbitron', sans-serif;
        }

        .form-group label i {
            color: var(--jjk-sukuna-bright);
            margin-right: 8px;
        }

        .form-group input { 
            width: 100%;
            padding: 14px 18px;
            border: 2px solid var(--jjk-border);
            border-radius: 12px;
            background: rgba(10, 10, 15, 0.9);
            color: var(--jjk-text);
            font-size: 1rem;
            transition: all 0.3s ease;
            font-family: 'Noto Sans JP', sans-serif;
            outline: none;
        }

        .form-group input:focus { 
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 20px var(--jjk-sukuna-glow), inset 0 2px 8px rgba(0,0,0,0.3);
            transform: translateY(-2px);
        }

        .form-group input::placeholder {
            color: var(--jjk-text-dark);
            font-style: italic;
        }

        .btn-calcular { 
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--jjk-sukuna), var(--jjk-sukuna-bright));
            color: var(--jjk-gold);
            font-size: 1.1rem;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            font-family: 'Orbitron', sans-serif;
            text-transform: uppercase;
            letter-spacing: 3px;
            position: relative;
            overflow: hidden;
            z-index: 1;
        }

        .btn-calcular::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.15), transparent);
            transition: left 0.5s ease;
        }

        .btn-calcular:hover::before {
            left: 100%;
        }

        .btn-calcular:hover { 
            transform: translateY(-2px);
            box-shadow: 0 8px 25px var(--jjk-sukuna-glow), 0 0 40px rgba(139,0,0,0.2);
        }

        .resultados { 
            margin-top: 30px;
            animation: fadeIn 0.5s ease;
            position: relative;
            z-index: 1;
        }

        @keyframes fadeIn { 
            from { opacity: 0; transform: translateY(20px); } 
            to { opacity: 1; transform: translateY(0); } 
        }

        .result-card { 
            background: linear-gradient(145deg, rgba(139,0,0,0.1), rgba(212,175,55,0.05));
            border: 1px solid rgba(139, 0, 0, 0.3);
            border-radius: 16px;
            padding: 30px;
            margin-bottom: 20px;
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: resultAppear 0.6s ease;
        }

        @keyframes resultAppear {
            from { opacity: 0; transform: translateY(30px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .result-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(139,0,0,0.1) 0%, transparent 70%);
            animation: rotate 10s linear infinite;
        }

        .result-card .label { 
            color: var(--jjk-text-dim);
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 10px;
            position: relative;
            z-index: 1;
            font-family: 'Orbitron', sans-serif;
        }

        .result-card .valor { 
            color: var(--jjk-sukuna-bright);
            font-size: 2.5rem;
            font-weight: 800;
            text-shadow: 0 0 30px var(--jjk-sukuna-glow);
            position: relative;
            z-index: 1;
            font-family: 'Cinzel', serif;
        }

        .result-card .unidad { 
            color: var(--jjk-text-dim);
            font-size: 1rem;
            margin-top: 5px;
            position: relative;
            z-index: 1;
        }

        .error-msg { 
            background: rgba(139, 0, 0, 0.1);
            border: 1px solid rgba(255, 26, 26, 0.3);
            color: var(--jjk-sukuna-bright);
            padding: 15px;
            border-radius: 12px;
            margin-bottom: 20px;
            text-align: center;
            animation: shake 0.5s ease;
            position: relative;
            z-index: 1;
            font-family: 'Orbitron', sans-serif;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-10px); }
            40% { transform: translateX(10px); }
            60% { transform: translateX(-5px); }
            80% { transform: translateX(5px); }
        }

        .footer-pagina { 
            text-align: center;
            margin-top: 30px;
            padding-top: 20px;
            border-top: 1px solid var(--jjk-border);
            color: var(--jjk-text-dim);
            font-size: 0.85rem;
            position: relative;
            z-index: 1;
        }

        /* Logos corregidos */
        .logo-instituto {
            position: fixed;
            width: 70px;
            height: 70px;
            z-index: 1000;
            border-radius: 14px;
            border: 2px solid var(--jjk-sukuna);
            box-shadow: 0 0 20px var(--jjk-sukuna-glow), 0 0 40px rgba(139,0,0,0.15);
            background: rgba(10, 10, 15, 0.95);
            padding: 6px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .logo-instituto:hover {
            transform: scale(1.08);
            box-shadow: 0 0 35px var(--jjk-sukuna-glow-bright), 0 0 60px rgba(139,0,0,0.25);
            border-color: var(--jjk-sukuna-bright);
        }

        .logo-instituto img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            border-radius: 8px;
        }

        .logo-top-left { top: 15px; left: 90px; }
        .logo-top-right { top: 15px; right: 15px; }

        @media (max-width: 768px) {
            body { padding-left: 0; }
            .logo-instituto { width: 55px; height: 55px; }
            .logo-top-left { left: 80px; top: 10px; }
            .logo-top-right { top: 10px; right: 10px; }
            .container { padding: 35px 20px; }
        }

        @media (max-width: 480px) {
            .logo-instituto { width: 45px; height: 45px; }
            .logo-top-left { left: 70px; }
        }
    </style>
</head>
<body>
    <!-- PRELOADER -->
    <div class="preloader-jjk" id="preloader">
        <div class="preloader-orb"></div>
        <div class="preloader-text">CARGANDO DOMINIO MALDITO...</div>
    </div>

    <!-- Logos -->
    <div class="logo-instituto logo-top-left">
        <img src="../../assets/logo1.jpg" alt="Logo IESTP">
    </div>
    <div class="logo-instituto logo-top-right">
        <img src="../../assets/logo2.jpg" alt="Logo DPW">
    </div>

    <div class="container">
        <a href="index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al Menú</a>

        <div class="header">
            <div class="numero">Ejercicio 03</div>
            <h1><i class="fas fa-gem"></i> Rombo</h1>
            <p class="descripcion">Diseñe un algoritmo que determine el área (A) de un rombo del que se conoce su base mayor (B), su base menor (b) y su altura (h).</p>
        </div>

        <div class="formulas">
            <h3><i class="fas fa-function"></i> Fórmula</h3>
            <div class="formula">A = (b + B) &times; h / 2</div>
        </div>

        <form action="calcular03" method="POST">
            <div class="form-group">
                <label for="baseMayor"><i class="fas fa-arrows-alt-h"></i> Base Mayor (B) en metros</label>
                <input type="number" name="baseMayor" id="baseMayor" step="any" min="0" placeholder="Ejemplo: 8" required>
            </div>
            <div class="form-group">
                <label for="baseMenor"><i class="fas fa-arrows-alt-h"></i> Base Menor (b) en metros</label>
                <input type="number" name="baseMenor" id="baseMenor" step="any" min="0" placeholder="Ejemplo: 6" required>
            </div>
            <div class="form-group">
                <label for="altura"><i class="fas fa-arrows-alt-v"></i> Altura (h) en metros</label>
                <input type="number" name="altura" id="altura" step="any" min="0" placeholder="Ejemplo: 4" required>
            </div>
            <button type="submit" class="btn-calcular"><i class="fas fa-bolt"></i> Activar Técnica</button>
        </form>

        <% 
            String error = (String) request.getAttribute("error");
            String area = (String) request.getAttribute("area");
            if (error != null) {
        %>
            <div class="error-msg" style="margin-top: 20px;"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
        <% } else if (area != null) { %>
        <div class="resultados">
            <div class="result-card">
                <div class="label"><i class="fas fa-gem"></i> Área</div>
                <div class="valor"><%= area %></div>
                <div class="unidad">metros cuadrados (m&sup2;)</div>
            </div>
        </div>
        <% } %>

        <div class="footer-pagina">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
            <p>Diseño y Programación Web - IESTP</p>
        </div>
    </div>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>