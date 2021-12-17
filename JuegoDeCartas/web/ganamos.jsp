<%-- 
    Document   : ganamos
    Created on : 12-dic-2021, 15:16:27
    Author     : rcane
--%>
<%@page import="modelo.JuegoC"%>
<%
    HttpSession sesion = request.getSession();
    String nombre = (String)sesion.getAttribute("nombre");
    JuegoC juego = (JuegoC)sesion.getAttribute("juego");
    if(nombre==null || juego==null || !juego.ganamos(juego.getCartas())){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel='stylesheet' type='text/css' media='screen' href='ganaste.css'>
        <link rel="icon" href="src/img/rebeldes.png">
        <title>Has ganado</title>
        
    </head>
    <body>
        <div class="contenedor">
            <h1>Has ganado <%=nombre%></h1>        
            <p>ERES UN PADAWAN EXCELENTE</p>
        </div>
        <div class="publi">  <!-- Aqui antes iba publicidad pero se cambió por botones-->
            <p><form action="juego.jsp" method="POST"><input type="submit" name="reiniciar" value="Reiniciar" class="neon_button"></form></p>
            <p><form action="cerrarSesion"><input type="submit" value="Cerrar Sesion" class="neon_button"></form></p>
        </div>
        
        <div class="img">
            <img src='src/img/explosion.gif' id='explota'>
            <img src='src/img/ganado.jpg' id='gana'>
        </div>
    </body>
</html>
