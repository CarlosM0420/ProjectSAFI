<%-- 
    Document   : otro
    Created on : 26 sep. 2023, 07:24:36
    Author     : ADSO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--        <link rel="stylesheet" href="../../css/index.css"/>-->
    </head>
    <body>
        <script>
            Swal.fire(  
                    'Ups',
                    'Correo o Contraseña incorrecta',
                    'error'
                ).then(() => {
       window.location.href = "index.jsp";
    });
        </script>       
        <jsp:include page="index.jsp" />
       
    </body>
</html>
