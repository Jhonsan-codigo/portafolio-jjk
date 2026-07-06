<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Configuracion | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; }
        .form-group { margin-bottom: 20px; }
        label { display: block; color: #FF1A1A; margin-bottom: 5px; }
        input { width: 100%; padding: 10px; background: #1a1a2e; border: 1px solid #8B0000; color: #fff; border-radius: 5px; }
        .btn { background: #8B0000; color: #fff; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #FF1A1A; }
        .success { color: #00ff00; }
    </style>
</head>
<body>
    <h1>Configuracion del Portafolio</h1>
    
    <% if (request.getParameter("success") != null) { %>
        <p class="success">Guardado correctamente!</p>
    <% } %>
    
    <form action="AdminConfigServlet" method="post">
        <div class="form-group">
            <label>Titulo del Portafolio</label>
            <input type="text" name="valor" value="">
            <input type="hidden" name="clave" value="titulo_portafolio">
            <button type="submit" class="btn">Guardar Titulo</button>
        </div>
    </form>
    
    <form action="AdminConfigServlet" method="post">
        <div class="form-group">
            <label>Subtitulo Hero</label>
            <input type="text" name="valor" value="">
            <input type="hidden" name="clave" value="subtitulo_hero">
            <button type="submit" class="btn">Guardar Subtitulo</button>
        </div>
    </form>
    
    <form action="AdminConfigServlet" method="post">
        <div class="form-group">
            <label>Email de Contacto</label>
            <input type="email" name="valor" value="">
            <input type="hidden" name="clave" value="email_contacto">
            <button type="submit" class="btn">Guardar Email</button>
        </div>
    </form>
    
    <br>
    <a href="admin.jsp" class="btn">Volver al Panel</a>
</body>
</html>