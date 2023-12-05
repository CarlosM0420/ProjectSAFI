/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safi.dao;

import com.safi.controlador.Conexion;
import com.safi.pojo.ActivosFijos;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADSO
 */
public class ActivosFijosDAO {
    public int CrearActivoFijoID(ActivosFijos acfi) {
        int generatedID = -1;

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            CallableStatement cs = connection.prepareCall("{call sp_CrearActivoFijoID(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, acfi.getAct_codigo());
            cs.setInt(2, acfi.getAct_estado());
            cs.setString(3, acfi.getAct_marca());
            cs.setString(4, acfi.getAct_modelo());
            cs.setString(5, acfi.getAct_no_serie());
            cs.setString(6, acfi.getAct_fecha_adqu());
            cs.setInt(7, acfi.getAct_precio_adqu());
            cs.setInt(8, acfi.getAct_vida_util());
            cs.setInt(9, acfi.getAct_meses_depreciados());
            cs.setString(10, acfi.getAct_descripcion());
            cs.setInt(11, acfi.getTblfabricantes_id());
            cs.setInt(12, acfi.getTblubicacion_id());
            cs.setInt(13, acfi.getTbltiposactivosfijos_id());
            // Parámetro de salida para el ID generado
            cs.registerOutParameter(14, Types.INTEGER);
            cs.executeUpdate();
            // Obtener el ID generado
            generatedID = cs.getInt(14);
        } catch (SQLException e) {
            System.out.println(e);
        }
        return generatedID;
    }

    public List<ActivosFijos> MostrarActivos() {
        ArrayList<ActivosFijos> list = new ArrayList<>();

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("SELECT * FROM bdsafi.tbltiposactivosfijos");
            ResultSet rs = ps.executeQuery();
            //colocamos un while que recorra los valores de la tabla por cada dato que este
            while (rs.next()) {
                //declaramos el pojo de los activos fijos en un objeto
                ActivosFijos acfi = new ActivosFijos();
                //vamos añadiendo al objeto los datos de la base de datos
                acfi.setAct_id(rs.getInt("id"));
                acfi.setAct_codigo(rs.getInt("act_codigo"));
                acfi.setAct_estado(rs.getInt("act_estado"));
                acfi.setAct_marca(rs.getString("act_marca"));
                acfi.setAct_modelo(rs.getString("act_modelo"));
                acfi.setAct_no_serie(rs.getString("act_no_serie"));
                acfi.setAct_fecha_adqu(rs.getString("act_fecha_adqu"));
                acfi.setAct_precio_adqu(rs.getInt("act_precio_adqu"));
                acfi.setAct_vida_util(rs.getInt("act_vida_util"));
                acfi.setAct_meses_depreciados(rs.getInt("act_meses_depreciados"));
                acfi.setAct_descripcion(rs.getString("act_descripcion"));
                acfi.setTblfabricantes_id(rs.getInt("tblfabricantes_id"));
                acfi.setTbltiposactivosfijos_id(rs.getInt("tbltiposactivosfijos_id"));
                acfi.setTblubicacion_id(rs.getInt("tblubicacion_id"));
                //añadimos a la lista los datos que se tomaron de la base de datos
                list.add(acfi);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public int ActualizarActivoFijo(ActivosFijos acfi) {
        int status = 0;

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            CallableStatement cs = connection.prepareCall("{call bdsafi.sp_ActualizarActivoFijo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cs.setInt(1, acfi.getAct_codigo());
            cs.setInt(2, acfi.getAct_estado());
            cs.setString(3, acfi.getAct_marca());
            cs.setString(4, acfi.getAct_modelo());
            cs.setString(5, acfi.getAct_no_serie());
            cs.setString(6, acfi.getAct_fecha_adqu());
            cs.setInt(7, acfi.getAct_precio_adqu());
            cs.setInt(8, acfi.getAct_vida_util());
            cs.setInt(9, acfi.getAct_meses_depreciados());
            cs.setString(10, acfi.getAct_descripcion());
            cs.setInt(11, acfi.getTblfabricantes_id());
            cs.setInt(12, acfi.getTblubicacion_id());
            cs.setInt(13, acfi.getTbltiposactivosfijos_id());
            cs.setInt(14, acfi.getAct_id());
            
            status = cs.executeUpdate();                       
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

}
