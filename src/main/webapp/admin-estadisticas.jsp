<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Estadisticas | Admin</title>
    <link rel="stylesheet" href="css/jjk-theme.css">
    <style>
        body { margin-left: 70px; padding: 40px; color: #fff; }
        .stats-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 20px; margin-top: 20px; }
        .stat-card { background: #1a1a2e; border: 1px solid #8B0000; border-radius: 10px; padding: 20px; text-align: center; }
        .stat-number { font-size: 2.5rem; color: #FF1A1A; font-weight: bold; }
        .stat-label { color: #B0B0C0; margin-top: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 30px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #8B0000; }
        th { color: #FF1A1A; }
        .btn { background: #8B0000; color: #fff; padding: 12px 30px; border: none; border-radius: 5px; cursor: pointer; text-decoration: none; display: inline-block; }
        .btn:hover { background: #FF1A1A; }
    </style>
</head>
<body>
    <h1>Estadisticas del Portafolio</h1>

    <%
        Map stats = (Map) request.getAttribute("stats");
        if (stats == null) stats = new java.util.HashMap();
    %>

    <div class="stats-grid">
        <div class="stat-card">
            <div class="stat-number"><%= stats.get("total_visitas") != null ? stats.get("total_visitas") : "0" %></div>
            <div class="stat-label">Total Visitas</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><%= stats.get("visitas_hoy") != null ? stats.get("visitas_hoy") : "0" %></div>
            <div class="stat-label">Visitas Hoy</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><%= stats.get("semanas_activas") != null ? stats.get("semanas_activas") : "0" %></div>
            <div class="stat-label">Semanas Activas</div>
        </div>
        <div class="stat-card">
            <div class="stat-number"><%= stats.get("total_usuarios") != null ? stats.get("total_usuarios") : "0" %></div>
            <div class="stat-label">Usuarios</div>
        </div>
    </div>

    <h2 style="margin-top: 40px;">Visitas por Pagina</h2>
    <table>
        <tr>
            <th>Pagina</th>
            <th>Visitas</th>
        </tr>
        <%
            Map visitasPorPagina = (Map) stats.get("visitasPorPagina");
            if (visitasPorPagina != null) {
                java.util.Iterator it = visitasPorPagina.entrySet().iterator();
                while (it.hasNext()) {
                    java.util.Map.Entry entry = (java.util.Map.Entry) it.next();
        %>
        <tr>
            <td><%= entry.getKey() %></td>
            <td><%= entry.getValue() %></td>
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