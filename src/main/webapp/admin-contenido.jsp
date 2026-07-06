<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    Map<String, String> configMap = (Map<String, String>) request.getAttribute("config");
    if (configMap == null) configMap = new java.util.HashMap<>();
    
    List<Map<String, String>> semanas = (List<Map<String, String>>) request.getAttribute("semanas");
    if (semanas == null) semanas = new java.util.ArrayList<>();
    
    String errorMsg = (String) request.getAttribute("error");
    String success = request.getParameter("success");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Contenido | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; background: #0a0a0f; }
        h1 { color: #FF1A1A; font-family: 'Cinzel', serif; margin-bottom: 10px; }
        .subtitle { color: #B0B0C0; margin-bottom: 30px; }
        
        .section {
            background: rgba(139,0,0,0.1);
            border: 1px solid #8B0000;
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
        }
        .section-title {
            color: #FF1A1A;
            font-size: 1.2rem;
            margin-bottom: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        .form-label {
            display: block;
            color: #FF1A1A;
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
        }
        .form-input {
            width: 100%;
            padding: 12px 15px;
            background: rgba(0,0,0,0.5);
            border: 1px solid #8B0000;
            border-radius: 8px;
            color: #fff;
            font-size: 1rem;
            transition: all 0.3s;
        }
        .form-input:focus {
            outline: none;
            border-color: #FF1A1A;
            box-shadow: 0 0 15px rgba(255,26,26,0.2);
        }
        textarea.form-input {
            min-height: 80px;
            resize: vertical;
        }
        
        .btn {
            background: #8B0000;
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            text-transform: uppercase;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s;
        }
        .btn:hover { background: #FF1A1A; }
        .btn-success { background: #006400; }
        .btn-success:hover { background: #008000; }
        .btn-danger { background: #8B0000; }
        .btn-danger:hover { background: #FF0000; }
        
        .mensaje-exito {
            background: rgba(0,255,0,0.1);
            border: 1px solid #00ff00;
            color: #00ff00;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .mensaje-error {
            background: rgba(255,0,0,0.1);
            border: 1px solid #FF1A1A;
            color: #FF1A1A;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        
        .semanas-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 20px;
        }
        .semana-card {
            background: rgba(139,0,0,0.15);
            border: 1px solid #8B0000;
            border-radius: 10px;
            padding: 20px;
        }
        .semana-numero {
            color: #FF1A1A;
            font-size: 1.5rem;
            font-weight: bold;
        }
        .semana-titulo {
            color: #fff;
            margin-top: 5px;
        }
        .semana-desc {
            color: #B0B0C0;
            font-size: 0.9rem;
            margin-top: 10px;
        }
        
        .back {
            color: #B0B0C0;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 8px;
            margin-bottom: 20px;
            transition: color 0.3s;
        }
        .back:hover { color: #FF1A1A; }
        
        .two-columns {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        @media (max-width: 768px) {
            .two-columns { grid-template-columns: 1fr; }
        }
    </style>
</head>
<body>
    <a href="admin.jsp" class="back"><i class="fas fa-arrow-left"></i> Volver al Panel</a>
    
    <h1><i class="fas fa-edit"></i> Editar Contenido del Portafolio</h1>
    <p class="subtitle">Modifica todos los textos y configuración de tu portafolio</p>

    <% if (success != null) { %>
    <div class="mensaje-exito">
        <i class="fas fa-check-circle"></i> ¡Cambios guardados correctamente!
    </div>
    <% } %>
    
    <% if (errorMsg != null) { %>
    <div class="mensaje-error">
        <i class="fas fa-exclamation-triangle"></i> <%= errorMsg %>
    </div>
    <% } %>

    <!-- CONFIGURACIÓN GENERAL -->
    <div class="section">
        <div class="section-title"><i class="fas fa-cog"></i> Configuración General</div>
        <form action="EditarContenidoServlet" method="POST">
            <input type="hidden" name="action" value="guardarConfig">
            
            <div class="two-columns">
                <div class="form-group">
                    <label class="form-label">Título del Portafolio</label>
                    <input type="text" name="titulo" class="form-input" 
                           value="<%= configMap.getOrDefault("titulo", "Portafolio Jhon Contreras") %>">
                </div>
                <div class="form-group">
                    <label class="form-label">Nombre del Desarrollador</label>
                    <input type="text" name="nombre" class="form-input" 
                           value="<%= configMap.getOrDefault("nombre", "Jhon Contreras") %>">
                </div>
            </div>
            
            <div class="two-columns">
                <div class="form-group">
                    <label class="form-label">Email de Contacto</label>
                    <input type="email" name="email" class="form-input" 
                           value="<%= configMap.getOrDefault("email", "admin@portafolio.com") %>">
                </div>
                <div class="form-group">
                    <label class="form-label">Profesión / Descripción</label>
                    <input type="text" name="descripcion" class="form-input" 
                           value="<%= configMap.getOrDefault("descripcion", "Desarrollador Web") %>">
                </div>
            </div>
            
            <div class="form-group">
                <label class="form-label">Frase Principal</label>
                <textarea name="frase" class="form-input"><%= configMap.getOrDefault("frase", "No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones.") %></textarea>
            </div>
            
            <div class="form-group">
                <label class="form-label">Subtítulo del Panel Admin</label>
                <input type="text" name="subtitulo" class="form-input" 
                       value="<%= configMap.getOrDefault("subtitulo", "Panel de Administración - Solo Personal Autorizado") %>">
            </div>
            
            <div class="two-columns">
                <div class="form-group">
                    <label class="form-label">Texto del Footer</label>
                    <input type="text" name="footer_texto" class="form-input" 
                           value="<%= configMap.getOrDefault("footer_texto", "© 2026 Jhon Contreras | Portafolio Jujutsu Kaisen") %>">
                </div>
                <div class="form-group">
                    <label class="form-label">Frase del Footer</label>
                    <input type="text" name="footer_frase" class="form-input" 
                           value="<%= configMap.getOrDefault("footer_frase", "No es sobre si eres elegido o no. Es sobre cuánto esfuerzo pones.") %>">
                </div>
            </div>
            
            <button type="submit" class="btn btn-success">
                <i class="fas fa-save"></i> Guardar Configuración
            </button>
        </form>
    </div>

    <!-- GESTIÓN DE SEMANAS -->
    <div class="section">
        <div class="section-title"><i class="fas fa-calendar-week"></i> Gestión de Semanas</div>
        
        <!-- Listado de semanas existentes -->
        <div class="semanas-grid">
            <% for (Map<String, String> semana : semanas) { %>
            <div class="semana-card">
                <div class="semana-numero">Semana <%= semana.get("numero") %></div>
                <div class="semana-titulo"><%= semana.get("titulo") %></div>
                <div class="semana-desc"><%= semana.get("descripcion") %></div>
                <form action="EditarContenidoServlet" method="POST" style="margin-top:15px;">
                    <input type="hidden" name="action" value="eliminarSemana">
                    <input type="hidden" name="id" value="<%= semana.get("id") %>">
                    <button type="submit" class="btn btn-danger" style="padding:8px 15px;font-size:0.75rem;">
                        <i class="fas fa-trash"></i> Eliminar
                    </button>
                </form>
            </div>
            <% } %>
        </div>
        
        <!-- Agregar nueva semana -->
        <div style="margin-top: 30px; padding-top: 20px; border-top: 1px solid #8B0000;">
            <div class="section-title" style="font-size:1rem;"><i class="fas fa-plus"></i> Agregar Nueva Semana</div>
            <form action="EditarContenidoServlet" method="POST">
                <input type="hidden" name="action" value="agregarSemana">
                
                <div class="two-columns">
                    <div class="form-group">
                        <label class="form-label">Número (ej: 04, 05)</label>
                        <input type="text" name="numero" class="form-input" placeholder="04" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Título de la Semana</label>
                        <input type="text" name="tituloSemana" class="form-input" placeholder="Semana 4 - ..." required>
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="form-label">Descripción</label>
                    <textarea name="descripcionSemana" class="form-input" placeholder="Breve descripción de los ejercicios..."></textarea>
                </div>
                
                <button type="submit" class="btn">
                    <i class="fas fa-plus"></i> Agregar Semana
                </button>
            </form>
        </div>
    </div>

</body>
</html>