<%@ page language="java" contentType="text/html"%> 
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	//Retrieve your list from the request, with casting
  ArrayList<solicitudDisponibilidadALP> SDListYES = (ArrayList<solicitudDisponibilidadALP>) request.getAttribute("SDListYES");
  ArrayList<solicitudDisponibilidadALP> SDListNO = (ArrayList<solicitudDisponibilidadALP>) request.getAttribute("SDListNO");

  String funcion = (String) request.getAttribute("funcion");

  String temp = "";
  temp = (String)request.getAttribute("openMode");
  String openMode = "";
	if(temp != null && !temp.isEmpty()){
		openMode = temp;
	}
%>
<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML ends --%>

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

    <style>
      .checkboxes label {
        display: block;
        padding-right: 10px;
        padding-left: 22px;
        text-indent: -22px;
      }
      .checkboxes input {
        vertical-align: middle;
      }
      .checkboxes label span {
        vertical-align: middle;
      }
    </style>
    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
    <jsp:include page="Menu.jsp" flush="true" />
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
                            <h6 class="username" style="font-weight: bold">
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
                              style="z-index: 10; background-color: #ffffff"
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
          <div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <nav class="navbar col-12 main-font">
                  <div class="dropdown mr-auto d-flex d-sm-none">
                    <button
                      class="btn dropdown-toggle btn-sm btn-primary"
                      type="button"
                      data-toggle="dropdown"
                      aria-haspopup="true"
                      aria-expanded="false"
                    >
                      SECCIONES
                    </button>
                    
                    <div class="dropdown-menu">
                      <a type="button" class="dropdown-item active" href="#"
                        >PROVEEDORES</a
                      >
                      <label class="dropdown-item">
                        VACIADO
                      </label>
                      <label class="dropdown-item">
                        EVALUACION
                      </label>
                      <label class="dropdown-item">
                        RECOMENDACION
                      </label>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">PROVEEDORES</a>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link">VACIADO</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link">EVALUACION</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link">RECOMENDACION</label>
                    </li>
                  </ul>
                </nav>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-12">
                    <h2 class="mb-4 large-title">
                      PROVEEDORES Y SOLICITUDES DE DISPONIBILIDAD
                    </h2>
                    <h5 class="font-weight-light main-font">
                      COMPRA ACUERDO A LARGO PLAZO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
            <form class="card-body" method="post" action="vaciadoEvaluacionRecomendacionALPStepRouting">
            <input type="hidden"  name="coddSd" id="coddSd" />
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left">
                    <h6 class="mb-4">NOTA: SELECCIONE UN PROVEEDOR PARA CONTINUAR...</h6>
                  </div>
                  <div class="form-group float-right">
                    <button
                      class="btn btn-success ml-2"
                      type="submit"
                      hidden
                      
                      name="submit"
                      id="reportButton"
                      value="recomendarOferta"
                    >
                      RECOMENDAR OFERTAS
                      <i class="material-icons md-18">done_all</i>
                    </button>
                    <button
                      class="btn btn-success ml-2"
                      type="button"
                      name="validarReocimienda"
                      id="validarReocimienda"
                    >
                      RECOMENDAR OFERTAS
                      <i class="material-icons md-18">done_all</i>
                    </button>
                  </div>
                </div>
              </div>
            </form>
          </div>
          <div class="card border-0 shadow-sm main-content-div main-font">
            <div class="card-body mr-3 ml-3">
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left">
                    <h5 class="mb-1">
                      PROVEEDORES Y SOLICITUDES DE DISPONIBILIDAD - SIN VACIADOS
                    </h5>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <!--Table Section starts-->
                  <table
                    id="noVaciados"
                    class="table table-bordered w-100 mb-0 table-aditional-styles"
                    aria-describedby="Tabla de Solicitudes de Disponibilidad sin vaciados"
                  >
                    <thead>
                      <tr>
                        <th class="all">ID</th>
                        <th class="min-tablet">
                          NO. DE SOLICITUD DE DISPONIBILIDAD
                        </th>
                        <th class="min-tablet">PROVEEDOR</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        if (SDListNO != null){
                          for(solicitudDisponibilidadALP SD : SDListNO){
                      %>
                            <tr>
							                <td><%=SD.getId()%></td>
							                <td><%=SD.getCodSolicitudDisponibilidad()%></td>
							                <td><%=SD.getProveedor()%></td>
						                </tr>
                      <%
                          }
                        }
                      %>
                    </tbody>
                  </table>
                  <!--Table Section ends-->
                </div>
              </div>
            </div>
            <div class="card-body mr-3 ml-3">
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left">
                    <h5 class="mb-1">
                      PROVEEDORES Y SOLICITUDES DE DISPONIBILIDAD - CON VACIADOS
                    </h5>
                  </div>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <!--Table Section starts-->
                  <table
                    id="vaciados"
                    class="table table-bordered w-100 mb-0 table-aditional-styles"
                    aria-describedby="Tabla de Solicitudes de Disponibilidad con vaciados"
                  >
                    <thead>
                      <tr>
                        <th class="all">ID</th>
                        <th class="min-tablet">
                          NO. DE SOLICITUD DE DISPONIBILIDAD
                        </th>
                        <th class="min-tablet">PROVEEDOR</th>
                      </tr>
                    </thead>
                    <tbody>
                      <%
                        if (SDListYES != null){
                          for(solicitudDisponibilidadALP SD : SDListYES){
                      %>
                            <tr>
							                <td><%=SD.getId()%></td>
							                <td><%=SD.getCodSolicitudDisponibilidad()%></td>
							                <td><%=SD.getProveedor()%></td>
						                </tr>
                      <%
                          }
                        }
                      %>
                    </tbody>
                  </table>
                  <!--Table Section ends-->
                </div>
              </div>
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

    <form class="main-font" action="evaluacionRecomendacionALPInit" method="post">
      <!-- Cancel Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded shadow"
          type="submit"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">close</i> CANCELAR
        </button>
      </div>
    </form>

    <form class="main-font" action="vaciadoEvaluacionRecomendacionALPStepRouting" method="post" id="SDRequestForm">
      <input type="hidden" id="SDID" name="SDID"/>
      <!--Submit section starts-->
      <!-- <div id="openModal" class="wrap-fixed-float wrap-fixed-bottom-right hide" style="padding-bottom:3%;">
        
       <button class="btn btn-primary btn-rounded shadow main-font" data-target="#CriteriosEvalaucionModal" data-toggle="modal"
       type = "button" id="CriteriosEvaluacionParamModalButton">
       		    CRITERIOS DE EVALUACION 
             </button>      
        
      </div> -->
      
      <div id="evaluateOffersButton" class="wrap-fixed-float wrap-fixed-bottom-right hide" style="padding-bottom:3%;">       
        <button
          class="btn btn-primary btn-rounded shadow main-font"
          id="enviar"
          type="submit"
          name="submit"
          value="evaluarOferta"
        >
          <span>CRITERIOS DE EVALUACION </span>
          <i class="material-icons vm">done_all</i>
        </button>
      </div>
      <div id="emptyingOffersButton" class="wrap-fixed-float wrap-fixed-bottom-right hide">
        <button
          class="btn btn-primary btn-rounded shadow main-font"
          type="submit"
          name="submit"
          value="vaciadoOferta"
        >
          <span>VACIAR OFERTAS </span>
          <i class="material-icons vm">assignment</i>
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--*****NO MODALS IN THIS PAGE*****-->
<!--Criterios evaluacion -->
    <div
      class="modal fade main-font"
      id="CriteriosEvalaucionModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
      data-backdrop="static" 
      data-keyboard="false"
    >
      <div class="modal-dialog modal-dialog-scrollable" style="max-width: 100%;padding-left: 30%;padding-right: 30%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
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
                  CRITERIOS DE EVALUCION
                </h1>                
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center
                          center;
                        background-size: cover;
                      "
                    >
                      <i
                        id="infoIcon"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >check</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        SELECCIONE LOS CRITERIOS DE EVALUACION:
                      </h5>
                      <div class="row">
                        <div class="card-body">                          
                          <div class="row">
                            <div class="col-md-12">
                              <!--Table Section starts-->
                              <table
                        id="criteriosEvalaucionTableParam"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de Oficios"
                      >
                        <thead>
                          <tr>
                            <th class="all">NO.</th>
                            <th class="min-tablet">CRITERIO</th>
                            <th class="min-tablet">SELECCION</th>
                          </tr>
                        </thead>
                        <tbody>                      
                        </tbody>
                      </table>        
                              <!--Ben Final Table Section ends-->
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
                  <div class="col-12 col-md-6 text-center">
                    <button
                      type="button"
                      id="cancelButton"                     
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button
                      id="submitParamCriterios"
                      value=""
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      GUARDAR & CONTINUAR
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--Ben Final Param ends-->
      </div>
    </div>
    <!-- Modal Section ends-->
