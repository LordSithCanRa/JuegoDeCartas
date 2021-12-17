<%-- 
    Document   : pierdes
    Created on : 12-dic-2021, 15:09:39
    Author     : rcane
--%>
<%@page import="modelo.JuegoC"%>
<%
    HttpSession sesion = request.getSession();
    String nombre = (String)sesion.getAttribute("nombre");
    JuegoC juego = (JuegoC)sesion.getAttribute("juego");
    if(nombre==null || juego == null || !(juego.getIntentos()<=1)){
        response.sendRedirect("index.jsp");
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Has perdido</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel='stylesheet' type='text/css' media='screen' href='perdiste.css'>
        <link rel="icon" href="src/img/rebeldes.png">
    </head>
    <body>
        <div class="contenedor">
            <h1>Has perdido <%=nombre%></h1>        
            <p>EL LADO OSCURO PUEDE CONTIGO</p>
        </div>
        <div class="img">
            <img src='src/img/pierdes.jpg' id='imagen'>
        </div>
       <div class="publi">  <!-- Aqui antes iba publicidad pero se cambió por botones-->
            <p><form action="juego.jsp" method="POST"><input type="submit" name="reiniciar" value="Reiniciar" class="neon_button"></form></p>
            <p><form action="cerrarSesion"><input type="submit" value="Cerrar Sesion" class="neon_button"></form></p>
        </div>
        
    </body>
</html>
