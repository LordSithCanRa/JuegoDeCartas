<%-- 
    Document   : index
    Created on : 04-dic-2021, 15:58:44
    Author     : rcane
--%>

<%@page import="modelo.JuegoC"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inicio</title>
        <link rel='stylesheet' type='text/css' media='screen' href='index.css'>
        <link rel="icon" href="src/img/rebeldes.png">
        
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            String nombre = (String) request.getParameter("nombre");
            String dificultad = (String)request.getParameter("dificultad");
        %>
        <h1>Escriba su nombre para continuar hacia</h1>
        <h2>Juego de parejas de STARWARS</h2>
        <form method="POST">
            <p>Nombre de padawan</p>
            <input type="text" name="nombre" required/>
            <br>
            <input type="submit" value="Enviar" class="neon_button"/>
            <p>Selecciona una dificultad de intentos</p>
            <select name="dificultad" required>
                <optgroup label="Fácil">
                    <option value="7im1">7 intentos (Suma cada vez que acierta)</option>
                    <option value="9im1">9 intentos (Suma cada vez que acierta)</option>
                </optgroup>
                <optgroup label="Normal">
                    <option value="6i">6 intentos</option>
                    <option value="4i">4 intentos</option>
                </optgroup>
                <optgroup label="Difícil">
                    <option value="3i">3 intentos</option>
                    <option value="2im1">2 intentos (Suma cada vez que acierta)</option>
                </optgroup>
            </select>
        </form>
        <%
            if (nombre != null && dificultad != null) {
                sesion.setAttribute("nombre", nombre.toLowerCase());//Pasamos a minuscula por la fuente de star wars
                sesion.setAttribute("dificultad", dificultad);
                response.sendRedirect("juego.jsp");
                
            }
        %>


    </body>
</html>
