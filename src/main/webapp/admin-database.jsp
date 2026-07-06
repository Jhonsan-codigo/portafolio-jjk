<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    List<Map<String, String>> tablas = (List<Map<String, String>>) request.getAttribute("tablas");
    if (tablas == null) tablas = new java.util.ArrayList<>();
    
    String tablaSeleccionada = (String) request.getAttribute("tablaSeleccionada");
    List<String> columnas = (List<String>) request.getAttribute("columnas");
    List<List<String>> filas = (List<List<String>>) request.getAttribute("filas");
    
    // Para SQL
    List<String> sqlColumnas = (List<String>) request.getAttribute("sqlColumnas");
    List<List<String>> sqlFilas = (List<List<String>>) request.getAttribute("sqlFilas");
    String sqlMensaje = (String) request.getAttribute("sqlMensaje");
    String sqlConsulta = (String) request.getAttribute("sqlConsulta");
    Boolean sqlEsSelect = (Boolean) request.getAttribute("sqlEsSelect");
%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Base de Datos | Admin</title>
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
        
        .tablas-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 15px;
        }
        .tabla-card {
            background: rgba(139,0,0,0.15);
            border: 1px solid #8B0000;
            border-radius: 10px;
            padding: 20px;
            transition: all 0.3s;
        }
        .tabla-card:hover {
            border-color: #FF1A1A;
            box-shadow: 0 0 15px rgba(255,26,26,0.2);
        }
        .tabla-nombre {
            color: #FF1A1A;
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 5px;
        }
        .tabla-tipo {
            color: #B0B0C0;
            font-size: 0.85rem;
        }
        .tabla-acciones {
            margin-top: 15px;
            display: flex;
            gap: 10px;
        }
        .btn-small {
            padding: 6px 12px;
            font-size: 0.75rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        .btn-ver { background: #8B0000; color: #fff; }
        .btn-ver:hover { background: #FF1A1A; }
        .btn-vaciar { background: #4a0000; color: #fff; }
        .btn-vaciar:hover { background: #8B0000; }
        
        /* Tabla de datos */
        .data-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-size: 0.9rem;
        }
        .data-table th {
            background: rgba(139,0,0,0.3);
            color: #FF1A1A;
            padding: 12px;
            text-align: left;
            border-bottom: 2px solid #8B0000;
        }
        .data-table td {
            padding: 10px 12px;
            border-bottom: 1px solid rgba(139,0,0,0.3);
            color: #B0B0C0;
        }
        .data-table tr:hover td {
            background: rgba(139,0,0,0.1);
        }
        
        /* SQL Console */
        .sql-textarea {
            width: 100%;
            min-height: 100px;
            padding: 15px;
            background: rgba(0,0,0,0.5);
            border: 1px solid #8B0000;
            border-radius: 8px;
            color: #fff;
            font-family: 'Courier New', monospace;
            font-size: 0.9rem;
            resize: vertical;
        }
        .sql-textarea:focus {
            outline: none;
            border-color: #FF1A1A;
        }
        .btn-ejecutar {
            background: #006400;
            color: #fff;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            font-family: 'Orbitron', sans-serif;
            font-size: 0.85rem;
            text-transform: uppercase;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn-ejecutar:hover { background: #008000; }
        
        .mensaje-sql {
            padding: 15px;
            border-radius: 8px;
            margin: 15px 0;
            font-size: 0.9rem;
        }
        .mensaje-exito {
            background: rgba(0,255,0,0.1);
            border: 1px solid #00ff00;
            color: #00ff00;
        }
        .mensaje-error {
            background: rgba(255,0,0,0.1);
            border: 1px solid #FF1A1A;
            color: #FF1A1A;
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
    <h1><i class="fas fa-database"></i> Base de Datos</h1>
    <p class="subtitle">Gestiona tablas, registros y ejecuta consultas SQL</p>

    <!-- LISTA DE TABLAS -->
    <div class="section">
        <div class="section-title"><i class="fas fa-table"></i> Tablas Disponibles</div>
        <div class="tablas-grid">
            <% for (Map<String, String> t : tablas) { 
                String nombre = t.get("nombre");
            %>
            <div class="tabla-card">
                <div class="tabla-nombre"><i class="fas fa-table"></i> <%= nombre %></div>
                <div class="tabla-tipo">Tipo: <%= t.get("tipo") %></div>
                <div class="tabla-acciones">
                    <a href="DatabaseServlet?action=ver&tabla=<%= nombre %>" class="btn-small btn-ver">
                        <i class="fas fa-eye"></i> Ver
                    </a>
                    <form action="DatabaseServlet" method="POST" style="display:inline;">
                        <input type="hidden" name="action" value="vaciar">
                        <input type="hidden" name="tabla" value="<%= nombre %>">
                        <button type="submit" class="btn-small btn-vaciar" onclick="return confirm('¿Vaciar tabla <%= nombre %>?')">
                            <i class="fas fa-trash"></i> Vaciar
                        </button>
                    </form>
                </div>
            </div>
            <% } %>
        </div>
    </div>

    <!-- CONTENIDO DE TABLA SELECCIONADA -->
    <% if (tablaSeleccionada != null && columnas != null) { %>
    <div class="section">
        <div class="section-title"><i class="fas fa-list"></i> Contenido de: <%= tablaSeleccionada %></div>
        <div style="overflow-x: auto;">
            <table class="data-table">
                <thead>
                    <tr>
                        <% for (String col : columnas) { %>
                        <th><%= col %></th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% if (filas != null && !filas.isEmpty()) { 
                        for (List<String> fila : filas) { %>
                    <tr>
                        <% for (String valor : fila) { %>
                        <td><%= valor %></td>
                        <% } %>
                    </tr>
                    <% } } else { %>
                    <tr>
                        <td colspan="<%= columnas.size() %>" style="text-align:center; color:#666;">Tabla vacía</td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>
    <% } %>

    <!-- CONSOLA SQL -->
    <div class="section">
        <div class="section-title"><i class="fas fa-terminal"></i> Consola SQL</div>
        <p style="color:#B0B0C0; margin-bottom:15px; font-size:0.85rem;">
            Escribe consultas SELECT, INSERT, UPDATE o DELETE. Ten cuidado con las operaciones destructivas.
        </p>
        
        <form action="DatabaseServlet" method="POST">
            <input type="hidden" name="action" value="sql">
            <textarea name="consulta" class="sql-textarea" placeholder="SELECT * FROM usuarios;"><%= sqlConsulta != null ? sqlConsulta : "" %></textarea>
            <button type="submit" class="btn-ejecutar">
                <i class="fas fa-play"></i> Ejecutar SQL
            </button>
        </form>
        
        <% if (sqlMensaje != null) { %>
        <div class="mensaje-sql <%= sqlMensaje.startsWith("Error") ? "mensaje-error" : "mensaje-exito" %>">
            <i class="fas fa-<%= sqlMensaje.startsWith("Error") ? "exclamation-triangle" : "check-circle" %>"></i>
            <%= sqlMensaje %>
        </div>
        <% } %>
        
        <% if (sqlEsSelect != null && sqlEsSelect && sqlColumnas != null && !sqlColumnas.isEmpty()) { %>
        <div style="overflow-x: auto; margin-top:20px;">
            <table class="data-table">
                <thead>
                    <tr>
                        <% for (String col : sqlColumnas) { %>
                        <th><%= col %></th>
                        <% } %>
                    </tr>
                </thead>
                <tbody>
                    <% for (List<String> fila : sqlFilas) { %>
                    <tr>
                        <% for (String valor : fila) { %>
                        <td><%= valor %></td>
                        <% } %>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
        <% } %>
    </div>

</body>
</html>