<%-- 
    Document   : equiposcomputo
    Created on : 26 oct. 2023, 06:25:46
    Author     : OMAR OROZCO
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.safi.dao.EquiposComputoDAO"%>
<%@page import="com.safi.dao.UbicacionesDAO"%>
<%@page import="com.safi.dao.FabricantesDAO"%>
<%@page import="com.safi.pojo.EquiposComputo"%>
<%@page import="com.safi.pojo.Ubicaciones"%>
<%@page import="com.safi.pojo.Fabricantes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!-- link necesarios para el dashboard -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <!-- Link de fontawesome -->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Link de bootstrap -->        

    </head>
    <body class="sb-nav-fixed">


        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="../inicio.html"><img src="" alt="Logo"/></a> <!-- Aca va el logo -->
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
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
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Activos Fijos
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="equiposcomputo.jsp">Equipos Computo</a>
                                    <a class="nav-link" href="#">Maquinaria</a>
                                </nav>
                            </div>                            
                        </div>

                    </div>

                    <div class="sb-sidenav-footer">
                        <div class="small">Logeado en:</div>
                        SAFI
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Equipos de Computo</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../inicio.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Equipos de Computo</li>
                        </ol>                        
                        <div class="mb-4">                            
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                Agregar Equipo computo  
                            </button>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Equipos de Computo.
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
                                                    <a class="btn btn-warning editar" data-toggle="modal" data-target="#EditarUbicacion"><i class="fa-solid fa-pen-to-square"></i></a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
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
                                    <select class="form-select" aria-label="Default select example" name="txtact_estado" required>
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
                                <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                <button type="submit" class="btn btn-success" name="accion" value="agrequipocomputo">Agregar</button>   
                                
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <!-- Scripts de el dashboard -->
        <!--        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../../js/js-menu.js"></script>            
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="../../js/datatables-simple-demo.js"></script>       
    </body>
</html>
