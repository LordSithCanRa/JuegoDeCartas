/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 *
 * @author rcane
 */
public class JuegoC {
    private List<Carta> cartas;
    private String primera;
    private String anterior;
    private boolean mostrarPareja;
    private int intentos;
    
    public JuegoC(){
        cartas = new ArrayList();
        for (int i = 0; i < 2; i++) {//Bucle para duplicar las cartas
            cartas.add(new Carta ("BobaFet"));
            cartas.add(new Carta ("babyYoda"));
            cartas.add(new Carta ("cadBane"));
            cartas.add(new Carta ("duku"));
            cartas.add(new Carta ("k2"));
            cartas.add(new Carta ("maze"));
            cartas.add(new Carta ("obiWan"));
            cartas.add(new Carta ("sidious"));
        }
        Collections.shuffle(cartas);
        mostrarPareja = false;
        
    }
    public List<Carta> getCartas(){
        return cartas;
    }
    public boolean ganamos(List<Carta> cartas){
        for (int i = 0; i < cartas.size(); i++) {
            if(cartas.get(i).isMostrada()==false){
                return false;
            }
            
        }
    return true;//no ganamos
    }
    public void eliminar(String nombre){
        cartas.remove(new Carta(nombre));
    }

    public String getPrimera() {
        return primera;
    }

    public void setPrimera(String primera) {
        this.primera = primera;
    }

    public String getAnterior() {
        return anterior;
    }
    public void setAnterior(String anterior) {
        this.anterior = anterior;
    }

    public int getIntentos() {
        return intentos;
    }

    public void setIntentos(int intentos) {
        this.intentos = intentos;
    }

    public boolean isMostrarPareja() {
        return mostrarPareja;
    }

    public void setMostrarPareja(boolean mostrarPareja) {
        this.mostrarPareja = mostrarPareja;
    }
    
}
