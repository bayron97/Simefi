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
          <% 
            String tipo = (String)session.getAttribute("tipoAcceso");
            String servlet = (String)request.getAttribute("throughServlet");
            String acceso = "none"; 
            if((tipo != null && !tipo.isEmpty()) && (servlet != null && !servlet.isEmpty()))
            { 
              acceso = tipo;
            } 
            boolean auth = true;
            if (!acceso.contentEquals("administrar") && !acceso.contentEquals("digitar") && !acceso.contentEquals("consultar") && !acceso.contentEquals("verificar") ) {
				auth = false;								
			}
          %>
          <% if(!acceso.contentEquals("none")){ %>
          <!-- Submenu row starts -->
          <div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <nav class="navbar col-12 main-font">
                  <form method="post" action="ParametrizacionRouting">
                  
                    <input class="hide" type="submit" id="levelAttention" name="submit" value="nivelAtencion.jsp" />
                    <input class="hide" type="submit" id="presentationUnit" name="submit" value="up.jsp" />
                    <input class="hide" type="submit" id="categories" name="submit" value="categorias.jsp" />

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
                        <a class="dropdown-item active" href="#">VIA DE ADMINISTRACION</a>
                        <label class="dropdown-item" for="levelAttention">NIVEL DE ATENCION</label>
                        <label class="dropdown-item" for="presentationUnit">UNIDAD DE PRESENTACION (UP)</label>
                        <label class="dropdown-item" for="categories">CATEGORIAS</label>
                      </div>
                    </div>
                    <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                      <li class="nav-item">
                        <a class="nav-link active" href="#">VIA DE ADMINISTRACION</a>
                      </li>
                      <li class="nav-item">
                        <label class="nav-link" for="levelAttention">NIVEL DE ATENCION</label>
                      </li>
                      <li class="nav-item">
                        <label class="nav-link" for="presentationUnit">UNIDAD DE PRESENTACION (UP)</label>
                      </li>
                      <li class="nav-item">
                        <label class="nav-link" for="categories">CATEGORIAS</label>
                      </li>
                    </ul>
                  </form>
                </nav>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
          <!-- Submenu row ends -->
          <% } %>
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-12">
                    <h2 class="mb-4 large-title">
                      PARAMETRIZACION DE MEDICAMENTOS & OTROS INSUMOS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      VIA DE ADMINISTRACION
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
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
              <% if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) {%>
                    <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="newRegButton"
                  >
                    <i class="material-icons md-18">add_circle</i> NUEVO
                  </button>
                  <%}%>
                  <% if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) {%>
                  <button 
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="editRegButton"
                  >
                    <i class="material-icons md-18">create</i> MODIFICAR
                  </button>
                  	<%}%>
                  	<% if (acceso.contentEquals("administrar") || acceso.contentEquals("verificar")) {%>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="changeStateButton"
                  >
                    <i class="material-icons md-18">spellcheck</i>
                    ACTIVAR / INACTIVAR
                  </button>
                  <%}%>

                </div>
              </div>
            </div>
            <div class="card-body main-font">
              <% if(auth == true){ %>
              <!--Table Section starts-->
              <table
                id="datatable"
                class="table table-bordered w-100 mb-0 table-aditional-styles"
              >
                <thead>
                  <tr>
                  <th class="all">COD.</th>
                    <th hidden class="all">ID.</th>
                    <th class="min-tablet">NOMBRE</th>
                    <th class="min-tablet">ABREVIACION</th>
                    <th class="min-tablet">ESTADO</th>
                    <th class="none">OBSERVACIONES</th>
                  </tr>
                </thead>
                <tbody>
                	<%
						        try{
							        Connection con = null;
							        Statement state = null;
							        int i = 1;
							        ResultSet rs = null;
							        String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							        con = DriverManager.getConnection(url,"admin","system123");
							        state = con.createStatement();
							        String QueryString = "SELECT * from dbo.viaAdmin order by id ASC";
							        rs = state.executeQuery(QueryString);
						      %>
						      <% 	
						      int count = 0;
					  	        while(rs.next()){
					  	        	count ++;
							          String st = rs.getString(2);
							          if(rs.wasNull()){
								          st = " ";
							          }
							          String st2 = rs.getString(3);
							          if(rs.wasNull()){
								          st2 = " ";
							          }
							          String ob = rs.getString(4);
							          if(rs.wasNull()){
								          ob = " ";
							          }
						      %>
						          <tr>
						          <td><%=count%></td>
							          <td hidden><%=rs.getString(5)%></td>
							          <td><%=rs.getString(1).toUpperCase()%></td>
							          <td><%=st.toUpperCase()%></td>
                  <%    if(st2 == null || 
                          st2.isEmpty() || 
                          st2.toUpperCase().contentEquals("INACTIVO")){
                  %>
                          <td>
                            <div class="btn-secondary btn btn-sm">INACTIVO</div>
                          </td>
                  <%
							          }
							          else
                        {
							    %>
                          <td>
                            <div class="btn-success btn btn-sm">ACTIVO</div>
                          </td>
                  <%
                        }
                  %>
							          <td><%=ob.toUpperCase()%></td>
						        </tr>
						      <%i = i + 1;} 
						          rs.close();
						          state.close();
						          con.close();
						        }catch(Exception e){System.out.println(e);}
						      %>
                </tbody>
              </table>
              <!--Table Section ends-->
              <% } %>
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

    <!-- Forward Float Button -->
    <form method="post" action="ParametrizacionRouting">
    	<div class="wrap-fixed-float wrap-fixed-bottom-right">
      	<button 
          class="btn btn-primary btn-rounded-circle shadow" 
          type="submit" 
          name="submit" 
          value="nivelAtencion.jsp"
        >
       	 	<i class="material-icons vm">arrow_forward</i>
      	</button>
    	</div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--New Edit Reg Modal-->
    <div
      class="modal fade main-font"
      id="newEditReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form id="editRegForm" method="post" action="viaAdminServlet">
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
                  PARAMETRIZACION DE VIAS DE ADMINISTRACION
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  -ACCION DEL FORMULARIO-
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
                      <i
                        id="infoIcon"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >format_shapes</i
                      >
                      <h5 id="instructionSubtitle" class="mb-3 text-center">
                        INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):
                      </h5>
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection">
                                <input type="hidden" id="modifId" value="0" name="modifId">
                                 <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>NOMBRE*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayNombre"
                                        name="overlayNombre"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>ABREVIACION*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayAbrv"
                                        name="overlayAbrv"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>OBSERVACIONES</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayObs"
                                        name="overlayObs"
                                        placeholder=""
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--DATA Section ends-->

                              <!--STATE Section-->
                              <div
                                id="stateSection"
                                class="state-section-aditional-styles"
                              >
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <h5
                                      class="mb-3 text-center"
                                      style="font-weight: bold;"
                                    >
                                      ESTADO
                                    </h5>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input type="checkbox" id="checkActivo" name="activ2" />
                                      <label for="checkActivo">ACTIVO</label>
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="checkInactivo"
                                        name="in2"
                                      />
                                      <label for="checkInactivo"
                                        >INACTIVO</label
                                      >
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--STATE Section ends-->

                              <!--ERROR Section-->
                              <div id="errorSection" class="hide">
                                <div class="row">
                                  <div class="col-lg-12 col-md-12 text-center">
                                    <h1>ERROR</h1>
                                    <p class="text-mute">
                                      CIERRE LA MODAL Y SELECCIONE EL REGISTRO A
                                      MODIFICAR EN LA TABLA
                                    </p>
                                  </div>
                                </div>
                              </div>
                              <!--ERROR Section ends-->
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
                      id="ButtonModal"
                      type="button"                                                                  
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      GUARDAR
                    </button>
                    <input class="hide" type="submit" id="submitButton" name="submit" value="null" />
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </form>
        <!--Form Edit Reg ends-->
      </div>
    </div>
    <!--Custom New Modal-->

    <!-- Modal Section ends-->


