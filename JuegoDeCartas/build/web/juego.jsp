<%-- 
    Document   : juego
    Created on : 04-dic-2021, 16:04:00
    Author     : rcane
--%>

<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="modelo.JuegoC"%>
<%@page import="modelo.Carta"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
    HttpSession sesion = request.getSession();
    JuegoC juego = (JuegoC)session.getAttribute("juego");//Sesion del juego
    String dificult = (String)session.getAttribute("dificultad");
    int intentos = Character.getNumericValue(dificult.charAt(0));
    boolean sumaInt = false;
    if(dificult.length()>2){
        sumaInt=true;
    }
    //Si la sesion del juego no existe
    if(juego == null ||request.getParameter("reiniciar") != null){
        juego = new JuegoC();
        juego.setIntentos(intentos);
        session.setAttribute("juego", juego);//guardamos el juego en la sesion
    }
    List<Carta> cartas = juego.getCartas();
    String anterior = (String)request.getParameter("selec");
    String texto = "";
    if(juego.isMostrarPareja()){
        String[] arrAn = juego.getAnterior().split("-");
        String[] arrPr = juego.getPrimera().split("-");
        int pos1 = Integer.parseInt(arrAn[1]);
        int pos2 = Integer.parseInt(arrPr[1]);
        cartas.get(pos1-1).setMostrada(false);
        cartas.get(pos2-1).setMostrada(false);
        juego.setAnterior(null);
        juego.setPrimera(null);
        juego.setIntentos(juego.getIntentos()-1);
        if(juego.getIntentos()<=0){
            response.sendRedirect("pierdes.jsp");
        }
        juego.setMostrarPareja(false);
    }
    if(juego.getAnterior()==null){//Entramos por primera vez
        juego.setAnterior(anterior);
        
    }else if(juego.getPrimera()==null && juego.getAnterior()!=null){//Segunda vez
        juego.setPrimera(anterior);
        String[] arrAn = juego.getAnterior().split("-");
        String[] arrPr = juego.getPrimera().split("-");
        int pos1 = Integer.parseInt(arrAn[1]);
        int pos2 = Integer.parseInt(arrPr[1]);
        if(cartas.get(pos1-1).isMostrada() || cartas.get(pos2-1).isMostrada()){//Que no se de la vuelta una acertada
            juego.setAnterior(null);
            juego.setPrimera(null);
            anterior=null;
        }else{
            cartas.get(pos1-1).setMostrada(true);
            cartas.get(pos2-1).setMostrada(true);

            if(arrPr[0].equals(arrAn[0])&&pos1!=pos2){//Si acierta
                if(sumaInt){
                    juego.setIntentos(juego.getIntentos()+1);//Sumamos un intento por acierto para que sea facil
                }
                    
                    juego.setAnterior(null);
                    juego.setPrimera(null);
                    anterior=null;
                    if(juego.ganamos(cartas)){//Si ganamos
                        response.sendRedirect("ganamos.jsp");
                    }
            }else{
                response.setHeader("Refresh", "2; URL=juego.jsp");//Lo pongo a 1s porque acordamos que 2s es demasiado
                juego.setMostrarPareja(true);
                
                anterior=null;
                
            }
        }
        
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Juego de cartas</title>
        <link rel='stylesheet' type='text/css' media='screen' href='juego.css'>
        <link rel="icon" href="src/img/rebeldes.png">
    </head>
    <body>
        <h1>Bienvenido <%= (String)sesion.getAttribute("nombre") %></h1>
        <p>Intentos: <%= juego.getIntentos()%></p>
        <table>
            
                <%
                    int columnas = 0;
                    int contador = 1;
                    for(Carta c : cartas){
                        
                %>
                    <%
                        if(columnas == 4){
                    %>
                        <tr>
                    <%
                        }
                    %>
                        <td>
                        <form class="img" method="POST">
                            <input type="image" src="<%= c.getImagen() %>" name="<%= c.getNombre() %>">
                            <input type="hidden" name="selec" value="<%= c.getNombre()%>-<%=contador%>">
                        </form>
                        <%
                            columnas++;
                            contador++;
                        %>
                        </td>
                    <%
                        if(columnas == 4){
                        columnas = 0;
                    %>
                        </tr>
                        
                    <%
                        }
                    %>
                <%
                    }
                %>
           
        </table>
    </body>
</html>
