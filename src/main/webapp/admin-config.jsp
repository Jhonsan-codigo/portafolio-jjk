<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String error = (String) request.getAttribute("error");
    String success = (String) request.getAttribute("success");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Configuración | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; background: #0a0a0f; }
        h1 { color: #FF1A1A; font-family: 'Cinzel', serif; margin-bottom: 10px; }
        .subtitle { color: #B0B0C0; margin-bottom: 30px; }
        .config-form { max-width: 600px; }
        .input-group { 
            background: rgba(139,0,0,0.15); 
            border: 1px solid #8B0000; 
            border-radius: 12px; 
            padding: 20px; 
            margin-bottom: 20px;
        }
        .input-label { 
            color: #FF1A1A; 
            font-weight: bold; 
            margin-bottom: 10px; 
            display: block;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .input-field {
            width: 100%;
            padding: 12px 15px;
            background: rgba(0,0,0,0.5);
            border: 1px solid #8B0000;
            border-radius: 8px;
            color: #fff;
            font-size: 1rem;
        }
        .input-field:focus {
            outline: none;
            border-color: #FF1A1A;
        }
        .btn-guardar {
            background: #8B0000;
            color: #fff;
            padding: 14px 30px;
            border: none;
            border-radius: 10px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.9rem;
            text-transform: uppercase;
            letter-spacing: 2px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .btn-guardar:hover { background: #FF1A1A; }
        .mensaje-error { color: #FF1A1A; margin-bottom: 20px; }
        .mensaje-exito { color: #00ff00; margin-bottom: 20px; }
        .back { color: #B0B0C0; text-decoration: none; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 20px; }
        .back:hover { color: #FF1A1A; }
    </style>
</head>
<body>
    <a href="admin.jsp" class="back"><i class="fas fa-arrow-left"></i> Volver al Panel</a>
    <h1><i class="fas fa-cog"></i> Configuración</h1>
    <p class="subtitle">Cambia tu contraseña de administrador</p>

    <% if (error != null) { %>
    <div class="mensaje-error"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
    <% } %>

    <% if (success != null) { %>
    <div class="mensaje-exito"><i class="fas fa-check-circle"></i> <%= success %></div>
    <% } %>

    <form action="ChangePasswordServlet" method="POST" class="config-form">
        <div class="input-group">
            <label class="input-label">Contraseña Actual</label>
            <input type="password" name="currentPassword" class="input-field" required placeholder="Ingresa tu contraseña actual">
        </div>

        <div class="input-group">
            <label class="input-label">Nueva Contraseña</label>
            <input type="password" name="newPassword" class="input-field" required placeholder="Ingresa la nueva contraseña">
        </div>

        <div class="input-group">
            <label class="input-label">Confirmar Nueva Contraseña</label>
            <input type="password" name="confirmPassword" class="input-field" required placeholder="Repite la nueva contraseña">
        </div>

        <button type="submit" class="btn-guardar">
            <i class="fas fa-key"></i> Cambiar Contraseña
        </button>
    </form>
</body>
</html>