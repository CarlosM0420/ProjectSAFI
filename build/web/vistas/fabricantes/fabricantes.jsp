<%@page import="java.util.List"%>
<!--
    Document   : veractivosFijos
    Created on : 10 oct. 2023, 06:21:19
    Author     : OMAR OROZCO
-->
<!DOCTYPE html>
<%@page import="com.safi.dao.FabricantesDAO"%>
<%@page import="com.safi.pojo.Fabricantes"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="Omar Orozco" />
        <title>Proveedores</title>
        <!-- Links de Dasboard e iconos -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="../../css/css-menu.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Script de api de reCAPtcha -->
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>


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
                        <li><a class="dropdown-item" href="../index.jsp">Logout</a></li>
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

                        <h1 class="mt-4">Proveedores.</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="../inicio.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Proveedores</li>
                        </ol>
                        <div class="mb-4">                            
                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#AgregarProveedor">
                                Agregar Proveedor  
                            </button>
                        </div>


                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Proveedores
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th>Observaciones</th>                                            
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Dirección</th>
                                            <th>Telefono</th>
                                            <th>Observaciones</th>                                            
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>          
                                        <%
                                            FabricantesDAO fabDAO = new FabricantesDAO();
                                            List<Fabricantes> listFab = fabDAO.MostrarFabricantes();
                                            request.setAttribute("listFab", listFab);
                                        %>
                                    <c:forEach items="${listFab}" var="fab">
                                        <tr>                                                
                                            <td>${fab.fab_codigo}</td>
                                            <td>${fab.fab_nombre}</td>
                                            <td>${fab.fab_direccion}</td>
                                            <td>${fab.fab_telefono}</td>                                            
                                            <td>${fab.fab_observaciones}</td>                                           
                                            <td>
                                                <a class="btn btn-warning editbutton" data-equ_id="${e.id}"><i class="fa-solid fa-pen-to-square"></i></a>                                                                                                       
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                            <!-- Modal de agregar -->
                            <div class="modal fade" id="AgregarProveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Agregar Proveedor.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">
                                            
                                            <form action="../../fabricantesServlet" method="POST">

                                                    <div class="form-group">
                                                        <label>Código</label>
                                                        <input type="number" class="form-control" name="txtfab_codigo" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Nombre del proveedor</label>
                                                        <input type="text" class="form-control" name="txtfab_nombre" required/>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Dirección</label>
                                                        <input type="text" class="form-control" name="txtfab_direccion" required/>     
                                                    </div>                            
                                                    <div class="form-group">
                                                        <label>Teléfono</label>
                                                        <input type="text" class="form-control" name="txtfab_telefono" required/>     
                                                    </div>                            
                                                    <div class="form-group">
                                                        <label>Descripción</label>
                                                        <input type="text" class="form-control" name="txtfab_descripcion" required/>     
                                                    </div>                            

                                                    <div class="modal-footer">
                                                        <div class="g-recaptcha" data-sitekey="6LfUVR8pAAAAAMyE2Igd5THThjc7PmMLSsZsjlVP"  data-callback="enableSubmitButton" data-expired-callback="recaptchaExpiredCallback"></div>
                                                        <button type="" class="btn btn-dark" data-dismiss="modal">Cancelar</button>
                                                        <button type="submit" class="AggButton btn btn-success" name="accion" value="AgregarFabricante" disabled/>Agregar Proveedor</button>                                
                                                    </div>
                                                </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Modal de edición -->
                            <div class="modal fade" id="EditarProveedor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                <div class="modal-dialog modal-xl">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h1 class="modal-title fs-5" id="exampleModalLabel">Editar Proveedor.</h1>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>
                                        <div class="modal-body">


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
        <script src="../../js/js-fabricantes.js"></script>
    </body>
</html>
