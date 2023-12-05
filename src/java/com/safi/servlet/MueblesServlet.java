/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import com.google.gson.Gson;
import com.safi.dao.ActivosFijosDAO;
import com.safi.dao.MueblesDAO;
import com.safi.pojo.ActivosFijos;
import com.safi.pojo.Muebles;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author OMAR OROZCO
 */
public class MueblesServlet extends HttpServlet {

    ActivosFijos acf = new ActivosFijos();
    Muebles mub = new Muebles();
    ActivosFijosDAO acfDAO = new ActivosFijosDAO();
    MueblesDAO mubDAO = new MueblesDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {       
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // definimos un objeto de tipo string que llevara el valor de la pagina a la que vamos a redirifir

        // se define la acccion, para saber que hara el servlet
        String accion = request.getParameter("accion");

        //si la accion es igual a verequiposcomputo entonces dirigimos la pagina a la vista en donde se muestran las respectivas ubicaciones
        if (accion.equalsIgnoreCase("vermuebles")) {
            response.sendRedirect("vistas/activosFijos/muebles.jsp");
        } // si la accion es igual a agregarequipocomputo hacemos la funcion de agregar
        else if (accion.equalsIgnoreCase("AgregarMuebles")) {

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
            String txtmub_denominacion = request.getParameter("txtmub_denominacion");
            String txtmub_material = request.getParameter("txtmub_material");
            int txtmub_peso = Integer.parseInt(request.getParameter("txtmub_peso"));
            int txtmub_ancho = Integer.parseInt(request.getParameter("txtmub_ancho"));
            int txtmub_alto = Integer.parseInt(request.getParameter("txtmub_alto"));
            int txtmub_largo = Integer.parseInt(request.getParameter("txtmub_largo"));

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
            mub.setMub_denominacion(txtmub_denominacion);
            mub.setMub_material(txtmub_material);
            mub.setMub_peso(txtmub_peso);
            mub.setMub_ancho(txtmub_ancho);
            mub.setMub_alto(txtmub_alto);
            mub.setMub_largo(txtmub_largo);
            mub.setTblactivosfijos_act_id(act_id);

            mubDAO.CrearEquipoComputo(mub);

            response.sendRedirect("vistas/activosFijos/muebles.jsp");

        } else if (accion.equalsIgnoreCase("EditarMuebles")) {
            // Obtén el valor del parámetro de la solicitud           
            String stringValue = request.getParameter("mub_id");            

            // Verifica si la cadena no es nula ni está vacía antes de intentar la conversión
            if (stringValue != null && !stringValue.isEmpty()) {
                try {
                    // Intenta convertir la cadena a un número
                    int intValue = Integer.parseInt(stringValue);            
                    // Realiza la lógica para obtener los datos del DAO utilizando el ID
                    List<Muebles> MueblesList = mubDAO.EditarMueblesActivos(intValue);
                    // Configura la respuesta
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8"); 
                    // Convierte la lista de equipos a formato JSON
                    Gson gson = new Gson();
                    String MueblesJson = gson.toJson(MueblesList);
                    try (PrintWriter out = response.getWriter()) {
                        out.print(MueblesJson);
                    }
                } catch (NumberFormatException e) {
                    // Maneja la excepción si la conversión no es exitosa
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
                }
            } else {
                // La cadena es nula o vacía, manejar este caso según tus necesidades
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            }
        }else if (accion.equalsIgnoreCase("ActualizarMueble")) {

            //tomamos los valores para la tabla activo fijo
            int txtact_id = Integer.parseInt(request.getParameter("txtact_idEdit"));
            int txtact_codigo = Integer.parseInt(request.getParameter("txtact_codigoEdit"));
            int txtact_estado = Integer.parseInt(request.getParameter("txtact_estadoEdit"));
            String txtact_marca = request.getParameter("txtact_marcaEdit");
            String txtact_modelo = request.getParameter("txtact_modeloEdit");
            String txtact_no_serie = request.getParameter("txtact_no_serieEdit");
            String txtact_fecha_adqu = request.getParameter("txtact_fecha_adquEdit");
            int txtact_precio_adqu = Integer.parseInt(request.getParameter("txtact_precio_adquEdit"));
            int txtact_vida_util = Integer.parseInt(request.getParameter("txtact_vida_utilEdit"));
            int txtact_meses_depreciados = Integer.parseInt(request.getParameter("txtact_meses_depreciadosEdit"));
            String txtact_descripcion = request.getParameter("txtact_descripcionEdit");
            int txttblfabricantes_id = Integer.parseInt(request.getParameter("txttblfabricantes_idEdit"));
            int txttblubicacion_id = Integer.parseInt(request.getParameter("txttblubicacion_idEdit"));

            //tomamos los valores para equipo de computo
            int txtmub_idEdit = Integer.parseInt(request.getParameter("txtmub_idEdit"));
            int txtmub_id_ActEdit = Integer.parseInt(request.getParameter("txtmub_id_ActEdit"));
            
            String txtmub_denominacionEdit = request.getParameter("txtmub_denominacionEdit");
            String txtmub_materialEdit = request.getParameter("txtmub_materialEdit");
            int txtmub_pesoEdit = Integer.parseInt(request.getParameter("txtmub_pesoEdit"));
            int txtmub_anchoEdit = Integer.parseInt(request.getParameter("txtmub_anchoEdit"));
            int txtmub_altoEdit = Integer.parseInt(request.getParameter("txtmub_altoEdit"));
            int txtmub_largoEdit = Integer.parseInt(request.getParameter("txtmub_largoEdit"));

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
            acf.setAct_id(txtact_id);
            //ejecutamos el metodo del DAO de Activos Fijos
            acfDAO.ActualizarActivoFijo(acf);            
            //enviamos los datos a los respectivos Sets de equipos computo
            mub.setMub_denominacion(txtmub_denominacionEdit);
            mub.setMub_material(txtmub_materialEdit);
            mub.setMub_peso(txtmub_pesoEdit);
            mub.setMub_ancho(txtmub_anchoEdit);
            mub.setMub_alto(txtmub_altoEdit);
            mub.setMub_largo(txtmub_largoEdit);
            mub.setTblactivosfijos_act_id(txtmub_id_ActEdit);           
            mub.setId(txtmub_idEdit);            
            //ejecutamos el metodo DAO de Equipos de computo            
            mubDAO.ActualizarMueble(mub);        
            
//          redirigimos a la pagina de muebles.
            response.sendRedirect("vistas/activosFijos/muebles.jsp");

        }
    }
}
