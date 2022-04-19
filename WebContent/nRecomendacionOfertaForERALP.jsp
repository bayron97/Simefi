<%@ page language="java" contentType="text/html"%> 
<%@ page import="main.model.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.sql.*"%>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%> 
<%
  //Retrieve your list from the request, with casting

  String funcion = (String)request.getAttribute("funcion");

  String temp = "";
  temp = (String)request.getAttribute("openMode");
  String openMode = "";
  if(temp != null && !temp.isEmpty()){ 
    openMode = temp; 
  }
%>

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
                      <label class="dropdown-item"> PROVEEDORES </label>
                      <label class="dropdown-item"> VACIADO </label>
                      <label class="dropdown-item"> EVALUACION </label>
                      <a type="button" class="dropdown-item active" href="#"
                        >RECOMENDACION</a
                      >
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link">PROVEEDORES</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link">VACIADO</label>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link">EVALUACION</label>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">RECOMENDACION</a>
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
                      RECOMENDACION DE OFERTAS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      COMPRA ACUERDO A LARGO PLAZO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
            <div class="card-body">
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left">
                    <h6 class="mb-4">
                      NOTA: PARA INICIAR LA RECOMENDACION SELECCIONE UNA OFERTA...
                    </h6>
                  </div>
                  <div
                    class="form-group float-right"
                    id="recommendationSection"
                  >
                    
                    
                     <form
                  id="ExportTableeXCEL"
                  method="post"
                  action="nRecomendacionOfertaForALPExportEXCEL.jsp"
                  class="main-font"
                  target="_blank"
                >
                <input name="SDEX" id="SDEX" type="hidden" value="${buyRequestCod}">
                <input name="PROEX" id="PROEX" type="hidden" value="${purchaseProcessCod}">
                <button
                type="submit"
                class="btn btn-sm btn-success ml-2"
                data-target="#"
                data-toggle="modal"
                id="prelacionButton"
                >
                  <i class="material-icons md-18">add_circle</i> GENERAR REPORTE 
                </button>
                </form>
                
                <form
                  id="ExportTableeXCELSegindaRCC"
                  method="post"
                  action="nRecomendacionOfertaForALPExportSegundaRCC.jsp"
                  class="main-font"
                  target="_blank"
                >
                <input name="SDEX" id="SDEX" type="hidden" value="${buyRequestCod}">
                <input name="PROEX" id="PROEX" type="hidden" value="${purchaseProcessCod}">
                <button
                type="submit"
                class="btn btn-sm btn-success ml-2"
                data-target="#"
                data-toggle="modal"
                id="prelacionButton"
                >
                  <i class="material-icons md-18">add_circle</i> GENERAR REPORTE 2DA RCC
                </button>
                </form>
                    
                    
                    
                    <form
                  id="ExportTable"
                  method="post"
                  action="nRecomendacionOfertaForALPExport.jsp"
                  class="main-font"
                  target="_blank"
                >
                <input name="SD" id="SD" type="hidden" value="${buyRequestCod}">
                <button
                type="submit"
                class="btn btn-sm btn-success ml-2"
                data-target="#"
                data-toggle="modal"
                id="export"
                >
                  <i class="material-icons md-18">add_circle</i> EXPORTAR TABLA 
                </button>
                </form>
                    
                    
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-body main-font">
              <div class="card-body" id="encabezado">
                <div class="row">
                  <div class="col-lg-6 col-md-6">
                    <div class="form-group">                     
                      <label>PROCESO DE COMPRA</label>
                      <input
                        type="text"
                        autocomplete="off"
                        class="form-control"
                        id="procesoCompra"
                        name="procesoCompra"
                        value="${purchaseProcessCod}"
                        readonly
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                      <label>NO. SOLICITUD DE COMPRA</label>
                      <input
                        type="text"
                        autocomplete="off"
                        class="form-control"
                        id="solicitudcompra"
                        name="solicitudcompra"
                        value="${buyRequestCod}"
                        readonly
                      />
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                      <label>BENEFICIARIO</label>
                      <input
                        type="text"
                        autocomplete="off"
                        class="form-control"
                        name="beneficiarioSC"
                        id="beneficiarioSC"
                        value="${SCbenef}"
                        readonly
                      />
                    </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <div class="form-group">
                      <label>NO. DE ITEM</label>
                      <!-- <input
                        type="number"
                        autocomplete="off"
                        class="form-control"
                        name="noItem"
                        id="noItem"
                      /> -->
                      
                      
                      <%  
                                    		 try{ 
                                                 Connection con1 = null;
                                                 Statement state1 = null;
                                                 int is = 1;
                                                 ResultSet rs1 = null;
                                                 String url1 = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                                 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                                 con1 = DriverManager.getConnection(url1,"admin","system123");
                                                 state1 = con1.createStatement();
                                                 String buyRequestCod = (String)session.getAttribute("buyRequestCod");
                                                 String purchaseProcessCod = (String)session.getAttribute("purchaseProcessCod");
                                                 //String QueryString1 = "select noItem from listaRequerimientoSolicitudDisponibilidadALP WHERE codSolicitudCompra = '"+buyRequestCod+"' and estadoCompra = 'EVALUACION REALIZADA'"; 
                                                 String QueryString1 = "select distinct noItem from listaRequerimientoSolicitudDisponibilidadALP as lrSDalp INNER JOIN ofertaALP AS oALP ON oALP.noOferta = lrSDalp.noOferta WHERE lrSDalp.codSolicitudCompra = '"+buyRequestCod+"'  and oALP.procesoCompra = '"+purchaseProcessCod+"' and lrSDalp.estadoCompra = 'EVALUACION REALIZADA' or  lrSDalp.estadoCompra = 'RECOMENDACION REALIZADA'";                               
                                                 rs1 = state1.executeQuery(QueryString1);
                                               %>
                                               
                                              <input list="browsers" id="noItem" autocomplete="off"  class="form-control"  name="noItem">
     										  <datalist id="browsers">
     										  
     										  <%
     										  while(rs1.next()){ 
     											  %>											  
     											    <option  class="form-control" value="<%=rs1.getString(1)%>">
     											  <%   
     										   }										  
     										  %>
     										  </datalist>                                           
                                               <%
                                                 rs1.close(); 
                                                 state1.close();
                                                 con1.close(); 
                                                 }catch(Exception e){System.out.println(e); }
                                    		 
                                    	 
                                    	 %>
                      
                      
                      
                    </div>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-right">
                      <button
                        class="btn btn-sm btn-success ml-2"
                        type="button"
                        id="filterButton"
                      >
                        MOSTRAR OFERTAS
                        <i class="material-icons md-18">search</i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!--Table Section Starts-->
              <div class="card-body main-font" style="overflow-x: auto">
                <table
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">FECHA VACIADO</th>
                      <th class="min-tablet">COD. SOLICITUD DISPONIBILIDAD</th>
                      <th class="min-tablet">PROVEEDOR</th>
                      <th class="min-tablet">CODIGO ATC</th>
                      <th class="min-tablet">PRODUCTO REQUERIDO</th>
                      <th class="min-desktop">PRODUCTO ACORDADO</th>
                      <th class="min-desktop">
                        DESCRIPCION/ESPECIFICACION TECNICA REQUERIDA
                      </th>
                      <th class="min-desktop">
                        DESCRIPCION/ESPECIFICACION TECNICA ACORDADA
                      </th>
                      <th class="min-desktop">
                        UNIDAD DE PRESENTACION REQUERIDA
                      </th>
                      <th class="min-desktop">
                        UNIDAD DE PRESENTACION ACORDADA
                      </th>
                      <th class="min-desktop">FABRICANTE / PAIS DE ORIGEN</th>
                      <th class="min-desktop">
                        CERTIFICADO DE REGISTRO SANITARIO
                      </th>
                      <th class="min-desktop">
                        FECHA DE VENCIMIENTO DE REGISTRO SANITARIO
                      </th>
                      <th class="min-desktop">CERTIFICADO DE BPM / CPP</th>
                      <th class="min-desktop">
                        FECHA DE VENCIMIENTO DE CERTIFICADO DE BPM / CPP
                      </th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">PRECIO UNITARIO ACORDADO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">TIEMPOS DE ENTREGA OFERTADO</th>
                      <th class="min-desktop">VIDA UTIL OFERTADA</th>
                      <th class="min-desktop">
                        CANTIDAD UNIDAD DE EMPAQUE PRIMARIA
                      </th>
                      <th class="min-desktop">
                        CANTIDAD UNIDAD DE EMPAQUE SECUNDARIO
                      </th>
                      <th class="min-desktop">CRITERIO REGISTRO SANITARIO</th>
                      <th class="min-desktop">CRITERIO DE CANTIDAD</th>
                      <th class="min-desktop">
                        CRITERIO DE CERTIFICACION DE BUENAS PRACTICAS DE
                        MANUFACTURA
                      </th>
                      <th class="min-desktop">CRITERIO DE TIEMPO DE ENTREGA</th>
                      <th class="min-desktop">CRITERIO DE VIDA UTIL</th>
                      <th class="min-desktop">
                        RECOMENDACION DEL COMITE DE EVALUACION
                      </th>
                      <th class="min-desktop">CRITERIO DE RECOMENDACION</th>
                      <th class="min-desktop">
                        PRELACION DE RECOMENDACION TECNICA
                      </th>
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">
                        RECOMENDACIONES A LOS BENEFICIARIOS
                      </th>
                      <th class="min-desktop">ESTATUS DE COMPRA</th>
                      <th class="min-desktop">
                        OBSERVACION DE ESTADO ORDEN DE COMPRA
                      </th>
                      <th class="min-desktop">CRITERIOS DE EVALUACION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;.</th>    
                      <th class="min-desktop">ACLARACION</th>
                      <th class="min-desktop">ID DB</th>
                      <th class="min-desktop">SEGUNDA RCC</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
              <!--form Section starts-->
              <div class="card-body main-font mt-1">
                <form id="recommendForm">
                  <input type="hidden" id="SDCod" name="SDCod"/>
                  <input type="hidden" id="noItemSelected" name="noItemSelected"/>
                  <input type="hidden" id="segundaRCC" name="segundaRCC"/>
                  <div class="collapse show" id="advertenciaRecomendacion">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group text-center">
                          <h5 class="mb-4">
                            SELECCIONE UN REGISTRO EN LA TABLA PARA CONTINUAR...
                          </h5>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="collapse" id="recomendacion">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group float-left">
                          <h5 class="mb-4">
                            <u>DATOS DE RECOMENDACION DE OFERTA</u>
                          </h5>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-3 col-md-3">
                        <div class="form-group">
                          <label><strong>RECOMENDACION COMITE DE EVALUACION</strong></label>
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="recomendacionCE"
                            name="recomendacionCE"
                          >
                            <option value="NO" selected>NO</option>
                            <option value="SI">SI</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-3 col-md-3">
                        <div class="form-group">
                          <label>CRITERIO DE RECOMENDACION</label>
                        </div>
                      </div>
                      <div class="col-lg-9 col-md-9">
                        <div class="form-group">
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="criterioRecomendacion"
                            name="criterioRecomendacion"
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-8 col-md-8">
                        <div class="form-group">
                          <label>OBSERVACIONES</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="observaciones"
                            name="observaciones"
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>
                            PRELACION DE RECOMENDACION TECNICA
                          </label>
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="prelacionRT"
                            name="prelacionRT"
                          >
                            <option value="0" selected>0</option>
                            <option value="1" >1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group float-right">
                          <br />
                          <button
                            type="button"
                            class="mb-2 mr-2 btn-rounded-circle shadow btn btn-success"
                            data-target="#newRegModalCenter"
                            data-toggle="modal"
                          >
                            <i class="material-icons">done</i>
                          </button>
                          <button
                            type="button"
                            class="mb-2 mr-2 btn-rounded-circle shadow btn btn-danger"
                            id="resetInputsButton"
                          >
                            <i class="material-icons">close</i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
              <!--form Section ends-->
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

    <form class="main-font" action="vaciadoEvaluacionRecomendacionALPStepRouting" method="post">
      <!-- Cancel Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded shadow"
          type="submit"
          name="submit"
          value="proveedor"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>

      <!-- Submit Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
        <button
          class="btn btn-primary btn-rounded shadow"
          type="submit"
          name="submit"
          value="cancelar"
        >
          <span>FINALIZAR </span>
          <i class="material-icons vm">done</i>
        </button>
      </div>

    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

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

    <!-- NEW REG MODE STATE Modal -->
    <div class="modal fade " id="newRegModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="">
              </figure>
              <div class="modal-body main-font" id="newRegConfirMessage">
                &#191;DESEA GUARDAR ESTOS DATOS PARA LA OFERTA SELECCIONADA?
              </div>
              <div>
                <div class="row">
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="closeModalButton"
                      data-dismiss="modal"
                    >
                      CANCELAR <i class="material-icons md-18">close</i>
                    </button>
                  </div>
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="confirmModalButton"
                    >
                      CONFIRMAR <i class="material-icons md-18">done</i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    
     <div
      class="modal fade"
      id="confirmationModalCenter"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>
              <div class="modal-body main-font" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>
              <div>
                <button
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	  

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

      function cleanFields(){
        $("#recomendacionCE").prop("value", "NO");
        $("#criterioRecomendacion").prop("value", "");
        $("#prelacionRT").prop("value", 5);
        $("#observaciones").prop("value", "");
      }

      $(document).ready(function () {
        /*TABLA DE RECOMENDADOS*/
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 35,
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

        /*New Emptying Button function*/

        $("#confirmModalButton").on("click", function (event) {
          event.preventDefault();
          $("#newRegModalCenter").modal('hide');

          $("#confirMessage").text(
              "GUARDANDO REGISTRO, PORFAVOR ESPERE..."
          );
          $("#confirmationModalCenter").modal('show');
          $('#prelacionRT').attr("disabled", false);          
          $('#recomendacionCE').attr("disabled", false);
  	
          
          var url = getAbsolutePath() + "ALPManageRecommendOffersForERAPI" + "?mode=new";
          console.log("Enviando...")
          $("#confirMessage").text("RECOMENDACION: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
          $.ajax({
            type: "POST",
            url: url,
            data: $("#recommendForm").serialize(),
            success: function(data)          
            {
              console.log(data);
              if (data === "successful"){
                var searchValue = $("#noItem").val();
                reqTable.ajax.url(getAbsolutePath() + "ALPManageRecommendOffersForERAPI" + "?filterItem=" + searchValue).load();
                $("#confirMessage").text(
                  "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
                );
                $("#confirmationModalCenter").modal('show');
                cleanFields();
              }
              else if(data === "DBError"){
                $("#confirMessage").text(
                  "ERROR DE BASE DE DATOS! NO SE PUEDO CONECTAR A LA BASE DE DATOS INTENTE DE NUEVO"
                );
                $("#confirmationModalCenter").modal('show');
              }
              else{
                $("#confirMessage").text(
                  "ERROR DESCONOCIDO! PORFAVOR INTENTE DE NUEVO"
                );
                $("#confirmationModalCenter").modal('show');
              }
            },
            error : function() {
              $("#confirMessage").text(
                "ERROR DE RED O SERVIDOR! NO SE PUDO CONECTAR CON EL SERVIDOR, PORFAVOR INTENTE DE NUEVO"
              );
              $("#confirmationModalCenter").modal('show');
            }
          });
        });

        $("#filterButton").on("click", function (event) {
        	event.preventDefault();
          var searchValue = $("#noItem").val();
          
          
          reqTable.ajax.url(getAbsolutePath() + "ALPManageRecommendOffersForERAPI" + "?filterItem=" + searchValue+"&procesoCompra="+ document.getElementById("procesoCompra").value).load();
        });
      });

      $("#reqTable tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        
        value = $(this).find("td:eq(34)").text();
       
        
        if($(this).find("td:eq(39)").text() == 'REALIZADA'){
        	$("#confirmationModalCenter").modal('show');				 				 
			 $("#confirMessage").text("ACCION NO PERMITIDA!. ESTE ITEM YA FUE RECOMENDADO POR SEGUNDA VEZ ..."); 
        
        }else if(value == "RECOMENDACION REALIZADA"){
        	$("#confirmationModalCenter").modal('show');				 				 
			 $("#confirMessage").text("ESTE ITEM YA FUE RECOMENDADO ...");          	
       }else{
        	value = $(this).find("td:eq(29)").text();
        	
        	if ($(this).find("td:eq(39)").text() === 'SOLICITADA'){
        		$('#recomendacionCE').attr("disabled", true);
        		$('#prelacionRT').attr("disabled", true);
        		$("#segundaRCC").prop("value", "REALIZADA");
              }else{
            	  $("#segundaRCC").prop("value", $(this).find("td:eq(39)").text());
              }
        	
        	
            if (value === "-"){
              $("#recomendacionCE").prop("value", "NO");
            }
            else{
              $("#recomendacionCE").prop("value", value);
            }
            value = $(this).find("td:eq(30)").text();
            $("#criterioRecomendacion").prop("value", value);
            value = $(this).find("td:eq(31)").text();
            if(value === "-"){
              $("#prelacionRT").prop("value", 5);
            }
            else{
              $("#prelacionRT").prop("value", value);
            }
            value = $(this).find("td:eq(32)").text();
            $("#observaciones").prop("value", value);

            value = $(this).find("td:eq(38)").text();
            $("#SDCod").prop("value", value);
            $("#noItemSelected").prop("value", $("#noItem").val());

            $("#advertenciaRecomendacion").collapse("hide");
            $("#recomendacion").collapse("show");
        }
        
      });

      $("#resetInputsButton").on("click", function () {
        cleanFields();
      });
      
      $("#recomendacionCE").on("change", function(event){
      	if(this.value === "NO"){      		
      	
      		$('#prelacionRT').attr("disabled", true); 
      		var options = document.getElementById("prelacionRT").options;
      	  	for (var i = 0; i < options.length; i++) {
      	    if (options[i].text == 0) {
      	      options[i].selected = true;
      	      break;
      	    }
      	  }
      		 }
      	else{
      		$('#prelacionRT').attr("disabled", false);
      		
      	}
      });
      
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
