<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<String[]> archivos = (List<String[]>) request.getAttribute("archivos");
    if (archivos == null) archivos = new java.util.ArrayList<>();
    
    String mensaje = (String) request.getAttribute("mensaje");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestión de Archivos | Admin</title>
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
        
        /* Upload area */
        .upload-area {
            border: 2px dashed #8B0000;
            border-radius: 10px;
            padding: 40px;
            text-align: center;
            transition: all 0.3s;
            margin-bottom: 20px;
        }
        .upload-area:hover {
            border-color: #FF1A1A;
            background: rgba(139,0,0,0.05);
        }
        .upload-input {
            display: none;
        }
        .upload-label {
            cursor: pointer;
            color: #B0B0C0;
        }
        .upload-label i {
            font-size: 3rem;
            color: #8B0000;
            margin-bottom: 15px;
            display: block;
        }
        .btn-subir {
            background: #006400;
            color: #fff;
            padding: 12px 30px;
            border: none;
            border-radius: 8px;
            font-family: 'Orbitron', sans-serif;
            cursor: pointer;
            margin-top: 15px;
        }
        .btn-subir:hover { background: #008000; }
        
        /* File grid */
        .archivos-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        .archivo-card {
            background: rgba(139,0,0,0.15);
            border: 1px solid #8B0000;
            border-radius: 10px;
            overflow: hidden;
            transition: all 0.3s;
        }
        .archivo-card:hover {
            border-color: #FF1A1A;
            transform: translateY(-5px);
        }
        .archivo-preview {
            height: 150px;
            background: rgba(0,0,0,0.3);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 3rem;
        }
        .archivo-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .archivo-info {
            padding: 15px;
        }
        .archivo-nombre {
            color: #fff;
            font-size: 0.9rem;
            word-break: break-all;
            margin-bottom: 5px;
        }
        .archivo-tamano {
            color: #B0B0C0;
            font-size: 0.8rem;
        }
        .archivo-acciones {
            padding: 0 15px 15px;
            display: flex;
            gap: 10px;
        }
        .btn-eliminar {
            background: #8B0000;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.8rem;
            width: 100%;
        }
        .btn-eliminar:hover { background: #FF0000; }
        
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
    </style>
</head>
<body>
    <a href="admin.jsp" class="back"><i class="fas fa-arrow-left"></i> Volver al Panel</a>
    <h1><i class="fas fa-folder-open"></i> Gestión de Archivos</h1>
    <p class="subtitle">Sube, visualiza y elimina imágenes del portafolio</p>

    <% if (mensaje != null) { %>
    <div class="mensaje-exito"><i class="fas fa-check-circle"></i> <%= mensaje %></div>
    <% } %>
    
    <% if (error != null) { %>
    <div class="mensaje-error"><i class="fas fa-exclamation-triangle"></i> <%= error %></div>
    <% } %>

    <!-- SUBIR ARCHIVO -->
    <div class="section">
        <div class="section-title"><i class="fas fa-cloud-upload-alt"></i> Subir Nuevo Archivo</div>
        <form action="GestionArchivosServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="action" value="subir">
            <div class="upload-area">
                <label for="archivo" class="upload-label">
                    <i class="fas fa-cloud-upload-alt"></i>
                    <div>Arrastra archivos aquí o haz click para seleccionar</div>
                    <div style="font-size:0.8rem; margin-top:10px; color:#666;">JPG, PNG, GIF, WEBP (máx 10MB)</div>
                </label>
                <input type="file" name="archivo" id="archivo" class="upload-input" accept="image/*" required>
            </div>
            <div style="text-align:center;">
                <button type="submit" class="btn-subir"><i class="fas fa-upload"></i> Subir Archivo</button>
            </div>
        </form>
    </div>

    <!-- LISTA DE ARCHIVOS -->
    <div class="section">
        <div class="section-title"><i class="fas fa-images"></i> Archivos Existentes (<%= archivos.size() %>)</div>
        <div class="archivos-grid">
            <% for (String[] archivo : archivos) { 
                String nombre = archivo[0];
                String tamano = archivo[1];
                String ruta = archivo[2];
                String tipo = archivo[3];
            %>
            <div class="archivo-card">
                <div class="archivo-preview">
                    <% if ("imagen".equals(tipo)) { %>
                    <img src="<%= ruta %>" alt="<%= nombre %>" onerror="this.style.display='none'; this.parentElement.innerHTML='<i class=\'fas fa-file-image\' style=\'color:#8B0000\'></i>';">
                    <% } else if ("pdf".equals(tipo)) { %>
                    <i class="fas fa-file-pdf" style="color:#FF1A1A;"></i>
                    <% } else { %>
                    <i class="fas fa-file" style="color:#8B0000;"></i>
                    <% } %>
                </div>
                <div class="archivo-info">
                    <div class="archivo-nombre"><%= nombre %></div>
                    <div class="archivo-tamano"><%= tamano %></div>
                </div>
                <div class="archivo-acciones">
                    <form action="GestionArchivosServlet" method="POST" style="width:100%;">
                        <input type="hidden" name="action" value="eliminar">
                        <input type="hidden" name="nombre" value="<%= nombre %>">
                        <button type="submit" class="btn-eliminar" onclick="return confirm('¿Eliminar <%= nombre %>?')">
                            <i class="fas fa-trash"></i> Eliminar
                        </button>
                    </form>
                </div>
            </div>
            <% } %>
            
            <% if (archivos.isEmpty()) { %>
            <div style="grid-column:1/-1; text-align:center; color:#666; padding:40px;">
                <i class="fas fa-folder-open" style="font-size:3rem; margin-bottom:15px; display:block;"></i>
                No hay archivos subidos
            </div>
            <% } %>
        </div>
    </div>

    <script>
        // Mostrar nombre del archivo seleccionado
        document.getElementById('archivo').addEventListener('change', function() {
            if (this.files && this.files[0]) {
                document.querySelector('.upload-label div').textContent = 'Archivo: ' + this.files[0].name;
            }
        });
    </script>
</body>
</html>