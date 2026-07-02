<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana 4 - Ejercicios | JJK</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Segoe UI', sans-serif; }
        body { background: linear-gradient(135deg, #0a0a0f, #1a1a24, #0f0f15); min-height: 100vh; padding: 40px 20px; color: #e2e8f0; }
        .container { max-width: 1000px; margin: 0 auto; }
        .back-link { display: inline-flex; align-items: center; gap: 8px; color: #FF4444; text-decoration: none; font-size: 0.95rem; margin-bottom: 30px; transition: 0.3s; }
        .back-link:hover { color: #fff; transform: translateX(-5px); }
        .header { text-align: center; margin-bottom: 50px; }
        .header .numero { color: #FF4444; font-size: 0.9rem; font-weight: 600; letter-spacing: 3px; text-transform: uppercase; margin-bottom: 10px; }
        .header h1 { font-size: 2.5rem; color: #FF0000; text-shadow: 0 0 20px rgba(255,0,0,0.5); margin-bottom: 15px; }
        .header p { color: #B0B0C0; font-size: 1.1rem; }
        .ejercicios-grid { display: flex; flex-wrap: wrap; justify-content: center; gap: 20px; }
        .ejercicio-card { background: linear-gradient(145deg, rgba(139,0,0,0.08), rgba(20,20,20,0.5)); border: 1px solid rgba(139, 0, 0, 0.25); border-radius: 16px; padding: 30px; width: 280px; text-align: center; transition: 0.3s; cursor: pointer; text-decoration: none; color: inherit; }
        .ejercicio-card:hover { transform: translateY(-8px); border-color: rgba(255, 0, 0, 0.6); box-shadow: 0 20px 40px rgba(139, 0, 0, 0.3); }
        .ejercicio-card .num { color: #FF4444; font-size: 2.5rem; font-weight: 800; margin-bottom: 10px; }
        .ejercicio-card .titulo { color: #fff; font-size: 1.1rem; font-weight: 600; margin-bottom: 8px; }
        .ejercicio-card .desc { color: #A0A0B0; font-size: 0.85rem; line-height: 1.5; }
        .ejercicio-card .btn { display: inline-block; margin-top: 15px; padding: 10px 25px; background: linear-gradient(135deg, #8B0000, #FF0000); color: #FFD700; border-radius: 25px; font-weight: 600; font-size: 0.9rem; }
        .footer { text-align: center; margin-top: 50px; padding-top: 30px; border-top: 1px solid rgba(139, 0, 0, 0.2); color: #808090; font-size: 0.85rem; }
    </style>
</head>
<body>
    <div class="container">
        <a href="../../index.jsp#semanas" class="back-link"><i class="fas fa-arrow-left"></i> Volver al portafolio</a>
        <div class="header">
            <div class="numero">Semana 4</div>
            <h1><i class="fas fa-code"></i> Ejercicios Java</h1>
            <p>4 ejercicios de programacion con condicionales y estructuras selectivas</p>
        </div>
        <div class="ejercicios-grid">
            <a href="ejercicio01.jsp" class="ejercicio-card">
                <div class="num">01</div>
                <div class="titulo">Renta Car</div>
                <div class="desc">Alquiler de autos con 3 tipos de vehiculo y recargo por km excedido</div>
                <span class="btn">Resolver <i class="fas fa-arrow-right"></i></span>
            </a>
            <a href="ejercicio02.jsp" class="ejercicio-card">
                <div class="num">02</div>
                <div class="titulo">Horas Extras</div>
                <div class="desc">Calculo de pago con horas extras al doble y triple</div>
                <span class="btn">Resolver <i class="fas fa-arrow-right"></i></span>
            </a>
            <a href="ejercicio03.jsp" class="ejercicio-card">
                <div class="num">03</div>
                <div class="titulo">Estacionamiento</div>
                <div class="desc">Tarifa de estacionamiento segun el dia de la semana</div>
                <span class="btn">Resolver <i class="fas fa-arrow-right"></i></span>
            </a>
            <a href="ejercicio04.jsp" class="ejercicio-card">
                <div class="num">04</div>
                <div class="titulo">Promedio Notas</div>
                <div class="desc">Promedio de 3 practicas con bonus de +2 puntos en la tercera</div>
                <span class="btn">Resolver <i class="fas fa-arrow-right"></i></span>
            </a>
        </div>
        <div class="footer">
            <p><i class="fas fa-code"></i> Desarrollado por Jhon Contreras</p>
            <p>Diseño y Programación Web - IESTP</p>
        </div>
    </div>
</body>
</html>