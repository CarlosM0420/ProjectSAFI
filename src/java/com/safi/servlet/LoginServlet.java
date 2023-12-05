/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import com.safi.controlador.Conexion;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.InetAddress;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADSO
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/loginServlet"})
public class LoginServlet extends HttpServlet {
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
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet LoginServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
// Establecer objetos para la conexión y consulta a la base de datos
         Connection con = null;  // Objeto para la conexión a la base de datos
         PreparedStatement ps = null;  // Objeto para la ejecución de consultas preparadas
         ResultSet rs = null;  // Objeto para almacenar el resultado de las consultas

         // Definir rutas de acceso para redireccionar después del inicio de sesión
         String acceso = "vistas/inicio.html";  // Ruta de acceso para usuarios normales
         //String accesoadministrador = "vistas/inicio.html";  // Ruta de acceso para usuarios administradores

         // Obtener parámetros del formulario de inicio de sesión
         String usu_email = request.getParameter("email");  // Obtener el parámetro "email" de la solicitud HTTP
         String user_password = request.getParameter("password");  // Obtener el parámetro "password" de la solicitud HTTP

         // Inicializar variables para almacenar información del usuario
         String usu_nombre_apellidos = "";  // Variable para almacenar el nombre y apellidos del usuario
         String user_rol = "";  // Variable para almacenar el rol del usuario
         int usu_id = 0;  // Variable para almacenar el ID del usuario
         String movimiento = "";  // Variable para almacenar el SEGUIMIENTO DE SESSION

        // Consulta SQL para verificar las credenciales del usuario en tblusuarios
        String sql = "SELECT * FROM tblusuarios WHERE usu_email = ? AND user_password = ?";
                try {
            con = cn.AbrirConexion(); // Abrir conexión a la base de datos
            ps = con.prepareStatement(sql);
            ps.setString(1, usu_email);
            ps.setString(2, user_password);
            
            rs = ps.executeQuery(); // Ejecutar la consulta

            if (rs.next()) { // Si hay resultados en la consulta (usuario encontrado en tblusuarios)
                HttpSession session = request.getSession();

                movimiento = "Ini Ss - ";
                session.setAttribute("movimiento", movimiento);
                usu_nombre_apellidos = rs.getString("usu_nombre_apellidos");
                user_rol = rs.getString("user_rol");
                usu_id = rs.getInt("usu_id");

                // Establecer atributos de sesión con información del usuario
                session.setAttribute("usu_nombre_apellidos", usu_nombre_apellidos);
                session.setAttribute("user_rol", user_rol);
                session.setAttribute("usu_id", usu_id);
               // session.setAttribute("adm_id", adm_id);

                LocalDateTime tiempoEntrada = LocalDateTime.now(); // Obtener la hora de inicio de sesión
                DateTimeFormatter formatoHora = DateTimeFormatter.ofPattern("HH:mm:ss");
                String horaFormateada = tiempoEntrada.format(formatoHora);
                session.setAttribute("tiempoEntrada", tiempoEntrada);
                
                // Imprimir información del usuario en la consola
                System.out.println("Estás en el sistema " + usu_nombre_apellidos);
                System.out.println("Estás en el sistema " + user_rol);

                LocalDate fechaActual = LocalDate.now(); // Obtener la fecha actual

                // Formatear la fecha
                DateTimeFormatter formatoFecha = DateTimeFormatter.ofPattern("yyyy-MM-dd");
                String fechaFormateada = fechaActual.format(formatoFecha);

                // Establecer un atributo en la sesión
                // Obtener el atributo de la sesión
              //  String nombreadmin = (String) session.getAttribute(usu_nombre_apellidos);

                InetAddress localHost = InetAddress.getLocalHost(); // Obtener la dirección IP local del dispositivo
                String ipAddress = localHost.getHostAddress();
                
                // Imprimir información adicional del usuario en la consola
                System.out.println("Estás en el sistema " + usu_nombre_apellidos);
                System.out.println("Estás en el sistema " + user_rol);
                System.out.println("codigo " + usu_id);
                System.out.println("Fecha actual: " + fechaFormateada);
                System.out.println("Hora actual: " + horaFormateada);
                System.out.println("ip: " + ipAddress);
                
                // Insertar información de inicio de sesión en tblseguimiento
                String sqlInsert = "INSERT INTO tblseguimiento (seg_idUsuario,seg_nombre_apellidos,seg_rol, seg_fecha, seg_hora, seg_direccionIP, seg_movimiento, seg_duracionSesion) VALUES (?,?,?,?,?,?,?,?)";

                try {
                    con = cn.AbrirConexion();
                    ps = con.prepareStatement(sqlInsert);
                    
                    // Establecer los valores para la inserción
                    ps.setInt(1, usu_id);
                    ps.setString(2, usu_nombre_apellidos);
                    ps.setString(3, user_rol);
                    ps.setString(4, fechaFormateada);
                    ps.setString(5, horaFormateada);
                    ps.setString(6, ipAddress);
                    ps.setString(7, movimiento);
                    ps.setString(8, "00:00:00");

                    int rowsAffected = ps.executeUpdate(); // Ejecutar la inserción

                    if (rowsAffected > 0) { // Si la inserción es exitosa
                        // Obtener el último ID insertado usando LAST_INSERT_ID()
                        String sqlLastId = "SELECT MAX(seg_id) as last_id FROM tblseguimiento";
                        con = cn.AbrirConexion();
                        PreparedStatement pstt = con.prepareStatement(sqlLastId);
                        ResultSet rst = (ResultSet) pstt.executeQuery();

                        if (rst.next()) {
                            int ultimoID = rst.getInt("last_id");
                            System.out.println("Último ID insertado en tblseguimiento: " + ultimoID);
                            session.setAttribute("seg_id", ultimoID);
                            response.sendRedirect(acceso);
                        } else {
                            System.out.println("No se pudo obtener el último ID de tblseguimiento");
                        }
                    } else {
                        System.out.println("La inserción en tbl_seguimiento no tuvo éxito");
                    }
                } catch (SQLException e) {
                    System.out.println("Error al insertar en tblseguimiento: " + e.getMessage());
                } finally {
                    // Cerrar recursos (ResultSet, PreparedStatement, Connection)
                }
                // Enviar respuesta al cliente
              //  response.getWriter().println("Sesión creada con éxito. Nombre de usuario: " + nombreadmin);
               // response.sendRedirect(acceso);
            
           // } else { // Si el usuario no se encuentra ni en tblusuarios ni en tbladmin, redirigir a la página de error
           //     response.sendRedirect("loginError.jsp");
           //     System.out.println("Error al entrar al sistema");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }  
     
        
        
        
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
