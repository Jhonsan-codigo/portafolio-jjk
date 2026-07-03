<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String redirect = request.getParameter("redirect");
    if (redirect == null) redirect = "admin.jsp";
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Acceso al Dominio | Jhon Contreras</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .curse-symbol-float {
            position: fixed;
            top: 30px;
            right: 40px;
            font-size: 3rem;
            color: var(--jjk-sukuna-bright, #FF1A1A);
            opacity: 0.15;
            font-family: 'Noto Sans JP', sans-serif;
            z-index: 10;
            animation: floatSymbol 6s ease-in-out infinite;
            pointer-events: none;
            text-shadow: 0 0 30px rgba(255, 26, 26, 0.3);
        }

        @keyframes floatSymbol {
            0%, 100% { transform: translateY(0) rotate(0deg); opacity: 0.12; }
            50% { transform: translateY(-15px) rotate(5deg); opacity: 0.25; }
        }

        .brand-title-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
        }

        .brand-title-wrapper .curse-symbol-inline {
            font-size: 2.5rem;
            color: var(--jjk-sukuna-bright, #FF1A1A);
            font-family: 'Noto Sans JP', sans-serif;
            text-shadow: 0 0 20px rgba(255, 26, 26, 0.5);
            animation: pulseSymbol 3s ease-in-out infinite;
        }

        @keyframes pulseSymbol {
            0%, 100% { opacity: 0.6; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.1); }
        }

        .login-brand .curse-symbol {
            display: none;
        }

        .back-link {
            position: fixed;
            top: 20px;
            left: 20px;
            z-index: 100;
            color: var(--jjk-text-dim, #C0C0D0);
            text-decoration: none;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.8rem;
            display: flex;
            align-items: center;
            gap: 8px;
            transition: all 0.3s ease;
            padding: 10px 15px;
            border: 1px solid rgba(139,0,0,0.3);
            border-radius: 8px;
            background: rgba(10,10,15,0.8);
        }

        .back-link:hover {
            color: var(--jjk-sukuna-bright, #FF1A1A);
            border-color: var(--jjk-sukuna-bright, #FF1A1A);
            box-shadow: 0 0 15px rgba(139,0,0,0.2);
        }
    </style>
</head>
<body>
    <a href="index.jsp" class="back-link">
        <i class="fas fa-arrow-left"></i> Volver al Portafolio
    </a>

    <canvas id="curseCanvas"></canvas>
    <div class="particles-container" id="particles"></div>
    <div class="domain-aura"></div>
    <div class="glitch-overlay"></div>

    <div class="curse-symbol-float">呪</div>

    <div class="login-wrapper">
        <div class="login-brand">
            <div class="brand-title-wrapper">
                <h1 class="brand-title">DOMINIO MALDITO</h1>
                <span class="curse-symbol-inline">呪</span>
            </div>
            <p class="brand-subtitle">Panel de Administración - Solo Personal Autorizado</p>
        </div>

        <div class="login-card" id="loginCard">
            <div class="card-border"></div>
            <div class="card-header">
                <div class="header-icon">
                    <i class="fas fa-fingerprint"></i>
                </div>
                <h2>INICIAR SESIÓN</h2>
                <p>Acceso restringido al panel de admin</p>
            </div>

            <form action="LoginServlet" method="POST" class="login-form" id="loginForm">
                <input type="hidden" name="redirect" value="<%= redirect %>">

                <div class="input-group">
                    <label for="email"><i class="fas fa-envelope"></i> Correo Electrónico</label>
                    <div class="input-wrapper">
                        <input type="text" id="email" name="email" required placeholder="Ingresa tu correo" autocomplete="username">
                        <div class="input-glow"></div>
                        <div class="input-border"></div>
                    </div>
                </div>

                <div class="input-group">
                    <label for="password"><i class="fas fa-lock"></i> Contraseña</label>
                    <div class="input-wrapper">
                        <input type="password" id="password" name="password" required placeholder="Ingresa tu contraseña" autocomplete="current-password">
                        <button type="button" class="toggle-password" onclick="togglePassword()">
                            <i class="fas fa-eye" id="eyeIcon"></i>
                        </button>
                        <div class="input-glow"></div>
                        <div class="input-border"></div>
                    </div>
                </div>

                <% if(request.getAttribute("error") != null) { %>
                <div class="error-message" id="errorMsg">
                    <i class="fas fa-exclamation-triangle"></i>
                    <%= request.getAttribute("error") %>
                </div>
                <% } %>

                <button type="submit" class="login-btn" id="loginBtn">
                    <span class="btn-text"><i class="fas fa-key"></i> ABRIR DOMINIO</span>
                    <span class="btn-loading"><i class="fas fa-circle-notch fa-spin"></i> Verificando...</span>
                    <div class="btn-particles"></div>
                </button>
            </form>
        </div>

        <div class="login-footer">
            <p>© 2026 Jhon Contreras | Portafolio Jujutsu Kaisen</p>
            <div class="footer-quote">"No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones."</div>
        </div>
    </div>

    <script src="js/login.js"></script>
</body>
</html>