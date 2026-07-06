<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<String[]> usuarios = (List<String[]>) request.getAttribute("usuarios");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Gestionar Usuarios | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; }
        h1 { color: #FF1A1A; font-family: 'Cinzel', serif; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #8B0000; }
        th { color: #FF1A1A; background: rgba(139,0,0,0.2); }
        tr:hover { background: rgba(139,0,0,0.1); }
        .btn { background: #8B0000; color: #fff; padding: 8px 16px; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #FF1A1A; }
        .back { color: #B0B0C0; text-decoration: none; display: inline-block; margin-bottom: 20px; }
    </style>
</head>
<body>
    <a href="admin.jsp" class="back"><i class="fas fa-arrow-left"></i> Volver al Panel</a>
    <h1><i class="fas fa-users"></i> Gestionar Usuarios</h1>
    
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Email</th>
            <th>Rol</th>
            <th>Creado</th>
        </tr>
        <% if (usuarios != null) { 
            for (String[] u : usuarios) { %>
        <tr>
            <td><%= u[0] %></td>
            <td><%= u[1] %></td>
            <td><%= u[2] %></td>
            <td><%= u[3] %></td>
            <td><%= u[4] %></td>
        </tr>
        <% } } else { %>
        <tr><td colspan="5" style="text-align:center;">No hay usuarios registrados</td></tr>
        <% } %>
    </table>
</body>
</html>