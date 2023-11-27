<%--
    Document   : report_equipo
    Created on : 21 nov 2023, 08:40:07
    Author     : ADSO
--%>

<%@page import="java.util.Map"%>
<%@page import="com.safi.controlador.Conexion"%>
<%@page import="java.sql.Connection"%>
<%@page import="net.sf.jasperreports.engine.JasperRunManager"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FICHA TECNICA</title>
    </head>
    <body>

        <%
            String txtequi_id = request.getParameter("txtequi_id");
            if (txtequi_id != null) {

                try (Conexion conexion = new Conexion()) {
                    Connection con = conexion.AbrirConexion();

                    if (con != null) {
                        File reporfile = new File(application.getRealPath("reportes/equipos_com.jasper"));
                        Map<String, Object> parameter = new HashMap<String, Object>();

                        // Utiliza txtequi_id en lugar de txtParametro
                        parameter.put("equipo_id", new String(txtequi_id));

                        byte[] bytes = JasperRunManager.runReportToPdf(reporfile.getPath(), parameter, con);

                        response.setContentType("application/pdf");
                        response.setContentLength(bytes.length);

                        ServletOutputStream outputStream = response.getOutputStream();
                        outputStream.write(bytes, 0, bytes.length);

                        outputStream.flush();
                        outputStream.close();
                    } else {
                        System.out.println("La conexión es null");
                    }
                } catch (Exception e) {
                    // Muestra un mensaje de error en la consola
                    e.printStackTrace();

                    // Puedes redirigir a una página de error o mostrar un mensaje en la página
                    System.out.println("Error al procesar el informe: " + e.getMessage());
                }

            } else {
                System.out.println("TENEMOS UN PROBLEMAAAA");
                // Puedes redirigir o mostrar un mensaje en la página indicando el problema
            }
        %>


    </body>
</html>
