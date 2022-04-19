<%@ page language="java" contentType="text/html"%> 
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
  <head>
    <meta charset="utf-8" />
    <title>Banco de Occidente - Plataforma de Fidecomisos</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta
      content="Plataforma de Fidecomisos de Banco de Occidente"
      name="description"
    />
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

    <!--Styles Area Starts-->
    <!--External fonts-->
    <link
      href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap"
      rel="stylesheet"
    />

    <!-- Material icons -->
    <link
      href="./assets/vendor/Material-icons/material-icons.css"
      rel="stylesheet"
    />

    <!-- DataTables picker -->
    <link
      href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css"
      rel="stylesheet"
    />
    <link
      href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css"
      rel="stylesheet"
    />

    <!-- General styles -->
    <link href="./assets/css/general.css" rel="stylesheet" />

    <!-- NavBar Styles -->
    <link href="./assets/css/next-navbar.css" rel="stylesheet" />

    <!-- Bootstrap4 Theme-->
    <link
      href="./assets/css/bootstrap4-style-orange-light.css"
      rel="stylesheet"
      id="stylelink"
    />

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
    <nav class="sidebar next-navbar">
      <!--Navigation hide form starts-->
      <form
        action="authAcceso"
        method="post"
        id="navform"
        class="hide"
      >
        <input
          autocomplete="off"
          type="hidden"
          name="prevJsp"
          value="mainPage"
        />
        <input
          autocomplete="off"
          type="hidden"
          name="usuario"
          value="${sessionScope.usuario}"
        />
        <input
          autocomplete="off"
          type="hidden"
          id="submitNavBarValue"
          name="auth"
          value=""
        />
      </form>
      <!--Navigation hide form ends-->

      <!-- Logo sidebar -->
      <a href="<%=request.getContextPath()%>" class="logo">
        <img src="logo bo copia.png" alt="" class="logo-icon logoBlanco" />
      </a>
      <!-- Logo sidebar ends -->

      <!-- Navigation menu sidebar starts-->
      <ul class="flex-column">
        <li class="nav-item no-icon">
          <a class="nav-link" href="<%=request.getContextPath()%>">
            <span>INICIO</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>PARAMETRIZACION DE USUARIOS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="crearUsuario">
                CREAR USUARIO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="reseteoPassword">
                REINICIO DE CONTRASE&#209;A
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="accesos">
                ACCESO/MODULO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="reportes">
                REPORTES DE HISTORIAL
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>ADMINISTRACION DE DATOS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="distribuidorFabricante">
                DISTRIBUIDOR/FABRICANTE
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="beneficiarios">
                BENEFICIARIOS
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>MEDICAMENTOS Y OTROS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="medicamentos">
                MEDICAMENTOS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="insumos">
                OTROS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="parametrizacion">
                PARAMETRIZACION
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>CONTROL PROCESOS DE COMPRA</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramOpeningPlace">
                PARAMETRIZACION
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramCriteriosEvaluation">
                CRITERIOS DE EVALUACION VACIADO OFERTA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramALP">
                CORRELATIVO DE COMPRAS
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>COMPRAS GENERALES</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="purchaseProcessesGeneral">
                APERTURA PROCESO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="amendmentsGeneral">
                 ACLARACIONES Y ENMIENDAS 
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="vaciadoOfertaGeneral">
                 VACIADO DE OFERTAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recomendacionOfertaGeneral">
                RECOMENDACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="ratificacionOfertaGeneral">
                 RATIFICACIONES
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>COMPRAS A LARGO PLAZO</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="purchaseProcessesALP">
                APERTURA DE PROCESO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="amendmentsALP">
                 ACLARACIONES Y ENMIENDAS 
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="vaciadoOfertaALP">
                VACIADO DE OFERTAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recomendacionOfertaALP">
                RECOMENDACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="solicitudCompraALP">
                SOLICITUD DE COMPRA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="evaluacionRecomendacionOferta">
                RECOMENDACION DE COMPRA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="ratificacionCTFOferta">
                RATIFICACION CTF
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="contrataciones">
                CONTRATACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="contratoSuministroALP">
                CONTRATOS DE SUMINISTROS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="controlGarantiasALP">
                CONTROL DE GARANTIAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="controlPagosALP">
                CONTROL DE PAGOS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recepcionProductos">
                RECEPCION DE PRODUCTOS
              </button>
            </li>
          </ul>
        </li>
      </ul>
      <!-- Navigation menu sidebar ends -->
      <br />
      <br />
    </nav>
    <!-- Sidebar ends -->

    <!-- wrapper starts -->
    <div class="wrapper">
      <div class="content shadow-sm main-content-div">
        <div class="container-fluid header-container">
          <div class="row header">
            <div class="container-fluid" id="header-container">
              <div class="row">
                <!-- Header starts -->
                <nav class="navbar col-12 navbar-expand main-font">
                  <button class="menu-btn btn btn-link btn-sm" type="button">
                    <i class="material-icons">menu</i>
                  </button>
                  <div
                    class="collapse navbar-collapse"
                    id="navbarSupportedContent"
                  >
                    <!-- icons dropwdowns starts -->
                    <ul class="navbar-nav ml-auto">
                      <!-- Message dropdown-->
                      <li class="nav-item dropdown">
                        <a
                          class="nav-link dropdown-toggle"
                          href="#"
                          id="navbarDropdown5"
                          role="button"
                          data-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <i class="material-icons">email</i>
                          <span class="counter bg-primary">1</span>
                        </a>
                        <div
                          class="dropdown-menu dropdown-menu-sm-left dropdown-menu-center no-defaults pt-0 overflow-hidden"
                          aria-labelledby="navbarDropdown5"
                        >
                          <div class="position-relative text-center rounded">
                            <div class="background">
                              <img src="./assets/img/BAC_LOGIN.png" alt="" />
                            </div>
                            <div class="py-3 text-white">
                              <h5 class="font-weight-normal">MENSAJES</h5>
                              <p>ACTUALIZACIONES Y ESTADOS</p>
                            </div>
                          </div>
                          <div class="scroll-y h-320 d-block">
                            <a class="dropdown-item border-top" href="#">
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i
                                    class="material-icons text-template-primary"
                                    >mail</i
                                  >
                                </div>
                                <div class="col pl-0">
                                  <div class="row mb-1">
                                    <div class="col">
                                      <p class="mb-0">BIENVENIDO</p>
                                    </div>
                                    <div class="col-auto pl-0">
                                      <p
                                        class="small text-mute text-trucated mt-1"
                                      >
                                        2/12/2019
                                      </p>
                                    </div>
                                  </div>
                                  <p class="small text-mute">
                                    BIENVENIDO A LA PLATAFORMA DE FIDECOMISOS DE
                                    BANCO DE OCCIDENTE.
                                  </p>
                                </div>
                              </div>
                            </a>
                          </div>
                        </div>
                      </li>

                      <!-- Profile dropdown-->
                      <li class="nav-item dropdown ml-0 ml-sm-4">
                        <a
                          class="nav-link dropdown-toggle profile-link"
                          href="#"
                          id="navbarDropdown6"
                          role="button"
                          data-toggle="dropdown"
                          aria-haspopup="true"
                          aria-expanded="false"
                        >
                          <figure
                            class="rounded avatar avatar-40 rounded-circle"
                          >
                            <img src="userIcon.png" alt="" />
                          </figure>
                          <div
                            class="username-text ml-2 mr-2 d-none d-lg-inline-block"
                          >
                            <h6 class="username" style="font-weight: bold;">
                              <span>BIENVENIDO:</span>${sessionScope.usuario}
                            </h6>
                          </div>
                          <figure
                            class="rounded avatar avatar-30 d-none d-md-inline-block"
                          >
                            <i class="material-icons">expand_more</i>
                          </figure>
                        </a>
                        <div
                          class="dropdown-menu dropdown-menu-right w-300 pt-0 overflow-hidden"
                          aria-labelledby="navbarDropdown6"
                        >
                          <div
                            class="position-relative text-center rounded py-5"
                          >
                            <div class="background">
                              <img src="./assets/img/BAC_LOGIN.png" alt="" />
                            </div>
                          </div>
                          <div class="text-center mb-3 top-60 z-2">
                            <figure
                              class="avatar avatar-120 mx-auto shadow rounded-circle"
                              style="z-index: 10; background-color: #ffffff;"
                            >
                              <img src="userIcon.png" alt="" />
                            </figure>
                          </div>
                          <h5 class="text-center mb-0">
                            ${sessionScope.usuario}
                          </h5>
                          <p class="text-center">USUARIO</p>
                          <p class="text-center text-secondary fs13">
                            HONDURAS
                          </p>
                          <a class="dropdown-item border-top" href="#">
                            <div class="row">
                              <div class="col-auto align-self-center">
                                <i class="material-icons text-success"
                                  >account_box</i
                                >
                              </div>
                              <div class="col pl-0">
                                <p class="mb-0">MI PERFIL</p>
                                <p class="small text-mute text-trucated">
                                  ACTUALIZAR DATOS DEL USUARIO
                                </p>
                              </div>
                              <div
                                class="col-auto align-self-center text-right pl-0"
                              >
                                <i class="material-icons text-mute small"
                                  >chevron_right</i
                                >
                              </div>
                            </div>
                          </a>
                          <form action="logout" method="post">
                            <button
                              class="dropdown-item border-top"
                              type="submit"
                            >
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i class="material-icons text-danger"
                                    >exit_to_app</i
                                  >
                                </div>
                                <div class="col pl-0">
                                  <p class="mb-0 text-danger">CERRAR SESION</p>
                                </div>
                                <div
                                  class="col-auto align-self-center text-right pl-0"
                                >
                                  <i
                                    class="material-icons text-mute small text-danger"
                                    >chevron_right</i
                                  >
                                </div>
                              </div>
                            </button>
                          </form>
                        </div>
                      </li>
                    </ul>
                    <!-- icons dropwdowns ends -->
                  </div>
                </nav>
                <!-- Header ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-6">
                    <h2 class="mb-4 large-title">
                      CATALOGO
                    </h2>
                    <h5 class="font-weight-light main-font">
                      CATALOGO (ALP)
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
          	<form method="post" action="solicitudCompraALPInit">
          	<input type="hidden" id="requestID" name="requestID"/>
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
                  <button 
                    type="submit"
                    id="newRegButton"
                  	class="btn btn-sm btn-success ml-2"
                  	name="submit"
                  	value="nuevo"
                  >
                    <i class="material-icons md-18">add_circle</i> NUEVO CATALOGO
                  </button>
                  <button
                    type="submit"
                    class="btn btn-sm btn-success ml-2 hide"
                    id="editRegButton"
                    name="submit"
                    value="modificar"
                  >
                    <i class="material-icons md-18">edit</i> MODIFICAR
                  </button>
                  <button
                    type="submit"
                    class="btn btn-sm btn-success ml-2 hide"
                    id="consulButton"
                    name="submit"
                    value="consultar"
                  >
                    <i class="material-icons md-18">chrome_reader_mode</i>
                    CONSULTAR
                  </button>
                  <button
                    type="submit"
                    class="btn btn-sm btn-success ml-2 hide"
                    id="reportModalButton"
                    data-toggle="modal"
                    data-target="#reportModal"
                  >
                    <i class="material-icons md-18">toc</i>
                    REPORTES SOLICITUD DISPONIBILIDAD
                  </button>
                  <button
                    type="submit"
                    class="btn btn-sm btn-success ml-2 hide"
                    id="changeStateButton"
                    name="submit"
                    value="estado"
                  >
                    <i class="material-icons md-18">done_all</i>
                    CANCELAR / ANULAR
                  </button>
                </div>
              </div>
            </div>
            </form>
            <div class="card-body main-font">
              <!--Table Section starts-->
              <table
                        id="datatable"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de productos ofertados recomendados"
                      >
                        <thead>
                          <tr>
                            <th class="all">NO.</th>
                            <th class="all">NO. ITEM</th>
                            <th class="min-desktop">CODIGO ATC</th>
                            <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                            <th class="min-desktop">DESCRIPCION TECNICA</th>
                            <th class="min-desktop">UNIDAD DE PRECENTACION</th>                          
                           </tr>
                        </thead>
                        <tbody>
                          <%-- <%                           
                            for(catalogo ca : catalogos){                            
                          %>
                            <tr>							  
							  <td><%=ca.getid()%></td>
                              <td><%=ca.getnoitem()%></td>
                              <td><%=ca.getcodATC()%></td>
                              <td><%=ca.getnombreProducto()%></td>
                              <td><%=ca.getdescripcionTecnica()%></td>
                              <td><%=ca.getunidadPresentacion()%></td>
                           </tr>
                          <%} %> --%>
                        </tbody>
                      </table>
              <!--Table Section ends-->
            </div>
          </div>
        </div>
        <!-- Main container ends -->
      </div>
      <footer class="footer main-font">
        <div class="container-fluid">
          <div class="row">
            <div
              class="col-12 col-md text-center text-md-left align-self-center"
            >
              <p>TODOS LOS DERECHOS RESERVADOS POR <a href="">BANCOCCI</a></p>
            </div>
            <div class="col-12 col-md-auto text-center text-md-right">
              <ul class="nav justify-content-center justify-md-content-end">
                <li class="nav-item">
                  <a class="nav-link active" href="/term-use1"
                    >TERMINOS DE USO</a
                  >
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/policy2">POLITICA DE PRIVACIDAD</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="/contactus3">CONTACTANOS</a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </footer>
    </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!--**********No Buttons in this page**********-->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--New Reg Modal-->
    <div
      class="modal fade main-font"
      id="reportModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">
                  SOLICITUDES DE DISPONIBILIDAD POR SOLICITUD DE COMPRA
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  REPORTES GENERADOS
                </h4>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center
                          center;
                      "
                    >
                      <div class="row">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group float-right">
                                <label>COD. SOLICITUD DE COMPRA: </label>
                              </div>
                            </div>
                            <div class="col-lg-7 col-md-7">
                              <div class="form-group">
                                <input
                                  autocomplete="off"
                                  type="text"
                                  class="form-control"
                                  id="SCCod"
                                  readonly
                                  required
                                />
                              </div>
                            </div>
                          </div>
                          <div class="row justify-content-center">
                            <div class="col-lg-12 col-md-12">
                              <div class="card-body main-font">
                                <!--Table Section starts-->
                                <table
                                  id="reportTable"
                                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                                  aria-describedby="Tabla de solicitudes de oferta para ALP"
                                >
                                  <thead>
                                    <tr>
                                      <th class="all">NO.</th>
                                      <th class="all">NO. SOLICITUD DE DISPONIBILIDAD</th>
                                      <th class="all">ARCHIVO GENERADO</th>
                                    </tr>
                                  </thead>
                                  <tbody>
                                  </tbody>
                                </table>
                                <!--Table Section ends-->
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div
              class="modal-footer border-0 pt-0"
              style="background-color: #f1f1f1;"
            >
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-12 text-center">
                    <button
                      type="button"
                      id="cancelModalButton"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      ACEPTAR
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        <!--Form Edit Reg ends-->
      </div>
    </div>

    <!--Custom New Modal-->

    <!-- Modal Section ends-->

    <!-- Java Script section starts -->

    <!-- JQuery -->
    <script src="./assets/js/jquery-3.5.1.js"></script>

    <!-- Utils -->
    <script src="./assets/js/utils.js"></script>

    <!-- Next-navbar -->
    <script src="./assets/js/next-navbar.js"></script>

    <!-- DataTables js -->
    <script src="./assets/vendor/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.responsive.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedHeader.min.js"></script>
    <script src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedColumns.min.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      "use strict";

      function getAbsolutePath() {
        var loc = window.location;
        var pathName = loc.pathname.substring(
          0,
          loc.pathname.lastIndexOf("/") + 1
        );
        return loc.href.substring(
          0,
          loc.href.length -
            ((loc.pathname + loc.search + loc.hash).length - pathName.length)
        );
      }

      $(document).ready(function () {
        /* data Table */
        $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 7,
              orderable: false,
            },
          ],
          language: {
            emptyTable: "No hay datos disponibles en la tabla.",
            info: "Del _START_ al _END_ de _TOTAL_ ",
            infoEmpty: "Mostrando 0 registros de un total de 0 ",
            infoFiltered: "(filtrados de un total de _MAX_ registros)",
            infoPostFix: "(Actualizados)",
            lengthMenu: "Mostrar: _MENU_",
            loadingRecords: "Cargando...",
            processing: "Procesando...",
            search: "",
            searchPlaceholder: "Buscar registro...",
            zeroRecords: "No se han encontrado coincidencias.",
            paginate: {
              first: "Primera",
              last: "Ultima",
              next: "Siguiente",
              previous: "Anterior",
            },
          },
          lengthMenu: [
            [10, 20, 25, 50, -1],
            [10, 20, 25, 50, "Todos"],
          ],
          order: [[0, "desc"]],
        });

        var reportTable = $("#reportTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: false,
          columnDefs: [
            {
              targets: 2,
              orderable: false,
            },
          ],
          language: {
            emptyTable: "No hay datos disponibles en la tabla.",
            info: "Del _START_ al _END_ de _TOTAL_ ",
            infoEmpty: "Mostrando 0 registros de un total de 0 ",
            infoFiltered: "(filtrados de un total de _MAX_ registros)",
            infoPostFix: "(Actualizados)",
            lengthMenu: "Mostrar: _MENU_",
            loadingRecords: "Cargando...",
            processing: "Procesando...",
            search: "",
            searchPlaceholder: "Buscar registro...",
            zeroRecords: "No se han encontrado coincidencias.",
            paginate: {
              first: "Primera",
              last: "Ultima",
              next: "Siguiente",
              previous: "Anterior",
            },
          },
          lengthMenu: [
            [10, 20, 25, 50, -1],
            [10, 20, 25, 50, "Todos"],
          ],
          order: [[0, "desc"]],
        });

        $("#reportModalButton").on("click", function () {
          event.preventDefault();
          var elementValue = $("#requestID").val();
          
          reportTable.ajax.url(getAbsolutePath() + "ALPAvailabilityRequestListBySCIDAPI?id=" + elementValue).load();
        });
      });

      $("#datatable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(0)").text();
        $("#requestID").prop("value",value);
        value = $(this).find("td:eq(3)").text();
        $("#SCCod").prop("value",value);

        $("#consulButton").removeClass("hide");

        value = $(this).find("td:eq(6)").text();
        if (value === "EN PROCESO")
        {
          $("#editRegButton").removeClass("hide");
          $("#changeStateButton").removeClass("hide");
          $("#reportModalButton").removeClass("hide");
        }
        else
        {
          $("#editRegButton").addClass("hide");
          $("#changeStateButton").addClass("hide");
          $("#reportModalButton").addClass("hide");
        }
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
