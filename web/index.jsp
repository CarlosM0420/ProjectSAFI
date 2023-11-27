<%@page contentType="text/html" pageEncoding="UTF-8"%>




<!DOCTYPE html>
<html>
    <head>
        <title>Login SGAF</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="css/css-login.css"/>  
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>


    <body>
        <div class="wrapper">
            <form action="loginServlet" method="POST" class="form-signin">       
                <h2 class="form-signin-heading">Iniciar Sesión</h2>
                <input type="email" class="form-control" name="email" placeholder="Correo electronico" required="" autofocus="" />
                <input type="password" class="form-control" name="password" placeholder="Contraseña" required=""/>      
                <label class="checkbox">
                    <input type="checkbox" value="remember-me" id="rememberMe" name="rememberMe"> Recordarme
                </label>
                <button class="btn btn-lg btn-success btn-block" type="submit">Ingresar</button>   
            </form>
        </div>




    </body>

</html>
