<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Semana 2 - Ejercicios | JJK</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        
        body { 
            background: linear-gradient(135deg, #0a0a0f, #1a1a24, #0f0f15); 
            min-height: 100vh; 
            display: flex; 
            justify-content: center; 
            align-items: center; 
            padding: 20px; 
            color: #fff; 
        }
        
        .container { 
            background: linear-gradient(145deg, #13131a, #1a1a24); 
            border-radius: 24px; 
            padding: 40px; 
            max-width: 600px; 
            width: 100%; 
            box-shadow: 0 25px 50px rgba(0,0,0,0.5); 
            border: 1px solid rgba(139, 0, 0, 0.3); 
        }
        
        .back-link { 
            display: inline-flex; 
            align-items: center; 
            gap: 8px; 
            color: #FF4444; 
            text-decoration: none; 
            font-size: 0.9rem; 
            margin-bottom: 25px; 
            transition: all 0.3s; 
        }
        
        .back-link:hover { 
            color: #fff; 
            transform: translateX(-5px); 
        }
        
        .header { 
            text-align: center; 
            margin-bottom: 35px; 
        }
        
        .header .numero { 
            color: #FF4444; 
            font-size: 0.9rem; 
            font-weight: 600; 
            letter-spacing: 3px; 
            text-transform: uppercase; 
            margin-bottom: 10px; 
        }
        
        .header h1 { 
            font-size: 1.8rem; 
            color: #FF0000; 
            text-shadow: 0 0 20px rgba(255,0,0,0.5); 
            margin-bottom: 15px; 
        }
        
        .header .descripcion { 
            color: #B0B0C0; 
            font-size: 1rem; 
            line-height: 1.7; 
        }
        
        .ejercicios-lista { 
            display: flex; 
            flex-direction: column; 
            gap: 15px; 
        }
        
        .ejercicio-card { 
            background: linear-gradient(145deg, rgba(139,0,0,0.08), rgba(20,20,20,0.5)); 
            border: 1px solid rgba(139, 0, 0, 0.25); 
            border-radius: 16px; 
            padding: 20px 25px; 
            display: flex; 
            align-items: center; 
            justify-content: space-between; 
            transition: all 0.3s; 
            cursor: pointer; 
            text-decoration: none; 
        }
        
        .ejercicio-card:hover { 
            transform: translateX(8px); 
            border-color: rgba(255, 0, 0, 0.6); 
            box-shadow: 0 8px 25px rgba(139, 0, 0, 0.3); 
        }
        
        .ejercicio-info { 
            display: flex; 
            align-items: center; 
            gap: 15px; 
        }
        
        .ejercicio-icono { 
            width: 50px; 
            height: 50px; 
            border-radius: 12px; 
            background: linear-gradient(135deg, #8B0000, #FF0000); 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            font-size: 1.3rem; 
            color: #FFD700; 
        }
        
        .ejercicio-texto h3 { 
            color: #FFFFFF; 
            font-size: 1.1rem; 
            margin-bottom: 4px; 
        }
        
        .ejercicio-texto p { 
            color: #A0A0B0; 
            font-size: 0.85rem; 
        }
        
        .ejercicio-flecha { 
            color: #FF4444; 
            font-size: 1.2rem; 
            transition: all 0.3s; 
        }
        
        .ejercicio-card:hover .ejercicio-flecha { 
            transform: translateX(5px); 
        }
        
        .footer-pagina { 
            text-align: center; 
            margin-top: 30px; 
            padding-top: 20px; 
            border-top: 1px solid rgba(139, 0, 0, 0.2); 
            color: #808090; 
            font-size: 0.85rem; 
        }
    </style>
</head>
<body>
    <div class="container">
        <a href="../../index.jsp" class="back-link"><i class="fas fa-arrow-left"></i> Volver al portafolio</a>
        
        <div class="header">
            <div class="numero">Semana 2</div>
            <h1>Ejercicios de Aplicación</h1>
            <p class="descripcion">Cálculos de descuentos, sueldos y donaciones con Java y JSP.</p>
        </div>
        
        <div class="ejercicios-lista">
            <a href="ejercicio01.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-percentage"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 01</h3>
                        <p>Descuento del 11% + Caramelos</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
            
            <a href="ejercicio02.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-percentage"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 02</h3>
                        <p>Descuento 7% + 7%</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
            
            <a href="ejercicio03.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-money-check-alt"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 03</h3>
                        <p>Pago Mensual del Empleado</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
            
            <a href="ejercicio04.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-hospital"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 04</h3>
                        <p>Donación al Hospital</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
            
            <a href="ejercicio05.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-chart-line"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 05</h3>
                        <p>Sueldo de Vendedores</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
            
            <a href="ejercicio06.jsp" class="ejercicio-card">
                <div class="ejercicio-info">
                    <div class="ejercicio-icono"><i class="fas fa-shield-alt"></i></div>
                    <div class="ejercicio-texto">
                        <h3>Ejercicio 06</h3>
                        <p>Sueldo con ESSALUD y AFP</p>
                    </div>
                </div>
                <i class="fas fa-chevron-right ejercicio-flecha"></i>
            </a>
        </div>
        
        <div class="footer-pagina">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
        </div>
    </div>
</body>
</html>