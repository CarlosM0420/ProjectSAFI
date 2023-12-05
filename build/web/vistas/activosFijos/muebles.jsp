<%-- 
    Document   : muebles
    Created on : 27 nov 2023, 09:40:39
    Author     : OMAR OROZCO
--%>

<%@page import="com.safi.pojo.Ubicaciones"%>
<%@page import="com.safi.dao.UbicacionesDAO"%>
<%@page import="com.safi.pojo.Fabricantes"%>
<%@page import="com.safi.dao.FabricantesDAO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.safi.pojo.ActivosFijos" %>
<%@page import="com.safi.pojo.Muebles" %>
<%@page import="com.safi.dao.MueblesDAO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muebles</title>
        <!-- Script de api de reCAPtcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>

        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>  

    </head>
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
                                    <a class="nav-link" href="equiposcomputo.jsp">Equipos Computo</a>
                                    <a class="nav-link" href="#">Maquinaria</a>
                                    <a class="nav-link" href="#">Muebles</a>
                                    <a class="nav-link" href="veractivosFijos.jsp">Prueba</a>
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
                        <h1 class="mt-4">Muebles</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../inicio.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Muebles</li>
                        </ol>
                        <div class="mb-4">                            
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Agregar Mueble  
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
                                            <th>Denominación</th>
                                            <th>Marca</th>
                                            <th>Modelo</th>
                                            <th>Fecha adquirido</th>
                                            <th>N° Serie</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Denominación</th>
                                            <th>Marca</th>
                                            <th>Modelo</th>
                                            <th>Fecha adquirido</th>
                                            <th>N° Serie</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>          
                                        <%
                                            MueblesDAO mubDAO = new MueblesDAO();
                                            List<Muebles> listmub = mubDAO.MostrarMueblesActivos();
                                            request.setAttribute("listmub", listmub);
                                        %>
                                        <c:forEach items="${listmub}" var="mub">
                                            <tr>                                                
                                                <td>${mub.activosfijos.act_codigo}</td>
                                                <td>${mub.mub_denominacion}</td>
                                                <td>${mub.activosfijos.act_marca}</td>
                                                <td>${mub.activosfijos.act_modelo}</td>
                                                <td>${mub.activosfijos.act_fecha_adqu}</td>                                                
                                                <td>${mub.activosfijos.act_no_serie}</td>
                                                <td>${mub.activosfijos.act_precio_adqu}</td>
                                                <td>
                                                    <a class="btn btn-warning editbutton" data-mub_id="${mub.id}"><i class="fa-solid fa-pen-to-square"></i></a>                                                    

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
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Muebles.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="../../mueblesServlet" method="POST">
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
                                                        <label>Denominación de Mueble</label>
                                                        <input type="text" class="form-control" name="txtmub_denominacion" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Material del Mueble</label>
                                                        <input type="text" class="form-control" name="txtmub_material" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Peso (en CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_peso" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Ancho (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_ancho" required/>     
                                                    </div> 
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Alto (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_alto" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Largo (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_largo" required/>     
                                                    </div>                                                       
                                                </div>
                                                <div class="modal-footer groupbttons">
                                                    
                                                    <div class="g-recaptcha" data-sitekey="6LfUVR8pAAAAAMyE2Igd5THThjc7PmMLSsZsjlVP"  
                                                         data-callback="enableSubmitButton" data-expired-callback="recaptchaExpiredCallback"></div>
                                                    
                                                    <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="AggButton btn btn-success" name="accion" value="AgregarMuebles" disabled>Agregar</button>   
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal de edicion -->
                            <div class="modal fade" id="EditarMueble" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Actualizar Mueble.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">

                                            <form action="../../mueblesServlet" method="POST">
                                                <div class="row">
                                                    <!-- inputs invisibles para enviar datos necesarios -->
                                                    <input type="hidden" name="txtmub_idEdit">
                                                    <input type="hidden" name="txtact_idEdit">
                                                    <input type="hidden" name="txtmub_id_ActEdit">

                                                    <div class="col-md-6 mb-3">
                                                        <label>Código</label>
                                                        <input type="number" class="form-control" name="txtact_codigoEdit" required/>
                                                    </div>
                                                    <div class="col-md-6 mb-3">
                                                        <label>Estado</label>
                                                        <select class="form-select" aria-label="Default select example" name="txtact_estadoEdit" required>
                                                            <option selected value="1">Activo</option>
                                                            <option value="2">Inactivo</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Marca</label>
                                                        <input type="text" class="form-control" name="txtact_marcaEdit" required/>     
                                                    </div>   
                                                    <div class="col-md-6 mb-3">
                                                        <label>Modelo</label>
                                                        <input type="text" class="form-control" name="txtact_modeloEdit" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>N° Serie</label>
                                                        <input type="text" class="form-control" name="txtact_no_serieEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fecha de adquisición</label>
                                                        <input type="date" class="form-control" name="txtact_fecha_adquEdit" required/>     
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Precio de adquisición</label>
                                                        <input type="number" class="form-control" name="txtact_precio_adquEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Vida Util (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_vida_utilEdit" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Meses Depreciados (n° de meses)</label>
                                                        <input type="number" class="form-control" name="txtact_meses_depreciadosEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Descripción</label>
                                                        <input type="text" class="form-control" name="txtact_descripcionEdit" required/>                                         
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Fabricante</label>
                                                        <select class="form-select" aria-label="Default select example" name="txttblfabricantes_idEdit" required>
                                                            <option selected>Seleccione el Fabricante</option>

                                                            <c:forEach items="${listfab}" var="fab">

                                                                <option value="${fab.id}">${fab.fab_nombre}</option>

                                                            </c:forEach>
                                                        </select>
                                                    </div>                             
                                                    <div class="col-md-6 mb-3">
                                                        <label>Ubicación</label>
                                                        <select class="form-select" aria-label="Default select example" name="txttblubicacion_idEdit" required>
                                                            <option selected>Seleccione la ubicación</option>

                                                            <c:forEach items="${listubi}" var="ubi">

                                                                <option value="${ubi.id}">${ubi.ubi_descripcion}</option>

                                                            </c:forEach>
                                                        </select>                                     
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Denominación de Mueble</label>
                                                        <input type="text" class="form-control" name="txtmub_denominacionEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Material del Mueble</label>
                                                        <input type="text" class="form-control" name="txtmub_materialEdit" required/>     
                                                    </div> 
                                                </div>
                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Peso (en CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_pesoEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Ancho (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_anchoEdit" required/>     
                                                    </div> 
                                                </div>

                                                <div class="row">
                                                    <div class="col-md-6 mb-3">
                                                        <label>Alto (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_altoEdit" required/>     
                                                    </div> 
                                                    <div class="col-md-6 mb-3">
                                                        <label>Largo (En CM)</label>
                                                        <input type="number" class="form-control" name="txtmub_largoEdit" required/>     
                                                    </div>                                                       
                                                </div>
                                                <div class="modal-footer">
                                                    <div class="g-recaptcha" data-sitekey="6LfUVR8pAAAAAMyE2Igd5THThjc7PmMLSsZsjlVP"  data-callback="enableSubmitButton1" data-expired-callback="recaptchaExpiredCallback2"></div>
                                                    <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                    <button type="submit" class="ActButton btn btn-success" name="accion" value="ActualizarMueble" disabled>Acualizar</button>   
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
        <script src="../../js/js-muebles.js"></script>
        


    </body>
</html>
