/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import com.safi.dao.ActivosFijosDAO;
import com.safi.pojo.ActivosFijos;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADSO
 */
@WebServlet(name = "ActivosFijosServlet", urlPatterns = {"/activosFijosServlet"})
public class ActivosFijosServlet extends HttpServlet {

    String verActivosFijos = "vistas/activosFijos/veractivosFijos.jsp";

    ActivosFijos acfi = new ActivosFijos();
    ActivosFijosDAO acfiDAO = new ActivosFijosDAO();  

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        processRequest(request, response);
        //se define acceso
        String acceso = "";
        // se define la acccion
        String accion = request.getParameter("accion");

        //si la accion es igual a verubicaciones entonces dirigimos la pagina a la vista en donde se muestran las respectivas ubicaciones
        if (accion.equalsIgnoreCase("veractivosfijos")) {
            acceso = verActivosFijos;
        }
        else if(accion.equalsIgnoreCase("agractivofijo")){            
            
                     
            //asignamos la vista a la que queremos redirigir
            acceso = verActivosFijos;            
            
        }

        
        
        
        response.sendRedirect(acceso);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
