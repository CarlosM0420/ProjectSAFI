/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.safi.servlet;

import com.google.gson.Gson;
import com.safi.controlador.Conexion;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.safi.dao.ActivosFijosDAO;
import com.safi.dao.EquiposComputoDAO;
import com.safi.pojo.ActivosFijos;
import com.safi.pojo.EquiposComputo;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;
import javax.json.Json;
import javax.json.JsonObjectBuilder;
import javax.mail.*;
import javax.mail.internet.*;

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
        String acceso = "";
        // se define la acccion
        String accion = request.getParameter("accion");

        if (accion.equalsIgnoreCase("EditarEquipo")) {
            // Obtén el valor del parámetro de la solicitud
            String stringValue = request.getParameter("equ_id");

            // Verifica si la cadena no es nula ni está vacía antes de intentar la conversión
            if (stringValue != null && !stringValue.isEmpty()) {
                try {
                    // Intenta convertir la cadena a un número
                    int intValue = Integer.parseInt(stringValue);

                    // Realiza la lógica para obtener los datos del DAO utilizando el ID
                    List<EquiposComputo> EquiposList = equDAO.EditarEquiposComputo(intValue);

                    // Configura la respuesta
                    response.setContentType("application/json");
                    response.setCharacterEncoding("UTF-8");

                    // Convierte la lista de equipos a formato JSON
                    Gson gson = new Gson();
                    String equiposJson = gson.toJson(EquiposList);

                    try ( PrintWriter out = response.getWriter()) {
                        out.print(equiposJson);
                    }

                } catch (NumberFormatException e) {
                    // Maneja la excepción si la conversión no es exitosa
                    response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
                }
            } else {
                // La cadena es nula o vacía, manejar este caso según tus necesidades
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST); // 400 Bad Request
            }
        }
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

            // Configuración de las propiedades del correo
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");

            // Dirección de correo y contraseña de aplicaciones en gmail
            final String correo = "carlosmarquez200404@gmail.com";
            final String contrasena = "csfqqzzuuwctyqay";

            // Crear una sesión de correo
            Session sesion = Session.getInstance(props, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(correo, contrasena);
                }
            });

            try {
                // Crear un mensaje de correo
                Message mensaje = new MimeMessage(sesion);
                mensaje.setFrom(new InternetAddress(correo));

                // Direcciones de correo
                String Destinatario1 = ("carlosmarquez200404@gmail.com");
                String Destinatario2 = ("omarorozco@gmail.com");
                String Destinatario3 = ("josepiineda06@gmail.com");
                String Destinatario4 = ("dannavesa04@gmail.com");

                // Guardamos las direcciones a las que sera enviada el correo en un array
                InternetAddress[] Correos = {
                    new InternetAddress(Destinatario1),
                    new InternetAddress(Destinatario2),
                    new InternetAddress(Destinatario3),
                    new InternetAddress(Destinatario4)
                };
                
                mensaje.setRecipients(Message.RecipientType.TO, Correos);

                // asunto establecido
                String asuntoPredeterminado = "Ficha de mantenimiento de computo con codigo #" + txtact_codigo;
                mensaje.setSubject(asuntoPredeterminado);

                // mensaje establecido
                String mensajePredeterminado = "¡Fue registrada correctamente!";
                mensaje.setText(mensajePredeterminado);

                // Enviamos el mensaje
                Transport.send(mensaje);

            } catch (MessagingException e) {

            }

            acceso = verequiposcomputo;

        }
        response.sendRedirect(acceso);
    }
}
