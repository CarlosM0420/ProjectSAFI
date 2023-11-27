<%-- 
    Document   : veractivosFijos
    Created on : 10 oct. 2023, 06:21:19
    Author     : OMAR OROZCO
--%>
<%@page import="java.util.Iterator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="Modelos.ActivosFijos"%>
<%@page import="Modelos.ActivosFijosDAO"%>
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
                            <div class="sb-sidenav-menu-heading">Inicio</div>



                            <a class="nav-link" href="../inicio.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Inicio
                            </a>
                            <div class="sb-sidenav-menu-heading">Opciones</div>
                            <div >
                                <a class="nav-link" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts" style="background-color: #1E282C; color: white;">
                                    <div class="sb-nav-link-icon"><i class="fa-solid fa-money-bill-trend-up" style="color: white;"></i></div>
                                    Activos Fijos
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse show" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav" style="margin-left: 0px; background-color: #343A40">
                                        <a class="nav-link disabled" href="#"  style="color: white;"><div class="sb-nav-link-icon"><i class="fa-solid fa-desktop" style="color: white;"></i></div>Equipos de Computo</a>
                                        <a class="nav-link" href="#"><div class="sb-nav-link-icon"><i class="fa-solid fa-oil-well"></i></div>Maquinaria</a>
                                    </nav>
                                </div>  
                            </div>

                            <a class="nav-link" href="../UbicacionesServlet?accion=verubicaciones"><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>Ubicaciones</a>
                            <a class="nav-link" href="#"><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>Usuarios</a>




                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>                                
            </div>



            <div id="layoutSidenav_content">
                <div class="container-fluid px-4">
                    <div id="body_box">
                        <div id="btnsBox">             
                            <button id="btnAdd"  class="btn btn-outline-success" data-toggle="modal" data-target="#AgregarUbicacion">Agregar Activo fijo</button>

                        </div>
                        <h1 id="titulo">Activos Fijos</h1>
                        <table class="table table-hover">
                            <thead>
                                <tr class="table-info">
                                    <th scope="col">Código</th>         
                                    <th scope="col">Estado</th>
                                    <th scope="col">Marca</th>
                                    <th scope="col">Modelo</th>
                                    <th scope="col">Descripción</th>
                                    <th scope="col">Acciones</th>
                                </tr>
                            </thead>
                            <%
                                // Se crea un objeto UbicacionesDAO para interactuar con la base de datos
                                ActivosFijosDAO acfiDAO = new ActivosFijosDAO();
                                // Se obtiene una lista de ubicaciones desde la base de datos
                                List<ActivosFijos> list = acfiDAO.MostrarActivos();
                                //Se crea un iterador (iter) para recorrer los elementos de la lista 
                                Iterator<ActivosFijos> iter = list.iterator();
                                // Se inicializa una variable 'ubi' de tipo Ubicaciones, para ir almacenando los valores que se jalen de la base de datos
                                ActivosFijos acfi = null;
                                //en el while En cada iteración, se obtiene el siguiente elemento de la lista y se asigna a la variable ubi.
                                while (iter.hasNext()) {
                                    acfi = iter.next();

                            %>
                            <tr>
                                <td><%= acfi.getAct_codigo()%></td>
                                <td><%= acfi.getAct_estado()%></td>
                                <td><%= acfi.getAct_marca()%></td>                        
                                <td><%= acfi.getAct_modelo()%></td>                        
                                <td><%= acfi.getAct_descripcion()%></td>                                                                         
                                <td id="acciones"> 

                                    <a class="btn btn-secondary vermas" data-toggle="modal" data-target="#VerActivosFijos"
                                       data-acfij_id="<%= acfi.getId()%>" data-acfij_codido="<%= acfi.getAct_codigo()%>"
                                       data-acfij_estado="<%= acfi.getAct_estado()%>" data-acfij_marca="<%= acfi.getAct_marca()%>" data-acfij_modelo="<%= acfi.getAct_modelo()%>" data-acfij_noserie="<%= acfi.getAct_no_serie()%>" 
                                       data-acfij_fechaadqui="<%= acfi.getAct_fecha_adqu()%>" data-acfij_precioadqui="<%= acfi.getAct_precio_adqu()%>" data-acfij_vidautil="<%= acfi.getAct_vida_util()%>" data-acfij_mesesdepre="<%= acfi.getAct_meses_depreciados()%>" 
                                       data-acfij_descripcion="<%= acfi.getAct_descripcion()%>" data-acfij_fabricante="<%= acfi.getTblfabricantes_id()%>" 
                                       data-acfij_tipoactivo="<%= acfi.getTbltiposactivosfijos_idtbltiposactivosfijos()%>" data-acfij_ubicacion="<%= acfi.getTblubicacion_id()%>"><i class="fa-solid fa-eye"></i></a>
                                    <a class="btn btn-warning editar" data-toggle="modal" data-target="#EditarUbicacion"
                                       data-acfi_id="<%= acfi.getId()%>" data-acfi_codido="<%= acfi.getAct_codigo()%>"
                                       data-acfi_estado="<%= acfi.getAct_estado()%>" data-acfi_marca="<%= acfi.getAct_marca()%>" data-acfi_modelo="<%= acfi.getAct_modelo()%>" data-acfi_noserie="<%= acfi.getAct_no_serie()%>" 
                                       data-acfi_fechaadqui="<%= acfi.getAct_fecha_adqu()%>" data-acfi_precioadqui="<%= acfi.getAct_precio_adqu()%>" data-acfi_vidautil="<%= acfi.getAct_vida_util()%>" data-acfi_mesesdepre="<%= acfi.getAct_meses_depreciados()%>" 
                                       data-acfi_descripcion="<%= acfi.getAct_descripcion()%>" data-acfi_fabricante="<%= acfi.getTblfabricantes_id()%>" 
                                       data-acfi_tipoactivo="<%= acfi.getTbltiposactivosfijos_idtbltiposactivosfijos()%>" data-acfi_ubicacion="<%= acfi.getTblubicacion_id()%>"                                                                      
                                       ><i class="fa-solid fa-pen-to-square"></i></a>


                                    <a class="btn btn-dark"><i class="fa-solid fa-box-archive"></i></a>                    
                                </td>               
                            </tr>
                            <%}%>
                        </table> 
                    </div>

                    <div class="modal fade" id="AgregarUbicacion" tabindex="-1" role="dialog" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title">Agregar Activo Fijo</h5>                       
                                    <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
                                </div>
                                <div class="modal-body">

                                    <form action="../../activosFijosServlet">

                                        <div class="form-group">
                                            <label for="editCodigo">Código</label>
                                            <input type="number" class="form-control" name="txtact_codigo" id="inputform" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="editFamilia">Estado</label>
                                            <input type="text" class="form-control" name="txtact_estado" id="inputform" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="editUbicacion">Marca</label>
                                            <input type="text" class="form-control" name="txtact_marca" id="inputform" required/>     
                                        </div>   
                                        <div class="form-group">
                                            <label for="editUbicacion">Modelo</label>
                                            <input type="text" class="form-control" name="txtact_modelo" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">N° Serie</label>
                                            <input type="number" class="form-control" name="txtact_no_serie" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Fecha de adquisición</label>
                                            <input type="date" class="form-control" name="txtact_fecha_adqu" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Precio de adquisición</label>
                                            <input type="text" class="form-control" name="txtact_precio_adqu" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Vida Util (en meses)</label>
                                            <input type="text" class="form-control" name="txtact_vida_util" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Meses Depreciados</label>
                                            <input type="number" class="form-control" name="txtact_meses_depreciados" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Descripción</label>
                                            <input type="text" class="form-control" name="txtact_descripcion" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Fabricante</label>
                                            <input type="text" class="form-control" name="txttblfabricantes_id" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Tipo de Activo Fijo</label>
                                            <input type="text" class="form-control" name="txttbltiposactivosfijos_id" id="inputform" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Ubicación</label>
                                            <input type="text" class="form-control" name="txttblubicacion_id" id="inputform" required/>     
                                        </div> 

                                        <div class="modal-footer">
                                            <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-success" name="accion" value="agractivofijo">Crear Ubicación</button>                                
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
                                    <h5 class="modal-title">Editar Activo Fijo</h5>                       
                                    <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
                                </div>
                                <div class="modal-body">

                                    <form action="../../activosFijosServlet">
                                        <input type="hidden" name="txtact_id" id="acfi_id">

                                        <div class="form-group">
                                            <label for="editCodigo">Código</label>
                                            <input type="number" class="form-control" name="txtact_codigo" id="acfi_codigo" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="editFamilia">Estado</label>
                                            <input type="text" class="form-control" name="txtact_estado" id="acfi_estado" required/>
                                        </div>
                                        <div class="form-group">
                                            <label for="editUbicacion">Marca</label>
                                            <input type="text" class="form-control" name="txtact_marca" id="acfi_marca" required/>     
                                        </div>   
                                        <div class="form-group">
                                            <label for="editUbicacion">Modelo</label>
                                            <input type="text" class="form-control" name="txtact_modelo" id="acfi_modelo" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">N° Serie</label>
                                            <input type="number" class="form-control" name="txtact_no_serie" id="acfi_noserie" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Fecha de adquisición</label>
                                            <input type="date" class="form-control" name="txtact_fecha_adqu" id="acfi_fechaadqui" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Precio de adquisición</label>
                                            <input type="text" class="form-control" name="txtact_precio_adqu" id="acfi_precioadqui" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Vida Util (en meses)</label>
                                            <input type="text" class="form-control" name="txtact_vida_util" id="acfi_vidautil" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Meses Depreciados</label>
                                            <input type="number" class="form-control" name="txtact_meses_depreciados" id="acfi_mesesdepre" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Descripción</label>
                                            <input type="text" class="form-control" name="txtact_descripcion" id="acfi_descripcion" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Fabricante</label>
                                            <input type="text" class="form-control" name="txttblfabricantes_id" id="acfi_fabricante" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Tipo de Activo Fijo</label>
                                            <input type="text" class="form-control" name="txttbltiposactivosfijos_id" id="acfi_tipoactivo" required/>     
                                        </div> 
                                        <div class="form-group">
                                            <label for="editUbicacion">Ubicación</label>
                                            <input type="text" class="form-control" name="txttblubicacion_id" id="acfi_ubicacion" required/>     
                                        </div> 

                                        <div class="modal-footer">
                                            <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                            <button type="submit" class="btn btn-success" name="accion" value="agractivofijo">Crear Ubicación</button>                                
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="VerActivosFijos" tabindex="-1" role="dialog" aria-hidden="true">                        
                        <div class="modal-dialog modal-xl" role="document"><!--si la quiero del tamaño que quiera custom-modal-dialog y en el css .custom-modal-dialog {max-width: 90% y/o el tamaño deseado}-->
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="acfij_id_codigo"></h5>                       
                                    <a class="close  btn btn-danger" data-dismiss="modal"><i class="fa-regular fa-circle-xmark"></i></a>
                                </div>
                                <div class="modal-body">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr class="table-info">                                            
                                                <th scope="col">Estado</th>
                                                <th scope="col">Marca</th>
                                                <th scope="col">Modelo</th>
                                                <th scope="col">N° Serie</th>
                                                <th scope="col">Fecha de Adquisición</th>     
                                                <th scope="col">Precio de Adquisición</th>  
                                            </tr>
                                        </thead>
                                        <tr>                                       
                                            <td><label id="acfij_estado"></label></td>                                    
                                            <td><label id="acfij_marca"></label></td>
                                            <td><label id="acfij_modelo"></label></td>
                                            <td><label id="acfij_noserie"></label></td>
                                            <td><label id="acfij_fechaadqui"></label></td>
                                            <td><label id="acfij_precioadqui"></label></td>
                                        </tr>
                                        <tr class="table-info">                                               
                                            <th scope="col">Vida Util</th>
                                            <th scope="col">Meses Depreciados</th>
                                            <th scope="col">Descripción</th>
                                            <th scope="col">Fabricante</th>                                            
                                            <th scope="col">Tipo de Activo</th>                                            
                                            <th scope="col">Ubicacion</th>                                            
                                        </tr> 
                                        <tr>                                       
                                            <td><label id="acfij_vidautil"></label></td>                                    
                                            <td><label id="acfij_mesesdepre"></label></td>
                                            <td><label id="acfij_descripcion"></label></td>
                                            <td><label id="acfij_fabricante"></label></td>
                                            <td><label id="acfij_tipoactivo"></label></td>
                                            <td><label id="acfij_ubicacion"></label></td>
                                        </tr>
                                    </table>                                 
                                </div>
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

                    $('#ubi_codigo').val(ubi_codigo);
                    $('#ubi_descrip').val(ubi_descrip);
                    $('#ubi_centrocosto').val(ubi_centrocosto);

                });
            });
            $(document).ready(function () {
                $('.vermas').click(function () {

                    var acfij_id = $(this).data('acfij_id');
                    var acfij_codido = $(this).data('acfij_codido');
                    var acfij_estado = $(this).data('acfij_estado');
                    var acfij_marca = $(this).data('acfij_marca');
                    var acfij_modelo = $(this).data('acfij_modelo');
                    var acfij_noserie = $(this).data('acfij_noserie');
                    var acfij_fechaadqui = $(this).data('acfij_fechaadqui');
                    var acfij_precioadqui = $(this).data('acfij_precioadqui');
                    var acfij_vidautil = $(this).data('acfij_vidautil');
                    var acfij_mesesdepre = $(this).data('acfij_mesesdepre');
                    var acfij_descripcion = $(this).data('acfij_descripcion');
                    var acfij_fabricante = $(this).data('acfij_fabricante');
                    var acfij_tipoactivo = $(this).data('acfij_tipoactivo');
                    var acfij_ubicacion = $(this).data('acfij_ubicacion');


                    $('#acfij_id_codigo').text("#" + acfij_id + "  -  Código: " + acfij_codido);
                    $('#acfij_estado').text(acfij_estado);
                    $('#acfij_marca').text(acfij_marca);
                    $('#acfij_modelo').text(acfij_modelo);
                    $('#acfij_noserie').text(acfij_noserie);
                    $('#acfij_fechaadqui').text(acfij_fechaadqui);
                    $('#acfij_precioadqui').text(acfij_precioadqui);
                    $('#acfij_vidautil').text(acfij_vidautil);
                    $('#acfij_mesesdepre').text(acfij_mesesdepre);
                    $('#acfij_descripcion').text(acfij_descripcion);
                    $('#acfij_fabricante').text(acfij_fabricante);
                    $('#acfij_tipoactivo').text(acfij_tipoactivo);
                    $('#acfij_ubicacion').text(acfij_ubicacion);



                });
            });
            $(document).ready(function () {
                $('.editar').click(function () {

                    var acfi_id = $(this).data('acfi_id');
                    var acfi_codido = $(this).data('acfi_codido');
                    var acfi_estado = $(this).data('acfi_estado');
                    var acfi_marca = $(this).data('acfi_marca');
                    var acfi_modelo = $(this).data('acfi_modelo');
                    var acfi_noserie = $(this).data('acfi_noserie');
                    var acfi_fechaadqui = $(this).data('acfi_fechaadqui');
                    var acfi_precioadqui = $(this).data('acfi_precioadqui');
                    var acfi_vidautil = $(this).data('acfi_vidautil');
                    var acfi_mesesdepre = $(this).data('acfi_mesesdepre');
                    var acfi_descripcion = $(this).data('acfi_descripcion');
                    var acfi_fabricante = $(this).data('acfi_fabricante');
                    var acfi_tipoactivo = $(this).data('acfi_tipoactivo');
                    var acfi_ubicacion = $(this).data('acfi_ubicacion');


                    $('#acfi_id').val(acfi_id);
                    $('#acfi_codigo').val(acfi_codido);
                    $('#acfi_estado').val(acfi_estado);
                    $('#acfi_marca').val(acfi_marca);
                    $('#acfi_modelo').val(acfi_modelo);
                    $('#acfi_noserie').val(acfi_noserie);
                    $('#acfi_fechaadqui').val(acfi_fechaadqui);
                    $('#acfi_precioadqui').val(acfi_precioadqui);
                    $('#acfi_vidautil').val(acfi_vidautil);
                    $('#acfi_mesesdepre').val(acfi_mesesdepre);
                    $('#acfi_descripcion').val(acfi_descripcion);
                    $('#acfi_fabricante').val(acfi_fabricante);
                    $('#acfi_tipoactivo').val(acfi_tipoactivo);
                    $('#acfi_ubicacion').val(acfi_ubicacion);



                });
            });

        </script>
    </body>
</html>
