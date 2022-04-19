<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

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

    <!-- JS tree CSS -->
    <link rel="stylesheet" href="./assets/vendor/Jstree/themes/default/style.min.css" />

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
                      ACCESO / MODULOS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      ACCESOS / MODULOS / PERMISOS
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <h4>PERMISOS</h4>
                </div>
                <div class="col-auto align-self-center main-font">
                  <p class="fs15"></p>
                </div>
              </div>
            </div>
            <!-- Permissions Form starts-->
            <div class="card-body main-font">
              <form action="accesoM" method="post">
                <div class="card-body">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <div class="form-group">
                        <label>USUARIO:</label>
                        <input
                          autocomplete="off"
                          type="text"
                          class="form-control"
                          id="usuario"
                          name="usuario"
                          value="${usuario}"
                          readOnly
                          required
                        />
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <div class="card-body normal-border">
                        <input autocomplete="off" type="hidden" id="disabledJstree" value="<%=request.getAttribute("disableJstree")%>" />
                        <input autocomplete="off" type="hidden" id="crearUsuario" name="crearUsuario" value="${cA}" />
                        <input autocomplete="off" type="hidden" id="reseteoPass" name="reseteoPass" value="${reseteoPass}" />
                        <input autocomplete="off" type="hidden" id="accMod" name="accMod" value="${accMod}" />
                        <input autocomplete="off" type="hidden" id="reportH" name="reportH" value="${reportH}" />
                        <input autocomplete="off" type="hidden" id="distFab" name="distFab" value="${distFab}" />
                        <input autocomplete="off" type="hidden" id="benef" name="benef" value="${benef}" />
                        <input autocomplete="off" type="hidden" id="med" name="med" value="${med}" />
                        <input autocomplete="off" type="hidden" id="otros" name="otros" value="${otros}" />
                        <input autocomplete="off" type="hidden" id="param" name="param" value="${parame}" />
                        <input autocomplete="off" type="hidden" id="cpcparam" name="cpcparam" value="${cpcparam}" />
                        <input autocomplete="off" type="hidden" id="criteva" name="criteva" value="${criteva}" />
                        <input autocomplete="off" type="hidden" id="corrcomp" name="corrcomp" value="${corrcomp}" />
                        <input autocomplete="off" type="hidden" id="aperturaProcesoG" name="aperturaProcesoG" value="${aperturaProcesoG}" />
                        <input autocomplete="off" type="hidden" id="aclaEnmiendasG" name="aclaEnmiendasG" value="${aclaEnmiendasG}" />
                        <input autocomplete="off" type="hidden" id="vaciadoOfertaG" name="vaciadoOfertaG" value="${vaciadoOfertaG}" />
                        <input autocomplete="off" type="hidden" id="recomendacionesG" name="recomendacionesG" value="${recomendacionesG}" />
                        <input autocomplete="off" type="hidden" id="ratificacionesG" name="ratificacionesG" value="${ratificacionesG}" />
                        <input autocomplete="off" type="hidden" id="aperturaProcesoALP" name="aperturaProcesoALP" value="${aperturaProcesoALP}" />
                        <input autocomplete="off" type="hidden" id="aclaEnmiendasAlp" name="aclaEnmiendasAlp" value="${aclaEnmiendasAlp}" />
                        <input autocomplete="off" type="hidden" id="vaciadoOfertAlp" name="vaciadoOfertAlp" value="${vaciadoOfertAlp}" />
                        <input autocomplete="off" type="hidden" id="recomendacionesALP" name="recomendacionesALP" value="${recomendacionesALP}" />
                        <input autocomplete="off" type="hidden" id="solicitudCompraALP" name="solicitudCompraALP" value="${solicitudCompraALP}" />
                        <input autocomplete="off" type="hidden" id="recomendacionCompraALP" name="recomendacionCompraALP" value="${recomendacionCompraALP}" />
                        <input autocomplete="off" type="hidden" id="ratificacionCtfALP" name="ratificacionCtfALP" value="${ratificacionCtfALP}" />
                        <input autocomplete="off" type="hidden" id="contratacionesALP" name="contratacionesALP" value="${contratacionesALP}" />
                        <input autocomplete="off" type="hidden" id="contratosSuministrosALP" name="contratosSuministrosALP" value="${contratosSuministrosALP}" />
                        <input autocomplete="off" type="hidden" id="controlGarantiasALP" name="controlGarantiasALP" value="${controlGarantiasALP}" />
                        <input autocomplete="off" type="hidden" id="controlPagosALP" name="controlPagosALP" value="${controlPagosALP}" />
                        <input autocomplete="off" type="hidden" id="recepcionProduALP" name="recepcionProduALP" value="${recepcionProduALP}" />
                        
                        <!--JSTREE Section starts-->
                        <div id="jstree_div"></div>
                        <!--JSTREE Section ends-->
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-12 col-md">
                      <p class="fs15">&nbsp;</p>
                    </div>
                  </div>
                  <!--STATE Section starts-->
                  <%
                    String funcion = (String)request.getAttribute("funcion"); 
                    String est1 = (String)request.getAttribute("estado1");
                    String est2 = (String)request.getAttribute("estado2");
                    String motivo1 = (String)request.getAttribute("motivo1");
                    String motivo2 = (String)request.getAttribute("motivo2");
                    String mot1 = "";
                    String mot2 = "";
                    if(motivo1 != null && !motivo1.isEmpty()){
                    	mot1 = motivo1;
                    }
                    if(motivo2 != null && !motivo2.isEmpty()){
                    	mot2 = motivo2;
                    }
                    if(funcion != null && funcion.contentEquals("revisar")){
                  %>
                  <div
                    id="stateSection"
                    class="state-section-aditional-styles"
                  >
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                        <div class="row">
                          <div class="col-lg-10 col-md-10">
                            <h5
                              class="mb-3 text-center"
                              style="font-weight: bold;"
                            >
                              ESTADO 1
                            </h5>
                          </div>
                        </div>
                        <% if(est1 != null && est1.contentEquals("APROBADO")){ %>
                        <div class="row">
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="ap1"
                                name="ap1"
                                checked
                              />
                              <label for="ap1">APROBADO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
						<div class="form-group">
						<input type="checkbox" id="pendie1"
						name="pendie1"  /> 
						<label for="pendie1">PENDIENTE DE APROBADO</label>
						</div>
						</div>
                          
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re1"
                                name="re1"
                              />
                              <label for="re1">RECHAZADO</label>
                            </div>
                          </div>
                        </div>
                        <%
						} if (est1 != null && est1.contentEquals("NO APROBADO")) {
						%>
                        <div class="row">
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="ap1"
                                name="ap1"
                                
                              />
                              <label for="ap1">APROBADO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
						<div class="form-group">
						<input type="checkbox" id="pendie1"
						name="pendie1"  /> 
						<label for="pendie1">PENDIENTE DE APROBADO</label>
					</div>
				</div>
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
							<input type="checkbox" id="re1" name="re1" checked />
							<label for="re1">RECHAZADO</label>
                            </div>
                          </div>
                        </div>
                        <%
						} if (est1 != null && est1.contentEquals("PENDIENTE APROBAR")) {
						%>
                        <div class="row">
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="ap1"
                                name="ap1"
                              />
                              <label for="ap1">APROBADO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
						<div class="form-group">
						<input type="checkbox"
						 id="pendie1"
						 name="pendie1"
						 checked
						  /> 
						<label for="pendie1">PENDIENTE DE APROBADO</label>
					</div>
				</div>
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re1"
                                name="re1"
                                
                              />
                              <label for="re1">RECHAZADO</label>
                            </div>
                          </div>
                        </div>
                        <%
                        }
                        %>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                              <label>MOTIVO 1</label>
                              <input
                                autocomplete="off"
                                type="text"
                                class="form-control"
                                id="motiv1"
                                name="motiv1"
                                value="<%=mot1%>"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="row">
                          <div class="col-lg-10 col-md-10">
                            <h5
                              class="mb-3 text-center"
                              style="font-weight: bold;"
                            >
                              ESTADO 2
                            </h5>
                          </div>
                        </div>
                        <% if(est2 != null && est2.contentEquals("ACTIVO")){ %>
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                              type="checkbox"
                              id="ap2"
                              name="ap2"
                              checked
                              />
                              <label for="ap2">ACTIVO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re2"
                                name="re2"
                              />
                              <label for="re2">INACTIVO</label>
                            </div>
                          </div>
                        </div>
                        <% } 
                        else{
                        %>
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                              type="checkbox"
                              id="ap2"
                              name="ap2"
                              />
                              <label for="ap2">ACTIVO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re2"
                                name="re2"
                                checked
                              />
                              <label for="re2">INACTIVO</label>
                            </div>
                          </div>
                        </div>
                        <% 
                        } 
                        %>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                              <label>MOTIVO 2</label>
                              <input
                                autocomplete="off"
                                type="text"
                                class="form-control"
                                id="motiv2"
                                name="motiv2"
                                value="<%=mot2%>"
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <% }
                    else{
                  %>
                  <div
                    id="stateSection"
                    class="state-section-aditional-styles"
                  >
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                        <div class="row">
                          <div class="col-lg-10 col-md-10">
                            <h5
                              class="mb-3 text-center"
                              style="font-weight: bold;"
                            >
                              ESTADO 1
                            </h5>
                          </div>
                        </div>
                         <% if(est1 != null && est1.contentEquals("APROBADO") || est1.contentEquals("NO APROBADO") || est1.contentEquals("PENDIENTE APROBAR")){ %>
                        <div class="row">
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="ap1"
                                name="ap1"
                                disabled
                              />
                              <label for="ap1">APROBADO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
						<div class="form-group">
						<input type="checkbox" id="pendie1" disabled checked
						name="pendie1"  /> 
						<label for="pendie1">PENDIENTE DE APROBADO</label>
					</div>
				</div>
                          
                          <div class="col-lg-3 col-md-3">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re1"
                                name="re1"
                                
                                disabled
                              />
                              <label for="re1">RECHAZADO</label>
                            </div>
                          </div>
                        </div>
                        <%
						} 
						%>
                        
                        
               
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                              <label>MOTIVO 1</label>
                              <input
                                autocomplete="off"
                                type="text"
                                class="form-control"
                                id="motiv1"
                                name="motiv1"
                                value="<%=mot1%>"
                                readOnly
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-6 col-md-6">
                        <div class="row">
                          <div class="col-lg-10 col-md-10">
                            <h5
                              class="mb-3 text-center"
                              style="font-weight: bold;"
                            >
                              ESTADO 2
                            </h5>
                          </div>
                        </div>
                        <% if(est2 != null && est2.contentEquals("ACTIVO") || est2.contentEquals("INACTIVO")){ %>
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                              type="checkbox"
                              id="ap2"
                              name="ap2"
                              disabled
                              
                              />
                              <label for="ap2">ACTIVO</label>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <input
                                type="checkbox"
                                id="re2"
                                name="re2"
                                checked
                                disabled
                              />
                              <label for="re2">INACTIVO</label>
                            </div>
                          </div>
                        </div>
                        <% } 
                        
                        %>
                        
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group">
                              <label>MOTIVO 2</label>
                              <input
                                autocomplete="off"
                                type="text"
                                class="form-control"
                                id="motiv2"
                                name="motiv2"
                                value="<%=mot2%>"
                                readOnly
                              />
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <% } %>
                  <!--STATE Section ends-->

                  
                  <% if(funcion != null && !funcion.contentEquals("consultar")){ %>
                  <!--Submit Buttons Section-->
                  <div id="submitButtonsSection">
                    <% if(funcion.contentEquals("revisar")){ %>
                      <div class="wrap-fixed-float wrap-fixed-bottom-right">
      		              <button class="btn btn-primary btn-rounded shadow" value="revAprov" name="submit">
                          <i class="material-icons vm">save</i> GUARDAR
                        </button>
    	                </div>
                    <% }
                    else{
                    %>
                      <div class="wrap-fixed-float wrap-fixed-bottom-right">
      		              <button class="btn btn-primary btn-rounded shadow" value="editar" name="submit">
                          <i class="material-icons vm">save</i> GUARDAR
                        </button>
    	                </div>
                    <% } %>
                  </div>
                  <!--Submit Buttons Section ends-->
                  <%
                  }
                  %>
                </div>
              </form>
            </div>
            <!-- Permissions Form ends-->
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

    <!-- Back Float Button -->
    <form method="post" action="backAccesos">
    	<div class="wrap-fixed-float wrap-fixed-bottom-left">
      		<button class="btn btn-primary btn-rounded shadow main-font" name="submit" value="accesos">
        		<i class="material-icons vm">arrow_back</i> REGRESAR
      		</button>
    	</div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--**********No MODALS in this page**********-->

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

    <!-- JS tree -->
    <script src="./assets/vendor/Jstree/jstree.min.js"></script>

    <!-- Customized page level js -->

    <script src="./assets/js/jstree-permissions.js"></script>

    <script>
      "use strict";

      $("#ap1").on("change", function () {
        $("#re1").prop("checked", false);
        $("#pendie1").prop("checked", false);
      });
      
      $("#pendie1").on("change", function () {
          $("#ap1").prop("checked", false);
          $("#re1").prop("checked", false);
        });

      $("#re1").on("change", function () {
        $("#ap1").prop("checked", false);
        $("#pendie1").prop("checked", false);
      });

      $("#ap2").on("change", function () {
        $("#re2").prop("checked", false);
      });

      $("#re2").on("change", function () {
        $("#ap2").prop("checked", false);
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
