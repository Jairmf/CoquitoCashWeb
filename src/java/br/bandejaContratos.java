/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br;

import be.contratobe;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Estudiante
 */
public class bandejaContratos {

    private List<contratobe> lista;
    
    public bandejaContratos() {
        lista = new ArrayList();
    }

    public List<contratobe> getLista() {
        return lista;
    }
    
    public void agregar(contratobe e){
        if(existeContrato(e)==0){
            lista.add(e);
        }
    }
    /*public int getCreditos(){
        int r = 0;
        for(contratobe x:this.lista){
            r=r+x.getCreditos();
        }
        return r;
    }*/
    
    public void eliminar(String codcontrato){
        int fila=-1;
        int posicion=-1;
        for(contratobe x:this.lista){
            fila=fila+1;
            if(x.getCod_contrato().equals(codcontrato)){
                posicion=fila;
            }
        }
        if(posicion>=0){
            this.lista.remove(posicion);
        }
    }
    
    public int existeContrato(contratobe e){
        int r = 0;
        for(contratobe x:this.lista){
            if(x.getCod_contrato().equals(e.getCod_contrato())){
                r = 1;
            }
        }
        return r;
    }
    
}
