package com.safi.pojo;

/**
 *
 * @author OMAR OROZCO
 */
public class Muebles {

    int id, tblactivosfijos_act_id;
    String mub_denominacion, mub_material, mub_foto1, mub_foto2;
    float mub_peso, mub_ancho, mub_alto, mub_largo;
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

    public int getTblactivosfijos_act_id() {
        return tblactivosfijos_act_id;
    }

    public void setTblactivosfijos_act_id(int tblactivosfijos_act_id) {
        this.tblactivosfijos_act_id = tblactivosfijos_act_id;
    }

    public String getMub_denominacion() {
        return mub_denominacion;
    }

    public void setMub_denominacion(String mub_denominacion) {
        this.mub_denominacion = mub_denominacion;
    }

    public String getMub_material() {
        return mub_material;
    }

    public void setMub_material(String mub_material) {
        this.mub_material = mub_material;
    }

    public String getMub_foto1() {
        return mub_foto1;
    }

    public void setMub_foto1(String mub_foto1) {
        this.mub_foto1 = mub_foto1;
    }

    public String getMub_foto2() {
        return mub_foto2;
    }

    public void setMub_foto2(String mub_foto2) {
        this.mub_foto2 = mub_foto2;
    }

    public float getMub_peso() {
        return mub_peso;
    }

    public void setMub_peso(float mub_peso) {
        this.mub_peso = mub_peso;
    }

    public float getMub_ancho() {
        return mub_ancho;
    }

    public void setMub_ancho(float mub_ancho) {
        this.mub_ancho = mub_ancho;
    }

    public float getMub_alto() {
        return mub_alto;
    }

    public void setMub_alto(float mub_alto) {
        this.mub_alto = mub_alto;
    }    

    public float getMub_largo() {
        return mub_largo;
    }

    public void setMub_largo(float mub_largo) {
        this.mub_largo = mub_largo;
    }
    
}
