/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safi.dao;


import com.safi.pojo.EquiposComputo;
import com.safi.pojo.ActivosFijos;
import com.safi.controlador.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADSO
 */
public class EquiposComputoDAO {

    public int CrearEquipoComputo(EquiposComputo equ) {
        int status = 0;

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_CrearEquipoComputo(?,?,?,?,?,?,?,?)");
            
            ps.setString(1, equ.getEqu_procesador());
            ps.setInt(2, equ.getEqu_ram());
            ps.setString(3, equ.getEqu_discoduro_marca());
            ps.setString(4, equ.getEqu_tajeta_video());
            ps.setInt(5, equ.getEqu_puertos());
            ps.setString(6, equ.getEqu_tipo_equipo());
            ps.setInt(7, equ.getEqu_capacidad_almacenamiento());
            ps.setInt(8, equ.getTblactivosfijos_id());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public List<EquiposComputo> MostrarEquipoComputoResumen() {
        ArrayList<EquiposComputo> list = new ArrayList<>();
        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_MostrarEquiposResumen()");
            ResultSet rs = ps.executeQuery();
            //colocamos un while que recorra los valores de la tabla por cada dato que este
            while (rs.next()) {
                //declaramos el pojo de los activos fijos en un objeto
                EquiposComputo equ = new EquiposComputo();
                ActivosFijos act = new ActivosFijos();
                //vamos añadiendo al objeto los datos de la base de datos de Equipos de computo
                equ.setId(rs.getInt("id"));
                equ.setEqu_procesador(rs.getString("equ_procesador"));                
                // rellenar datos de Activos Fijos
                act.setAct_codigo(rs.getInt("act_codigo"));
                act.setAct_estado(rs.getInt("act_estado"));
                act.setAct_marca(rs.getString("act_marca"));
                act.setAct_modelo(rs.getString("act_modelo"));
                act.setAct_no_serie(rs.getString("act_no_serie"));
                act.setAct_precio_adqu(rs.getInt("act_precio_adqu"));
                //asignar activos fijos a equipos 
                equ.setActivosfijos(act);
                //añadimos a la lista los datos que se tomaron de la base de datos
                list.add(equ);
            }
        } catch (NumberFormatException | SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public List<EquiposComputo> EditarEquiposComputo(int id) {
        ArrayList<EquiposComputo> list = new ArrayList<>();
        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_MostrarEquiposActivos('"+id+"')");
            ResultSet rs = ps.executeQuery();
            //colocamos un while que recorra los valores de la tabla por cada dato que este
            while (rs.next()) {
                //declaramos el pojo de los activos fijos en un objeto
                EquiposComputo equ = new EquiposComputo();
                ActivosFijos act = new ActivosFijos();
                
                //vamos añadiendo al objeto los datos de la base de datos de Equipos de computo
                equ.setId(rs.getInt("id"));
                equ.setEqu_procesador(rs.getString("equ_procesador"));    
                equ.setEqu_ram(rs.getInt("equ_ram"));    
                equ.setEqu_discoduro_marca(rs.getString("equ_discoduro_marca"));  
                equ.setEqu_tajeta_video(rs.getString("equ_tajeta_video"));  
                equ.setEqu_puertos(rs.getInt("equ_puertos"));    
                equ.setEqu_tipo_equipo(rs.getString("equ_tipo_equipo"));  
                equ.setEqu_capacidad_almacenamiento(rs.getInt("equ_capacidad_almacenamiento"));   
                
                
                // rellenar datos de Activos Fijos
                
                act.setAct_id(rs.getInt("act_codigo"));
                act.setAct_codigo(rs.getInt("act_codigo"));
                act.setAct_estado(rs.getInt("act_estado"));
                act.setAct_marca(rs.getString("act_marca"));
                act.setAct_modelo(rs.getString("act_modelo"));
                act.setAct_no_serie(rs.getString("act_no_serie"));
                act.setAct_fecha_adqu(rs.getString("act_fecha_adqu"));
                act.setAct_precio_adqu(rs.getInt("act_precio_adqu"));
                act.setAct_vida_util(rs.getInt("act_vida_util"));
                act.setAct_meses_depreciados(rs.getInt("act_meses_depreciados"));
                act.setAct_descripcion(rs.getString("act_descripcion"));
                act.setTblfabricantes_id(rs.getInt("tblfabricantes_id"));
                act.setTblubicacion_id(rs.getInt("tblubicacion_id"));
                act.setTbltiposactivosfijos_id(rs.getInt("tbltiposactivosfijos_id"));
                
                
                
                //asignar activos fijos a equipos 
                equ.setActivosfijos(act);
                //añadimos a la lista los datos que se tomaron de la base de datos
                list.add(equ);
            }
        } catch (NumberFormatException | SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
}