<!-- Confirmation Modal -->
    <div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-5">
                <img src="./bancoccicon.png" alt="">
              </figure>
              <div class="modal-body main-font mt-2" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>
              <div>
                <button 
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                ACEPTAR <i class="material-icons md-18">done</i></button>
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
      $(document).ready(function () {
    	  if (window.history.replaceState) {  		
      	    window.history.replaceState(null, null, window.location.href);
      	}
        
    	  <% 
    	  String mode = (String)request.getAttribute("openMode"); 
    	  System.out.println(mode + " mode" );
    	  if (mode != null && !mode.isEmpty()){  			
        	  %>        	
        	  $("#submitButton").prop("value", <%=mode%>);      	  
        	  <%          	  
            }
    		%>
    	  
        /* data Table */
        $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 5,
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
      });

      $("#datatable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(1)").text();
        $("#modifId").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#overlayNombre").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#overlayAbrv").prop("value", value);
         value = $(this).find("td:eq(5)").text();
        $("#overlayObs").prop("value", value);

        value = $(this).find("td:eq(4) div").text();
        if (value === "activo" || value === "Activo" || value === "ACTIVO") {
          $("#checkActivo").prop("checked", true);
          $("#checkInactivo").prop("checked", false);
        } else if (
          value === "inactivo" ||
          value === "Inactivo" ||
          value === "INACTIVO"
        ) {
          $("#checkActivo").prop("checked", false);
          $("#checkInactivo").prop("checked", true);
        } else {
          $("#checkActivo").prop("checked", false);
          $("#checkInactivo").prop("checked", false);
        }
      });

      $("#newRegButton").on("click", function () {
        $("#subtitleChange").text("NUEVO REGISTRO");
        $("#infoIcon").text("format_shapes");
        $("#instructionSubtitle").removeClass("hide");
        $("#editRegForm #dataSection div div div input").prop(
          "readonly",
          false
        );
        $("#editRegForm #stateSection div div div input").prop(
          "disabled",
          true
        );
        $("#editRegForm")[0].reset();
        $("#editRegForm #dataSection").removeClass("hide");
        $("#editRegForm #stateSection").addClass("hide");
        $("#editRegForm #errorSection").addClass("hide");
        $("#editRegForm #submitButtonsSection").removeClass("hide");

        $("#submitButton").prop("value", "guardar");
      });

      $("#editRegButton").on("click", function () {
        var value = $("#overlayNombre").val();
        if (value === "") {
          $("#subtitleChange").text("EDITAR REGISTRO");
          $("#infoIcon").text("error");
          $("#editRegForm #errorSection").removeClass("hide");
          $("#instructionSubtitle").addClass("hide");
          $("#editRegForm #dataSection").addClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        } else {
          $("#subtitleChange").text("EDITAR REGISTRO");
          $("#infoIcon").text("format_shapes");
          $("#instructionSubtitle").text(
            "INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):"
          );
          $("#instructionSubtitle").removeClass("hide");
          $("#editRegForm #dataSection div div div input").prop(
            "readonly",
            false
          );
          $("#editRegForm #stateSection div div div input").prop(
            "disabled",
            true
          );
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #errorSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").removeClass("hide");

          $("#submitButton").prop("value", "modif");
        }
      });

      $("#changeStateButton").on("click", function () {
        var value = $("#overlayNombre").val();
        if (value === "") {
          $("#subtitleChange").text("CAMBIAR ESTADO");
          $("#infoIcon").text("error");
          $("#editRegForm #errorSection").removeClass("hide");
          $("#instructionSubtitle").addClass("hide");
          $("#editRegForm #dataSection").addClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        } else {
          $("#subtitleChange").text("CAMBIAR ESTADO");
          $("#infoIcon").text("format_shapes");
          $("#editRegForm #errorSection").addClass("hide");
          $("#instructionSubtitle").removeClass("hide");
          $("#editRegForm #dataSection div div div input").prop(
            "readonly",
            true
          );
          $("#editRegForm #stateSection div div div input").prop(
            "disabled",
            false
          );
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").removeClass("hide");
          $("#editRegForm #submitButtonsSection").removeClass("hide");

          $("#submitButton").prop("value", "rev");
        }
      });

      $("#checkActivo").on("change", function () {
        $("#checkInactivo").prop("checked", false);
      });

      $("#checkInactivo").on("change", function () {
        $("#checkActivo").prop("checked", false);
      });
      
      function getAbsolutePath() {
		  var loc = window.location;
		  var pathName = loc.pathname.substring(0, loc.pathname.lastIndexOf("/") + 1);
		  return loc.href.substring(0,loc.href.length - ((loc.pathname + loc.search + loc.hash).length - pathName.length));
	  }
      
       $("#ButtonModal").on("click", function (event) {    	
         event.preventDefault();
          var url = getAbsolutePath() + "ValidarParamViaAdmistracionAPI";	
          var overlayNombre = document.getElementById("overlayNombre").value;
          var overlayAbrv = document.getElementById("overlayAbrv").value;
          var modifId = document.getElementById("modifId").value;
          $.ajax({
      	    url:url,
      	    type:"POST",
      	    dataType:'json',
      	    data: {overlayNombre:overlayNombre, overlayAbrv:overlayAbrv, modifId:modifId},
      	    success:function(data){  
      	    	
      	      if(parseInt(data) == 0){     
      	    	  $("#submitButton").trigger("click");
      	    	return true;
      	      }else{
      	    	$("#confirMessage").text("ALERTA! NOMBRE DE VIA DE ADMINISTRACION Y ABREVIATURA YA ESTAN REGISTRADAS INGRESE UNA NUEVA");
      	        $("#confirmationModalCenter").modal('show');
      	        return false;
      	      } 	     	 
          
      	    },
      	}); 
    }); 
       
       $("#cancelButton").on("click", function (event) {  
     	  $('#datatable  tr ').removeClass('selected');
     	  $("#overlayNombre").val("");
       });
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
