<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 02 - Sistema Anti-Overflow | JJK</title>
    <link rel="stylesheet" href="../../css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .ejercicios-page {
            min-height: 100vh;
            padding-left: 70px;
            position: relative;
            background: radial-gradient(ellipse at center, rgba(20,0,40,0.2) 0%, var(--jjk-bg) 70%);
        }

        .ejercicios-hero {
            min-height: 30vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            padding: 80px 20px 30px;
        }

        .semana-number {
            font-family: 'Cinzel', serif;
            font-size: 8rem;
            font-weight: 900;
            color: transparent;
            -webkit-text-stroke: 2px rgba(139, 0, 0, 0.15);
            opacity: 0.3;
            line-height: 1;
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            z-index: 0;
        }

        .hero-content { position: relative; z-index: 1; }

        .semana-power-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 20px;
            background: rgba(139, 0, 0, 0.15);
            border: 1px solid rgba(139, 0, 0, 0.3);
            border-radius: 20px;
            color: #FF6B6B;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.8rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 15px;
        }

        .semana-title-main {
            font-family: 'Cinzel', 'Orbitron', serif;
            font-size: clamp(1.8rem, 4vw, 3rem);
            font-weight: 900;
            color: #FF0000;
            text-align: center;
            letter-spacing: 8px;
            margin-bottom: 10px;
            text-shadow: 0 0 20px rgba(255,0,0,0.6), 0 0 40px rgba(139,0,0,0.3);
        }

        .semana-desc-main {
            color: #B0B0C8;
            max-width: 500px;
            margin: 0 auto;
            font-size: 1rem;
            line-height: 1.8;
        }

        .ejercicios-grid {
            display: grid;
            grid-template-columns: 1fr;
            gap: 35px;
            padding: 40px 30px 60px;
            max-width: 700px;
            margin: 0 auto;
        }

        .carta-maldita {
            background: linear-gradient(145deg, rgba(15,15,25,0.98), rgba(8,8,15,0.99));
            border: 1px solid rgba(139, 0, 0, 0.2);
            border-radius: 24px;
            padding: 0;
            position: relative;
            overflow: hidden;
            transition: all 0.5s ease;
            display: flex;
            flex-direction: column;
        }

        .carta-maldita::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, #FFA500, var(--jjk-gold));
            transform: scaleX(0);
            transition: transform 0.5s ease;
        }

        .carta-maldita:hover::before { transform: scaleX(1); }

        .carta-maldita:hover {
            transform: translateY(-10px);
            border-color: rgba(255, 165, 0, 0.4);
            box-shadow: 0 20px 50px rgba(255, 165, 0, 0.15), 0 0 60px rgba(255,165,0,0.08);
        }

        .carta-header {
            padding: 35px 30px 25px;
            position: relative;
        }

        .dificultad {
            position: absolute;
            top: 20px; right: 20px;
            padding: 5px 14px;
            border-radius: 10px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 700;
        }

        .dif-intermedio {
            background: rgba(255, 165, 0, 0.12);
            border: 1px solid rgba(255, 165, 0, 0.25);
            color: #FFA500;
        }

        .carta-icono {
            width: 60px; height: 60px;
            border-radius: 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.6rem;
            margin-bottom: 20px;
        }

        .icono-overflow {
            background: linear-gradient(135deg, rgba(255,165,0,0.25), rgba(100,50,0,0.2));
            color: #FFA500;
            box-shadow: 0 0 25px rgba(255,165,0,0.15);
        }

        .carta-titulo {
            font-family: 'Cinzel', serif;
            font-size: 1.3rem;
            color: #FFFFFF;
            margin-bottom: 8px;
            letter-spacing: 2px;
        }

        .carta-desc {
            color: #9090A8;
            font-size: 0.9rem;
            line-height: 1.7;
        }

        .carta-body {
            padding: 0 30px 35px;
            flex: 1;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            color: #A0A0B8;
            font-size: 0.8rem;
            margin-bottom: 8px;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .form-group input {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid rgba(255, 165, 0, 0.2);
            border-radius: 12px;
            background: rgba(8, 8, 15, 0.9);
            color: #E0E0F0;
            font-size: 1rem;
            font-family: 'Noto Sans JP', 'Inter', sans-serif;
            transition: all 0.4s ease;
            outline: none;
        }

        .form-group input:focus {
            border-color: #FFA500;
            box-shadow: 0 0 20px rgba(255,165,0,0.15);
        }

        .form-group input::placeholder {
            color: #505060;
            font-style: italic;
        }

        .btn-lanzar {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 12px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            font-weight: 700;
            letter-spacing: 2px;
            text-transform: uppercase;
            cursor: pointer;
            transition: all 0.4s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .btn-overflow {
            background: linear-gradient(135deg, rgba(255,165,0,0.8), rgba(150,80,0,0.9));
            color: #FFFFFF;
        }

        .btn-overflow:hover {
            box-shadow: 0 0 30px rgba(255,165,0,0.3);
            transform: translateY(-2px);
        }

        .resultado-caja {
            margin-top: 20px;
            padding: 25px;
            border-radius: 16px;
            text-align: center;
            animation: aparecer 0.6s ease;
        }

        @keyframes aparecer {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .resultado-label {
            color: #808090;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 10px;
            font-family: 'Orbitron', sans-serif;
        }

        .resultado-valor {
            font-family: 'Cinzel', serif;
            font-size: 2.5rem;
            font-weight: 900;
            margin-bottom: 8px;
        }

        .resultado-detalles {
            color: #606070;
            font-size: 0.85rem;
            font-family: 'Orbitron', sans-serif;
            margin-top: 10px;
        }

        .res-overflow {
            background: linear-gradient(145deg, rgba(255,165,0,0.1), rgba(100,50,0,0.05));
            border: 2px solid rgba(255,165,0,0.25);
        }

        .res-overflow .resultado-valor {
            color: #FFA500;
            text-shadow: 0 0 20px rgba(255,165,0,0.3);
        }

        .secuencia-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(100px, 1fr));
            gap: 10px;
            margin-top: 15px;
        }

        .secuencia-item {
            padding: 12px;
            background: rgba(0,0,0,0.3);
            border-radius: 10px;
            border: 1px solid rgba(255,165,0,0.2);
            text-align: center;
        }

        .secuencia-item .sec-potencia {
            color: #808090;
            font-size: 0.7rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-family: 'Orbitron', sans-serif;
            margin-bottom: 4px;
        }

        .secuencia-item .sec-valor {
            color: #FFA500;
            font-family: 'Cinzel', serif;
            font-size: 1.1rem;
            font-weight: 900;
        }

        .warning-msg {
            margin-top: 15px;
            padding: 14px;
            background: linear-gradient(145deg, rgba(255,165,0,0.12), rgba(100,50,0,0.15));
            border: 1px solid rgba(255,165,0,0.3);
            color: #FFAA33;
            border-radius: 12px;
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            animation: shake 0.5s ease;
        }

        .error-msg {
            margin-top: 15px;
            padding: 14px;
            background: linear-gradient(145deg, rgba(139,0,0,0.12), rgba(50,0,0,0.15));
            border: 1px solid rgba(255,26,26,0.3);
            color: #FF6666;
            border-radius: 12px;
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-5px); }
            40% { transform: translateX(5px); }
            60% { transform: translateX(-3px); }
            80% { transform: translateX(3px); }
        }

        .back-nav {
            position: fixed;
            top: 80px; left: 100px;
            z-index: 100;
        }

        .back-nav a {
            display: inline-flex;
            align-items: center;
            gap: 12px;
            padding: 14px 24px;
            background: rgba(10, 10, 15, 0.95);
            border: 1px solid rgba(139, 0, 0, 0.2);
            border-radius: 14px;
            color: #A0A0B0;
            text-decoration: none;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            backdrop-filter: blur(20px);
        }

        .back-nav a:hover {
            border-color: #FFA500;
            color: #FFA500;
            box-shadow: 0 0 20px rgba(255,165,0,0.15);
            transform: translateX(-5px);
        }

        .footer-ej {
            text-align: center;
            padding: 40px;
            border-top: 1px solid rgba(139, 0, 0, 0.1);
            color: #606070;
            font-size: 0.9rem;
            margin-left: 70px;
        }

        @media (max-width: 768px) {
            .ejercicios-page { padding-left: 0; }
            .secuencia-grid { grid-template-columns: repeat(2, 1fr); }
            .back-nav { left: 80px; top: 70px; }
            .footer-ej { margin-left: 0; }
        }
    </style>
