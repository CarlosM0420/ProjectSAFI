package com.safi.dao;

import com.safi.pojo.Muebles;
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
public class MueblesDAO {

    public List<Muebles> MostrarMueblesActivos() {
        ArrayList<Muebles> list = new ArrayList<>();
        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_MostrarMueblesActivos()");
            ResultSet rs = ps.executeQuery();
            //colocamos un while que recorra los valores de la tabla por cada dato que este
            while (rs.next()) {
                //declaramos el pojo de los activos fijos en un objeto
                Muebles mub = new Muebles();
                ActivosFijos act = new ActivosFijos();

                //vamos añadiendo al objeto los datos de la base de datos de Equipos de computo
                mub.setId(rs.getInt("id"));
                mub.setMub_denominacion(rs.getString("mub_denominacion"));
                mub.setMub_material(rs.getString("mub_material"));
                mub.setMub_peso(rs.getFloat("mub_peso"));
                mub.setMub_ancho(rs.getFloat("mub_ancho"));
                mub.setMub_alto(rs.getFloat("mub_alto"));
                mub.setMub_largo(rs.getFloat("mub_largo"));
                mub.setMub_foto1(rs.getString("mub_foto1"));
                mub.setMub_foto2(rs.getString("mub_foto2"));
                mub.setTblactivosfijos_act_id(rs.getInt("tblactivosfijos_act_id"));
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
                mub.setActivosfijos(act);
                //añadimos a la lista los datos que se tomaron de la base de datos
                list.add(mub);
            }
        } catch (NumberFormatException | SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int CrearEquipoComputo(Muebles mub) {
        int status = 0;

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_CrearMuebles(?,?,?,?,?,?,?,?,?)");

            ps.setString(1, mub.getMub_denominacion());
            ps.setString(2, mub.getMub_material());
            ps.setFloat(3, mub.getMub_peso());
            ps.setFloat(4, mub.getMub_ancho());
            ps.setFloat(5, mub.getMub_alto());
            ps.setFloat(6, mub.getMub_largo());
            ps.setString(7, mub.getMub_foto1());
            ps.setString(8, mub.getMub_foto2());
            ps.setInt(9, mub.getTblactivosfijos_act_id());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }

    public List<Muebles> EditarMueblesActivos(int id) {
        ArrayList<Muebles> list = new ArrayList<>();
        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_MostrarMueblesActivosID('" + id + "')");
            ResultSet rs = ps.executeQuery();
            //colocamos un while que recorra los valores de la tabla por cada dato que este
            while (rs.next()) {
                //declaramos el pojo de los activos fijos en un objeto
                Muebles mub = new Muebles();
                ActivosFijos act = new ActivosFijos();

                //vamos añadiendo al objeto los datos de la base de datos de Equipos de computo
                mub.setId(rs.getInt("id"));
                mub.setMub_denominacion(rs.getString("mub_denominacion"));
                mub.setMub_material(rs.getString("mub_material"));
                mub.setMub_peso(rs.getFloat("mub_peso"));
                mub.setMub_ancho(rs.getFloat("mub_ancho"));
                mub.setMub_alto(rs.getFloat("mub_alto"));
                mub.setMub_largo(rs.getFloat("mub_largo"));
                mub.setMub_foto1(rs.getString("mub_foto1"));
                mub.setMub_foto2(rs.getString("mub_foto2"));
                mub.setTblactivosfijos_act_id(rs.getInt("tblactivosfijos_act_id"));
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
                mub.setActivosfijos(act);
                //añadimos a la lista los datos que se tomaron de la base de datos
                list.add(mub);
            }
        } catch (NumberFormatException | SQLException e) {
            System.out.println(e);
        }

        return list;
    }

    public int ActualizarMueble(Muebles mub) {
        int status = 0;

        try {
            Conexion con = new Conexion();
            Connection connection = con.AbrirConexion();
            PreparedStatement ps = connection.prepareStatement("call bdsafi.sp_ActualizarMueble(?,?,?,?,?,?,?,?,?,?)");

            ps.setString(1, mub.getMub_denominacion());
            ps.setString(2, mub.getMub_material());
            ps.setFloat(3, mub.getMub_peso());
            ps.setFloat(4, mub.getMub_ancho());
            ps.setFloat(5, mub.getMub_alto());
            ps.setFloat(6, mub.getMub_largo());
            ps.setString(7, mub.getMub_foto1());
            ps.setString(8, mub.getMub_foto2());
            ps.setInt(9, mub.getTblactivosfijos_act_id());
            ps.setInt(10, mub.getId());

            status = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        return status;
    }
}
