/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.safi.dao;
import com.safi.controlador.Conexion;
import com.safi.pojo.Fabricantes;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author ADSO
 */
public class FabricantesDAO {
    public List<Fabricantes> MostrarFabricantes(){
        ArrayList<Fabricantes> list = new ArrayList<>();
        
        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_MostrarFabricantes()");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                Fabricantes fab = new Fabricantes();
                fab.setId(rs.getInt("id"));
                fab.setFab_codigo(rs.getInt("fab_codigo"));
                fab.setFab_nombre(rs.getString("fab_nombre"));
                fab.setFab_direccion(rs.getString("fab_direccion"));
                fab.setFab_telefono(rs.getString("fab_telefono"));
                fab.setFab_observaciones(rs.getString("fab_observaciones"));
                list.add(fab);
            }                        
        } catch (Exception e) {
            System.err.println("Error al listar fabricantes"+e);
        }
        return list;
    }
}
