/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safi.pojo;

/**
 *
 * @author ADSO
 */
public class EquiposComputo {
    int id,  equ_ram,  equ_puertos,  equ_capacidad_almacenamiento, tblactivosfijos_id;
    String equ_procesador,equ_discoduro_marca, equ_tajeta_video,equ_tipo_equipo;
    ActivosFijos activosfijos;

    public ActivosFijos getActivosfijos() {
        return activosfijos;
    }

    public void setActivosfijos(ActivosFijos activosfijos) {
        this.activosfijos = activosfijos;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getEqu_ram() {
        return equ_ram;
    }

    public void setEqu_ram(int equ_ram) {
        this.equ_ram = equ_ram;
    }

    public int getEqu_puertos() {
        return equ_puertos;
    }

    public void setEqu_puertos(int equ_puertos) {
        this.equ_puertos = equ_puertos;
    }

    public int getEqu_capacidad_almacenamiento() {
        return equ_capacidad_almacenamiento;
    }

    public void setEqu_capacidad_almacenamiento(int equ_capacidad_almacenamiento) {
        this.equ_capacidad_almacenamiento = equ_capacidad_almacenamiento;
    }

    public int getTblactivosfijos_id() {
        return tblactivosfijos_id;
    }

    public void setTblactivosfijos_id(int tblactivosfijos_id) {
        this.tblactivosfijos_id = tblactivosfijos_id;
    }

    public String getEqu_procesador() {
        return equ_procesador;
    }

    public void setEqu_procesador(String equ_procesador) {
        this.equ_procesador = equ_procesador;
    }

    public String getEqu_discoduro_marca() {
        return equ_discoduro_marca;
    }

    public void setEqu_discoduro_marca(String equ_discoduro_marca) {
        this.equ_discoduro_marca = equ_discoduro_marca;
    }

    public String getEqu_tajeta_video() {
        return equ_tajeta_video;
    }

    public void setEqu_tajeta_video(String equ_tajeta_video) {
        this.equ_tajeta_video = equ_tajeta_video;
    }

    public String getEqu_tipo_equipo() {
        return equ_tipo_equipo;
    }

    public void setEqu_tipo_equipo(String equ_tipo_equipo) {
        this.equ_tipo_equipo = equ_tipo_equipo;
    }
    
}    
