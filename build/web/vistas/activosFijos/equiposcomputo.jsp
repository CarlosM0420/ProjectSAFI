<!--
    Document   : veractivosFijos
    Created on : 10 oct. 2023, 06:21:19
    Author     : OMAR OROZCO
-->
<!DOCTYPE html>
<%@page import="com.safi.dao.EquiposComputoDAO"%>
<%@page import="com.safi.dao.UbicacionesDAO"%>
<%@page import="com.safi.dao.FabricantesDAO"%>
<%@page import="com.safi.pojo.EquiposComputo"%>
<%@page import="com.safi.pojo.Ubicaciones"%>
<%@page import="com.safi.pojo.Fabricantes"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="Omar Orozco" />
        <title>Equipos Computo</title>
        <!-- Script de api de reCAPtcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>


    </head>
    
     <%
    HttpSession sesion = request.getSession();  // Obtiene la sesión actual del usuario
    String usu_nombre_apellidos = (String) sesion.getAttribute("usu_nombre_apellidos");  // Obtiene el valor del atributo "usu_nombre_apellidos" de la sesión
    String movimiento = (String) sesion.getAttribute("movimiento");// Obtiene el valor del atributo "movimiento" de la sesión
    movimiento = movimiento + "Fich compu - "; // Agrega la cadena "Fich compu-" al valor de "movimiento"
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
                                    <a class="nav-link" href="#">Equipos Computo</a>
                                    <a class="nav-link" href="#">Maquinaria</a>
                                    <a class="nav-link" href="muebles.jsp">Muebles</a>
                                </nav>
                            </div>
                            <a class="nav-link" href="../ubicaciones/ubicaciones.jsp">
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
                        <div class="small">Logged in as:</div>
                        Start Bootstrap
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Equipos de Computo</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../inicio.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Equipos Computo</li>
                        </ol>
                        <div class="mb-4">                            
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Agregar Equipo  
                            </button>
                        </div>


                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Equipos de Computo
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Estado</th>
                                            <th>Marca</th>
                                            <th>Modelo</th>
                                            <th>Procesador</th>
                                            <th>N° Serie</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Estado</th>
                                            <th>Marca</th>
                                            <th>Modelo</th>
                                            <th>Procesador</th>
                                            <th>N° Serie</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>          
                                        <%
                                            EquiposComputoDAO equDAO = new EquiposComputoDAO();
                                            List<EquiposComputo> listequi = equDAO.MostrarEquipoComputoResumen();
                                            request.setAttribute("listequi", listequi);
                                        %>
                                        <c:forEach items="${listequi}" var="e">
                                            <tr>                                                
                                                <td>${e.activosfijos.act_codigo}</td>
                                                <td>${e.activosfijos.act_estado}</td>
                                                <td>${e.activosfijos.act_marca}</td>
                                                <td>${e.activosfijos.act_modelo}</td>
                                                <td>${e.equ_procesador}</td>
                                                <td>${e.activosfijos.act_no_serie}</td>
                                                <td>${e.activosfijos.act_precio_adqu}</td>
                                                <td>
                                                    <a class="btn btn-warning editbutton" data-equ_id="${e.id}"><i class="fa-solid fa-pen-to-square"></i></a>                                                    
                                                    <a class="btn btn-danger" href="../reportes/report_equipo.jsp?txtequi_id=${e.id}" target="_blank"><i class="fa-solid fa-file-pdf"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Modal de agregar -->
                            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Equipo de Computo.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="../../equiposServlet" method="POST">
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Código</label>
                                                        <input type="number" class="form-control" name="txtact_codigo" id="inputform" required/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label>Estado</label>
                                                        <select class="form-select" aria-label="Default select example" name="txtact_estado" required>
                                                            <option selected value="1">Activo</option>
                                                            <option value="2">Inactivo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca</label>
                                                        <input type="text" class="form-control" name="txtact_marca" required/>     
                                                    </div>   
                                                    <div class="col-md-6 mb-3">
                                                        <label>Modelo</label>
                                                        <input type="text" class="form-control" name="txtact_modelo" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>N° Serie</label>
                                                        <input type="text" class="form-control" name="txtact_no_serie" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fecha de adquisición</label>
                                                        <input type="date" class="form-control" name="txtact_fecha_adqu" required/>     
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Precio de adquisición</label>
                                                        <input type="number" class="form-control" name="txtact_precio_adqu" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Vida Util (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_vida_util" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Meses Depreciados (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_meses_depreciados" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Descripción</label>
                                                        <input type="text" class="form-control" name="txtact_descripcion" required/>                                         
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fabricante</label>

                                                        <select class="form-select" aria-label="Default select example" name="txttblfabricantes_id" required>
                                                            <option selected>Seleccione el Fabricante</option>
                                                            <%
                                                                FabricantesDAO fabDAO = new FabricantesDAO();
                                                                List<Fabricantes> listfab = fabDAO.MostrarFabricantes();
                                                                request.setAttribute("listfab", listfab);
                                                            %>
                                                            <c:forEach items="${listfab}" var="fab">

                                                                <option value="${fab.id}">${fab.fab_nombre}</option>

                                                            </c:forEach>
                                                        </select>



                                                    </div>                             
                                                    <div class="col-md-6 mb-3">
                                                        <label>Ubicación</label>
                                                        <select class="form-select" aria-label="Default select example" name="txttblubicacion_id" required>
                                                            <option selected>Seleccione la ubicación</option>
                                                            <%
                                                                UbicacionesDAO ubiDAO = new UbicacionesDAO();
                                                                List<Ubicaciones> listubi = ubiDAO.MostrarUbicaciones();
                                                                request.setAttribute("listubi", listubi);
                                                            %>
                                                            <c:forEach items="${listubi}" var="ubi">

                                                                <option value="${ubi.id}">${ubi.ubi_descripcion}</option>

                                                            </c:forEach>
                                                        </select>                                     
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca de Procesador</label>
                                                        <input type="text" class="form-control" name="txtequ_procesador" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Capacidad de RAM (N° de GB)</label>
                                                        <input type="text" class="form-control" name="txtequ_ram" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca Disco Duro</label>
                                                        <input type="text" class="form-control" name="txtequ_discoduro_marca" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca de Tarjeta de Video</label>
                                                        <input type="text" class="form-control" name="txtequ_tajeta_video" required/>     
                                                    </div> 
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <label>Numero de Puertos</label>
                                                        <input type="number" class="form-control" name="txtequ_puertos" required/>     
                                                    </div> 
                                                    <div class="col-md-4 mb-3">
                                                        <label>Tipo de Equipo</label>
                                                        <select class="form-select" aria-label="Default select example" name="txtequ_tipo" required>
                                                            <option selected value="Todo en uno">Todo en Uno</option>
                                                            <option value="CPU">CPU</option>
                                                            <option value="Portatil">Portatil</option>

                                                        </select>
                                                    </div>  
                                                    <div class="col-md-4 mb-3">
                                                        <label>Capacidad de Almacenamiento (N° de gb)</label>
                                                        <input type="number" class="form-control" name="txtequ_capacidad_almacenamiento" required/>     
                                                    </div>  
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="g-recaptcha" data-sitekey="6LfUVR8pAAAAAMyE2Igd5THThjc7PmMLSsZsjlVP"  data-callback="enableSubmitButton" data-expired-callback="recaptchaExpiredCallback"></div>
                                                    <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="AggButton btn btn-success" name="accion" value="agrequipocomputo" disabled/>Agregar</button>   

                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal de edicion -->
                            <div class="modal fade" id="EditarEquipoComputo" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Equipo de Computo.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="../../equiposServlet" method="POST">
                                                <input type="hidden" name="txtequ_id" id="equipoid_edit">
                                                <input type="hidden" name="txtact_id" id="activoid_edit">
                                                <input type="hidden" name="txtequ_id_Act" id="equipoidAct_edit">
                                                
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Código</label>
                                                        <input type="number" class="form-control" name="txtact_codigoEdit" id="codigoedit" required/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label>Estado</label>
                                                        <select class="form-select" aria-label="Default select example" name="txtact_estadoEdit" id="estadoedit" required>
                                                            <option selected value="1">Activo</option>
                                                            <option value="2">Inactivo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca</label>
                                                        <input type="text" class="form-control" name="txtact_marcaEdit" id="marcaedit" required/>     
                                                    </div>   
                                                    <div class="col-md-6 mb-3">
                                                        <label>Modelo</label>
                                                        <input type="text" class="form-control" name="txtact_modeloEdit" id="modeloedit" required/>     
                                                    </div> 
                                                </div>
                                                  <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>N° Serie</label>
                                                        <input type="text" class="form-control" name="txtact_no_serieEdit" id="noserieedit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fecha de adquisición</label>
                                                        <input type="date" class="form-control" name="txtact_fecha_adquEdit" id="adqufechaedit" required/>     
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Precio de adquisición</label>
                                                        <input type="number" class="form-control" name="txtact_precio_adquEdit" id="precioedit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Vida Util (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_vida_utilEdit" id="vidautiledit" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Meses Depreciados (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_meses_depreciadosEdit" id="mesesdepr_edit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Descripción</label>
                                                        <input type="text" class="form-control" name="txtact_descripcionEdit" id="descrip_edit" required/>                                         
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fabricante</label>

                                                        <select class="form-select" aria-label="Default select example" name="txttblfabricantes_idEdit" id="fabri_edit" required>
                                                            <option selected>Seleccione el Fabricante</option>
                                                            <%
                                                                List<Fabricantes> listfabedit = fabDAO.MostrarFabricantes();
                                                                request.setAttribute("listfabedit", listfabedit);
                                                            %>
                                                            <c:forEach items="${listfabedit}" var="fabedit">

                                                                <option value="${fabedit.id}">${fabedit.fab_nombre}</option>

                                                            </c:forEach>
                                                        </select>



                                                    </div>                             
                                                    <div class="col-md-6 mb-3">
                                                        <label>Ubicación</label>
                                                        <select class="form-select" aria-label="Default select example" name="txttblubicacion_idEdit" id="ubica_edit" required>
                                                            <option selected>Seleccione la ubicación</option>
                                                            <%
                                                                List<Ubicaciones> listubiedit = ubiDAO.MostrarUbicaciones();
                                                                request.setAttribute("listubiedit", listubiedit);
                                                            %>
                                                            <c:forEach items="${listubiedit}" var="ubiedit">
                                                                <option value="${ubiedit.id}">${ubiedit.ubi_descripcion}</option>
                                                            </c:forEach>
                                                        </select>                                     
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca de Procesador</label>
                                                        <input type="text" class="form-control" name="txtequ_procesadorEdit" id="marcaproce_edit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Capacidad de RAM (N° de GB)</label>
                                                        <input type="text" class="form-control" name="txtequ_ramEdit" id="caparam_edit" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca Disco Duro</label>
                                                        <input type="text" class="form-control" name="txtequ_discoduro_marcaEdit" id="marcadisco_edit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca de Tarjeta de Video</label>
                                                        <input type="text" class="form-control" name="txtequ_tajeta_videoEdit" id="marcatarjeta_edit" required/>     
                                                    </div> 
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-4 mb-3">
                                                        <label>Numero de Puertos</label>
                                                        <input type="number" class="form-control" name="txtequ_puertosEdit" id="nopuertos_edit" required/>     
                                                    </div> 
                                                    <div class="col-md-4 mb-3">
                                                        <label>Tipo de Equipo</label>
                                                        <select class="form-select" aria-label="Default select example" name="txtequ_tipoEdit" id="tipoequi_edit" required>
                                                            <option selected value="Todo en uno">Todo en Uno</option>
                                                            <option value="CPU">CPU</option>
                                                            <option value="Portatil">Portatil</option>
                                                        </select>
                                                    </div>  
                                                    <div class="col-md-4 mb-3">
                                                        <label>Capacidad de Almacenamiento (N° de gb)</label>
                                                        <input type="number" class="form-control" name="txtequ_capacidad_almacenamientoEdit" id="almacapa_edit" required/>     
                                                    </div>  
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="btn btn-success" name="accion" value="ActualizarEquipos">Actualizar</button>   
                                                </div>
                                            </form>
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
        <script src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script src="../../js/js-equipos-computo.js"></script>




    </body>
</html>
