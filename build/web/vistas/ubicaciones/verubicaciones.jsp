<%-- 
    Document   : verubicaciones
    Created on : 6 oct. 2023, 06:55:05
    Author     : OMAR OROZCO
--%>

<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.safi.pojo.Ubicaciones"%>
<%@page import="com.safi.dao.UbicacionesDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ubicaciones</title>


        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    </head>

    <body class="sb-nav-fixed">

        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="../dashboard.html"><img src="../../img/SAFI_Blanco.png" alt="SAFI" id="logo"/></a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->

            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="#!">Configuración</a></li>
                        <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                        <li><hr class="dropdown-divider" /></li>
                        <li><a class="dropdown-item" href="../index.jsp">Cerrar Sesión</a></li>
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
                            <div class="sb-sidenav-menu-heading">Opciones</div>
                            <a class="nav-link" href="../activosFijos/veractivosFijos.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Activos Fijos
                            </a>
                            <a class="nav-link" href="#" style="color: white; font-weight: bolder">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Ubicaciones
                            </a>                            
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>                                
            </div>



            <div id="layoutSidenav_content">

                <div id="body_box">
                    <div id="btnsBox">                                                      
                        <button id="btnAdd"  class="btn btn-light" data-toggle="modal" data-target="#AgregarUbicacion">Agregar Ubicación</button>                                                                                                         
                    </div>
                    <h1 id="titulo">Ubicaciones</h1>
                    <table class="table table-hover">
                        <thead>
                            <tr class="table-info">
                                <th scope="col">Código</th>         
                                <th scope="col">Descripción</th>
                                <th scope="col">Centro de costo</th>
                                <th scope="col">Acciones</th>
                            </tr>
                        </thead>
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
                                <a class="btn btn-warning edit-btn" data-toggle="modal" data-target="#EditarUbicacion" data-ubi_codigo="<%= ubi.getUbi_codigo()%>" data-ubi_descrip="<%= ubi.getUbi_descripcion()%>" data-ubi_centrocosto="<%= ubi.getUbi_centro_costo()%>" data-ubi_id="<%= ubi.getId()%>"><i class="fa-solid fa-pen-to-square"></i></a>
                                <a href="#" class="btn btn-danger"><i class="fa-regular fa-trash-can"></i></a>                    
                            </td>               
                        </tr>
                        <%}%>
                    </table> 
                </div>

                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Agregar Ubicación</h5>                       
                                <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
                            </div>
                            <div class="modal-body">

                                <form action="../../UbicacionesServlet">

                                    <div class="form-group">
                                        <label for="editCodigo">Código</label>
                                        <input type="number" class="form-control" name="txtubi_codigo" id="inputform" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="editFamilia">Descripción</label>
                                        <input type="text" class="form-control" name="txtubi_descripcion" id="inputform" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="editUbicacion">Centro de costo</label>
                                        <input type="text" class="form-control" name="txtubi_centro_costo" id="inputform" required/>     
                                    </div>                            

                                    <div class="modal-footer">
                                        <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-success" name="accion" value="agrubicacion">Crear Ubicación</button>                                
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="EditarUbicacion" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Editar Ubicación</h5>                       
                                <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
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
                                        <button type="submit" class="btn btn-success" name="accion" value="actubicacion">Actualizar</button>                                
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div><div class="modal fade" id="AgregarUbicacion" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Agregar Ubicación</h5>                       
                                <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
                            </div>
                            <div class="modal-body">

                                <form action="../../UbicacionesServlet">

                                    <div class="form-group">
                                        <label for="editCodigo">Código</label>
                                        <input type="number" class="form-control" name="txtubi_codigo" id="inputform" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="editFamilia">Descripción</label>
                                        <input type="text" class="form-control" name="txtubi_descripcion" id="inputform" required/>
                                    </div>
                                    <div class="form-group">
                                        <label for="editUbicacion">Centro de costo</label>
                                        <input type="text" class="form-control" name="txtubi_centro_costo" id="inputform" required/>     
                                    </div>                            

                                    <div class="modal-footer">
                                        <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                        <button type="submit" class="btn btn-success" name="accion" value="agrubicacion">Crear Ubicación</button>                                
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="modal fade" id="EditarUbicacion" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Editar Ubicación</h5>                       
                                <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
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
                                        <button type="submit" class="btn btn-success" name="accion" value="actubicacion">Actualizar</button>                                
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>

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



        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../js/js-menu.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>        
        <script>
            // abicamos los datos en los input de la modal
            $(document).ready(function () {
                $('.edit-btn').click(function () {
                    var ubi_codigo = $(this).data('ubi_codigo');
                    var ubi_descrip = $(this).data('ubi_descrip');
                    var ubi_centrocosto = $(this).data('ubi_centrocosto');
                    var ubi_id = $(this).data('ubi_id');

                    $('#ubi_codigo').val(ubi_codigo);
                    $('#ubi_descrip').val(ubi_descrip);
                    $('#ubi_centrocosto').val(ubi_centrocosto);
                    $('#ubi_id').val(ubi_id);

                });              
            });
            
        </script>
    </body>
</html>
