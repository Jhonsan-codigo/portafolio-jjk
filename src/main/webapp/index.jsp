<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Portafolio Jhon Contreras | Jujutsu Kaisen</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
</head>

<body>
    <!-- PRELOADER -->
    <div class="preloader-jjk" id="preloader">
        <div class="preloader-orb"></div>
        <div class="preloader-text">CARGANDO DOMINIO MALDITO...</div>
    </div>

    <!-- Video de fondo HD -->
    <div class="video-bg-container">
        <video class="video-bg" autoplay muted loop playsinline>
            <source src="assets/Sukuna.mp4" type="video/mp4">
        </video>
    </div>

    <!-- SIDEBAR DESPLEGABLE -->
    <nav class="jjk-sidebar">
        <div class="jjk-sidebar-toggle">
            <i class="fas fa-bars"></i>
        </div>

        <div class="jjk-nav">
            <a href="#inicio" class="jjk-nav-item active">
                <i class="fas fa-home"></i>
                <span class="jjk-nav-text">Inicio</span>
            </a>
            <a href="#sobre-mi" class="jjk-nav-item">
                <i class="fas fa-user"></i>
                <span class="jjk-nav-text">Sobre Mi</span>
            </a>
            <a href="#semanas" class="jjk-nav-item">
                <i class="fas fa-layer-group"></i>
                <span class="jjk-nav-text">Semanas</span>
            </a>
            <a href="#contacto" class="jjk-nav-item">
                <i class="fas fa-envelope"></i>
                <span class="jjk-nav-text">Contacto</span>
            </a>
            <!-- Link al panel admin (solo visible si sabes la URL) -->
            <a href="admin.jsp" class="jjk-nav-item" style="margin-top: 20px; border-top: 1px solid rgba(139,0,0,0.2); padding-top: 15px;">
                <i class="fas fa-cog"></i>
                <span class="jjk-nav-text">Admin</span>
            </a>
        </div>

        <!-- ====== REPRODUCTOR DE MUSICA ====== -->
        <div class="jjk-music-sidebar">
            <div class="music-equalizer" id="musicVisualizer">
                <span></span><span></span><span></span><span></span>
            </div>
            <span class="music-label">BGM</span>
            <button class="music-toggle" onclick="toggleMusic()" id="sidebarMusicBtn" title="Reproducir/Pausar música">
                <i class="fas fa-play"></i>
            </button>
            <input type="range" class="music-volume-slider" min="0" max="1" step="0.1" value="0.3" onchange="setVolume(this.value)" title="Volumen">
        </div>
        <!-- ====== FIN REPRODUCTOR ====== -->

        <div class="jjk-sidebar-footer">
            <div class="curse-mark">呪</div>
        </div>
    </nav>

    <!-- Audio oculto -->
    <audio id="bgMusic" loop>
        <source src="assets/openig.mp3" type="audio/mpeg">
        Tu navegador no soporta audio HTML5.
    </audio>

    <!-- Logos del instituto -->
    <div class="logo-instituto logo-top-left">
        <img src="assets/logo1.jpg" alt="Logo IESTP" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class='fas fa-shield-alt' style='color:#FF1A1A; font-size:2.5rem;'></i>';">
    </div>
    <div class="logo-instituto logo-top-right">
        <img src="assets/logo2.jpg" alt="Logo DPW" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class='fas fa-code' style='color:#FF1A1A; font-size:2.5rem;'></i>';">
    </div>

    <!-- CONTENIDO PRINCIPAL -->
    <div class="main-content">

    <!-- HERO SECTION -->
    <section class="hero-section" id="inicio">
        <div class="hero-content">
            <div class="hero-badge">Hechicero en Desarrollo</div>

            <h1 class="hero-title">JHON CONTRERAS</h1>

            <div class="hero-typing" id="typing"></div>

            <p class="hero-desc">
                Estudiante de Diseño y Programación Web. Desarrollo aplicaciones con la misma 
                determinación que Yuji Itadori combate maldiciones. Cada línea de código es una 
                técnica maldita para crear experiencias digitales extraordinarias.
            </p>

            <div class="hero-stats">
                <div class="stat-item">
                    <div class="stat-number">15</div>
                    <div class="stat-label">Semanas</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">60+</div>
                    <div class="stat-label">Ejercicios</div>
                </div>
                <div class="stat-item">
                    <div class="stat-number">100%</div>
                    <div class="stat-label">Energía Maldita</div>
                </div>
            </div>

            <a href="#semanas" class="jjk-btn">
                <i class="fas fa-play"></i> Iniciar Dominio
            </a>
        </div>
    </section>

    <!-- SOBRE MI -->
    <section class="jjk-section" id="sobre-mi">
        <div class="jjk-container">
            <div class="about-grid">
                <div class="about-photo">
                    <img src="assets/Jhon.png" alt="Jhon Contreras" onerror="this.src='assets/Itadori.jpg'">
                </div>
                <div class="about-info">
                    <span class="jjk-subtitle">Sobre Mi</span>
                    <h2>HECHICERO <span style="color: var(--jjk-sukuna-bright);">EN DESARROLLO</span></h2>

                    <p>
                         No nací con talento innato, pero compensó con esfuerzo y 
                        determinación. Cada proyecto es un entrenamiento para dominar nuevas técnicas 
                        malditas del desarrollo web. Mi objetivo: convertirme en el mejor Desarrollador Web Full Stack.
                    </p>

                    <div class="about-data">
                        <div class="about-data-item">
                            <i class="fas fa-graduation-cap"></i>
                            <span>Diseño y Programación Web</span>
                        </div>
                        <div class="about-data-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>Perú</span>
                        </div>
                        <div class="about-data-item">
                            <i class="fas fa-envelope"></i>
                            <span>jhon@email.com</span>
                        </div>
                        <div class="about-data-item">
                            <i class="fas fa-code"></i>
                            <span>Full Stack Junior</span>
                        </div>
                    </div>

                    <h3 style="margin-bottom: 20px; color: var(--jjk-sukuna-bright); font-family: 'Cinzel', serif;">Técnicas Malditas Dominadas</h3>
                    <div class="skill-grid">
                        <span class="skill-tag">HTML5</span>
                        <span class="skill-tag">CSS3</span>
                        <span class="skill-tag">JavaScript</span>
                        <span class="skill-tag">Java</span>
                        <span class="skill-tag">JSP</span>
                        <span class="skill-tag">MySQL</span>
                        <span class="skill-tag">UI/UX</span>
                        <span class="skill-tag">Responsive</span>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <hr class="jjk-divider">

    <!-- SEMANAS -->
    <section class="jjk-section semanas-section" id="semanas">
        <div class="jjk-container">
            <div style="text-align: center; margin-bottom: 70px;">
                <span class="jjk-subtitle">Entrenamiento</span>
                <h2 style="font-family: 'Cinzel', serif; font-size: 2.5rem; color: #FFFFFF; text-transform: uppercase; letter-spacing: 8px; margin-bottom: 10px;">MIS <span style="color: #FF1A1A; text-shadow: 0 0 20px rgba(255,26,26,0.5);">SEMANAS</span></h2>
                <p style="color: #B0B0C0; max-width: 600px; margin: 25px auto 0; font-size: 1.1rem;">
                    Cada semana representa un nivel de entrenamiento. Completa los ejercicios 
                    para desbloquear nuevas técnicas malditas.
                </p>
            </div>

            <div class="semanas-grid">
