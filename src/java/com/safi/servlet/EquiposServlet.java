/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.safi.dao.ActivosFijosDAO;
import com.safi.dao.EquiposComputoDAO;
import com.safi.pojo.ActivosFijos;
import com.safi.pojo.EquiposComputo;

/**
 *
 * @author ADSO
 */
public class EquiposServlet extends HttpServlet {

 String verequiposcomputo = "vistas/activosFijos/equiposcomputo.jsp";

    ActivosFijos acf = new ActivosFijos();
    EquiposComputo equ = new EquiposComputo();
    ActivosFijosDAO acfDAO = new ActivosFijosDAO();
    EquiposComputoDAO equDAO = new EquiposComputoDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // definimos un objeto de tipo string que llevara el valor de la pagina a la que vamos a redirifir
        String acceso = "";
        // se define la acccion, para saber que hara el servlet
        String accion = request.getParameter("accion");

        //si la accion es igual a verequiposcomputo entonces dirigimos la pagina a la vista en donde se muestran las respectivas ubicaciones
        if (accion.equalsIgnoreCase("verequiposcomputo")) {                    
            acceso = verequiposcomputo;
        } // si la accion es igual a agregarequipocomputo hacemos la funcion de agregar
        else if (accion.equalsIgnoreCase("agrequipocomputo")) {

            //tomamos los valores para la tabla activo fijo
            int txtact_codigo = Integer.parseInt(request.getParameter("txtact_codigo"));
            int txtact_estado = Integer.parseInt(request.getParameter("txtact_estado"));
            String txtact_marca = request.getParameter("txtact_marca");
            String txtact_modelo = request.getParameter("txtact_modelo");
            String txtact_no_serie = request.getParameter("txtact_no_serie");
            String txtact_fecha_adqu = request.getParameter("txtact_fecha_adqu");
            int txtact_precio_adqu = Integer.parseInt(request.getParameter("txtact_precio_adqu"));
            int txtact_vida_util = Integer.parseInt(request.getParameter("txtact_vida_util"));
            int txtact_meses_depreciados = Integer.parseInt(request.getParameter("txtact_meses_depreciados"));
            String txtact_descripcion = request.getParameter("txtact_descripcion");
            int txttblfabricantes_id = Integer.parseInt(request.getParameter("txttblfabricantes_id"));
            int txttblubicacion_id = Integer.parseInt(request.getParameter("txttblubicacion_id"));
            
            

            //tomamos los valores para equipo de computo
            String txtequ_procesador = request.getParameter("txtequ_procesador");
            int txtequ_ram = Integer.parseInt(request.getParameter("txtequ_ram"));
            String txtequ_discoduro_marca = request.getParameter("txtequ_discoduro_marca");
            String txtequ_tajeta_video = request.getParameter("txtequ_tajeta_video");
            int txtequ_puertos = Integer.parseInt(request.getParameter("txtequ_puertos"));
            String txtequ_tipo_equipo = request.getParameter("txtequ_tipo_equipo");
            int txtequ_capacidad_almacenamiento = Integer.parseInt(request.getParameter("txtequ_capacidad_almacenamiento"));

            //enviamos los datos a los respectivos Sets de activos fijos
            acf.setAct_codigo(txtact_codigo);
            acf.setAct_estado(txtact_estado);
            acf.setAct_marca(txtact_marca);
            acf.setAct_modelo(txtact_modelo);
            acf.setAct_no_serie(txtact_no_serie);
            acf.setAct_fecha_adqu(txtact_fecha_adqu);
            acf.setAct_precio_adqu(txtact_precio_adqu);
            acf.setAct_vida_util(txtact_vida_util);
            acf.setAct_meses_depreciados(txtact_meses_depreciados);
            acf.setAct_descripcion(txtact_descripcion);
            acf.setTblfabricantes_id(txttblfabricantes_id);
            acf.setTblubicacion_id(txttblubicacion_id);
            
            acf.setTbltiposactivosfijos_id(1);

            //ejecutamos el metodo del DAO
            int act_id = acfDAO.CrearActivoFijoID(acf); 
            //enviamos los datos a los respectivos Sets de equipos computo
            equ.setEqu_procesador(txtequ_procesador);            
            equ.setEqu_ram(txtequ_ram);            
            equ.setEqu_discoduro_marca(txtequ_discoduro_marca);           
            equ.setEqu_tajeta_video(txtequ_tajeta_video);            
            equ.setEqu_puertos(txtequ_puertos);            
            equ.setEqu_tipo_equipo(txtequ_tipo_equipo);            
            equ.setEqu_capacidad_almacenamiento(txtequ_capacidad_almacenamiento);            
            equ.setTblactivosfijos_id(act_id);                                    
            equDAO.CrearEquipoComputo(equ);
            
            acceso= verequiposcomputo;

        }
        response.sendRedirect(acceso);
    }
}
