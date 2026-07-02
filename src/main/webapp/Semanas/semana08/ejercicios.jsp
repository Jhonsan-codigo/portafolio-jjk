<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana 08 - Ejercicios Math | JJK</title>
    <link rel="stylesheet" href="../../css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .ejercicios-page {
            min-height: 100vh;
            padding-left: 70px;
            position: relative;
        }

        .ejercicios-hero {
            min-height: 35vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            padding: 80px 20px 40px;
        }

        .ejercicios-hero::before {
            content: '';
            position: absolute;
            top: 50%; left: 50%;
            width: 500px; height: 500px;
            background: radial-gradient(circle, rgba(139, 0, 0, 0.2) 0%, transparent 70%);
            transform: translate(-50%, -50%);
            animation: heroGlow 4s ease-in-out infinite;
        }

        @keyframes heroGlow {
            0%, 100% { transform: translate(-50%, -50%) scale(1); opacity: 0.5; }
            50% { transform: translate(-50%, -50%) scale(1.2); opacity: 0.8; }
        }

        .semana-number {
            font-family: 'Cinzel', serif;
            font-size: 10rem;
            font-weight: 900;
            color: var(--jjk-sukuna-bright);
            opacity: 0.15;
            line-height: 1;
            position: absolute;
            top: 50%; left: 50%;
            transform: translate(-50%, -50%);
            z-index: 0;
            text-shadow: 0 0 100px var(--jjk-sukuna-glow);
        }

        .hero-content { position: relative; z-index: 1; }

        .semana-power-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 20px;
            background: rgba(139, 0, 0, 0.15);
            border: 1px solid var(--jjk-border);
            border-radius: 20px;
            color: #FF6B6B;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.8rem;
            letter-spacing: 3px;
            text-transform: uppercase;
            margin-bottom: 20px;
        }

        .semana-title-main {
            font-family: 'Cinzel', 'Orbitron', serif;
            font-size: clamp(2rem, 5vw, 3.5rem);
            font-weight: 900;
            color: #FF0000;
            text-align: center;
            display: block;
            width: 100%;
            text-shadow: 0 0 20px rgba(255,0,0,0.8), 0 0 40px rgba(139,0,0,0.5);
            letter-spacing: 8px;
            margin-bottom: 15px;
        }

        .semana-desc-main {
            color: #D0D0E0;
            max-width: 600px;
            margin: 20px auto 0;
            font-size: 1.1rem;
            line-height: 1.8;
        }

        .ejercicios-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(450px, 1fr));
            gap: 30px;
            padding: 40px 30px 60px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .ejercicio-card {
            background: linear-gradient(145deg, rgba(26,26,36,0.95), rgba(15,15,25,0.98));
            border: 1px solid rgba(139, 0, 0, 0.25);
            border-radius: 20px;
            padding: 0;
            position: relative;
            overflow: hidden;
            transition: all 0.5s ease;
            display: flex;
            flex-direction: column;
        }

        .ejercicio-card::before {
            content: '';
            position: absolute;
            top: 0; left: 0; right: 0;
            height: 3px;
            background: linear-gradient(90deg, var(--jjk-sukuna), var(--jjk-gold), var(--jjk-sukuna-bright));
            transform: scaleX(0);
            transition: transform 0.5s ease;
        }

        .ejercicio-card:hover::before { transform: scaleX(1); }

        .ejercicio-card:hover {
            transform: translateY(-10px) scale(1.02);
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 25px 50px rgba(139, 0, 0, 0.2), 0 0 80px rgba(139,0,0,0.1);
        }

        .card-header {
            padding: 30px 30px 20px;
            position: relative;
        }

        .difficulty-badge {
            position: absolute;
            top: 20px; right: 20px;
            padding: 5px 14px;
            border-radius: 12px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.7rem;
            letter-spacing: 2px;
            text-transform: uppercase;
            font-weight: 700;
        }

        .badge-facil {
            background: rgba(0, 200, 100, 0.15);
            border: 1px solid rgba(0, 200, 100, 0.3);
            color: #00C864;
        }

        .badge-intermedio {
            background: rgba(255, 165, 0, 0.15);
            border: 1px solid rgba(255, 165, 0, 0.3);
            color: #FFA500;
        }

        .card-icon {
            width: 55px; height: 55px;
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-bottom: 20px;
        }

        .icon-ej1 {
            background: linear-gradient(135deg, rgba(139,0,0,0.3), rgba(255,26,26,0.2));
            color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 20px rgba(139,0,0,0.2);
        }

        .icon-ej2 {
            background: linear-gradient(135deg, rgba(0,102,204,0.3), rgba(0,170,255,0.2));
            color: var(--jjk-gojo-bright);
            box-shadow: 0 0 20px rgba(0,102,204,0.2);
        }

        .card-title {
            font-family: 'Cinzel', serif;
            font-size: 1.4rem;
            color: #FFFFFF;
            margin-bottom: 10px;
            letter-spacing: 1px;
        }

        .card-desc {
            color: #A0A0B0;
            font-size: 0.9rem;
            line-height: 1.7;
            margin-bottom: 5px;
        }

        .card-body {
            padding: 0 30px 30px;
            flex: 1;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            color: var(--jjk-text-dim);
            font-size: 0.8rem;
            margin-bottom: 8px;
            font-family: 'Orbitron', sans-serif;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .form-group input {
            width: 100%;
            padding: 14px 18px;
            border: 2px solid var(--jjk-border);
            border-radius: 12px;
            background: rgba(10, 10, 15, 0.9);
            color: var(--jjk-text);
            font-size: 1rem;
            font-family: 'Noto Sans JP', 'Inter', sans-serif;
            transition: all 0.4s ease;
            outline: none;
        }

        .form-group input:focus {
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 20px var(--jjk-sukuna-glow);
        }

        .form-group input::placeholder {
            color: var(--jjk-text-dark);
            font-style: italic;
        }

        .catetos-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .submit-btn {
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

        .btn-ej1 {
            background: linear-gradient(135deg, var(--jjk-sukuna), var(--jjk-sukuna-bright));
            color: var(--jjk-gold);
        }

        .btn-ej1:hover {
            box-shadow: 0 0 30px var(--jjk-sukuna-glow-bright);
            transform: translateY(-2px);
        }

        .btn-ej2 {
            background: linear-gradient(135deg, var(--jjk-gojo), var(--jjk-gojo-bright));
            color: #FFFFFF;
        }

        .btn-ej2:hover {
            box-shadow: 0 0 30px var(--jjk-gojo-glow-bright);
            transform: translateY(-2px);
        }

        .resultado-box {
            margin-top: 20px;
            padding: 25px;
            border-radius: 16px;
            text-align: center;
            animation: resultAppear 0.6s cubic-bezier(0.4, 0, 0.2, 1);
        }

        @keyframes resultAppear {
            from { opacity: 0; transform: translateY(20px) scale(0.95); }
            to { opacity: 1; transform: translateY(0) scale(1); }
        }

        .resultado-label {
            color: var(--jjk-text-dim);
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            margin-bottom: 10px;
            font-family: 'Orbitron', sans-serif;
        }

        .resultado-valor {
            font-family: 'Cinzel', serif;
            font-size: 2.2rem;
            font-weight: 900;
            margin-bottom: 6px;
        }

        .resultado-formula {
            color: #808090;
            font-size: 0.85rem;
            font-family: 'Orbitron', sans-serif;
        }

        .res-ej1 {
            background: linear-gradient(145deg, rgba(139,0,0,0.12), rgba(212,175,55,0.05));
            border: 2px solid rgba(139,0,0,0.3);
        }

        .res-ej1 .resultado-valor {
            color: var(--jjk-sukuna-bright);
            text-shadow: 0 0 20px var(--jjk-sukuna-glow);
        }

        .res-ej2 {
            background: linear-gradient(145deg, rgba(0,102,204,0.12), rgba(212,175,55,0.05));
            border: 2px solid rgba(0,102,204,0.3);
        }

        .res-ej2 .resultado-valor {
            color: var(--jjk-gojo-bright);
            text-shadow: 0 0 20px var(--jjk-gojo-glow);
        }

        .error-msg {
            margin-top: 15px;
            padding: 14px;
            background: linear-gradient(145deg, rgba(139,0,0,0.15), rgba(50,0,0,0.2));
            border: 2px solid rgba(255,26,26,0.4);
            color: var(--jjk-sukuna-bright);
            border-radius: 12px;
            text-align: center;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            animation: shake 0.5s ease;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            20% { transform: translateX(-6px); }
            40% { transform: translateX(6px); }
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
            background: rgba(10, 10, 10, 0.95);
            border: 1px solid var(--jjk-border);
            border-radius: 14px;
            color: #C0C0D0;
            text-decoration: none;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            transition: all 0.3s ease;
            backdrop-filter: blur(20px);
        }

        .back-nav a:hover {
            border-color: var(--jjk-sukuna-bright);
            color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 25px var(--jjk-sukuna-glow);
            transform: translateX(-5px);
        }

        .footer-ej {
            text-align: center;
            padding: 40px;
            border-top: 1px solid var(--jjk-border);
            color: #9090A0;
            font-size: 0.9rem;
            margin-left: 70px;
        }

        @media (max-width: 768px) {
            .ejercicios-page { padding-left: 0; }
            .ejercicios-grid { grid-template-columns: 1fr; padding: 30px 15px; }
            .back-nav { left: 80px; top: 70px; }
            .catetos-row { grid-template-columns: 1fr; }
            .footer-ej { margin-left: 0; }
        }
    </style>
</head>
<body>
    <!-- PRELOADER -->
    <div class="preloader-jjk" id="preloader">
        <div class="preloader-orb"></div>
        <div class="preloader-text">CARGANDO DOMINIO MALDITO...</div>
    </div>

    <!-- SIDEBAR -->
    <nav class="jjk-sidebar">
        <div class="jjk-sidebar-toggle"><i class="fas fa-bars"></i></div>
        <div class="jjk-nav">
            <a href="../../index.jsp" class="jjk-nav-item">
                <i class="fas fa-home"></i>
                <span class="jjk-nav-text">Portafolio</span>
            </a>
            <a href="../../index.jsp#semanas" class="jjk-nav-item">
                <i class="fas fa-layer-group"></i>
                <span class="jjk-nav-text">Semanas</span>
            </a>
        </div>
        <div class="jjk-sidebar-footer">
            <div class="curse-mark">呪</div>
        </div>
    </nav>

    <!-- Boton volver -->
    <div class="back-nav">
        <a href="../../index.jsp#semanas">
            <i class="fas fa-arrow-left"></i> Volver al Portafolio
        </a>
    </div>

    <div class="ejercicios-page">
        <section class="ejercicios-hero">
            <div class="semana-number">08</div>
            <div class="hero-content">
                <div class="semana-power-badge">
                    <i class="fas fa-fist-raised"></i> Poder Maldito: Clase Math
                </div>
                <span class="jjk-subtitle">Nivel de Entrenamiento</span>
                <h1 class="semana-title-main">SEMANA 08</h1>
                <p class="semana-desc-main">
                    Dominio de métodos matemáticos de Java. Calcula áreas, hipotenusas y desata 
                    el poder de <strong style="color: var(--jjk-gold);">Math.PI</strong> y 
                    <strong style="color: var(--jjk-gojo-bright);">Math.hypot()</strong>.
                </p>
            </div>
        </section>

        <hr class="jjk-divider" style="max-width: 900px; margin: 0 auto;">

        <div class="ejercicios-grid">
            <!-- ========== EJERCICIO 1: ÁREA DE CÍRCULO ========== -->
            <div class="ejercicio-card">
                <div class="card-header">
                    <span class="difficulty-badge badge-facil">Fácil</span>
                    <div class="card-icon icon-ej1">
                        <i class="fas fa-circle-notch"></i>
                    </div>
                    <h3 class="card-title">Calculadora de Área de Círculos</h3>
                    <p class="card-desc">
                        Ingresa el radio y calcula el área usando 
                        <strong style="color: var(--jjk-gold);">Math.PI</strong> y 
                        <strong style="color: var(--jjk-gold);">Math.pow()</strong>
                    </p>
                </div>
                <div class="card-body">
                    <!-- CORREGIDO: action con ruta absoluta desde contexto -->
                    <form action="${pageContext.request.contextPath}/Semanas/semana08/calcular" method="POST">
                        <input type="hidden" name="ejercicio" value="1">
                        <div class="form-group">
                            <label for="radio"><i class="fas fa-ruler"></i> Radio</label>
                            <input type="number" id="radio" name="radio" step="any" min="0" 
                                   placeholder="Ejemplo: 5.5" required>
                        </div>
                        <button type="submit" class="submit-btn btn-ej1">
                            <i class="fas fa-calculator"></i> Calcular Área
                        </button>
                    </form>

                    <% 
                        if ("1".equals(request.getAttribute("ejercicioNum"))) {
                            String error = (String) request.getAttribute("error");
                            if (error != null) {
                    %>
                        <div class="error-msg"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
                    <% 
                            } else {
                                String area = (String) request.getAttribute("area");
                                String radioVal = (String) request.getAttribute("radio");
                    %>
                        <div class="resultado-box res-ej1">
                            <div class="resultado-label">Área del Círculo</div>
                            <div class="resultado-valor"><%= area %></div>
                            <div class="resultado-formula">π × <%= radioVal %>² = <%= area %></div>
                        </div>
                    <% 
                            }
                        }
                    %>
                </div>
            </div>

            <!-- ========== EJERCICIO 2: PITÁGORAS EXPRESS ========== -->
            <div class="ejercicio-card">
                <div class="card-header">
                    <span class="difficulty-badge badge-intermedio">Intermedio</span>
                    <div class="card-icon icon-ej2">
                        <i class="fas fa-draw-polygon"></i>
                    </div>
                    <h3 class="card-title">Teorema de Pitágoras Express</h3>
                    <p class="card-desc">
                        Dos catetos, una hipotenusa. Usa 
                        <strong style="color: var(--jjk-gojo-bright);">Math.hypot()</strong> 
                        para evitar desbordamiento
                    </p>
                </div>
                <div class="card-body">
                    <!-- CORREGIDO: action con ruta absoluta desde contexto -->
                    <form action="${pageContext.request.contextPath}/Semanas/semana08/calcular" method="POST">
                        <input type="hidden" name="ejercicio" value="2">
                        <div class="catetos-row">
                            <div class="form-group">
                                <label for="catetoA"><i class="fas fa-arrows-alt-h"></i> Cateto A</label>
                                <input type="number" id="catetoA" name="catetoA" step="any" 
                                       placeholder="Ej: 3" required>
                            </div>
                            <div class="form-group">
                                <label for="catetoB"><i class="fas fa-arrows-alt-v"></i> Cateto B</label>
                                <input type="number" id="catetoB" name="catetoB" step="any" 
                                       placeholder="Ej: 4" required>
                            </div>
                        </div>
                        <button type="submit" class="submit-btn btn-ej2">
                            <i class="fas fa-calculator"></i> Calcular Hipotenusa
                        </button>
                    </form>

                    <% 
                        if ("2".equals(request.getAttribute("ejercicioNum"))) {
                            String error = (String) request.getAttribute("error");
                            if (error != null) {
                    %>
                        <div class="error-msg"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
                    <% 
                            } else {
                                String hipotenusa = (String) request.getAttribute("hipotenusa");
                                String catA = (String) request.getAttribute("catetoA");
                                String catB = (String) request.getAttribute("catetoB");
                    %>
                        <div class="resultado-box res-ej2">
                            <div class="resultado-label">Hipotenusa</div>
                            <div class="resultado-valor"><%= hipotenusa %></div>
                            <div class="resultado-formula">hypot(<%= catA %>, <%= catB %>) = <%= hipotenusa %></div>
                        </div>
                    <% 
                            }
                        }
                    %>
                </div>
            </div>
        </div>

        <footer class="footer-ej">
            <div class="curse-mark" style="font-size: 2rem; color: var(--jjk-sukuna-bright); opacity: 0.3; margin-bottom: 10px;">呪</div>
            <p>&copy; 2026 Jhon Contreras. Todos los derechos reservados.</p>
            <p style="margin-top: 10px; font-size: 0.85rem; font-family: 'Cinzel', serif;">"No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones."</p>
        </footer>
    </div>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>