<%
String[][] semanasData = {
    {"01", "fa-shapes", "RECTÁNGULO, CÍRCULO, ROMBO", "Fuerza Bruta", "Itadori.jpg", "Golpe Divergente", "si"},
    {"02", "fa-percentage", "PORCENTAJES, DESCUENTOS", "Velocidad", "Yuji.jpg", "Impacto Negro", "si"},
    {"03", "fa-calculator", "CALCULADORA AVANZADA", "Precisión", "Sukuna.jpg", "Corte", "si"},
    {"04", "fa-code-branch", "CONDICIONALES, BUCLES", "Adaptación", "Jujutsu.jpg", "Manipulación", "si"},
    {"05", "fa-database", "ARRAYS, MATRICES", "Memoria", "Kaisen.jpg", "Extensión de Dominio", "si"},
    {"06", "fa-layer-group", "FUNCIONES, MÉTODOS", "Estrategia", "Gojo.jpg", "Ilimitado", "si"},
    {"07", "fa-network-wired", "CLASES, OBJETOS", "Evolución", "Itadori.jpg", "Resonancia", "si"},
    {"08", "fa-shield-alt", "SEGURIDAD, VALIDACIÓN", "Defensa", "Yuji.jpg", "Barrera", "si"},
    {"09", "fa-dragon", "APIs, SERVICIOS WEB", "Poder", "Sukuna.jpg", "Malevolent Shrine", "si"},
    {"10", "fa-crown", "PROYECTO INTEGRADOR", "Maestría", "Jujutsu.jpg", "Hechicero Especial", "si"},
    {"11", "fa-infinity", "OPTIMIZACIÓN, DEPLOY", "Infinito", "Kaisen.jpg", "Six Eyes", "si"},
    {"12", "fa-server", "HOSTING JAVA GRATUITO", "Despliegue", "Gojo.jpg", "Dominio Infinito", "no"},
    {"13", "fa-book-open", "PORTAFOLIO ESTUDIANTIL", "Documentación", "Sukuna.jpg", "Shrine Final", "no"}
};

