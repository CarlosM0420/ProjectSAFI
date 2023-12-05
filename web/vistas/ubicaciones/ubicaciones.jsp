<!--
    Document   : veractivosFijos
    Created on : 10 oct. 2023, 06:21:19
    Author     : OMAR OROZCO
-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="Omar Orozco" />
        <title>Ubicaciones</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Script de api de reCAPtcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        

        <%@page import="java.util.List"%>
        <%@page import="com.safi.pojo.Ubicaciones"%>
        <%@page import="com.safi.dao.UbicacionesDAO"%>
        <%@page import="java.util.Iterator"%>


    </head>
    
      <%
    HttpSession sesion = request.getSession(); // Obtiene la sesión actual del usuario
    String usu_nombre_apellidos = (String) sesion.getAttribute("usu_nombre_apellidos"); // Obtiene el valor del atributo "usu_nombre_apellidos" de la sesión
    String movimiento = (String) sesion.getAttribute("movimiento"); // Obtiene el valor del atributo "movimiento" de la sesión
    movimiento = movimiento + "Ubic - "; // Agrega la cadena  "Ubic-" al valor de "movimiento"
    sesion.setAttribute("movimiento", movimiento); // Establece el nuevo valor de "movimiento" en la sesión
    %>
    
    <body class="sb-nav-fixed">


        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="index.html"><img src="" alt="Logo"/></a> <!-- Aca va el logo -->
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar-->
            <div class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">                               
            </div>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Settings</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="#!">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="../inicio.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-money-bills"></i></div>
                                Activos Fijos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="../activosFijos/equiposcomputo.jsp">Equipos Computo</a>
                                    <a class="nav-link" href="#">Maquinaria</a>
                                    <a class="nav-link" href="../activosFijos/muebles.jsp">Muebles</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-location-dot"></i></i></div>
                                Ubicaciones
                            </a>    
                            <a class="nav-link" href="../fabricantes/fabricantes.jsp">
                                <div class="sb-nav-link-icon"><i class="fa-solid fa-cart-shopping"></i></div>
                                Proveedores
                            </a>
                        </div>  

                    </div>

                    <div class="sb-sidenav-footer">
                        <div class="small">Logueado en:</div>
                        SAFI
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Ubicaciones</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../inicio.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Ubicaciones</li>
                        </ol>
                        <div class="mb-4">                            
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#AgregarUbicacion">
                                Agregar Ubicación  
                            </button>
                        </div>


                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Ubicaciones
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Código</th>         
                                            <th>Descripción</th>
                                            <th>Centro de costo</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Código</th>         
                                            <th>Descripción</th>
                                            <th>Centro de costo</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>          
                                        <%
                                            // Se crea un objeto UbicacionesDAO para interactuar con la base de datos
                                            UbicacionesDAO ubiDAO = new UbicacionesDAO();
                                            // Se obtiene una lista de ubicaciones desde la base de datos
                                            List<Ubicaciones> list = ubiDAO.MostrarUbicaciones();
                                            //Se crea un iterador (iter) para recorrer los elementos de la lista 
                                            Iterator<Ubicaciones> iter = list.iterator();
                                            // Se inicializa una variable 'ubi' de tipo Ubicaciones, para ir almacenando los valores que se jalen de la base de datos
                                            Ubicaciones ubi = null;
                                            //en el while En cada iteración, se obtiene el siguiente elemento de la lista y se asigna a la variable ubi.
                                            while (iter.hasNext()) {
                                                ubi = iter.next();

                                        %>
                                        <tr>
                                            <td><%= ubi.getUbi_codigo()%></td>
                                            <td><%= ubi.getUbi_descripcion()%></td>
                                            <td><%= ubi.getUbi_centro_costo()%></td>                        
                                            <td id="acciones">                           
<!--                                                <a class="btn btn-warning edit-btn" data-bs-toggle="modal" data-bs-target="#EditarUbicacion" data-ubi_codigo="<%= ubi.getUbi_codigo()%>" data-ubi_descrip="<%= ubi.getUbi_descripcion()%>" data-ubi_centrocosto="<%= ubi.getUbi_centro_costo()%>" data-ubi_id="<%= ubi.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a>-->
                                                <a class="btn btn-warning editbutton" data-bs-toggle="modal" data-bs-target="#EditarUbicacion" data-ubi_id="<%= ubi.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a>

                                                <a href="#" class="btn btn-danger"><i class="fa-regular fa-trash-can"></i></a>                    
                                            </td>               
                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>

                                <div class="modal fade" id="AgregarUbicacion" tabindex="-1" aria-labelledby="AgregarUbicacion" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Equipo de Computo.</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">
                                                <form action="../../UbicacionesServlet" method="POST" id="form_id">

                                                    <div class="form-group">
                                                        <label for="editCodigo">Código</label>
                                                        <input type="number" class="form-control" name="txtubi_codigo" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editFamilia">Descripción</label>
                                                        <input type="text" class="form-control" name="txtubi_descripcion" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editUbicacion">Centro de costo</label>
                                                        <input type="text" class="form-control" name="txtubi_centro_costo" required/>     
                                                    </div>                            

                                                    <div class="modal-footer">

                                                        <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>

                                                        <button  class="AggButton btn btn-success" name="accion" value="agrubicacion">Crear Ubicación</button> 

                                                        

                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>       

                                <div class="modal fade" id="EditarUbicacion" tabindex="-1" aria-labelledby="EditarUbicacion" aria-hidden="true">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Equipo de Computo.</h1>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <div class="modal-body">

                                                <form action="../../UbicacionesServlet">
                                                    <input type="hidden" name="txtubi_idEdit" id="ubi_id">
                                                    <div class="form-group">
                                                        <label for="editCodigo">Código</label>
                                                        <input type="number" class="form-control" name="txtubi_codigoEdit" id="ubi_codigo" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editFamilia">Descripción</label>
                                                        <input type="text" class="form-control" name="txtubi_descripcionEdit" id="ubi_descrip" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="editUbicacion">Centro de costo</label>
                                                        <input type="text" class="form-control" name="txtubi_centro_costoEdit" id="ubi_centrocosto" required/>     
                                                    </div>                            

                                                    <div class="modal-footer">
                                                        <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="btn btn-success" >Actualizar</button>

                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2023</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>  





        <!-- Scripts de el dashboard -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../js/js-menu.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>        
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../js/datatables-simple-demo.js"></script>        
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> 

        <script src="../../js/script-ubicaciones.js"></script>
        



    </body>
</html>