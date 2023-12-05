/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import com.safi.controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.Duration;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADSO
 */
public class CerrarSesionServlet extends HttpServlet {
Conexion cn = new Conexion();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet CerrarSesionServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CerrarSesionServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        
        Connection con = null; // Establece las variables de conexión a la base de datos
          PreparedStatement pst = null;
          
          // Obtiene la sesión actual del usuario
          HttpSession session = request.getSession();
          int seg_id = (int) session.getAttribute("seg_id"); // Obtiene el valor del atributo "seg_id" de la sesión y lo almacena en la variable seg_id
          String movimiento = (String) session.getAttribute("movimiento"); // Obtiene el valor del atributo "movimiento" de la sesión y lo almacena en la variable movimiento
          movimiento = movimiento + "Cer Ss."; // Agrega la cadena "Cer Ss-" al valor de "movimiento"

          // Obtener la marca de tiempo de entrada
          LocalDateTime tiempoEntrada = (LocalDateTime) session.getAttribute("tiempoEntrada");

          // Obtener la marca de tiempo de salida
          LocalDateTime tiempoSalida = LocalDateTime.now();

          // Calcular la duración de la sesión
          Duration duracionSesion = Duration.between(tiempoEntrada, tiempoSalida);

          // Obtener la duración en segundos
          long segundosDuracion = duracionSesion.getSeconds();
          long horas = segundosDuracion / 3600;
          long minutos = (segundosDuracion % 3600) / 60;
          long segundos = segundosDuracion % 60;

          String horass = String.valueOf(horas); //  
          String minutoss = String.valueOf(minutos);
          String segundoss = String.valueOf(segundos);
          String horatotal = horass + ":" + minutoss + ":" + segundoss + ".";
          
          //Actualizar la fila correspondiente en la tabla tblseguimiento
          String sqlUpdate = "UPDATE tblseguimiento SET seg_movimiento = ?, seg_duracionSesion = ? WHERE seg_id = ?";
          try {
               con = cn.AbrirConexion();
               
              // Establecer los valores para la inserción
              pst = con.prepareStatement(sqlUpdate);
              pst.setString(1, movimiento);
              pst.setString(2, horatotal);
              pst.setInt(3, seg_id);
              int rowsUpdated = pst.executeUpdate();
              if (rowsUpdated > 0) {
                  System.out.println("La duracion de inicio de sesión a sido actualizada con éxito.");
              } else {
                  System.out.println("  :(  Error al actualizar la duración de la sesión");
              }
          } catch (SQLException e) {
              System.out.println("Este es el error puedes llorar un ratico solucionandolo :c : " + e.getMessage());
          }

          // Invalidar la sesión
          session.invalidate();
          
          // Redirige a la página de inicio de sesión o a donde desees después de cerrar sesión
          response.sendRedirect("index.jsp");
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
