/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package be;

/**
 *
 * @author DIVAD
 */
public class contratobe {
    
    private String cod_contrato;
    private String fec_inicio_cont;
    private String fec_vencimiento;
    private int diasEmpenio;
    private Double monto;
    private Double interes;
    private Double prestamoMax;
    private Double moraxdia;
    private String cod_cliente;
    private String cod_empleado;
    private String cod_estado_contrato;

    public contratobe() {
    }

    public contratobe(String cod_contrato, String fec_inicio_cont, String fec_vencimiento, int diasEmpenio, Double monto, Double interes, Double prestamoMax, Double moraxdia, String cod_cliente, String cod_empleado, String cod_estado_contrato) {
        this.cod_contrato = cod_contrato;
        this.fec_inicio_cont = fec_inicio_cont;
        this.fec_vencimiento = fec_vencimiento;
        this.diasEmpenio = diasEmpenio;
        this.monto = monto;
        this.interes = interes;
        this.prestamoMax = prestamoMax;
        this.moraxdia = moraxdia;
        this.cod_cliente = cod_cliente;
        this.cod_empleado = cod_empleado;
        this.cod_estado_contrato = cod_estado_contrato;
    }

    public String getCod_contrato() {
        return cod_contrato;
    }

    public void setCod_contrato(String cod_contrato) {
        this.cod_contrato = cod_contrato;
    }

    public String getFec_inicio_cont() {
        return fec_inicio_cont;
    }

    public void setFec_inicio_cont(String fec_inicio_cont) {
        this.fec_inicio_cont = fec_inicio_cont;
    }

    public String getFec_vencimiento() {
        return fec_vencimiento;
    }

    public void setFec_vencimiento(String fec_vencimiento) {
        this.fec_vencimiento = fec_vencimiento;
    }

    public int getDiasEmpenio() {
        return diasEmpenio;
    }

    public void setDiasEmpenio(int diasEmpenio) {
        this.diasEmpenio = diasEmpenio;
    }

    public Double getMonto() {
        return monto;
    }

    public void setMonto(Double monto) {
        this.monto = monto;
    }

    public Double getInteres() {
        return interes;
    }

    public void setInteres(Double interes) {
        this.interes = interes;
    }

    public Double getPrestamoMax() {
        return prestamoMax;
    }

    public void setPrestamoMax(Double prestamoMax) {
        this.prestamoMax = prestamoMax;
    }

    public Double getMoraxdia() {
        return moraxdia;
    }

    public void setMoraxdia(Double moraxdia) {
        this.moraxdia = moraxdia;
    }

    public String getCod_cliente() {
        return cod_cliente;
    }

    public void setCod_cliente(String cod_cliente) {
        this.cod_cliente = cod_cliente;
    }

    public String getCod_empleado() {
        return cod_empleado;
    }

    public void setCod_empleado(String cod_empleado) {
        this.cod_empleado = cod_empleado;
    }

    public String getCod_estado_contrato() {
        return cod_estado_contrato;
    }

    public void setCod_estado_contrato(String cod_estado_contrato) {
        this.cod_estado_contrato = cod_estado_contrato;
    }
    
    
    
}
