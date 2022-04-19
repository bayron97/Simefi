<%@ page language="java" contentType="text/html"%>
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*"%> <%@ page import="java.io.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  //Retrieve your list from the request, with casting
  
  String funcion = (String) request.getAttribute("funcion");
  
	System.out.println(funcion + " ccccccccc");
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

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
     <style>
    	#documentpurchaseprocess th:nth-child(1){
			   display: none;
			}
		#documentpurchaseprocess td:nth-child(1){
			   display: none;
			}
		#documentpurchaseprocess th:nth-child(2){
		   display: none;
		}
		#documentpurchaseprocess td:nth-child(2){
			   display: none;
			}
    </style>
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
          <div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <form method="post" action="solicitudCompraALPStepRouting">
                <input type="submit" class="hide" id="criteriosEvaluacionRoute" name="submit" value="criteriosEvaluacion">
                <input type="submit" class="hide" id="datosGeneralesRoute" name="submit" value="datosGenerales">
                <input type="submit" class="hide" id="listaRequerimientoRoute" name="submit" value="listaRequerimiento">
                <input type="submit" class="hide" id="preSeleccionItemProveedorRoute" name="submit" value="preSeleccionItemProveedor">
                <input type="submit" class="hide" id="DigSolicitudCompraRoute" name="submit" value="DigSolicitudCompra">
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
                      <label class="dropdown-item" for="datosGeneralesRoute">
                        DATOS GENERALES
                      </label>
                      <label class="dropdown-item" for="criteriosEvaluacionRoute">
                        CRITERIOS DE EVALUACION
                      </label>
                      <label class="dropdown-item" for="listaRequerimientoRoute">
                        LISTA DE REQUERIMIENTO
                      </label>
                      <label class="dropdown-item" for="preSeleccionItemProveedorRoute">
                        PRE SELECCION ITEM-PROVEEDOR
                      </label>
                      <label class="dropdown-item" for="preSeleccionItemProveedorRoute">
                        SOLICITUD DE DISPONIBILIDAD
                      </label>
                      <a type="button" class="dropdown-item active" href="#"
                        >DIGITALIZACION SOLICITUD DE COMPRA</a
                      >
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link" for="datosGeneralesRoute">DATOS GENERALES</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="listaRequerimientoRoute">LISTA DE REQUERIMIENTO</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="preSeleccionItemProveedorRoute">PRE SELECCION ITEM-PROVEEDOR</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="preSeleccionItemProveedorRoute">SOLICITUD DE DISPONIBILIDAD</label>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">DIGITALIZACION SOLOCITUD DE COMPRA</a>
                    </li>
                  </ul>
                </nav>
                </form>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