</head>
<body>
    <!-- PRELOADER -->
    <div class="preloader-jjk" id="preloader">
        <div class="preloader-orb"></div>
        <div class="preloader-text">INVOCANDO DOMINIO...</div>
    </div>

    <!-- SIDEBAR -->
    <nav class="jjk-sidebar">
        <div class="jjk-sidebar-toggle"><i class="fas fa-bars"></i></div>
        <div class="jjk-nav">
            <a href="../../index.jsp" class="jjk-nav-item">
                <i class="fas fa-home"></i>
                <span class="jjk-nav-text">Portafolio</span>
            </a>
            <a href="index.jsp" class="jjk-nav-item">
                <i class="fas fa-layer-group"></i>
                <span class="jjk-nav-text">Ejercicios</span>
            </a>
        </div>
        <div class="jjk-sidebar-footer">
            <div class="curse-mark">呪</div>
        </div>
    </nav>

    <!-- Botón volver -->
    <div class="back-nav">
        <a href="index.jsp">
            <i class="fas fa-arrow-left"></i> Volver a Semana 10
        </a>
    </div>

    <div class="ejercicios-page">
        <section class="ejercicios-hero">
            <div class="semana-number">10</div>
            <div class="hero-content">
                <div class="semana-power-badge">
                    <i class="fas fa-shield-alt"></i> Dominio de Protección
                </div>
                <h1 class="semana-title-main">SISTEMA ANTI-OVERFLOW</h1>
                <p class="semana-desc-main">
                    Multiplica un número por sí mismo sucesivamente usando <strong style="color: #FFA500;">Math.multiplyExact()</strong> para detectar desbordamiento antes de que ocurra.
                </p>
            </div>
        </section>

        <hr class="jjk-divider" style="max-width: 800px; margin: 0 auto;">

        <div class="ejercicios-grid">
            <div class="carta-maldita">
                <div class="carta-header">
                    <span class="dificultad dif-intermedio">Intermedio</span>
                    <div class="carta-icono icono-overflow">
                        <i class="fas fa-shield-virus"></i>
                    </div>
                    <h3 class="carta-titulo">Bucle de Potencias Seguro</h3>
                    <p class="carta-desc">
                        Ingresa un <strong style="color: #FFA500;">número entero</strong> y observa cómo se multiplica por sí mismo hasta que el sistema detecta un posible desbordamiento de <strong style="color: var(--jjk-gold);">int</strong>.
                    </p>
                </div>
                <div class="carta-body">
                    <form action="calcular02" method="POST">
                        <div class="form-group">
                            <label for="numero"><i class="fas fa-hashtag"></i> Número Entero</label>
                            <input type="number" id="numero" name="numero" 
                                   placeholder="Ejemplo: 2, 3, 10, -5..." required>
                        </div>
                        <button type="submit" class="btn-lanzar btn-overflow">
                            <i class="fas fa-play"></i> Iniciar Secuencia
                        </button>
                    </form>

                    <% 
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                        <div class="error-msg"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
                    <% 
                        } else {
                            String numeroInicial = (String) request.getAttribute("numeroInicial");
                            java.util.List<String> secuencia = (java.util.List<String>) request.getAttribute("secuencia");
                            String ultimoValido = (String) request.getAttribute("ultimoValido");
                            String potenciaMaxima = (String) request.getAttribute("potenciaMaxima");
                            String mensajeWarning = (String) request.getAttribute("mensajeWarning");
                            
                            if (numeroInicial != null && secuencia != null) {
                    %>
                        <div class="resultado-caja res-overflow">
                            <div class="resultado-label">Secuencia de Potencias</div>
                            <div class="resultado-detalles" style="margin-bottom: 15px;">
                                Número base: <strong style="color: #FFA500;"><%= numeroInicial %></strong> | 
                                Potencia máxima segura: <strong style="color: #FFA500;"><%= potenciaMaxima %></strong>
                            </div>
                            <div class="secuencia-grid">
                                <% for (String paso : secuencia) { %>
                                    <div class="secuencia-item">
                                        <div class="sec-potencia"><%= paso.split(":")[0] %></div>
                                        <div class="sec-valor"><%= paso.split(":")[1] %></div>
                                    </div>
                                <% } %>
                            </div>
                            <% if (mensajeWarning != null) { %>
                                <div class="warning-msg" style="margin-top: 15px;">
                                    <i class="fas fa-radiation"></i> <%= mensajeWarning %>
                                </div>
                            <% } %>
                            <div class="resultado-detalles" style="margin-top: 15px;">
                                Último valor seguro: <strong style="color: #FFA500;"><%= ultimoValido %></strong>
                            </div>
                        </div>
                    <% 
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <footer class="footer-ej">
            <div class="curse-mark" style="font-size: 2.5rem; color: #FFA500; opacity: 0.2; margin-bottom: 10px;">呪</div>
            <p>&copy; 2026 Jhon Contreras. Todos los derechos reservados.</p>
            <p style="margin-top: 10px; font-size: 0.85rem; font-family: 'Cinzel', serif; color: #505060;">
                "El desbordamiento es la maldición que acecha a todo programador descuidado."
            </p>
        </footer>
    </div>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>