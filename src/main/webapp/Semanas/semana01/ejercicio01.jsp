<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 01 - Rectángulo | JJK</title>
    <link rel="stylesheet" href="../../css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .exercise-page {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 40px 20px;
            position: relative;
            padding-left: 70px;
        }

        .exercise-container {
            background: linear-gradient(145deg, rgba(17,17,17,0.95), rgba(10,10,10,0.98));
            border: 1px solid var(--jjk-border);
            border-radius: 28px;
            padding: 60px;
            max-width: 650px;
            width: 100%;
            position: relative;
            overflow: hidden;
            box-shadow: 0 30px 60px rgba(0, 0, 0, 0.6), 0 0 100px rgba(139,0,0,0.05);
        }

        .exercise-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--jjk-sukuna), var(--jjk-gold), var(--jjk-sukuna-bright));
        }

        .exercise-container::after {
            content: '呪';
            position: absolute;
            top: 25px;
            right: 30px;
            font-family: 'Noto Sans JP', sans-serif;
            font-size: 4rem;
            color: var(--jjk-sukuna-bright);
            opacity: 0.08;
        }

        /* CORREGIDO: Boton volver al menu - mas abajo para no chocar con logos */
        .back-nav {
            position: fixed;
            top: 80px;
            left: 100px;
            z-index: 100;
        }

        .back-nav a {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 14px 24px;
            background: rgba(10, 10, 10, 0.95);
            border: 1px solid var(--jjk-border);
            border-radius: 14px;
            color: #C0C0D0;
            text-decoration: none;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            backdrop-filter: blur(20px);
            letter-spacing: 1px;
        }

        .back-nav a:hover {
            border-color: var(--jjk-sukuna-bright);
            color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 25px var(--jjk-sukuna-glow);
            transform: translateX(-5px);
        }

        /* CORREGIDO: Boton portafolio - posicionado debajo del logo derecho */
        .back-portafolio {
            position: fixed;
            top: 75px;
            right: 15px;
            z-index: 100;
        }

        .back-portafolio a {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 20px;
            background: rgba(10, 10, 10, 0.9);
            border: 1px solid var(--jjk-border);
            border-radius: 12px;
            color: #C0C0D0;
            text-decoration: none;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.8rem;
            transition: all 0.3s ease;
        }

        .back-portafolio a:hover {
            border-color: var(--jjk-gold);
            color: var(--jjk-gold);
            box-shadow: 0 0 20px var(--jjk-gold-glow);
        }

        .exercise-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 1;
        }

        .exercise-number {
            font-family: 'Orbitron', sans-serif;
            font-size: 1rem;
            color: #FF6B6B;
            letter-spacing: 5px;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        /* CORREGIDO: Titulo ejercicio blanco */
        .exercise-title {
            font-family: 'Cinzel', serif;
            font-size: 2.2rem;
            font-weight: 900;
            color: #FFFFFF;
            margin-bottom: 20px;
            letter-spacing: 4px;
            text-shadow: 0 0 20px rgba(255,0,0,0.3);
        }

        .exercise-desc {
            color: #D0D0E0;
            font-size: 1.05rem;
            line-height: 1.8;
        }

        .formulas-box {
            background: rgba(139, 0, 0, 0.08);
            border: 1px solid rgba(139, 0, 0, 0.2);
            border-radius: 20px;
            padding: 30px;
            margin-bottom: 35px;
            text-align: center;
            position: relative;
            z-index: 1;
        }

        .formulas-box h3 {
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            color: #FF6B6B;
            letter-spacing: 4px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .formula {
            color: #E0E0F0;
            font-size: 1.3rem;
            margin: 10px 0;
            font-family: 'Courier New', monospace;
        }

        .jjk-form-group {
            margin-bottom: 30px;
            position: relative;
            z-index: 1;
        }

        .jjk-form-group label {
            display: block;
            color: #C0C0D0;
            font-size: 0.9rem;
            margin-bottom: 12px;
            font-weight: 500;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-family: 'Orbitron', sans-serif;
        }

        .jjk-form-group label i {
            color: var(--jjk-sukuna-bright);
            margin-right: 10px;
        }

        .jjk-submit {
            width: 100%;
            padding: 20px;
            border: none;
            border-radius: 14px;
            background: linear-gradient(135deg, var(--jjk-sukuna), var(--jjk-sukuna-bright));
            color: var(--jjk-gold);
            font-family: 'Orbitron', sans-serif;
            font-size: 1.1rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 4px;
            cursor: pointer;
            position: relative;
            overflow: hidden;
            transition: all 0.3s ease;
            z-index: 1;
        }

        .jjk-submit::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.15), transparent);
            transition: left 0.5s ease;
        }

        .jjk-submit:hover::before {
            left: 100%;
        }

        .jjk-submit:hover {
            box-shadow: 0 0 40px var(--jjk-sukuna-glow), 0 0 80px rgba(139,0,0,0.2);
            transform: translateY(-3px);
        }

        .results-area {
            margin-top: 35px;
            position: relative;
            z-index: 1;
        }

        .jjk-result {
            background: linear-gradient(145deg, rgba(139, 0, 0, 0.1), rgba(212, 175, 55, 0.05));
            border: 1px solid rgba(139, 0, 0, 0.25);
            border-radius: 20px;
            padding: 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
            animation: resultAppear 0.6s ease;
            margin-bottom: 20px;
        }

        @keyframes resultAppear {
            from {
                opacity: 0;
                transform: translateY(30px) scale(0.95);
            }
            to {
                opacity: 1;
                transform: translateY(0) scale(1);
            }
        }

        .jjk-result::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(139, 0, 0, 0.1) 0%, transparent 70%);
            animation: rotate 10s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        .jjk-result-label {
            color: #B0B0C0;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 4px;
            margin-bottom: 12px;
            position: relative;
            z-index: 1;
            font-family: 'Orbitron', sans-serif;
        }

        .jjk-result-value {
            color: #FF6B6B;
            font-family: 'Cinzel', serif;
            font-size: 3rem;
            font-weight: 900;
            text-shadow: 0 0 30px var(--jjk-sukuna-glow);
            position: relative;
            z-index: 1;
        }

        .jjk-result-unit {
            color: #B0B0C0;
            font-size: 1rem;
            margin-top: 8px;
            position: relative;
            z-index: 1;
        }

        .jjk-error {
            background: rgba(139, 0, 0, 0.1);
            border: 1px solid rgba(139, 0, 0, 0.3);
            color: #FF6B6B;
            padding: 18px;
            border-radius: 14px;
            margin-top: 25px;
            text-align: center;
            animation: resultAppear 0.4s ease;
            position: relative;
            z-index: 1;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
        }

        .jjk-footer {
            text-align: center;
            margin-top: 40px;
            padding-top: 25px;
            border-top: 1px solid var(--jjk-border);
            color: #9090A0;
            font-size: 0.9rem;
            position: relative;
            z-index: 1;
        }

        /* CORREGIDO: Logos mas pequeños */
        .logo-instituto {
            position: fixed;
            width: 100px;
            height: 100px;
            z-index: 1000;
            border-radius: 10px;
            border: 2px solid var(--jjk-sukuna);
            box-shadow: 0 0 15px var(--jjk-sukuna-glow), 0 0 30px rgba(139,0,0,0.15);
            background: rgba(10, 10, 15, 0.95);
            padding: 4px;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .logo-instituto:hover {
            transform: scale(1.08);
            box-shadow: 0 0 25px var(--jjk-sukuna-glow-bright), 0 0 50px rgba(139,0,0,0.25);
            border-color: var(--jjk-sukuna-bright);
        }

        .logo-instituto img {
            width: 100%;
            height: 100%;
            object-fit: contain;
            border-radius: 6px;
        }

        .logo-top-left { top: 15px; left: 90px; }
        .logo-top-right { top: 15px; right: 15px; }

        @media (max-width: 768px) {
            .exercise-page { padding-left: 0; }
            .back-nav { left: 80px; top: 70px; }
            .back-portafolio { top: 65px; right: 10px; }
            .logo-instituto { display: none; }
            .logo-top-left { display: none; }
            .logo-top-right { display: none; }
            .exercise-container { padding: 40px 25px; }
        }

        @media (max-width: 480px) {
            .logo-instituto { display: none; }
            .logo-top-left { display: none; }
        }
    </style>
</head>
<body>
    <!-- PRELOADER -->
    <div class="preloader-jjk" id="preloader">
        <div class="preloader-orb"></div>
        <div class="preloader-text">CARGANDO DOMINIO MALDITO...</div>
    </div>

    <!-- Logos eliminados de esta página -->

    <!-- Boton volver al menu de la semana -->
    <div class="back-nav">
        <a href="index.jsp">
            <i class="fas fa-arrow-left"></i> Volver al Menú
        </a>
    </div>

    <!-- Boton volver al portafolio -->
    <div class="back-portafolio">
        <a href="../../index.jsp#semanas">
            <i class="fas fa-home"></i> Portafolio
        </a>
    </div>

    <section class="exercise-page">
        <div class="exercise-container">
            <div class="exercise-header">
                <div class="exercise-number">Ejercicio 01</div>
                <h1 class="exercise-title">RECTÁNGULO</h1>
                <p class="exercise-desc">
                    Calcular el área y perímetro de un rectángulo conociendo su base y altura.
                </p>
            </div>

            <div class="formulas-box">
                <h3><i class="fas fa-function"></i> Fórmulas</h3>
                <div class="formula">Área = base × altura</div>
                <div class="formula">Perímetro = 2 × (base + altura)</div>
            </div>

            <form method="POST" action="calcular01">
                <div class="jjk-form-group">
                    <label for="base">
                        <i class="fas fa-ruler-horizontal"></i> Base
                    </label>
                    <input type="number" name="base" id="base" class="jjk-input" 
                           step="any" min="0" placeholder="Ingrese la base" required>
                </div>

                <div class="jjk-form-group">
                    <label for="altura">
                        <i class="fas fa-ruler-vertical"></i> Altura
                    </label>
                    <input type="number" name="altura" id="altura" class="jjk-input" 
                           step="any" min="0" placeholder="Ingrese la altura" required>
                </div>

                <button type="submit" class="jjk-submit">
                    <i class="fas fa-bolt"></i> Activar Técnica
                </button>
            </form>

            <!-- Area de resultados -->
            <div class="results-area">
                <% if (request.getAttribute("area") != null) { %>
                <div class="jjk-result">
                    <div class="jjk-result-label">Área</div>
                    <div class="jjk-result-value"><%= request.getAttribute("area") %></div>
                    <div class="jjk-result-unit">unidades²</div>
                </div>
                <div class="jjk-result">
                    <div class="jjk-result-label">Perímetro</div>
                    <div class="jjk-result-value"><%= request.getAttribute("perimetro") %></div>
                    <div class="jjk-result-unit">unidades</div>
                </div>
                <% } %>

                <% if (request.getAttribute("error") != null) { %>
                <div class="jjk-error">
                    <i class="fas fa-exclamation-triangle"></i> <%= request.getAttribute("error") %>
                </div>
                <% } %>
            </div>

            <div class="jjk-footer">
                <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
                <p style="margin-top: 8px; font-size: 0.8rem;">Diseño y Programación Web - IESTP</p>
            </div>
        </div>
    </section>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>