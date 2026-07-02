<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ejercicio 01 - Conversor Trigonométrico | JJK</title>
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
            background: linear-gradient(90deg, var(--jjk-sukuna), var(--jjk-gold));
            transform: scaleX(0);
            transition: transform 0.5s ease;
        }

        .carta-maldita:hover::before { transform: scaleX(1); }

        .carta-maldita:hover {
            transform: translateY(-10px);
            border-color: rgba(139, 0, 0, 0.4);
            box-shadow: 0 20px 50px rgba(139, 0, 0, 0.15), 0 0 60px rgba(139,0,0,0.08);
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

        .dif-facil {
            background: rgba(0, 200, 100, 0.12);
            border: 1px solid rgba(0, 200, 100, 0.25);
            color: #00C864;
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

        .icono-trig {
            background: linear-gradient(135deg, rgba(139,0,0,0.25), rgba(80,0,80,0.2));
            color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 25px rgba(139,0,0,0.15);
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
            border: 2px solid rgba(139, 0, 0, 0.2);
            border-radius: 12px;
            background: rgba(8, 8, 15, 0.9);
            color: #E0E0F0;
            font-size: 1rem;
            font-family: 'Noto Sans JP', 'Inter', sans-serif;
            transition: all 0.4s ease;
            outline: none;
        }

        .form-group input:focus {
            border-color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 20px rgba(139,0,0,0.15);
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

        .btn-trig {
            background: linear-gradient(135deg, var(--jjk-sukuna), rgba(100,0,0,0.9));
            color: var(--jjk-gold);
        }

        .btn-trig:hover {
            box-shadow: 0 0 30px rgba(139,0,0,0.3);
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

        .res-trig {
            background: linear-gradient(145deg, rgba(139,0,0,0.1), rgba(80,0,80,0.05));
            border: 2px solid rgba(139,0,0,0.25);
        }

        .res-trig .resultado-valor {
            color: var(--jjk-sukuna-bright);
            text-shadow: 0 0 20px rgba(139,0,0,0.3);
        }

        .trig-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 15px;
        }

        .trig-item {
            padding: 15px;
            background: rgba(0,0,0,0.3);
            border-radius: 12px;
            border: 1px solid rgba(139,0,0,0.2);
        }

        .trig-item .trig-label {
            color: #808090;
            font-size: 0.75rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-family: 'Orbitron', sans-serif;
            margin-bottom: 5px;
        }

        .trig-item .trig-valor {
            color: var(--jjk-sukuna-bright);
            font-family: 'Cinzel', serif;
            font-size: 1.3rem;
            font-weight: 900;
        }

        .radianes-info {
            color: #606070;
            font-size: 0.85rem;
            font-family: 'Orbitron', sans-serif;
            margin-bottom: 15px;
            padding: 10px;
            background: rgba(139,0,0,0.05);
            border-radius: 8px;
            border: 1px solid rgba(139,0,0,0.1);
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
            border-color: var(--jjk-sukuna-bright);
            color: var(--jjk-sukuna-bright);
            box-shadow: 0 0 20px rgba(139,0,0,0.15);
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
            .trig-grid { grid-template-columns: 1fr; }
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
                    <i class="fas fa-wave-square"></i> Dominio Trigonométrico
                </div>
                <h1 class="semana-title-main">CONVERSOR TRIGONOMÉTRICO</h1>
                <p class="semana-desc-main">
                    Transforma grados en radianes y desata el poder del seno, coseno y tangente con precisión maldita.
                </p>
            </div>
        </section>

        <hr class="jjk-divider" style="max-width: 800px; margin: 0 auto;">

        <div class="ejercicios-grid">
            <div class="carta-maldita">
                <div class="carta-header">
                    <span class="dificultad dif-facil">Fácil</span>
                    <div class="carta-icono icono-trig">
                        <i class="fas fa-wave-square"></i>
                    </div>
                    <h3 class="carta-titulo">Analizador de Ángulos</h3>
                    <p class="carta-desc">
                        Ingresa un ángulo en <strong style="color: var(--jjk-gold);">grados</strong> y obtén su conversión a radianes junto con sus funciones trigonométricas redondeadas a <strong style="color: var(--jjk-sukuna-bright);">4 decimales</strong>.
                    </p>
                </div>
                <div class="carta-body">
                    <form action="calcular01" method="POST">
                        <div class="form-group">
                            <label for="grados"><i class="fas fa-ruler-angle"></i> Ángulo en Grados</label>
                            <input type="number" id="grados" name="grados" step="any" 
                                   placeholder="Ejemplo: 45, 90, 180..." required>
                        </div>
                        <button type="submit" class="btn-lanzar btn-trig">
                            <i class="fas fa-magic"></i> Calcular Funciones
                        </button>
                    </form>

                    <% 
                        String error = (String) request.getAttribute("error");
                        if (error != null) {
                    %>
                        <div class="error-msg"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
                    <% 
                        } else {
                            String grados = (String) request.getAttribute("grados");
                            String radianes = (String) request.getAttribute("radianes");
                            String seno = (String) request.getAttribute("seno");
                            String coseno = (String) request.getAttribute("coseno");
                            String tangente = (String) request.getAttribute("tangente");
                            
                            if (grados != null) {
                    %>
                        <div class="resultado-caja res-trig">
                            <div class="resultado-label">Resultados del Ángulo</div>
                            <div class="radianes-info">
                                <i class="fas fa-exchange-alt"></i> <%= grados %>° = <%= radianes %> rad
                            </div>
                            <div class="trig-grid">
                                <div class="trig-item">
                                    <div class="trig-label">Seno (sin)</div>
                                    <div class="trig-valor"><%= seno %></div>
                                </div>
                                <div class="trig-item">
                                    <div class="trig-label">Coseno (cos)</div>
                                    <div class="trig-valor"><%= coseno %></div>
                                </div>
                                <div class="trig-item">
                                    <div class="trig-label">Tangente (tan)</div>
                                    <div class="trig-valor"><%= tangente %></div>
                                </div>
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
            <div class="curse-mark" style="font-size: 2.5rem; color: var(--jjk-sukuna-bright); opacity: 0.2; margin-bottom: 10px;">呪</div>
            <p>&copy; 2026 Jhon Contreras. Todos los derechos reservados.</p>
            <p style="margin-top: 10px; font-size: 0.85rem; font-family: 'Cinzel', serif; color: #505060;">
                "En el círculo de la trigonometría, todo vuelve a su origen."
            </p>
        </footer>
    </div>

    <script src="../../js/jjk-effects.js"></script>
</body>
</html>