<!-- Type Select Modal -->
	<div class="modal fade" id="confirmationModalCenter" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered "
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-25">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<div class="row mb-2 justify-content-center">
							<figure class="avatar avatar-50"> <img
								src="./bancoccicon.png" alt=""></figure>
							<h2 class="mb-0 ml-2 text-white main-font">ALERTA</h2>
						</div>
						<div class="modal-body main-font" id="confirMessage">
							<!--DATA Section starts-->
							
							<!--DATA Section ends-->
						</div>
						<div>
							<button class="btn btn-primary btn-block main-font"
								id="confirModalButton" data-dismiss="modal"> ACEPTAR
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
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
    	  //document.getElementById('evaluateOffersButton').style.display = 'none';
        /*TABLA DE RECOMENDADOS*/
        $("#vaciados").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
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
          order: [[0, "asc"]],
        });

        /*TABLA DE RECOMENDADOS PENDIENTES*/
        $("#noVaciados").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
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
          order: [[0, "asc"]],
        });
        
        
        /*TABLA DE CRITERIOS*/
        var reqTable = $("#criteriosEvalaucionTableParam").DataTable({
            responsive: true,
            searching: false,
            bLengthChange: false,
            //pageLength: 3,
            columnDefs: [
              {
   			  targets: 1,
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
              //search: "",
              //searchPlaceholder: "Buscar registro...",
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
            order: [[0, "asc"]],
          }); 

        
    	var container = document.getElementById("SDRequestForm")	
        
        $('#submitParamCriterios').click(function (){	    	
   		  var checkedRows = $("#criteriosEvalaucionTableParam input[type=checkbox]:checked").parents("tr").clone();   		  	
   		  if(checkedRows.length == 0){
   			$("#confirmationModalCenter").modal('show');				 				 
 			 $("#confirMessage").text(" POR FAVOR SELECCIONE UN CRITERIO DE EVALUCION COMO MINIMO...");
   			  return false;
   		  }
   		  
           checkedRows.find('td:last').remove();
           checkedRows.each(function () {             
         	  var inputBC = document.createElement("input");
 		        inputBC.setAttribute("type", "hidden");
 		        inputBC.setAttribute("name","idCriterio");
 		      	inputBC.setAttribute("value", $(this).find( "td:eq(0)" ).html());
 		      	container.appendChild(inputBC); 		             			  
             });                 
           $('#enviar').click();
         });
    	
    	var idSD = 0;
    	$("#vaciados tr").click(function () {
            $(this).addClass("selected").siblings().removeClass("selected");
            var value;
            value = $(this).find("td:eq(0)").text();
            $("#SDID").prop("value", value);
            idSD = value;         
            
            $("#coddSd").prop("value", value);
            //Obtenercriterios(value)
            $("#reportSDID").prop("value", value);

            $("#emptyingOffersButton").removeClass("hide");
            $("#evaluateOffersButton").removeClass("hide");
          });

          $("#noVaciados tr").click(function () {
            $(this).addClass("selected").siblings().removeClass("selected");
            var value;
            value = $(this).find("td:eq(0)").text();
            $("#SDID").prop("value", value);
            $("#reportSDID").prop("value", value);

            $("#emptyingOffersButton").removeClass("hide");
            $("#evaluateOffersButton").addClass("hide");
          });
          
          function Obtenercriterios(id) {
    		
    		reqTable.ajax.url(getAbsolutePath() + "ObtenerCriteriosEvaluacionAPI" + "?id=" + id).load();
    	}
          
          
          $("#validarReocimienda").on("click", function (event) {
		      	event.preventDefault();
		      	 var url = getAbsolutePath() + "ValidarPermiteRecomendarAPI";
		          $.ajax({
		      	    url:url,
		      	    type:"POST",
		      	    dataType:'json',
		      	    data: {idSD:idSD},
		      	    success:function(data){		      	    	
		      	    	if(data > 0){
		      	    	$("#confirmationModalCenter").modal('show');				 				 
		    			 $("#confirMessage").text("NO SE PUEDE RECOMENDAR. DEBE DE VACIAR Y EVALUAR LA SOLICITUD");
		      	    	}else{		      	    		
		      	    		$('#reportButton').click();
		      	    	}
		      	    },
		      	});		      	
          });           
      });
            
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