<div class="container main-container" id="main-container">
              
    
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            
            <form id="digForm" method="post" action="digitizedDocumentALPServlet" enctype="multipart/form-data">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                
                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div
                        class="card-body text-center"
                        style="
                          background: url(./assets/img/BAC.png) center center fixed;
                        "
                      >
                        <i
                          id="infoIcon"
                          class="avatar avatar-60 md-36 material-icons text-template-primary"
                          >assignment</i
                        >
                        <h5
                          id="instructionSubtitle"
                          class="mb-3 text-center"
                          style="font-weight: bold;"
                        >
                          TERMINOS DE REFERENCIA:
                        </h5>
                        <div class="row">
                          <div class="card-body">
                            <div class="row justify-content-center">
                              <div class="col-md-10 mx-auto">
                                <!--DATA Section-->
                                <div id="dataSection">
                                <div class="row">
                                    <div class="col-lg-12 col-md-12">
                                      <div class="form-group float-right">
                                        <!--label class="btn btn-sm btn-success text-white">SUBIR ARCHIVO: </label-->
                                        <button
                                          class="btn btn-sm btn-success ml-3"
                                          data-target="#documentsModal"
                                          data-toggle="modal"
                                          type = "button"
                                          id="benFinalParamModalButton"
                                        >SUBIR ARCHIVO: </button>
                                      </div>
                                    </div>
                                  </div>
                               
                                  <div class="row">
                                    <div class="col-lg-8 col-md-8">
                                      <div class="form-group">
                                      	<input type="hidden" id="archivos" />
                                        <!--Ben Final Table Section starts-->
                                        <table
                                          id="documentpurchaseprocess"
                                          class="table table-bordered w-100 mb-0 table-aditional-styles"
                                          aria-describedby="Tabla de Beneficiarios y Oficios"
                                        >
                                          <thead>
                                            <tr>
                                              <th class="all">ID SESION</th>
                                              <th class="all">ID</th>
                                              <th class="min-tablet">DESCRIPCION ARCHIVO</th>
                                              <th class="min-tablet">ARCHIVO</th>
                                              <th class="min-tablet">ACCIONES</th>
                                            </tr>
                                          </thead>
                                          <tbody>
                       					           
                                                	<tr>
                                                    <td>-1</td>
                                                    <td></td>
                                                    <td></td>
                                                    <td></td>
                                                    <td>
                                                    <button class="btn btn-sm btn-success previewButton" title="MOSTRAR" onclick="event.preventDefault();" value="assets/files/buyProcessALPFiles/digitizedDocument/">
                                                      <i class="material-icons">receipt</i>
                                                    </button>
                                                    <a class="btn btn-sm btn-success" target="_blank" title="EXPORTAR" href="assets/files/buyProcessALPFiles/digitizedDocument/">
                                                      <i class="material-icons">input</i>
                                                    </a></td>
                                                  </tr>
                                                
                                          </tbody>
                                        </table>
                                        <!--Ben Final Table Section ends-->
                                      </div>
                                    </div>
                                    
                                    <div class="col-lg-4 col-md-4">
                                      <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                        <div class="col-lg-12 col-md-12">
                                          <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                            <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                            <p>
                                              SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                            </p>
                                          </div>
                                          <iframe title="document preview" src="" id="previewDocumentInput1" name="SubHtml"
                                            height="520" class="container-fluid hide">
                                            <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                                          </iframe>
                                        </div>
                                      </label>
                                    </div>
                                  </div>
                                </div>
                                <!--DATA Section ends-->
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
                <!-- Submit Float Button -->
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
                  <button
                    type="button"
                    class="btn btn-primary btn-rounded shadow main-font"
                    id="submitExternalButton"
                    name="submitExternalButton"
                    value="guardar"
                    data-target="#"
                    data-toggle="modal"
                  >
                    <span>GUARDAR Y FINALIZAR</span
                    ><i class="material-icons vm">done</i>
                  </button>
                </div>
              </div>
            </form>
            <!--Form Edit Reg ends-->
          </div>

        <!-- Main container ends -->
 
     
     
          <!--Content ends-->
        </div>
        <!-- Main container ends -->
        
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

    <!-- Cancel Float Button -->
    <form method="post" action="solicitudCompraALPStepRouting">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="preSeleccionItemProveedor"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>


