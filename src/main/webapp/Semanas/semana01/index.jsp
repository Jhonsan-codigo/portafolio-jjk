<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana 01 - Ejercicios | JJK</title>
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

        .ejercicios-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 30px;
            padding: 40px 20px 60px;
            max-width: 1300px;
            margin: 0 auto;
        }

        .ejercicio-card {
            background: linear-gradient(145deg, rgba(17,17,17,0.95), rgba(10,10,10,0.98));
            border: 1px solid var(--jjk-border);
            border-radius: 24px;
            padding: 35px;
            text-align: center;
            text-decoration: none;
            color: inherit;
            position: relative;
            overflow: hidden;
            transition: all 0.5s ease;
            display: block;
        }

        .ejercicio-card::before {
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

        .ejercicio-card:hover::before {
            opacity: 0.25;
        }

        .ejercicio-card:hover {
            transform: translateY(-12px) scale(1.02);
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 25px 50px rgba(139, 0, 0, 0.2), 0 0 80px rgba(139,0,0,0.1);
        }

        .ejercicio-num {
            font-family: 'Cinzel', serif;
            font-size: 4rem;
            font-weight: 900;
            color: var(--jjk-sukuna-bright);
            opacity: 0.25;
            line-height: 1;
            margin-bottom: 15px;
            text-shadow: 0 0 30px var(--jjk-sukuna-glow);
        }

        .ejercicio-title {
            font-family: 'Cinzel', serif;
            font-size: 1.3rem;
            margin-bottom: 12px;
            color: #FFFFFF;
            letter-spacing: 2px;
        }

        .ejercicio-desc {
            color: #B0B0C0;
            font-size: 0.95rem;
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .ejercicio-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 30px;
            background: linear-gradient(135deg, var(--jjk-sukuna), var(--jjk-sukuna-bright));
            color: var(--jjk-gold);
            border-radius: 12px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            text-decoration: none;
            transition: all 0.3s ease;
            font-weight: 700;
            border: none;
            cursor: pointer;
        }

        .ejercicio-btn:hover {
            box-shadow: 0 0 30px var(--jjk-sukuna-glow-bright);
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
            .ejercicios-grid { grid-template-columns: 1fr; }
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
            <div class="semana-number">01</div>
            <div class="semana-content">
                <!-- CORREGIDO: Imagen con fallback si no carga -->
                <div class="semana-character">
                    <img src="../../assets/Itadori.jpg" alt="Yuji Itadori" 
                         onerror="this.onerror=null; this.src='https://kimi-web-img.moonshot.cn/img/static.wikia.nocookie.net/1375e20e828320a558ef9ae87f791cf26dfc2ab2'; this.style.filter='brightness(0.8) saturate(0.9)';">
                </div>
                <div class="semana-power-badge">
                    <i class="fas fa-fist-raised"></i> Poder Maldito: Golpe Divergente
                </div>
                <span class="jjk-subtitle">Nivel de Entrenamiento</span>
                <!-- CORREGIDO: Titulo blanco brillante -->
                <h1 class="semana-title-main">SEMANA 01</h1>
                <p class="semana-desc-main">
                    Ejercicios fundamentales de programación. Domina las bases del cálculo geométrico 
                    antes de enfrentar maldiciones mayores.
                </p>
            </div>
        </section>

        <hr class="jjk-divider" style="max-width: 900px; margin: 0 auto;">

        <div class="ejercicios-grid">
            <a href="ejercicio01.jsp" class="ejercicio-card">
                <div class="ejercicio-num">01</div>
                <h3 class="ejercicio-title">RECTÁNGULO</h3>
                <p class="ejercicio-desc">Área y perímetro de un rectángulo conociendo su base y altura</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio02.jsp" class="ejercicio-card">
                <div class="ejercicio-num">02</div>
                <h3 class="ejercicio-title">CÍRCULO</h3>
                <p class="ejercicio-desc">Área y longitud de circunferencia conociendo su radio</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio03.jsp" class="ejercicio-card">
                <div class="ejercicio-num">03</div>
                <h3 class="ejercicio-title">ROMBO</h3>
                <p class="ejercicio-desc">Área de un rombo conociendo sus diagonales</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio04.jsp" class="ejercicio-card">
                <div class="ejercicio-num">04</div>
                <h3 class="ejercicio-title">CILINDRO</h3>
                <p class="ejercicio-desc">Área total y volumen de un cilindro conociendo radio y altura</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio05.jsp" class="ejercicio-card">
                <div class="ejercicio-num">05</div>
                <h3 class="ejercicio-title">CUBO</h3>
                <p class="ejercicio-desc">Área y volumen de un cubo conociendo su lado</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio06.jsp" class="ejercicio-card">
                <div class="ejercicio-num">06</div>
                <h3 class="ejercicio-title">DIVISIÓN ENTERA</h3>
                <p class="ejercicio-desc">Cociente y residuo de la división de dos números enteros</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio07.jsp" class="ejercicio-card">
                <div class="ejercicio-num">07</div>
                <h3 class="ejercicio-title">NÚMERO INVERTIDO</h3>
                <p class="ejercicio-desc">Invertir un número de 5 dígitos (ej: 12345 → 54321)</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio08.jsp" class="ejercicio-card">
                <div class="ejercicio-num">08</div>
                <h3 class="ejercicio-title">CONVERSIÓN DE TIEMPO</h3>
                <p class="ejercicio-desc">Convertir segundos en horas, minutos y segundos</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio09.jsp" class="ejercicio-card">
                <div class="ejercicio-num">09</div>
                <h3 class="ejercicio-title">REPARTO DE DINERO</h3>
                <p class="ejercicio-desc">Repartir dinero entre 5 hijos con porcentajes diferentes</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
                </span>
            </a>

            <a href="ejercicio10.jsp" class="ejercicio-card">
                <div class="ejercicio-num">10</div>
                <h3 class="ejercicio-title">GASTOS DE FERIA</h3>
                <p class="ejercicio-desc">Calcular gastos de una empresa en feria por rubros</p>
                <span class="ejercicio-btn">
                    <i class="fas fa-play"></i> Resolver
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