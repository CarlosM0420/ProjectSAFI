package com.safi.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.safi.dao.FabricantesDAO;
import com.safi.pojo.Fabricantes;

/**
 *
 * @author ADSO
 */
public class FabricantesServlet extends HttpServlet {

    Fabricantes fab = new Fabricantes();
    FabricantesDAO fabDAO = new FabricantesDAO();

    String verfabricantes = "vistas/fabricantes/fabricantes.jsp";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acceso = "";
        // se define la acccion
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("AgregarFabricante")) {
            //tomamos los valores para la tabla activo fijo
            int txtfab_codigo = Integer.parseInt(request.getParameter("txtfab_codigo"));
            String txtfab_nombre = request.getParameter("txtfab_nombre");
            String txtfab_direccion = request.getParameter("txtfab_direccion");
            String txtfab_telefono = request.getParameter("txtfab_telefono");
            String txtfab_descripcion = request.getParameter("txtfab_descripcion");
            
            fab.setFab_codigo(txtfab_codigo);
            fab.setFab_nombre(txtfab_nombre);
            fab.setFab_direccion(txtfab_direccion);
            fab.setFab_telefono(txtfab_telefono);
            fab.setFab_observaciones(txtfab_descripcion);
            
            fabDAO.CrearUbicaciones(fab);
            response.sendRedirect("vistas/fabricantes/fabricantes.jsp");
        }
    }

}
