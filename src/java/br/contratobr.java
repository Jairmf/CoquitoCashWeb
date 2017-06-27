/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br;

import be.contratobe;
import dao.contratodao;
import java.util.List;

/**
 *
 * @author DIVAD
 */
public class contratobr {

    public contratobr() {
    }
    
    public List<contratobe> listaContratos(){
        return new contratodao().listaSinFiltro();
    }
    public List<contratobe> listaContratosFiltrados(String est, String fec){
        return new contratodao().lista(est,fec);
    }
    public List<contratobe> listaContratosFiltradosSoloEst(String est){
        return new contratodao().listaSoloEstado(est);
    }
    
}
