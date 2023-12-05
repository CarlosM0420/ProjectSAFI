/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.safi.pojo.Ubicaciones;
import com.safi.dao.UbicacionesDAO;
import java.util.List;
import javax.servlet.annotation.WebServlet;
import javax.json.Json;
import javax.json.JsonObjectBuilder;

/**
 *
 * @author ADSO
 */
@WebServlet(name = "UbicacionesServlet", urlPatterns = {"/UbicacionesServlet"})
public class UbicacionesServlet extends HttpServlet {

    String verubicaciones = "vistas/ubicaciones/ubicaciones.jsp";

    UbicacionesDAO ubDAO = new UbicacionesDAO();
    Ubicaciones ub = new Ubicaciones();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        // se define la acccion
        String accion = request.getParameter("accion");
        System.out.println(accion);

        if (accion.equalsIgnoreCase("EditarUbicacion")) {
            // Obtén el ID de ubicación del parámetro de la solicitud
            String ubi_id = request.getParameter("ubi_id");
            int id = Integer.parseInt(ubi_id);
            // Realiza la lógica para obtener los datos del DAO utilizando el ID
            // Suponiendo que tu DAO devuelve una lista de ubicaciones
            List<Ubicaciones> ubicacionesList = ubDAO.MostrarUbicacionesID(id);

            // Verifica si la lista no está vacía antes de continuar
            if (!ubicacionesList.isEmpty()) {
                // Obtén la primera ubicación (o el elemento que necesites de la lista)
                Ubicaciones ubicacion = ubicacionesList.get(0);

                // Ahora puedes trabajar con la ubicación obtenida
                JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
                jsonBuilder.add("ubi_codigo", ubicacion.getUbi_codigo());
                jsonBuilder.add("ubi_descripcion", ubicacion.getUbi_descripcion());
                jsonBuilder.add("ubi_centro_costo", ubicacion.getUbi_centro_costo());
                jsonBuilder.add("ubi_id", ubicacion.getId());

                // Configura la respuesta
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                try (PrintWriter out = response.getWriter()) {
                    out.print(jsonBuilder.build());
                }
            } else {
                // Manejar el caso en que la lista de ubicaciones está vacía
                response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404 Not Found
            }
        } else {

            //si la accion es igual a verubicaciones entonces dirigimos la pagina a la vista en donde se muestran las respectivas ubicaciones
            if (accion.equalsIgnoreCase("verubicaciones")) {
                acceso = verubicaciones;
            } //
            else if (accion.equalsIgnoreCase("agrubicacion")) {
                //asignamos los valores escritos por el usuario en los input a un objeto tipo String
                String txtubi_codigo = request.getParameter("txtubi_codigo");
                String txtubi_descripcion = request.getParameter("txtubi_descripcion");
                String txtubi_centro_costo = request.getParameter("txtubi_centro_costo");
                // enviamos los valores a el set de la clase POJO de ubicaciones
                ub.setUbi_codigo(Integer.parseInt(txtubi_codigo));
                ub.setUbi_descripcion(txtubi_descripcion);
                ub.setUbi_centro_costo(txtubi_centro_costo);
                //enviamos los datos a el DAO
                ubDAO.CrearUbicaciones(ub);
                //asignamos la vista a la que queremos redirigir
                acceso = verubicaciones;

            } else if (accion.equalsIgnoreCase("actubicacion")) {
                //asignamos los valores escritos por el usuario en los input a un objeto tipo String
                String txtubi_codigo = request.getParameter("txtubi_codigoEdit");
                String txtubi_descripcion = request.getParameter("txtubi_descripcionEdit");
                String txtubi_centro_costo = request.getParameter("txtubi_centro_costoEdit");
                int txtubi_id = Integer.parseInt(request.getParameter("txtubi_idEdit"));
                // enviamos los valores a el set de la clase POJO de ubicaciones
                ub.setUbi_codigo(Integer.parseInt(txtubi_codigo));
                ub.setUbi_descripcion(txtubi_descripcion);
                ub.setUbi_centro_costo(txtubi_centro_costo);
                ub.setId(txtubi_id);
                //enviamos los datos a el DAO
                ubDAO.ActualizarUbicacion(ub);
                //asignamos la vista a la que queremos redirigir
                acceso = verubicaciones;
            }

            //redirigimos a la vista seleccionada
            //RequestDispatcher vista=request.getRequestDispatcher(acceso); vista.forward(request, response);
            response.sendRedirect(acceso);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String acceso = "";
        // se define la acccion
        String accion = request.getParameter("accion");
        System.out.println(accion);

        if (accion.equalsIgnoreCase("EditarUbicacion")) {
            // Obtén el ID de ubicación del parámetro de la solicitud
            String ubi_id = request.getParameter("ubi_id");
            int id = Integer.parseInt(ubi_id);
            // Realiza la lógica para obtener los datos del DAO utilizando el ID
            // Suponiendo que tu DAO devuelve una lista de ubicaciones
            List<Ubicaciones> ubicacionesList = ubDAO.MostrarUbicacionesID(id);

            // Verifica si la lista no está vacía antes de continuar
            if (!ubicacionesList.isEmpty()) {
                // Obtén la primera ubicación (o el elemento que necesites de la lista)
                Ubicaciones ubicacion = ubicacionesList.get(0);

                // Ahora puedes trabajar con la ubicación obtenida
                JsonObjectBuilder jsonBuilder = Json.createObjectBuilder();
                jsonBuilder.add("ubi_codigo", ubicacion.getUbi_codigo());
                jsonBuilder.add("ubi_descripcion", ubicacion.getUbi_descripcion());
                jsonBuilder.add("ubi_centro_costo", ubicacion.getUbi_centro_costo());
                jsonBuilder.add("ubi_id", ubicacion.getId());

                // Configura la respuesta
                response.setContentType("application/json");
                response.setCharacterEncoding("UTF-8");

                try (PrintWriter out = response.getWriter()) {
                    out.print(jsonBuilder.build());
                }
            } else {
                // Manejar el caso en que la lista de ubicaciones está vacía
                response.setStatus(HttpServletResponse.SC_NOT_FOUND); // 404 Not Found
            }
        } else {

            //si la accion es igual a verubicaciones entonces dirigimos la pagina a la vista en donde se muestran las respectivas ubicaciones
            if (accion.equalsIgnoreCase("verubicaciones")) {
                acceso = verubicaciones;
            } //
            else if (accion.equalsIgnoreCase("agrubicacion")) {
                //asignamos los valores escritos por el usuario en los input a un objeto tipo String
                String txtubi_codigo = request.getParameter("txtubi_codigo");
                String txtubi_descripcion = request.getParameter("txtubi_descripcion");
                String txtubi_centro_costo = request.getParameter("txtubi_centro_costo");
                // enviamos los valores a el set de la clase POJO de ubicaciones
                ub.setUbi_codigo(Integer.parseInt(txtubi_codigo));
                ub.setUbi_descripcion(txtubi_descripcion);
                ub.setUbi_centro_costo(txtubi_centro_costo);
                //enviamos los datos a el DAO
                ubDAO.CrearUbicaciones(ub);
                //asignamos la vista a la que queremos redirigir
                acceso = verubicaciones;

            } else if (accion.equalsIgnoreCase("actubicacion")) {
                //asignamos los valores escritos por el usuario en los input a un objeto tipo String
                String txtubi_codigo = request.getParameter("txtubi_codigoEdit");
                String txtubi_descripcion = request.getParameter("txtubi_descripcionEdit");
                String txtubi_centro_costo = request.getParameter("txtubi_centro_costoEdit");
                int txtubi_id = Integer.parseInt(request.getParameter("txtubi_idEdit"));
                // enviamos los valores a el set de la clase POJO de ubicaciones
                ub.setUbi_codigo(Integer.parseInt(txtubi_codigo));
                ub.setUbi_descripcion(txtubi_descripcion);
                ub.setUbi_centro_costo(txtubi_centro_costo);
                ub.setId(txtubi_id);
                //enviamos los datos a el DAO
                ubDAO.ActualizarUbicacion(ub);
                //asignamos la vista a la que queremos redirigir
                acceso = verubicaciones;
            }

            //redirigimos a la vista seleccionada
            //RequestDispatcher vista=request.getRequestDispatcher(acceso); vista.forward(request, response);
            response.sendRedirect(acceso);
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
