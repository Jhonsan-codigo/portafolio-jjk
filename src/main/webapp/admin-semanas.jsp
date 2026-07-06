<%
    // Protección: si no está logueado, redirigir al login
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Semanas | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #8B0000; }
        th { color: #FF1A1A; }
        .btn { background: #8B0000; color: #fff; padding: 8px 16px; border: none; border-radius: 5px; cursor: pointer; margin-right: 5px; }
        .btn:hover { background: #FF1A1A; }
        .btn-add { background: #006600; }
        .btn-add:hover { background: #00aa00; }
        .btn-delete { background: #660000; }
        .btn-delete:hover { background: #cc0000; }
        .form-group { margin-bottom: 15px; }
        label { display: block; color: #FF1A1A; margin-bottom: 5px; }
        input, select { width: 100%; padding: 10px; background: #1a1a2e; border: 1px solid #8B0000; color: #fff; border-radius: 5px; }
        .success { color: #00ff00; }
        .error { color: #ff0000; }
    </style>
</head>
<body>
    <h1>Gestionar Semanas</h1>
    
    <% if (request.getParameter("success") != null) { %>
        <p class="success">Operacion exitosa!</p>
    <% } %>
    <% if (request.getParameter("error") != null) { %>
        <p class="error">Error en la operacion.</p>
    <% } %>

    <h2>Agregar Nueva Semana</h2>
    <form action="AdminSemanasServlet" method="post">
        <input type="hidden" name="action" value="add">
        <div class="form-group">
            <label>Numero</label>
            <input type="number" name="numero" required>
        </div>
        <div class="form-group">
            <label>Titulo</label>
            <input type="text" name="titulo" required>
        </div>
        <div class="form-group">
            <label>Descripcion</label>
            <input type="text" name="descripcion">
        </div>
        <div class="form-group">
            <label>Icono (clase FontAwesome)</label>
            <input type="text" name="icono" value="fa-code">
        </div>
        <div class="form-group">
            <label>Imagen</label>
            <input type="text" name="imagen" value="assets/Itadori.jpg">
        </div>
        <div class="form-group">
            <label>Tema</label>
            <input type="text" name="tema">
        </div>
        <div class="form-group">
            <label>Poder</label>
            <input type="text" name="poder">
        </div>
        <div class="form-group">
            <label>Estado</label>
            <select name="estado">
                <option value="activo">Activo</option>
                <option value="inactivo">Inactivo</option>
                <option value="proximamente">Proximamente</option>
            </select>
        </div>
        <button type="submit" class="btn btn-add">Agregar Semana</button>
    </form>

    <h2 style="margin-top: 40px;">Semanas Existentes</h2>
    <table>
        <tr>
            <th>Num</th>
            <th>Titulo</th>
            <th>Tema</th>
            <th>Poder</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        <%
            List semanas = (List) request.getAttribute("semanas");
            if (semanas != null) {
                for (int i = 0; i < semanas.size(); i++) {
                    java.util.Map semana = (java.util.Map) semanas.get(i);
        %>
        <tr>
            <td><%= semana.get("numero") %></td>
            <td><%= semana.get("titulo") %></td>
            <td><%= semana.get("tema") %></td>
            <td><%= semana.get("poder") %></td>
            <td><%= semana.get("estado") %></td>
            <td>
                <form action="AdminSemanasServlet" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="id" value="<%= semana.get("id") %>">
                    <button type="submit" class="btn btn-delete" onclick="return confirm('Eliminar semana <%= semana.get("numero") %>?')">Eliminar</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <br><br>
    <a href="admin.jsp" class="btn">Volver al Panel</a>
</body>
</html>