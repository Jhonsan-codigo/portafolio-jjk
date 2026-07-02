<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana 08 - Ejercicios | JJK</title>
    <link rel="stylesheet" href="../../css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .semana-page {
            min-height: 100vh;
            padding-left: 70px;
            position: relative;
        }

        .semana-hero {
            min-height: 45vh;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            position: relative;
            padding: 80px 20px 40px;
        }

        .semana-hero::before {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            width: 500px;
            height: 500px;
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
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            z-index: 0;
            text-shadow: 0 0 100px var(--jjk-sukuna-glow);
        }

        .semana-content {
            position: relative;
            z-index: 1;
        }

        .semana-power-badge {
            display: inline-block;
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

        /* CORREGIDO: Imagen del personaje con fallback */
        .semana-character {
            width: 180px;
            height: 180px;
            border-radius: 50%;
            border: 3px solid var(--jjk-sukuna);
            margin: 0 auto 30px;
            overflow: hidden;
            box-shadow: 0 0 40px var(--jjk-sukuna-glow), 0 0 80px rgba(139,0,0,0.2);
            position: relative;
            background: linear-gradient(145deg, #1a1a24, #0a0a0f);
        }

        .semana-character img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(0.8) saturate(0.9);
            transition: all 0.4s ease;
        }

        .semana-character:hover img {
            filter: brightness(1) saturate(1.1);
            transform: scale(1.1);
        }

        .semana-character::after {
            content: '';
            position: absolute;
            top: -5px;
            left: -5px;
            right: -5px;
            bottom: -5px;
            border-radius: 50%;
            border: 2px solid transparent;
            background: linear-gradient(45deg, var(--jjk-sukuna), var(--jjk-gold), var(--jjk-sukuna-bright)) border-box;
            -webkit-mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
            mask: linear-gradient(#fff 0 0) padding-box, linear-gradient(#fff 0 0);
            -webkit-mask-composite: xor;
            mask-composite: exclude;
            animation: rotate 8s linear infinite;
        }

        @keyframes rotate {
            from { transform: rotate(0deg); }
            to { transform: rotate(360deg); }
        }

        /* ROJO PURO CENTRADO */
        .semana-title-main {
            font-family: 'Cinzel', 'Orbitron', serif;
            font-size: clamp(2rem, 5vw, 3.5rem);
            font-weight: 900;
            color: #FF0000;
            text-align: center;
            display: block;
            width: 100%;
            text-shadow: 0 0 20px rgba(255,0,0,0.8), 0 0 40px rgba(139,0,0,0.5), 0 0 80px rgba(139,0,0,0.3);
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

        /* ====== UNA SOLA TARJETA GRANDE ====== */
        .ejercicios-container {
            display: flex;
            justify-content: center;
            padding: 40px 20px 60px;
            max-width: 900px;
            margin: 0 auto;
        }

        .ejercicio-card-unica {
            background: linear-gradient(145deg, rgba(17,17,17,0.95), rgba(10,10,10,0.98));
            border: 1px solid var(--jjk-border);
            border-radius: 24px;
            padding: 50px 40px;
            text-align: center;
            text-decoration: none;
            color: inherit;
            position: relative;
            overflow: hidden;
            transition: all 0.5s ease;
            display: block;
            width: 100%;
            max-width: 600px;
        }

        .ejercicio-card-unica::before {
            content: '';
            position: absolute;
            top: -2px;
            left: -2px;
            right: -2px;
            bottom: -2px;
            background: linear-gradient(45deg, var(--jjk-sukuna), var(--jjk-gold), var(--jjk-sukuna-bright));
            border-radius: 24px;
            opacity: 0;
            z-index: -1;
            transition: opacity 0.5s ease;
        }

        .ejercicio-card-unica:hover::before {
            opacity: 0.25;
        }

        .ejercicio-card-unica:hover {
            transform: translateY(-12px) scale(1.02);
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 25px 50px rgba(139, 0, 0, 0.2), 0 0 80px rgba(139,0,0,0.1);
        }

        .ejercicio-num-grande {
            font-family: 'Cinzel', serif;
            font-size: 5rem;
            font-weight: 900;
            color: var(--jjk-sukuna-bright);
            opacity: 0.25;
            line-height: 1;
            margin-bottom: 20px;
            text-shadow: 0 0 30px var(--jjk-sukuna-glow);
        }

        .ejercicio-titulo-grande {
            font-family: 'Cinzel', serif;
            font-size: 1.6rem;
            margin-bottom: 15px;
            color: #FFFFFF;
            letter-spacing: 3px;
        }

        .ejercicio-desc-grande {
            color: #B0B0C0;
            font-size: 1rem;
            line-height: 1.8;
            margin-bottom: 30px;
        }

        .ejercicios-lista {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-bottom: 30px;
            text-align: left;
            max-width: 400px;
            margin-left: auto;
            margin-right: auto;
        }

        .ejercicio-item {
            display: flex;
            align-items: center;
            gap: 15px;
            padding: 12px 20px;
            background: rgba(139, 0, 0, 0.08);
            border: 1px solid rgba(139, 0, 0, 0.2);
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .ejercicio-item:hover {
            border-color: var(--jjk-sukuna-bright);
            background: rgba(139, 0, 0, 0.15);
            transform: translateX(5px);
        }

        .ejercicio-item-num {
            font-family: 'Cinzel', serif;
            font-size: 1.2rem;
            font-weight: 900;
            color: var(--jjk-sukuna-bright);
            width: 30px;
            text-align: center;
        }

        .ejercicio-item-text {
            color: #D0D0E0;
            font-size: 0.9rem;
        }

        .ejercicio-btn-grande {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 16px 40px;
            background: linear-gradient(135deg, var(--jjk-sukuna), var(--jjk-sukuna-bright));
            color: var(--jjk-gold);
            border-radius: 14px;
            font-family: 'Orbitron', sans-serif;
            font-size: 1rem;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 700;
            border: none;
            cursor: pointer;
        }

        .ejercicio-btn-grande:hover {
            box-shadow: 0 0 40px var(--jjk-sukuna-glow-bright);
            transform: translateY(-3px);
        }

        /* CORREGIDO: Boton volver mejor posicionado */
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

        .curse-symbol {
            position: fixed;
            bottom: 40px;
            right: 40px;
            font-size: 4rem;
            color: var(--jjk-sukuna-bright);
            opacity: 0.08;
            font-family: 'Noto Sans JP', sans-serif;
            pointer-events: none;
            z-index: 0;
            animation: float 4s ease-in-out infinite;
        }

        /* CORREGIDO: Logos mas pequeños y mejor posicionados */
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
            .semana-page { padding-left: 0; }
            .back-nav { left: 80px; top: 70px; }
            .logo-instituto { display: none; }
            .logo-top-left { display: none; }
            .logo-top-right { display: none; }
            .semana-number { font-size: 6rem; }
            .ejercicio-card-unica { padding: 35px 25px; }
            .ejercicio-num-grande { font-size: 3.5rem; }
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

    <!-- SIDEBAR -->
    <nav class="jjk-sidebar">
        <div class="jjk-sidebar-toggle">
            <i class="fas fa-bars"></i>
        </div>
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

    <!-- Logos eliminados de esta página -->

    <!-- Boton volver al portafolio -->
    <div class="back-nav">
        <a href="../../index.jsp#semanas">
            <i class="fas fa-arrow-left"></i> Volver al Portafolio
        </a>
    </div>

    <div class="semana-page">
        <section class="semana-hero">
            <div class="semana-number">08</div>
            <div class="semana-content">
                <!-- CORREGIDO: Imagen con fallback si no carga -->
                <div class="semana-character">
                    <img src="../../assets/Itadori.jpg" alt="Yuji Itadori" 
                         onerror="this.onerror=null; this.src='https://kimi-web-img.moonshot.cn/img/static.wikia.nocookie.net/1375e20e828320a558ef9ae87f791cf26dfc2ab2'; this.style.filter='brightness(0.8) saturate(0.9)';">
                </div>
                <div class="semana-power-badge">
                    <i class="fas fa-fist-raised"></i> Poder Maldito: Clase Math
                </div>
                <span class="jjk-subtitle">Nivel de Entrenamiento</span>
                <!-- CORREGIDO: Titulo blanco brillante -->
                <h1 class="semana-title-main">SEMANA 08</h1>
                <p class="semana-desc-main">
                    Dominio de métodos matemáticos de Java. Calcula áreas, hipotenusas y desata 
                    el poder de <strong style="color: var(--jjk-gold);">Math.PI</strong> y 
                    <strong style="color: var(--jjk-gojo-bright);">Math.hypot()</strong>.
                </p>
            </div>
        </section>

        <hr class="jjk-divider" style="max-width: 900px; margin: 0 auto;">

        <!-- UNA SOLA TARJETA CON AMBOS EJERCICIOS -->
        <div class="ejercicios-container">
            <a href="ejercicios.jsp" class="ejercicio-card-unica">
                <div class="ejercicio-num-grande">01 - 02</div>
                <h3 class="ejercicio-titulo-grande">EJERCICIOS MATH</h3>
                <p class="ejercicio-desc-grande">
                    Dos desafíos matemáticos te esperan. Domina el cálculo geométrico 
                    con los métodos de la clase Math.
                </p>
                
                <div class="ejercicios-lista">
                    <div class="ejercicio-item">
                        <span class="ejercicio-item-num">01</span>
                        <span class="ejercicio-item-text">Área de Círculo — Math.PI + Math.pow()</span>
                    </div>
                    <div class="ejercicio-item">
                        <span class="ejercicio-item-num">02</span>
                        <span class="ejercicio-item-text">Pitágoras Express — Math.hypot()</span>
                    </div>
                </div>

                <span class="ejercicio-btn-grande">
                    <i class="fas fa-play"></i> Resolver Ejercicios
                </span>
            </a>
        </div>

        <footer class="jjk-footer" style="padding-left: 70px;">
            <div class="curse-mark">呪</div>
            <p>&copy; 2026 Jhon Contreras. Todos los derechos reservados.</p>
            <p style="margin-top: 15px; font-size: 0.9rem; font-family: 'Cinzel', serif;">"No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones."</p>
        </footer>
    </div>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>