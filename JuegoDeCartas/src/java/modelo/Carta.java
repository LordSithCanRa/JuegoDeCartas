/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.Objects;

/**
 *
 * @author rcane
 */
public class Carta {
    private String nombre;
    private boolean mostrada;//False esta sin mostrar
                            //True se muestra
    
    public Carta(){
        this("");
    }
    public Carta(String nombre){
        this.nombre = nombre;
        this.mostrada = false;
    }
    public String getImagen(){
        if(mostrada){
            return "src/img/"+nombre+".png";
        }else{
            return "src/img/reverso.png";
        }
        
    }

    public boolean isMostrada() {
        return mostrada;
    }
    
    public void setMostrada(boolean mostrada) {
        this.mostrada = mostrada;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 11 * hash + Objects.hashCode(this.nombre);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Carta other = (Carta) obj;
        if (!Objects.equals(this.nombre, other.nombre)) {
            return false;
        }
        return true;
    }
    
}