for(int i = 0; i < semanasData.length; i++) {
    String num = semanasData[i][0];
    String icono = semanasData[i][1];
    String desc = semanasData[i][2];
    String tema = semanasData[i][3];
    String imagen = semanasData[i][4];
    String poder = semanasData[i][5];
    String tieneEjercicios = semanasData[i][6];
    String carpeta = "semana" + num;
%>

<div class="semana-card" <% if(tieneEjercicios.equals("si")) { %>onclick="irASemana('<%= carpeta %>')"<% } %>>
    <div class="semana-image">
        <img src="assets/<%= imagen %>" alt="Semana <%= num %>" onerror="this.src='assets/Itadori.jpg'">
        <div class="semana-smoke"></div>
    </div>
    <div class="semana-content">
        <div class="semana-header">
            <div class="semana-num"><%= num %></div>
            <div class="semana-icon">
                <i class="fas <%= icono %>"></i>
            </div>
        </div>
        <h3 class="semana-title">SEMANA <%= num %></h3>
        <div class="semana-power">
            <i class="fas fa-fire"></i> <%= poder %>
        </div>
        <p class="semana-desc">
            <%= desc %>. Domina el nivel <%= num %> de entrenamiento hechicero.
        </p>
        <div class="semana-actions">
            <% if(tieneEjercicios.equals("si")) { %>
            <button class="semana-btn semana-btn-primary">
                <i class="fas fa-play"></i> Ejecutar
            </button>
            <% } %>
            <a href="manuales/Manual<%= num %>.pdf" target="_blank" class="semana-btn semana-btn-secondary" onclick="event.stopPropagation();">
                <i class="fas fa-book"></i> Manual
            </a>
        </div>
    </div>
</div>
<% } %>
            </div>
        </div>
    </section>

    <hr class="jjk-divider">

    <!-- CONTACTO -->
    <section class="jjk-section contact-section" id="contacto">
        <div class="jjk-container">
            <div style="text-align: center; margin-bottom: 70px;">
                <span class="jjk-subtitle">Conexión</span>
                <h2 class="jjk-title">CONTACTO <span class="jjk-text-gradient">HECHICERO</span></h2>
            </div>

            <div class="contact-grid">
                <div class="contact-card">
                    <i class="fas fa-envelope"></i>
                    <h3>Email</h3>
                    <p>jhon@email.com</p>
                    <a href="mailto:jhon@email.com" class="jjk-btn" style="padding: 12px 25px; font-size: 0.8rem;">
                        Enviar Mensaje
                    </a>
                </div>
                <div class="contact-card">
                    <i class="fab fa-github"></i>
                    <h3>GitHub</h3>
                    <p>@jhoncontreras</p>
                    <a href="#" class="jjk-btn jjk-btn-gold" style="padding: 12px 25px; font-size: 0.8rem;">
                        Ver Perfil
                    </a>
                </div>
                <div class="contact-card">
                    <i class="fab fa-linkedin"></i>
                    <h3>LinkedIn</h3>
                    <p>Jhon Contreras</p>
                    <a href="#" class="jjk-btn" style="padding: 12px 25px; font-size: 0.8rem;">
                        Conectar
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER -->
    <footer class="jjk-footer">
        <div class="curse-mark">呪</div>
        <p>&copy; 2026 Jhon Contreras. Todos los derechos reservados.</p>
        <p style="margin-top: 15px; font-size: 0.9rem; font-family: 'Cinzel', serif;">"No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones." - Yuji Itadori</p>
    </footer>

    </div><!-- main-content -->

    <script src="js/jjk-effects.js"></script>
    <script>
        const textos = [
            "Desarrollador Web",
            "Hechicero de Código", 
            "Dominio: Programación",
            "Técnica Maldita: Java",
            "Sukuna: El Rey de las Maldiciones"
        ];

        let contador = 0;
        let letra = 0;
        let borrando = false;
        const typingEl = document.getElementById('typing');

        function escribir() {
            const texto = textos[contador];
            if (!borrando) {
                typingEl.textContent = texto.substring(0, letra++);
                if (letra > texto.length) {
                    borrando = true;
                    setTimeout(escribir, 2000);
                    return;
                }
            } else {
                typingEl.textContent = texto.substring(0, letra--);
                if (letra < 0) {
                    borrando = false;
                    contador = (contador + 1) % textos.length;
                    letra = 0;
                }
            }
            setTimeout(escribir, borrando ? 40 : 100);
        }

        document.addEventListener('DOMContentLoaded', escribir);

        // Solo aplicar preventDefault a los items de navegación interna (anclas #)
        // Los enlaces a servlets NO deben tener preventDefault
        document.querySelectorAll('.jjk-nav-item').forEach(item => {
            item.addEventListener('click', (e) => {
                const href = item.getAttribute('href');

                // Si es un enlace a servlet o admin (no empieza con #), dejar que navegue normalmente
                if (!href || !href.startsWith('#')) {
                    return; // No hacer nada, dejar que el enlace funcione normalmente
                }

                // Solo para anclas internas (#inicio, #sobre-mi, etc.)
                e.preventDefault();
                const target = document.querySelector(href);
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth' });
                }
                document.querySelectorAll('.jjk-nav-item').forEach(i => i.classList.remove('active'));
                item.classList.add('active');
            });
        });

        function irASemana(carpeta) {
            if (window.jjkAudio) jjkAudio.playDomain();
            setTimeout(() => {
                window.location.href = 'Semanas/' + carpeta + '/index.jsp';
            }, 600);
        }

        // ====== FUNCIONES DE MUSICA ======
        let bgMusic = document.getElementById('bgMusic');
        let musicBtn = document.getElementById('sidebarMusicBtn');
        let isPlaying = false;

        function toggleMusic() {
            if (!bgMusic) return;

            if (isPlaying) {
                bgMusic.pause();
                musicBtn.innerHTML = '<i class="fas fa-play"></i>';
                musicBtn.style.background = 'rgba(139, 0, 0, 0.15)';
                musicBtn.style.borderColor = 'rgba(139, 0, 0, 0.3)';
                document.getElementById('musicVisualizer').classList.remove('active');
            } else {
                bgMusic.play().catch(e => {
                    console.log('Autoplay bloqueado por el navegador');
                });
                musicBtn.innerHTML = '<i class="fas fa-pause"></i>';
                musicBtn.style.background = 'rgba(0, 200, 100, 0.3)';
                musicBtn.style.borderColor = 'rgba(0, 200, 100, 0.5)';
                document.getElementById('musicVisualizer').classList.add('active');
            }
            isPlaying = !isPlaying;
        }

        function setVolume(valor) {
            if (bgMusic) {
                bgMusic.volume = valor;
            }
        }

        // Iniciar con volumen bajo
        if (bgMusic) {
            bgMusic.volume = 0.3;
        }
        // ====== FIN FUNCIONES DE MUSICA ======
    </script>

</body>
</html>