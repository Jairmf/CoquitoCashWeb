/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import be.contratobe;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DIVAD
 */
public class contratodao {

    public contratodao() {
    }
    
    public List<contratobe> lista(String est, String fec){
        List<contratobe> l = new ArrayList();
        String sql = "select cod_contrato,fec_inicio_cont,fec_vencimiento,diasEmpenio,monto,interes,prestamoMax,moraxdia,cod_cliente,cod_empleado,cod_estado_contrato from contrato where cod_estado_contrato='"+est+"' and fec_inicio_cont='"+fec+"'";
        
        try {
            Connection c = new bd().obtieneConexionMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                contratobe e = new contratobe();
                e.setCod_contrato(rs.getString("cod_contrato"));
                e.setFec_inicio_cont(rs.getString("fec_inicio_cont"));
                e.setFec_vencimiento(rs.getString("fec_vencimiento"));
                e.setDiasEmpenio(rs.getInt("diasEmpenio"));
                e.setMonto(rs.getDouble("monto"));
                e.setInteres(rs.getDouble("interes"));
                e.setPrestamoMax(rs.getDouble("prestamoMax"));
                e.setMoraxdia(rs.getDouble("moraxdia"));
                e.setCod_cliente(rs.getString("cod_cliente"));
                e.setCod_empleado(rs.getString("cod_empleado"));
                e.setCod_estado_contrato(rs.getString("cod_estado_contrato"));
                l.add(e);
            }
            
            rs.close();
            st.close();
            c.close();
        } catch (SQLException ex) {
            Logger.getLogger(contratodao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    
    public List<contratobe> listaSinFiltro(){
        List<contratobe> l = new ArrayList();
        String sql = "select cod_contrato,fec_inicio_cont,fec_vencimiento,diasEmpenio,monto,interes,prestamoMax,moraxdia,cod_cliente,cod_empleado,cod_estado_contrato from contrato";
        
        try {
            Connection c = new bd().obtieneConexionMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                contratobe e = new contratobe();
                e.setCod_contrato(rs.getString("cod_contrato"));
                e.setFec_inicio_cont(rs.getString("fec_inicio_cont"));
                e.setFec_vencimiento(rs.getString("fec_vencimiento"));
                e.setDiasEmpenio(rs.getInt("diasEmpenio"));
                e.setMonto(rs.getDouble("monto"));
                e.setInteres(rs.getDouble("interes"));
                e.setPrestamoMax(rs.getDouble("prestamoMax"));
                e.setMoraxdia(rs.getDouble("moraxdia"));
                e.setCod_cliente(rs.getString("cod_cliente"));
                e.setCod_empleado(rs.getString("cod_empleado"));
                e.setCod_estado_contrato(rs.getString("cod_estado_contrato"));
                l.add(e);
            }
            
            rs.close();
            st.close();
            c.close();
        } catch (SQLException ex) {
            Logger.getLogger(contratodao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    public List<contratobe> listaSoloEstado(String est){
        List<contratobe> l = new ArrayList();
        String sql = "select cod_contrato,fec_inicio_cont,fec_vencimiento,diasEmpenio,monto,interes,prestamoMax,moraxdia,cod_cliente,cod_empleado,cod_estado_contrato from contrato where cod_estado_contrato='"+est+"'";
        
        try {
            Connection c = new bd().obtieneConexionMysql();
            Statement st = c.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while(rs.next()){
                contratobe e = new contratobe();
                e.setCod_contrato(rs.getString("cod_contrato"));
                e.setFec_inicio_cont(rs.getString("fec_inicio_cont"));
                e.setFec_vencimiento(rs.getString("fec_vencimiento"));
                e.setDiasEmpenio(rs.getInt("diasEmpenio"));
                e.setMonto(rs.getDouble("monto"));
                e.setInteres(rs.getDouble("interes"));
                e.setPrestamoMax(rs.getDouble("prestamoMax"));
                e.setMoraxdia(rs.getDouble("moraxdia"));
                e.setCod_cliente(rs.getString("cod_cliente"));
                e.setCod_empleado(rs.getString("cod_empleado"));
                e.setCod_estado_contrato(rs.getString("cod_estado_contrato"));
                l.add(e);
            }
            
            rs.close();
            st.close();
            c.close();
        } catch (SQLException ex) {
            Logger.getLogger(contratodao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return l;
    }
    
}