<!-- Modal Section starts-->
    <!-- Modal Subida de archivos-->
    <div class="modal fade main-font" id="documentsModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--Ben Final Param starts-->
        <div id="benFinalContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close" onclick="limpiariframe();">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">SUBIR ARCHIVO</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                      INGRESE LOS DATOS
                      </h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-10 col-md-10">
                                <div class="form-group">
                                  <label>NOMBRE DEL ARCHIVO</label>
                                  <input autocomplete="off" type="text" class="form-control" id="namedocument" name="namedocument" placeholder="" value="" required/>
                                </div>
                              </div>
                              <div class="col-lg-2 col-md-2">
                                <div class="form-group" style="text-align: right;">
                                <button id="botonsubir" class="btn btn-sm btn-success ml-2">SUBIR ARCHIVO </button>
                                </div>
                              </div> 
                               <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                <label>DESCRIPCION DEL ARCHIVO</label>
                                <input autocomplete="off" type="text" class="form-control" id="descriptiondocument" name="descriptiondocument" placeholder="" value="" required/>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-md-12">
                                <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                      <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                      <p>SELECCIONE EL ARCHIVO A PREVISUALIZAR</p>
                                    </div>
                                    <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml" height="520" class="container-fluid hide">
                                      <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                                    </iframe>
                                  </div>
                                </label>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-6 text-center">
                    <button type="button" id="cancelButton" onclick="limpiariframe();" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button id="submitParamBens" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      GUARDAR
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
    <!-- End Modal Subida de Archivos-->
    <!-- Modal Aprobacion de Proceso de Compra-->
    <div class="modal fade main-font" id="AprobacionModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--Aprobacion Param starts-->
        <div id="AprobacionContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">SOLICITAR APROBACION</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        &iquest;ESTA SEGURO QUE DESEA ENVIAR A APROBACION?
                      </h5>
                      <p>UNA VEZ ENVIADO, YA NO SE PODRA MODIFICAR EL PROCESO DE COMPRA</p>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>CODIGO DE PROCESO</label>
                            <input
                              autocomplete="off"
                              type="text"
                              class="form-control"
                              id="processID"
                              name="procesID"
                              value=""
                              placeholder=""
                              required
                              readonly
                            />
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-4 text-center">
                    <button type="button" id="cancelButton" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitenviar" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-sm btn-success">
                      GUARDAR Y SEGUIR MODIFICANDO
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitaprobacion" value="" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-sm btn-success">
                      GUARDAR Y ENVIAR A APROBACION
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--Aprobacion Param ends-->
      </div>
    </div>
    <!-- End Modal Aprobacion Proceso de Compra-->
    <!-- Modal AprobacionCorreccion de Proceso de Compra-->
    <div class="modal fade main-font" id="AprobacionCorreccionModal" tabindex="-1" role="dialog" aria-hidden="true" data-backdrop="static" data-keyboard="false">
      <div class="modal-dialog modal-lg modal-dialog-centered" style="max-width: 100%;padding-left: 25%;padding-right: 25%;" role="document">
        <!--AprobacionCorreccion Param starts-->
        <div id="AprobacionCorreccionContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button type="button" class="closePersonalize" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">APROBACION DE PROCESO DE COMPRA</h1>
                <h4><br></br> </h4>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div class="card-body text-center" style="background: url(./assets/img/BAC.png) no-repeat center center;background-size: cover;">
                      <i id="infoIcon" class="avatar avatar-60 md-36 material-icons text-template-primary">check</i>
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        &iquest;ESTA SEGURO DE APROBAR EL PROCESO DE COMPRA?
                      </h5>
                      <p>UNA VEZ APROBADO, YA NO SE PODRA MODIFICAR EL PROCESO DE COMPRA</p>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>CODIGO DE PROCESO</label>
                            <input
                              autocomplete="off"
                              type="text"
                              class="form-control"
                              id="processID"
                              name="procesID"
                              value=""
                              placeholder=""
                              required
                              readonly
                            />
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <div class="form-group">
                            <label>OBSERVACIONES</label>
                            <textarea
                              autocomplete="off"
                              type="text"
                              class="form-control"
                              id="obsApert"
                              name="obsApert"
                              value=""
                              placeholder=""
                              style="min-height: 40px; height: 40px;"
                            ></textarea>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="modal-footer border-0 pt-0" style="background-color: #f1f1f1;">
              <!--Submit Buttons Section-->
              <div id="submitButtonsSection" class="container">
                <div class="row w-100 mx-0">
                  <div class="col-12 col-md-4 text-center">
                    <button type="button" id="cancelButton" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitaprobar" value="" onclick="actualizarestado('APROBADO');" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      APROBAR
                    </button>
                  </div>
                  <div class="col-12 col-md-4 text-center">
                    <button id="submitrechazar" value="" onclick="actualizarestado('CORREGIR')" data-dismiss="modal" aria-label="Close" class="mb-2 shadow-sm mr-2 btn btn-lg btn-success">
                      RECHAZAR
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </div>
        <!--AprobacionCorreccion Param ends-->
      </div>
    </div>
    <!-- End Modal AprobacionCorreccion Proceso de Compra-->
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
	  var archivos="";
      var contador=-1;
      $("#botonsubir").click(function () {
          contador++;
          var container = document.getElementById("digForm")
          var inputPT = document.createElement("input");
          inputPT.setAttribute("type", "file");
          inputPT.setAttribute("name", "oficioFiles_"+contador);
          inputPT.setAttribute("id", "oficioFiles_"+contador);
          inputPT.setAttribute("style","display:none");
          container.appendChild(inputPT);
          $("#oficioFiles_"+contador).trigger('click');
          $("#oficioFiles_"+contador).change(function(){
    		  if(!this.files.length == 0){
    			  $("#archivos").val("HAYARCHIVO");
    		  }
    		  else{
    			  $("#archivos").val("NOHAYARCHIVO");
    		  }
    		   
    	  });
      });
      
      function limpiariframe(){
          var iframe = document.getElementById("previewDocumentInput");
            var html = "";

            iframe.contentWindow.document.open();
            iframe.contentWindow.document.write(html);
            iframe.contentWindow.document.close();
      	    $("#archivos").val("");
      }

      function actualizarestado(newestado){
    	  var hoy=new Date();
    	  var fecha=hoy.getDate()+'-'+(hoy.getMonth()+1)+'-'+hoy.getFullYear();
    	  var hora=hoy.getHours()+':'+hoy.getMinutes()+':'+hoy.getSeconds();
    	  var fechaYHora=fecha+' '+hora;
    	  
          var container = document.getElementById("digForm");
          var inputES = document.createElement("input");
          inputES.setAttribute("type", "hidden");
          inputES.setAttribute("name","estado");
          inputES.setAttribute("value",newestado);
          container.appendChild(inputES);

          var observacion=$("#obsApert").val();
          var container = document.getElementById("digForm");
          var inputOB = document.createElement("input");
          inputOB.setAttribute("type", "hidden");
          inputOB.setAttribute("name","observaciones");
          inputOB.setAttribute("value",observacion);
          container.appendChild(inputOB);
		  
          var inputPC = document.createElement("input");
	      inputPC.setAttribute("type", "hidden");
	      inputPC.setAttribute("name","noProcCompra");
	      inputPC.setAttribute("value","");
	      container.appendChild(inputPC);
	      
	      var inputF = document.createElement("input");
	      inputF.setAttribute("type", "hidden");
	      inputF.setAttribute("name","fecha");
	      inputF.setAttribute("value",fechaYHora);
	      container.appendChild(inputF);
          
          document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
          document.getElementById("submit").click();

      }

      $(document).ready(function () {

      /* Preparativos iniciales*/

      var container = document.getElementById("digForm")

      var inputPT = document.createElement("input");
      inputPT.setAttribute("type", "hidden");
      inputPT.setAttribute("name", "projectPath");
      inputPT.setAttribute("value", getAbsolutePath());
      container.appendChild(inputPT);

      /*Tabla de Beneficiarios Finales del Documento*/
      var reqTable = $("#documentpurchaseprocess").DataTable({
        responsive: true,
        searching: true,
        bLengthChange: false,
        pageLength: 6,
        columnDefs: [
          {
            targets: 3,
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

      $("#submitParamBens").click(function(){
        debugger
        var nombrearchivo = document.getElementById("namedocument").value;
        var descripcionarchivo = document.getElementById("descriptiondocument").value;
        var arch = document.getElementById("archivos").value;
        if(nombrearchivo!="" && nombrearchivo!=null || descripcionarchivo!="" && descripcionarchivos!=null){
        	if(arch=="HAYARCHIVO"){
                var tbody = document.getElementById("documentpurchaseprocess").getElementsByTagName("TBODY")[0];
                var row = document.createElement("TR")
                var td1 = document.createElement("TD")
                td1.appendChild(document.createTextNode(contador))
                var td2 = document.createElement("TD")
                td2.appendChild (document.createTextNode(""))
                var td3 = document.createElement("TD")
                td3.appendChild(document.createTextNode(descripcionarchivo.toUpperCase()))
                var td4 = document.createElement("TD")
                td4.appendChild (document.createTextNode(nombrearchivo.toUpperCase()))
                var td5 = document.createElement("TD")
                td5.appendChild (document.createTextNode("NO DISPONIBLE"))
                row.appendChild(td1);
                row.appendChild(td2);
                row.appendChild(td3);
                row.appendChild(td4);
                row.appendChild(td5);
                reqTable.row.add(row).draw();
                $("#namedocument").val("");
                $("#descriptiondocument").val("");
                var iframe = document.getElementById("previewDocumentInput");
                var html = "";
                iframe.contentWindow.document.open();
                iframe.contentWindow.document.write(html);
                iframe.contentWindow.document.close();
        	}
        	else{
                alert("INGRESE EL ARCHIVO")
        	}
        }
        else{
          alert("INGRESE LOS DATOS SOLICITADOS")
        }
      }); 

      $('#submitenviar').click(function (){
    	debugger
      var container = document.getElementById("digForm");
      var table = document.getElementById('documentpurchaseprocess');
      //console.log(table.rows[2].cells[1].innerHTML);
        if(reqTable.data().any()){
          for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();

              var inputPT = document.createElement("input");
              inputPT.setAttribute("type", "hidden");
              inputPT.setAttribute("name", "nombresarchivos");
              inputPT.setAttribute("value", cell[3]);
              container.appendChild(inputPT);
              
              var inputBF = document.createElement("input");
              inputBF.setAttribute("type", "hidden");
              inputBF.setAttribute("name","descripcionesarchivos");
              inputBF.setAttribute("value",cell[2]);
              container.appendChild(inputBF);

              var inputBC = document.createElement("input");
              inputBC.setAttribute("type", "hidden");
              inputBC.setAttribute("name","iddocumentos");
              inputBC.setAttribute("value",cell[0]);
              container.appendChild(inputBC);

              
          }
        }
        var inputES = document.createElement("input");
        inputES.setAttribute("type", "hidden");
        inputES.setAttribute("name","estado");
        inputES.setAttribute("value","EN PROCESO");
        container.appendChild(inputES);
        document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
        document.getElementById("submit").click();
      });
	  
      $('#submitaprobacion').click(function (){
    	debugger
      var container = document.getElementById("digForm");
      var table = document.getElementById('documentpurchaseprocess');
      //console.log(table.rows[2].cells[1].innerHTML);
        if(reqTable.data().any()){
          for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();

              var inputPT = document.createElement("input");
              inputPT.setAttribute("type", "hidden");
              inputPT.setAttribute("name", "nombresarchivos");
              inputPT.setAttribute("value", cell[3]);
              container.appendChild(inputPT);
              
              var inputBF = document.createElement("input");
              inputBF.setAttribute("type", "hidden");
              inputBF.setAttribute("name","descripcionesarchivos");
              inputBF.setAttribute("value",cell[2]);
              container.appendChild(inputBF);

              var inputBC = document.createElement("input");
              inputBC.setAttribute("type", "hidden");
              inputBC.setAttribute("name","iddocumentos");
              inputBC.setAttribute("value",cell[0]);
              container.appendChild(inputBC);

             
          }
        }
        var inputES = document.createElement("input");
        inputES.setAttribute("type", "hidden");
        inputES.setAttribute("name","estado");
        inputES.setAttribute("value","EN REVISION");
        container.appendChild(inputES);
        
        document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
        document.getElementById("submit").click();
      });

      $("#benFinalTable tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        const rowSelected = $(this);
        $("#deletRegButton").on("click", function (event) {
          event.preventDefault();
          reqTable.row(rowSelected).remove().draw();
        });
      });


      $(document).on('change', 'input[type=file]', function(e) {
      if (e.target.files[0])
      {
        // Obtenemos la ruta temporal mediante el evento
        var TmpPath = URL.createObjectURL(e.target.files[0]);
        // Mostramos la ruta temporal en el Iframe dedicado
        $("#previewDocumentInput").prop("src",TmpPath);
        $("#previewDocumentInput").removeClass("hide");
      }
      else
      {
        $("#previewDocumentInput").prop("src","");
        $("#previewDocumentInput").addClass("hide");
      }
      });
      });

      $("button.previewButton").on('click', function(e) {
          const TmpPath = getAbsolutePath() + $(this).val();
          $("#previewDocumentInput1").prop("src",TmpPath);
          $("#previewDocumentInput1").removeClass("hide");
      });

      $(document).on('change', 'input[type=file]', function(e) {
        if (e.target.files[0])
        {
          // Obtenemos la ruta temporal mediante el evento
          var TmpPath = URL.createObjectURL(e.target.files[0]);
          // Mostramos la ruta temporal en el Iframe dedicado
          $("#previewDocumentInput").prop("src",TmpPath);
          $("#previewDocumentInput").removeClass("hide");
        }
        else
        {
          $("#previewDocumentInput").prop("src","");
          $("#previewDocumentInput").addClass("hide");
        }
    });
      
	  $('#submitExternalButton').click(function (){
		  var container = document.getElementById("digForm");
	      var inputES = document.createElement("input");
	      inputES.setAttribute("type", "hidden");
	      inputES.setAttribute("name","estado");
	      inputES.setAttribute("value","APROBADO");
	      container.appendChild(inputES);
	      
		  document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
	      document.getElementById("submit").click();
	  });
	      
    </script>
    <!-- Java Script section ends -->
  </body>
</html>
