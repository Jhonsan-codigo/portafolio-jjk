<%
    // Protección: si no está logueado, redirigir al login
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Verificar si está logueado como admin
    if (session == null || session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp?redirect=admin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>Panel de Administración | Jhon Contreras</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        .admin-container { 
            margin-left: 70px; 
            padding: 40px; 
            min-height: 100vh; 
            position: relative; 
            z-index: 1; 
        }
        .admin-header { 
            margin-bottom: 40px; 
            padding-bottom: 20px; 
            border-bottom: 2px solid var(--jjk-border); 
        }
        .admin-grid { 
            display: grid; 
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); 
            gap: 30px; 
        }
        .admin-card { 
            background: linear-gradient(145deg, var(--jjk-bg-card), var(--jjk-bg-light)); 
            border: 1px solid var(--jjk-border); 
            border-radius: 20px; 
            padding: 30px; 
            transition: all 0.4s ease; 
        }
        .admin-card:hover { 
            border-color: var(--jjk-sukuna-bright); 
            transform: translateY(-5px); 
            box-shadow: 0 20px 40px rgba(139,0,0,0.2); 
        }
        .admin-card h3 { 
            font-family: 'Cinzel', serif; 
            color: #FFFFFF; 
            margin-bottom: 20px; 
            font-size: 1.3rem; 
        }
        .admin-card i { 
            font-size: 2rem; 
            color: var(--jjk-sukuna-bright); 
            margin-bottom: 15px; 
            display: block; 
        }
        .admin-btn { 
            display: inline-flex; 
            align-items: center; 
            gap: 10px; 
            padding: 12px 24px; 
            border: 2px solid var(--jjk-sukuna); 
            border-radius: 10px; 
            background: transparent; 
            color: var(--jjk-sukuna-bright); 
            font-family: 'Orbitron', sans-serif; 
            font-size: 0.85rem; 
            text-transform: uppercase; 
            letter-spacing: 2px; 
            cursor: pointer; 
            text-decoration: none; 
            transition: all 0.3s ease; 
            margin-top: 15px; 
        }
        .admin-btn:hover { 
            background: var(--jjk-sukuna); 
            color: var(--jjk-gold); 
            box-shadow: 0 0 20px var(--jjk-sukuna-glow); 
        }
        .logout-btn { 
            position: fixed; 
            top: 20px; 
            right: 20px; 
            z-index: 1000; 
            padding: 10px 20px; 
            border: 1px solid var(--jjk-sukuna-bright); 
            border-radius: 8px; 
            background: rgba(139,0,0,0.2); 
            color: var(--jjk-sukuna-bright); 
            font-family: 'Orbitron', sans-serif; 
            font-size: 0.8rem; 
            cursor: pointer; 
            text-decoration: none; 
            transition: all 0.3s ease; 
        }
        .logout-btn:hover { 
            background: var(--jjk-sukuna); 
            color: var(--jjk-gold); 
        }
        @media (max-width: 768px) {
            .admin-container { margin-left: 0; padding: 20px; }
            .admin-grid { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <a href="LogoutServlet" class="logout-btn">
        <i class="fas fa-power-off"></i> Cerrar Sesión
    </a>

    <div class="admin-container">
        <div class="admin-header">
            <span class="jjk-subtitle">Panel de Control</span>
            <h1 class="jjk-title">ADMINISTRACIÓN <span class="jjk-text-gradient">DE HECHICERIA</span></h1>
            <p style="color: #B0B0C0; margin-top: 15px;">Bienvenido al panel de administración. Solo tú puedes acceder aquí.</p>
        </div>

        <div class="admin-grid">
            <div class="admin-card">
                <i class="fas fa-users"></i>
                <h3>Gestionar Usuarios</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Ver, editar o eliminar usuarios registrados en la base de datos.</p>
                <a href="UsuariosServlet" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Acceder
                </a>
            </div>

            <div class="admin-card">
                <i class="fas fa-database"></i>
                <h3>Base de Datos</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Gestionar tablas, registros y consultas SQL.</p>
                <a href="DatabaseServlet" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Acceder
                </a>
            </div>

            <div class="admin-card">
                <i class="fas fa-edit"></i>
                <h3>Editar Contenido</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Modificar textos, imágenes y secciones del portafolio.</p>
                <a href="EditarContenidoServlet" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Acceder
                </a>
            </div>
            
            <div class="admin-card">
    <i class="fas fa-folder-open"></i>
    <h3>Gestionar Archivos</h3>
    <p style="color: #B0B0C0; margin-bottom: 15px;">Sube, visualiza y elimina imágenes del portafolio.</p>
    <a href="GestionArchivosServlet" class="admin-btn">
        <i class="fas fa-arrow-right"></i> Acceder
    </a>
</div>

            <div class="admin-card">
                <i class="fas fa-chart-line"></i>
                <h3>Estadísticas</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Ver visitas, ejercicios completados y métricas.</p>
                <a href="AdminEstadisticasServlet" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Acceder
                </a>
            </div>

            <div class="admin-card">
                <i class="fas fa-cog"></i>
                <h3>Configuración</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Cambiar contraseña, configurar notificaciones y más.</p>
                <a href="ChangePasswordServlet" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Acceder
                </a>
            </div>

            <div class="admin-card">
                <i class="fas fa-home"></i>
                <h3>Ver Portafolio</h3>
                <p style="color: #B0B0C0; margin-bottom: 15px;">Regresar a la página principal del portafolio.</p>
                <a href="index.jsp" class="admin-btn">
                    <i class="fas fa-arrow-right"></i> Ir al Portafolio
                </a>
            </div>
        </div>
    </div>
</body>
</html>