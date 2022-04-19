<%@ page language="java" contentType="text/html"%> <%@ page
import="java.sql.*"%> <%@ page import="java.io.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  String temp = "";
  temp = (String)request.getAttribute("openMode");
  String openMode = "";
	if(temp != null && !temp.isEmpty()){
		openMode = temp;
	}
  String temp2 = (String)request.getAttribute("mProductosChecked");
  boolean isMProductos = false;
  if(temp2 != null && !temp2.isEmpty()){
		isMProductos = Boolean.valueOf(temp2);
	}
  String disableMProductos = "";
  if (isMProductos)
  {
    disableMProductos = "Disabled";
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
                <% if (!openMode.equalsIgnoreCase("disabled")) { %>
                <form method="post" action="amendmentsBarALPRouting">
                <nav class="navbar col-12 main-font">
                  <div class="dropdown mr-auto d-flex d-sm-none">
                  <input type="hidden" name="id" id="id" value="${cod}"/>
                  <input class="hide" type="text" name="noProcesoCompraNavBar" id="noProcesoCompraNavBar" value="${noProcesoCompra}" required/>
                  <input class="hide" type="submit" name="submit" id="listaest" value="listaest"/>
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
                        >DATOS DE ENMIENDA</a
                      >
                      <% if (isMProductos) { %>
                        <label class="dropdown-item" for="listaest" id="listEstItemNav1">
                          LISTA DE ESTIMACIONES DE COMPRA
                        </label>
                      <% } else { %>
                        <label class="dropdown-item hide" for="listaest" id="listEstItemNav1">
                          LISTA DE ESTIMACIONES DE COMPRA
                        </label>
                      <% } %>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">DATOS DE ENMIENDA</a>
                    </li>
                    <% if (isMProductos) { %>
                    <li class="nav-item" id="listEstItemNav2">
                      <label class="nav-link" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                    </li>
                    <% } else { %>
                    <li class="nav-item hide" id="listEstItemNav2">
                      <label class="nav-link" for="listaest">LISTA DE ESTIMACIONES DE COMPRA</label>
                    </li>
                    <% } %>
                  </ul>
                </nav>
                </form>
                <% } else { %>
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
                        >DATOS DE ENMIENDA</a
                      >
                      <% if (isMProductos) { %>
                        <a class="dropdown-item" id="listEstItemNav1" href="#">
                          LISTA DE ESTIMACIONES DE COMPRA
                        </a>
                      <% } else { %>
                        <a class="dropdown-item hide" id="listEstItemNav1" href="#">
                          LISTA DE ESTIMACIONES DE COMPRA
                        </a>
                      <% } %>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link active" href="#">DATOS DE ENMIENDA</a>
                    </li>
                    <% if (isMProductos) { %>
                    <li class="nav-item" id="listEstItemNav2">
                      <a class="nav-link" href="#">LISTA DE ESTIMACIONES DE COMPRA</a>
                    </li>
                    <% } else { %>
                    <li class="nav-item hide" id="listEstItemNav2">
                      <a class="nav-link" href="#">LISTA DE ESTIMACIONES DE COMPRA</a>
                    </li>
                    <% } %>
                  </ul>
                </nav>
                <% } %>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="row">
            <div class="col-12 col-xs-12 col-md-12">
              <h2 class="mb-4 large-title">
                NUEVA ACLARACION Y ENMIENDA
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                COMPRAS A LARGO PLAZO(ALP)
              </h5>
            </div>
          </div>
          <!--Content starts-->
          <div class="main-content-div main-font">
            <form id="newEditRegForm" action="aclaracionesEnmiendasALPServlet" enctype="multipart/form-data" method="post">
              <input type="hidden" name="id" value="${cod}">
              <div class="row">
                <div class="col-lg-7 col-md-7">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h6
                        id="instructionSubtitle"
                        class="mb-3 text-center float-left"
                        style="font-weight:bold;"
                      >
                        I) REGISTRO DE ACLARACIONES Y ENMIENDAS
                      </h6>
                    </div>
                  </div>
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>1) NO. DE PROCESO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id ="processNum"
                        name="processNum"
                        value="${noProcesoCompra}"
                        readonly
                      />
                    </div>
                  </div>
                  <% } else { %>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>1) NO. DE PROCESO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id ="processNum"
                        name="processNum"
                        value="${noProcesoCompra}"
                        required
                        readonly
                      />
                    </div>
                    <div class="col-lg-2 col-md-2">
                      <div class="form-group">
                        <button
                          class="btn btn-sm btn-success"
                          style="height: 40px;margin-top:0px !important;"
                          data-target="#processNumberModal"
                          data-toggle="modal"
                          id="processNumbersButton"
                        >
                          <i class="material-icons md-18">add_box</i>
                        </button>
                      </div>
                    </div>
                  </div>
                  <% } %>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>2) FECHA* </label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="date"
                        class="form-control"
                        id ="amendmentDate"
                        name="amendmentDate"
                        value="${fecha}"
                        required
                        <%=openMode%>
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>3) TIPO & CORRELATIVO* </label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <select
                        autocomplete="off"
                        class="form-control"
                        id ="amendmentType"
                        name="amendmentType"
                        value=""
                        <%=openMode%>
                        <%=disableMProductos%>
                      >
                        <option value="ENMIENDA" selected>ENMIENDA</option>
                        <option value="ACLARACION">ACLARACION</option>
                      <select>
                    </div>
                    <div class="col-lg-2 col-md-2">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id ="cDocumentNumber"
                        name="cDocumentNumber"
                        value="${correlativoDocumento}"
                        required
                        readonly
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      <input
                        autocomplete="off"
                        type="checkbox"
                        class="form-control"
                        id ="amendment1Check"
                        name="amendment1Check"
                        <%=openMode%>
                      />
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <label>3.1 FECHA LIMITE. LA OFERTA PUEDE SER PRESENTADA HASTA LAS</label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-4 col-md-4">
                          <input
                            autocomplete="off"
                            type="time"
                            class="form-control"
                            id ="deadlineHour"
                            name="deadlineHour"
                            value="${horaLimite}"
                            required
                            <%=openMode%>
                          />
                        </div>
                        <div class="col-lg-2 col-md-2">
                          <label> DEL DIA </label>
                        </div>
                        <div class="col-lg-6 col-md-6">
                          <input
                            autocomplete="off"
                            type="date"
                            class="form-control"
                            id ="deadlineDate"
                            name="deadlineDate"
                            value="${diaLimite}"
                            required
                            <%=openMode%>
                          />
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col-lg-12 col-md-12">
                          <label>TODA OFERTA, FUERA DE ESTE PLAZO NO SERA ACEPTADA.</label>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      <input
                        autocomplete="off"
                        type="checkbox"
                        class="form-control"
                        id ="amendment2Check"
                        name="amendment2Check"
                        <%=openMode%>
                      />
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <div class="row">
                        <div class="col-lg-12 col-md-12">
                          <label>3.2 APERTURA DE OFERTA. LA FECHA DE APERTURA ES: </label>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col-lg-6 col-md-6">
                          <input
                            autocomplete="off"
                            type="date"
                            class="form-control"
                            id ="apertDate"
                            name="apertDate"
                            value="${diaApertura}"
                            required
                            <%=openMode%>
                          />
                        </div>
                        <div class="col-lg-2 col-md-2">
                          <label> A LAS </label>
                        </div>
                        <div class="col-lg-4 col-md-4">
                          <input
                            autocomplete="off"
                            type="time"
                            class="form-control"
                            id ="apertHour"
                            name="apertHour"
                            value="${horaApertura}"
                            required
                            <%=openMode%>
                          />
                        </div>
                      </div>
                      <div class="row mt-3">
                        <div class="col-lg-2 col-md-2">
                          <label>LUGAR:</label>
                        </div>
                        <div class="col-lg-10 col-md-10">
                          <select
                            autocomplete="off"
                            class="form-control"
                            id ="apertLocation"
                            name="apertLocation"
                            value=""
                            <%=openMode%>
                          >
                            <% try{ 
                                Connection con = null;
                                Statement state = null; 
                                ResultSet rs = null; 
                                String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                con = DriverManager.getConnection(url,"admin","system123");
                                state = con.createStatement(); 
                                String QueryString = "SELECT * from dbo.lugarApertura where estado = 'ACTIVO'"; 
                                rs = state.executeQuery(QueryString);
                                while(rs.next()){ %>
                                  <option value="<%=rs.getString(2)%>"><%=rs.getString(2).toUpperCase()%></option>
                              <%} rs.close(); 
                                  state.close();
                                  con.close(); }catch(Exception e){System.out.println(e); }
                              %>
                          <select>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-1 col-md-1">
                      
                      
                      <input
                        autocomplete="off"
                        type="checkbox"
                        class="form-control"
                        id ="amendmentProductCheck"
                        name="amendmentProductCheck"
                        <% String check = (String)request.getAttribute("mProductosChecked");
                        System.out.println(check + "check");
                        if(check.contentEquals("true")){
                    	%>
                    	checked
                    	<%
                      	}                      
                      	%>                        
                        <%=openMode%>
                        <%=disableMProductos%>
                      />
                      
                      
                      
                    </div>
                    <div class="col-lg-11 col-md-11">
                      <label>3.3 AGREGAR, MODIFICAR Y ANULAR UN PRODUCTO</label>
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-4 col-md-4">
                      <label>4) OBSERVACIONES</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <textarea
                        autocomplete="off"
                        class="form-control"
                        id ="amendmentObs"
                        name="amendmentObs"
                        style="min-height:80px;"
                        <%=openMode%>
                      >${observaciones}</textarea>
                    </div>
                  </div>
                </div>
                <div class="col-lg-5 col-md-5">
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row">
                    <div class="col-lg-12 col-md-12">
                      <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                        <h3 class="mt-1"><i class="material-icons">cloud_download</i></h3>
                        <p>
                          ARCHIVO CARGADO
                        </p>
                      </div>
                      <iframe title="previewDocument" src="" id="previewDocumentInput" name="SubHtml"
                        height="500" class="container-fluid hide">
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                      </iframe>
                    </div>
                  </label>
                  <% } else { %>
                  <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="documentFile" id="myDropzone">
                    <div class="col-lg-12 col-md-12">
                      <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                        <h3 class="mt-1"><i class="material-icons">cloud_download</i></h3>
                        <p>
                          DEJA TU ARCHIVO AQUI PARA SUBIR
                        </p>
                      </div>
                      <iframe title="previewDocument" src="" id="previewDocumentInput" name="SubHtml"
                        height="500" class="container-fluid hide">
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                      </iframe>
                      <div class="form-group mt-3">
                        <input type="file" id="documentFile" name="documentFile" accept="application/pdf" required>
                      </div>
                    </div>
                  </label>
                  <% } %>
                </div>
              </div>
              <!--Submit section starts-->
              <div class="wrap-fixed-float wrap-fixed-bottom-right">
               <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
                <% if (isMProductos) { %>
                
                <button
                  id="submitButton"
                  class="btn btn-primary btn-rounded shadow main-font"
                  type="button"
                  value="continuar"
                >
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <span id="submitButtonText">CONTINUAR </span>
                  <% } else { %>
                  <span id="submitButtonText">GUARDAR Y CONTINUAR </span>
                  <% } %>
                  <i class="material-icons vm">done</i>
                </button>

                <% } else { %>

                <button
                  id="submitButton"
                  class="btn btn-primary btn-rounded shadow main-font"
                  type="button"
                  value="guardar"
                >
                  <% if (openMode.equalsIgnoreCase("disabled")) { %>
                  <span id="submitButtonText">FINALIZAR </span>
                  <% } else { %>
                  <span id="submitButtonText">GUARDAR Y FINALIZAR </span>
                  <% } %>
                  <i class="material-icons vm">done</i>
                </button>

                <% } %>
              </div>
              <!--Submit section ends-->
            </form>
          </div>
          <!--Content ends-->
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

    <!-- Cancel Float Button -->
    <form method="post" action="amendmentsALPRoutingServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="cancelar"
        >
          <i class="material-icons vm">close</i>CANCELAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
    <% if (!openMode.equalsIgnoreCase("disabled")) { %>
    <!--PROCESS NUMBER Modal-->
    <div
      class="modal fade main-font"
      id="processNumberModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--PROCESS NUMBER starts-->
        <div id="processNumberContent">
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
              <div class="text-center pb-5" style="z-index:0;">
                <h1 class="mb-0 text-white">
                  REGISTRO DE PROCESOS DE COMPRA ABIERTOS
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  UTILIZAR PROCESO
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
                        background-size: cover;
                      "
                    >
                      <div class="row">
                        <div class="card-body">
                          <div class="row">
                            <div class="col-lg-8 col-md-8">
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group" style="text-align: left">
                                    <label hidden>TIPO COMPRA</label>
                                    <select
                                      autocomplete="off"
                                      class="form-control"
                                      id="purchaseType"
                                      hidden
                                      name="purchaseType"
                                      required="required"
                                    >
                                      
                                      <% try{ 
                                          Connection con = null;
                                          Statement state = null; 
                                          ResultSet rs = null; 
                                          String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                          con = DriverManager.getConnection(url,"admin","system123");
                                          state = con.createStatement();
                                          String QueryString = "select abreviatura from tipoCompra WHERE abreviatura='alp'";
                                          rs = state.executeQuery(QueryString);
                                          while(rs.next()){%>
                                            <option value="<%=rs.getString(1)%>">
                                              <%=rs.getString(1).toUpperCase()%>
                                            </option>
                                        <%} } catch(Exception e){ System.out.println(e); }
                                      %>
                                    </select>
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <input
                                      autocomplete="off"
                                      type="text"
                                      class="form-control"
                                      id="processNumbersSearchInput"
                                      placeholder="INGRESE UNA BUSQUEDA..."
                                      value=""
                                      style="z-index:100;"
                                    />
                                  </div>
                                </div>
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="row mt-4">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                   <button
                                     class="btn btn-sm btn-success"
                                     id="processNumbersInModalButton"
                                     type="button"
                                    >
                                    <i class="material-icons md-18">list</i>
                                     MOSTRAR TODOS
                                   </button>
                                  </div>
                                </div>
                              </div>
                              <div class="row mt-1">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    <button
                                     class="btn btn-sm btn-success"
                                     id="processNumbersSearchButton"
                                     type="button"
                                    >
                                    <i class="material-icons md-18">search</i>
                                     BUSCAR REGISTRO
                                   </button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <!--PROCESS NUMBERS Table Section starts-->
                              <table
                                id="processNumbersTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de Numeros de Proceso"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">NO.</th>
                                    <th class="min-tablet">
                                      NO. DE PROCESO
                                    </th>
                                    <th class="min-tablet">
                                      FECHA DE APERTURA
                                    </th>
                                  </tr>
                                </thead>
                                <tbody>
                                  <tr>
                                    <td>-</td>
                                    <td>-</td>
                                    <td>-</td>
                                  </tr>
                                </tbody>
                              </table>
                              <!--PROCESS NUMBERS Table Section ends-->
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
                      id="cancelButton"
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
        </div>
        <!--Med Insumos ends-->
      </div>
    </div>
    <% } %>
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
    <% if (!openMode.equalsIgnoreCase("disabled")) { %>
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

      function preparacionesIniciales() {
        /* Combinacion Javascript y Java*/
        var nombreDocumento = "${nombreDocumento}";
        if (nombreDocumento === "")
        {
          $("#previewDocumentInput").addClass("hide");
          $("#previewDocumentInput").prop("src", "");
          $("#documentFile").prop("required", true);
        }
        else{
          var ruta = getAbsolutePath() + "assets/files/amendmentsALPFiles/" + nombreDocumento;
          $("#previewDocumentInput").prop("src", ruta);
          $("#previewDocumentInput").removeClass("hide");
          $("#documentFile").prop("required", false);
        }
        $("#apertLocation").prop("value","${lugarApertura}");
        $("#amendmentType").prop("value","${tipo}");
        var val = document.getElementById("amendmentType").value;
		    if(val === "ENMIENDA"){
          const value1 = "${horaLimite}";
          const value2 = "${diaLimite}";
          if (value1=="" && value2==""){
            $("#amendment1Check").prop("disabled", false);
          }
          if (value1==""){
            $("#deadlineHour").removeAttr("required");
            $("#deadlineHour").prop("disabled", true);
          }
          if (value2==""){
            $("#deadlineDate").removeAttr("required");
            $("#deadlineDate").prop("disabled", true);
          }
          const value3 = "${diaApertura}";
          const value4 = "${horaApertura}";
          const value5 = "${lugarApertura}";
          if (value3=="" && value4=="" && value5==""){
            $("#amendment2Check").prop("disabled", false);
          }
          if (value3==""){
            $("#apertDate").removeAttr("required");
            $("#apertDate").prop("disabled", true);
          }
          if (value4==""){
            $("#apertHour").removeAttr("required");
            $("#apertHour").prop("disabled", true);
          }
          if (value5=="")
          {
            $("#apertLocation").removeAttr("required");
            $("#apertLocation").prop("disabled", true);
          }
		    }
		    else{
          $("#amendment1Check").prop("checked", false);
          $("#amendment2Check").prop("checked", false);
          $("#amendmentProductCheck").prop("checked", false);
			    $("#amendment1Check").prop("disabled", true);
          $("#amendment2Check").prop("disabled", true);
          $("#amendmentProductCheck").prop("disabled", true);
			    $("#deadlineHour").prop("disabled", true);
			    $("#deadlineDate").prop("disabled", true);
			    $("#apertDate").prop("disabled", true);
			    $("#apertHour").prop("disabled", true);
          $("#apertLocation").prop("disabled", true);
        }
        val = document.getElementById("deadlineDate").value;
        if(val !== ""){
          $("#amendment1Check").prop("checked", true);
        }
        val = document.getElementById("apertDate").value;
        if(val !== ""){
          $("#amendment2Check").prop("checked", true);          
        }
        val = document.getElementById("amendmentType").value;
        if(val !== "ACLARACION"){           
            $("#amendmentProductCheck").prop("checked", true);
          }
        
      }

      $(document).ready(function () {
        preparacionesIniciales();

        /* data Table */
        var processNumberTable = $("#processNumbersTableParam").DataTable({
          responsive: true,
          searching: false,
          bLengthChange: false,
          pageLength: 5,
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
		
        $("#processNumbersButton").on("click", function (event){
        	event.preventDefault();
        	/* processNumberTable.ajax.url(getAbsolutePath() + "tableEmpty").load(); */
          $("#subtitleChange").text(
            "SELECCIONE UN MEDICAMENTO Y CIERRE LA VENTANA"
          );
          var searchValue = $("#purchaseType").val();          
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
        });
        
        $("#processNumbersInModalButton").on("click", function (event) {
          event.preventDefault();
          var selector;
          selector = "procesosCompraAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector).load();
        });
        
        $("#processNumbersSearchButton").on("click", function (event) {
        	event.preventDefault();
          var searchValue = $("#processNumbersSearchInput").val();
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
           
        });

        
        $("#purchaseType").on("change", function(){
          var searchValue = $("#purchaseType").val();          
          var selector;
          $("#subtitleChange").text("SELECCIONE UN ITEM Y CIERRE LA VENTANA");
          selector = "procesosCompraAPI";
          processNumberTable.ajax.url(getAbsolutePath() + selector + "?search=" + searchValue).load();
        });
        
        $("#processNumbersButton").on("click", function (event){
          event.preventDefault();
          //medInsumosTable.ajax.url(getAbsolutePath() + "processNumbersALP").load();
          $("#subtitleChange").text(
            "SELECCIONE ITEM Y CIERRE LA VENTANA"
          );
        });

        /*Modal Select add info in Main Form*/
        $("#processNumbersTableParam tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          var value;
          value = $(this).find("td:eq(1)").text();
          $("#processNum").prop("value", value);
          $("#noProcesoCompraNavBar").prop("value", value);
        });


	$("#amendmentType").on("change", function(){
    var val = $(this).val();
    var purchaseNumberTemp = $("#processNum").val();
	
    if(val === "ENMIENDA"){
    	$("#cDocumentNumber").prop("readOnly", false);
    }
    else{
    	$("#cDocumentNumber").prop("readOnly", false);
    }
    
  /*   if (purchaseNumberTemp != "" && val !="")
    {
      $.post('ALPAmendmentsCorrelativeAPI', {
        type : val,
        purchaseNumber: purchaseNumberTemp,
			}, function(responseText) {
				$("#cDocumentNumber").prop("value", responseText);
		  });
    }
    else
    {
      alert("Para generar un correlativo es necesario seleccionar un proceso de compra y un tipo de correccion!");
    } */

		if(val === "ENMIENDA"){
			$("#amendment1Check").prop("disabled", false);
      $("#amendment2Check").prop("disabled", false);
      $("#amendmentProductCheck").prop("disabled", false);
		}
		else{
      $("#amendment1Check").prop("checked", false);
      $("#amendment2Check").prop("checked", false);
      $("#amendmentProductCheck").prop("checked", false);
			$("#amendment1Check").prop("disabled", true);
      $("#amendment2Check").prop("disabled", true);
      $("#amendmentProductCheck").prop("disabled", true);
			$("#deadlineHour").prop("disabled", true);
			$("#deadlineDate").prop("disabled", true);
			$("#apertDate").prop("disabled", true);
			$("#apertHour").prop("disabled", true);
			$("#apertHour").prop("disabled", true);
      $("#apertLocation").prop("disabled", true);
      
      $("#listEstItemNav1").addClass("hide");
      $("#listEstItemNav2").addClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y FINALIZAR");
      $("#submitButton").prop("value","guardar");
		}
	});

	$("#amendment1Check").on("change", function(){
		if($("#amendment1Check").prop("checked")){
      $("#deadlineHour").prop("disabled", false);
      $("#deadlineHour").prop("required", true);
      $("#deadlineDate").prop("disabled", false);
      $("#deadlineDate").prop("required", true);
		}
		else{
      $("#deadlineHour").prop("disabled", true);
      $("#deadlineHour").prop("required", false);
      $("#deadlineDate").prop("disabled", true);
      $("#deadlineDate").prop("required", false);
		}	
	});
	
	$("#amendment2Check").on("change", function(){
		if($("#amendment2Check").prop("checked")){
      $("#apertDate").prop("disabled", false);
      $("#apertDate").prop("required", true);
      $("#apertHour").prop("disabled", false);
      $("#apertHour").prop("required", true);
      $("#apertLocation").prop("disabled", false);
      $("#apertLocation").prop("required", true);
			
		}
		else{
      $("#apertDate").prop("disabled", true);
      $("#apertDate").prop("required", false);
			$("#apertHour").prop("disabled", true);
			$("#apertHour").prop("required", false);
      $("#apertLocation").prop("disabled", true);
      $("#apertLocation").prop("required", false);
		}	
  });
  
  $("#amendmentProductCheck").on("change", function(){
		if($("#amendmentProductCheck").prop("checked")){
      $("#listEstItemNav1").removeClass("hide");
      $("#listEstItemNav2").removeClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y CONTINUAR");
      $("#submitButton").prop("value","continuar");
		}
		else{
      $("#listEstItemNav1").addClass("hide");
      $("#listEstItemNav2").addClass("hide");
      $("#submitButton #submitButtonText").text("GUARDAR Y FINALIZAR");
      $("#submitButton").prop("value","guardar");
		}	
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

    </script>

    <% } else { %>

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

      function preparacionesIniciales() {
        /* Combinacion Javascript y Java*/
        var nombreDocumento = "${nombreDocumento}";
        if (nombreDocumento === "")
        {
          $("#previewDocumentInput").addClass("hide");
          $("#previewDocumentInput").prop("src", "");
          $("#documentFile").prop("required", true);
        }
        else{
          var ruta = getAbsolutePath() + "assets/files/amendmentsALPFiles/" + nombreDocumento;
          $("#previewDocumentInput").prop("src", ruta);
          $("#previewDocumentInput").removeClass("hide");
          $("#documentFile").prop("required", false);
        }
        $("#apertLocation").prop("value","${lugarApertura}");
        $("#amendmentType").prop("value","${tipo}");
        
        var val = "";
        
        val = document.getElementById("deadlineDate").value;
        if(val !== ""){
          $("#amendment1Check").prop("checked", true);
        }
        val = document.getElementById("apertDate").value;
        if(val !== ""){
          $("#amendment2Check").prop("checked", true);
        }
        
      }

      $(document).ready(function () {
        preparacionesIniciales();
      });

    </script>
    <% } %>
    <script>
    $('#submitButton').click(function (){		
    	
    	<%
    	String accion = (String) session.getAttribute("funcion");    	
    	if (accion.contentEquals("nuevo")) { %>
    	if (document.getElementById("amendmentType").value =="ENMIENDA")
        {
          $.post('ALPAmendmentsAPI', {
        	  	  processNum: document.getElementById("processNum").value,
        		  amendmentType: document.getElementById("amendmentType").value,
        		  correlativoDocumento: document.getElementById("cDocumentNumber").value,
        		  accion: "getCorrelativoXProceso"
    			}, function(responseText) {
    				console.log("responseText "+ responseText)
    				if(responseText == ""){
    					document.getElementById("submit").value = document.getElementById("submitButton").value;
    			    	  document.getElementById("submit").click();
    				}else{
    					alert("ESTE CORRELATIVO YA ESTA EN USO PARA ESTE PROCESO")
    				}
    		  });
        }else if (document.getElementById("amendmentType").value =="ACLARACION"){
        	  $.post('ALPAmendmentsAPI', {
        	  	  processNum: document.getElementById("processNum").value,
        		  amendmentType: document.getElementById("amendmentType").value,
        		  correlativoDocumento: document.getElementById("cDocumentNumber").value,
        		  accion: "getCorrelativoXProceso"
    			}, function(responseText) {
    				console.log("responseText "+ responseText)
    				if(responseText == ""){
    					document.getElementById("submit").value = document.getElementById("submitButton").value;
    			    	  document.getElementById("submit").click();
    				}else{
    					alert("ESTE CORRELATIVO YA ESTA EN USO PARA ESTE PROCESO")
    				}
    		  });
        }
        else
        {
          alert("Para generar un correlativo es necesario seleccionar un proceso de compra y un tipo de correlativo!");
        }
    	<%}else{%>
    	document.getElementById("submit").value = document.getElementById("submitButton").value;
  	  document.getElementById("submit").click();
    	<%}%>
    	
    	
    	
		  
      });
    </script>
    
    <!-- Java Script section ends -->
  </body>
</html>
