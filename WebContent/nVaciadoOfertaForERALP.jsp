<%@ page language="java" contentType="text/html"%> 
<%@ page import="main.model.*" %> 
<%@ page import="java.util.*" %> 

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%> 
<%
  //Retrieve your list from the request, with casting
  ArrayList<listaRequerimientoSolicitudDisponibilidadALP> reqList = (ArrayList<listaRequerimientoSolicitudDisponibilidadALP>) request.getAttribute("reqList");

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
    
    <style>
       #reqTable th:nth-child(19){
        display:none;
      } 
       #reqTable td:nth-child(19){
        display:none;
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
                      <a type="button" class="dropdown-item active" href="#"
                        >VACIADO</a
                      >
                      <label class="dropdown-item"> EVALUACION </label>
                      <label class="dropdown-item"> RECOMENDACION </label>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link">PROVEEDORES</label>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#">VACIADO</a>
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
                      VACIADO DE OFERTAS
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
                      NOTA: PARA INICIAR EL VACIADO SELECCIONE UNA OFERTA...
                    </h6>
                  </div>
                  <div
                    class="form-group float-right"
                    id="recommendationSection"
                  >
                    <button
                      class="btn btn-sm btn-success ml-2"
                      data-target="#newEditRegPrelacion"
                      data-toggle="modal"
                      id="prelacionButton"
                    >
                      GENERAR REPORTE
                      <i class="material-icons md-18">picture_as_pdf</i>
                    </button>
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
                      <label>PROVEEDOR - SOLICITUD DE DISPONIBILIDAD</label>
                      <input
                        type="text"
                        autocomplete="off"
                        class="form-control"
                        name="proveedorSD"
                        id="proveedorSD"
                        value="${provSD}"
                        readonly
                      />
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
                      <th class="min-tablet">NO. ITEM</th>
                      <th class="min-tablet">CODIGO SESAL</th>
                      <th class="min-tablet">PRODUCTO REQUERIDO</th>
                      <th class="min-desktop">PRODUCTO ACORDADO</th>
                      <th class="min-desktop">DESCRIPCION/ESPECIFICACION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCRIPCION/ESPECIFICACION TECNICA ACORDADA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION REQUERIDA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION ACORDADA</th>
                      <th class="min-desktop">FABRICANTE / PAIS DE ORIGEN</th>
                      <th class="min-desktop">CERTIFICADO DE REGISTRO SANITARIO</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO DE REGISTRO SANITARIO</th>
                      <th class="min-desktop">CERTIFICADO DE BPM / CPP</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO DE CERTIFICADO DE BPM / CPP</th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">PRECIO UNITARIO ACORDADO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">TIEMPOS DE ENTREGA OFERTADO</th>
                      <th class="min-desktop">VIDA UTIL OFERTADA</th>
                      <th class="min-desktop">CANTIDAD UNIDAD DE EMPAQUE PRIMARIA</th>
                      <th class="min-desktop">CANTIDAD UNIDAD DE EMPAQUE SECUNDARIO</th>
                      <th class="min-desktop">CRITERIO REGISTRO SANITARIO</th>
                      <th class="min-desktop">CRITERIO DE CANTIDAD</th>
                      <th class="min-desktop">CRITERIO DE CERTIFICACION DE BUENAS PRACTICAS DE MANUFACTURA</th>
                      <th class="min-desktop">CRITERIO DE TIEMPO DE ENTREGA</th>
                      <th class="min-desktop">CRITERIO DE VIDA UTIL</th>
                      <th class="min-desktop">RECOMENDACION DEL COMITE DE EVALUACION</th>
                      <th class="min-desktop">CRITERIO DE RECOMENDACION</th>
                      <th class="min-desktop">PRELACION DE RECOMENDACION TECNICA</th>
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">RECOMENDACIONES A LOS BENEFICIARIOS</th>
                      <th class="min-desktop">ESTATUS DE COMPRA</th>
                      <th class="min-desktop">OBSERVACION DE ESTADO ORDEN DE COMPRA</th>
                      <th class="min-desktop">ACLARACION</th>
                      <th class="min-desktop">NUMERO DE REGISTRO SANITARIO VENCIMIENTO</th>
                      <th class="min-desktop">FECHA DE REGISTRO SANITARIO VENCIMIENTO</th>
                      <th class="min-desktop">NUMERO DE CERTIFICADO DE BUENAS PRACTICAS VENCIMIENTO</th>
                      <th class="min-desktop">FECHA DE CERTIFICADO DE BUENAS PRACTICAS VENCIMIENTO</th>
                      <th class="min-desktop">CANTIDAD UNIDAD DE EMPAQUE TERCIARIO</th>
                      <th class="min-desktop">OBSERVACIONES DE LA OFERTA DEL PROVEEDOR</th>
                      <th class="min-desktop">ID DB</th>
                       <th class="min-desktop">NO OFERTA CATALOGO</th>
                        <th class="min-desktop">REGISTRO SANITARIO</th>
                    </tr>
                  </thead>
                  <tbody>
                    <% if (reqList != null) {
                        for(listaRequerimientoSolicitudDisponibilidadALP req : reqList){
                    System.out.println(req.getnumCerBPMVen() + "ccc");
                    %>
                    <tr>
                      <td><%=req.getFechaVaciado().toUpperCase()%></td>
                      <td><%=req.getNoItem()%></td>
                      <td><%=req.getcodigoSesal().toUpperCase()%></td>
                      <td><%=req.getNombreProductoRequerido().toUpperCase()%></td>
                      <td><%=req.getNombreProductoOfertado().toUpperCase()%></td>
                      <td><%=req.getDescripcionTecnicaRequerida().toUpperCase()%></td>
                      <td><%=req.getDescripcionTecnicaOfertada().toUpperCase()%></td>
                      <td><%=req.getUnidadPresentacionRequerida().toUpperCase()%></td>
                      <td><%=req.getUnidadPresentacionOfertada().toUpperCase()%></td>
                      <td><%=req.getOrigenFP().toUpperCase()%></td>
                      <td><%=req.getNumCertRegSan().toUpperCase()%></td>
                      <td><%=req.getRegSanVenc().toUpperCase()%></td>
                      <td><%=req.getNumCertBPM().toUpperCase()%></td>
                      <td><%=req.getCertBPMVenc().toUpperCase()%></td>
                      <td><%=req.getCantidadRequerida()%></td>                      
                      <td><%= String.format("%,d", req.getCantidadOfertada())%></td>                    
                      <td><%=req.getPrecioUnitarioAcordado()%>  <%=req.getMoneda().toUpperCase()%></td>
                      <td><%=req.getPrecioTotal()%>  <%=req.getMoneda().toUpperCase()%></td>
                      <td><%=req.getMoneda().toUpperCase()%></td>
                      <td><%=req.getTiempoEntregaOfertado().toUpperCase()%></td>
                      <td><%=req.getVidaUtilOfertada().toUpperCase()%></td>
                      <td><%=String.format("%,d", req.getCantidadEmpaquePrimario())%></td>
                      <td><%=String.format("%,d", req.getCantidadEmpaqueSecundario())%></td>
                      <td><%=req.getRegSanCriterio().toUpperCase()%></td>
                      <td><%=req.getCantCriterio().toUpperCase()%></td>
                      <td><%=req.getCertBPMCriterio().toUpperCase()%></td>
                      <td><%=req.getTiempoEntregaCriterio().toUpperCase()%></td>
                      <td><%=req.getVidaUtilCriterio().toUpperCase()%></td>
                      <td><%=req.getRecomendacionCE().toUpperCase()%></td>
                      <td><%=req.getCriterioRecomendacion().toUpperCase()%></td>
                      <td><%=req.getPrelacionRT().toUpperCase()%></td>
                      <td><%=req.getObservaciones().toUpperCase()%></td>
                      <td><%=req.getRecomendacionesBeneficiarios().toUpperCase()%></td>
                      <td><%=req.getEstadoCompra().toUpperCase()%></td>
                      <td><%=req.getObservacionEstadoCompra().toUpperCase()%></td>
                      <td><%=req.getAclaracion().toUpperCase()%></td>
                      <%-- <td><%=req.getnumRegSanitarioVen()%></td> --%>
                      <td><%=req.getNumCertRegSan().toUpperCase()%></td>
                      <td><%=req.getfechaRegSanitarioVen()%></td>
                     <%--  <td><%=req.getnumCerBPMVen()%></td> --%>
                      <td><%=req.getNumCertBPM().toUpperCase()%></td>                   
                      <%-- <td><%=req.getfechaCerBPMVen()%></td> --%>
                      <td><%=req.getCertBPMVenc().toUpperCase()%></td>
                       <td><%=String.format("%,d", req.getcantidadEmpaqueTerciario())%></td>
                       <td><%=req.getObserRespuestaProveedor().toUpperCase()%></td>
                       <td><%=req.getId()%></td>
                       <td><%=req.getnoOferta()%></td>
                       <td><%=req.getregistroSanitario()%></td>
                    </tr>
                    
                    
                    
                    <% } } %>
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
              <!--form Section starts-->
              <div class="card-body main-font mt-1">
                <form id="emptyingForm">
                  <div class="collapse show" id="advertenciaVaciado">
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
                  <div class="collapse" id="vaciado">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group float-left">
                          <h5 class="mb-4">
                            <u>DATOS DE VACIADO DE OFERTA</u>
                          </h5>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                    
                    <input autocomplete="off" type="hidden" class="form-control" id="idItemRequerimiento" name="idItemRequerimiento" readonly/>
                    
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>PRODUCTO ACORDADO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="nombreProducto"
                            name="nombreProducto"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>NO. ITEM</label>
                          <input
                            autocomplete="off"
                            type="number"
                            class="form-control"
                            id="noItem"
                            name="noItem"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group mt-4">
                          <div class="custom-control custom-checkbox">
                            <input
                              type="checkbox"
                              class="custom-control-input"
                              id="sinOferta"
                              name="sinOferta"
                              value="true"
                            />
                            <label class="custom-control-label" for="sinOferta"
                              >NO PRESENTO OFERTA</label
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>UNIDAD PRESENTACION ACORDADA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="unidadPresentacionA"
                            name="unidadPresentacionA"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CODIGO ATC</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="codATC"
                            name="codATC"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group mt-4">
                          <div class="custom-control custom-checkbox">
                            <input
                              type="checkbox"
                              class="custom-control-input"
                              id="solicitudAclaracion"
                            />
                            <label class="custom-control-label" for="solicitudAclaracion"
                              >SOLICITUD DE ACLARACION</label
                            >
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                   
                      <div hidden class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>
                           NO. REGISTRO SANITARIO "CATALOGO"
                          </label>
                           <input type="text" class="form-control" id="numRegistroSanitarioCatalogo" name="numRegistroSanitarioCatalogo" readonly />
                          <input
                          hidden
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="numRegistroSanitario"
                            name="numRegistroSanitario"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>
                           NO. CERTIFICADO BPM "CATALOGO"
                          </label>
                          <input  type="text" class="form-control" id="numCertBPMCatalogo" name="numCertBPMCatalogo" readonly/>
                          <input
                          hidden
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="numCertBPM"
                            name="numCertBPM"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>DETALLES DE ACLARACION</label>
                          <textarea
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="detallesAclaracion"
                            name="detallesAclaracion"
                            disabled
                          ></textarea>
                        </div>
                      </div>
                      
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>
                            VENCIMIENTO DE REGISTRO SANITARIO "CATALOGO"
                          </label>
                          <input autocomplete="off" type="text" class="form-control" id="registroSanitarioVencCatalogo" name="registroSanitarioVencCatalogo" readonly/>
                          <input
                          hidden
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="registroSanitarioVenc"
                            name="registroSanitarioVenc"
                            readonly
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>
                            VENCIMIENTO CERTIFICADO BPM "CATALOGO"
                          </label>
                          <input autocomplete="off" type="text" class="form-control" id="numCertBPMVencCatalogo" name="numCertBPMVencCatalogo" readonly />
                        <input
                          hidden
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="numCertBPMVenc"
                            name="numCertBPMVenc"
                            readonly
                          />
                        </div>                          
                        </div>  
                    </div>
                    
                                            
                  
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>TIEMPOS DE ENTREGA OFERTADO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="tiempoEntregaOfertado"
                            name="tiempoEntregaOfertado"
                            maxlength="250"
                            required
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>VIDA UTIL OFERTADA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="vidaUtilOfertada"
                            name="vidaUtilOfertada"
                            maxlength="100"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CANTIDAD OFERTADA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="cantidadOfertada"
                            name="cantidadOfertada"
                            onkeyup="format(this)"
                            maxlength="20"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CANTIDAD UNIDAD DE EMPAQUE PRIMARIO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            onkeyup="format(this)"
                            id="cantidadEmpaquePrimario"
                            name="cantidadEmpaquePrimario"
                            required
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CANTIDAD UNIDAD DE EMPAQUE SECUNDARIO</label>
                          <input
                            autocomplete="off"
                            type="text"
                             onkeyup="format(this)"
                            class="form-control"
                            id="cantidadEmpaqueSecundario"
                            name="cantidadEmpaqueSecundario"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>CANTIDAD UNIDAD DE EMPAQUE TERCIARIO</label>
                          <input
                            autocomplete="off"
                            type="text"
                             onkeyup="format(this)"
                            class="form-control"
                            id="cantidadEmpaqueTerciario"
                            name="cantidadEmpaqueTerciario"
                            required
                          />
                        </div>
                      </div>
                      
                      <div class="col-lg-4 col-md-4">
                    		<div class="form-group" style="text-align: left">
                      			<label>REGISTRO SANITARIO</label>
                      				<select id="registroSanitario" name="registroSanitario" class="form-control">
                      					<option value="REGISTRO SANITARIO">REGISTRO SANITARIO</option>
                      					<option value="RECONOCIMIENTO MUTUO">RECONOCIMIENTO MUTUO</option>
                      					<option value="CONSTANCIA">CONSTANCIA</option>
                      					<option value="SOLICITUD">SOLICITUD</option>
                      					<option value="OTROS">OTROS</option>
                      					<option value="NO PRESENTO">NO PRESENTO</option>	 
                      				</select>
                    		</div>
                  		</div>
                      
                       <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>NUMERO DE REGISTRO SANITARIO VENCIMIENTO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="numRegSanitarioVenc"
                            name="numRegSanitarioVenc"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>FECHA DE REGISTRO SANITARIO VENCIMIENTO</label>
                          <input
                            autocomplete="off"
                            type="date"
                            class="form-control"
                            id="fechaRegSanitarioVenc"
                            name="fechaRegSanitarioVenc"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>NUMERO DE CERTIFICADO DE BUENAS PRACTICAS VENCIMIENTO</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="numCerBPMVenc"
                            name="numCerBPMVenc"
                            required
                          />
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>FECHA DE CERTIFICADO DE BUENAS PRACTICAS VENCIMIENTO</label>
                          <input
                            autocomplete="off"
                            type="date"
                            class="form-control"
                            id="fechaCerBPMVenc"
                            name="fechaCerBPMVenc"
                            required
                          />
                        </div>
                      </div>
                      
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                          <label>OBSERVACIONES DE LA RESPUESTA DEL PROVEEDOR</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="ObserRespuestaProveedor"
                            name="ObserRespuestaProveedor"
                            maxlength="8000"
                            required
                          />
                        </div>
                      </div>
                      
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
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

    <form
      class="main-font"
      action="vaciadoEvaluacionRecomendacionALPStepRouting"
      method="post"
    >
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
          value="evaluarOferta"
        >
          <span>EVALUAR OFERTAS </span>
          <i class="material-icons vm">done_all</i>
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
        $("#cantidadOfertada").prop("value", "");
        $("#vidaUtilOfertada").prop("value", "");
        $("#tiempoEntregaOfertado").prop("value", "");
        $("#cantidadEmpaquePrimario").prop("value", "");
        $("#cantidadEmpaqueSecundario").prop("value", "");
        $("#numRegSanitarioVenc").prop("value", "");
        $("#fechaRegSanitarioVenc").prop("value", "");
        $("#numCerBPMVenc").prop("value", "");
        $("#fechaCerBPMVenc").prop("value", "");
        
        $("#nombreProducto").prop("value", "");
        $("#noItem").prop("value", "");
        $("#unidadPresentacionA").prop("value", "");
        $("#codATC").prop("value", "");
        $("#numRegistroSanitario").prop("value", "");
        $("#numCertBPM").prop("value", "");
        $("#ObserRespuestaProveedor").prop("value", "");
        

        $("#solicitudAclaracion").prop("checked", false);
        $("#detallesAclaracion").prop("disabled", true);

        $("#sinOferta").prop("checked", false);
        $("#cantidadOfertada").prop("readonly", false);
        $("#vidaUtilOfertada").prop("readonly", false);
        $("#tiempoEntregaOfertado").prop("readonly", false);
        $("#cantidadEmpaquePrimario").prop("readonly", false);
        $("#cantidadEmpaqueSecundario").prop("readonly", false);
      }

      $(document).ready(function () {
        /*TABLA DE RECOMENDADOS*/
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 40,
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

          if (
            ($("#noItem").prop("value") === "" ||
            $("#cantidadOfertada").prop("value") === "" ||
            $("#vidaUtilOfertada").prop("value") === "" ||
            $("#tiempoEntregaOfertado").prop("value") === "" ||
            $("#cantidadEmpaquePrimario").prop("value") === "" ||
            $("#cantidadEmpaqueSecundario").prop("value") === "") &&
            $("#sinOferta").prop("checked") === false
          ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL FORMULARIO..."
            );
          } else {
              var url = getAbsolutePath() + "ALPManageEmptyingOffersForERAPI" + "?mode=new";
              console.log("Enviando...")
              $("#confirMessage").text("NUEVO VACIADO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
              $.ajax({
                type: "POST",
                url: url,
                data: $("#emptyingForm").serialize(),
                success: function(data)          
                {
                  console.log(data);
                  if (data === "successful"){
                    reqTable.ajax.url(getAbsolutePath() + "ALPManageEmptyingOffersForERAPI").load();
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
          }
        });
      });
      
      <%
      Long codDisponibilidadER = Long.parseLong(session.getAttribute("SDID").toString());
      %>
      
      var idSolicitudDisponibilidad_Param = <%=codDisponibilidadER%>;
      var noItem_Param = 0;
     

      $("#reqTable tbody").on("click", "tr", function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;   
        value = $(this).find("td:eq(1)").text();
        noItem_Param = value;
        $("#noItem").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#codATC").prop("value", value);
        value = $(this).find("td:eq(4)").text();
        $("#nombreProducto").prop("value", value);
        value = $(this).find("td:eq(8)").text();
        $("#unidadPresentacionA").prop("value", value);
        value = $(this).find("td:eq(10)").text();
        $("#numRegistroSanitario").prop("value", value);
        value = $(this).find("td:eq(11)").text();
        $("#registroSanitarioVenc").prop("value", value);
        value = $(this).find("td:eq(12)").text();
        $("#numCertBPM").prop("value", value);
        value = $(this).find("td:eq(13)").text();
        $("#numCertBPMVenc").prop("value", value);
        value = $(this).find("td:eq(15)").text();
        if (value === "-")
        {
          $("#cantidadOfertada").prop("value", "");
        }
        else
        {
          $("#cantidadOfertada").prop("value", value);
        }
        value = $(this).find("td:eq(19)").text();
        if (value === "-")
        {
          $("#tiempoEntregaOfertado").prop("value", "");
        }
        else
        {
          $("#tiempoEntregaOfertado").prop("value", value);
        }
        value = $(this).find("td:eq(20)").text();
        if (value === "-")
        {
          $("#vidaUtilOfertada").prop("value", "");
        }
        else
        {
          $("#vidaUtilOfertada").prop("value", value);
        }
        value = $(this).find("td:eq(21)").text();
        if (value === "-")
        {
          $("#cantidadEmpaquePrimario").prop("value", "");
        }
        else
        {
          $("#cantidadEmpaquePrimario").prop("value", value);
        }
        value = $(this).find("td:eq(22)").text();
        if (value === "-")
        {
          $("#cantidadEmpaqueSecundario").prop("value", "");
        }
        else
        {
          $("#cantidadEmpaqueSecundario").prop("value", value);
        }
        //---
        value = $(this).find("td:eq(36)").text();
        if (value === "-")
        {
          $("#numRegSanitarioVenc").prop("value", "");
        }
        else
        {
          $("#numRegSanitarioVenc").prop("value", value);
        }
        value = $(this).find("td:eq(37)").text();
        if (value === "-")
        {
          $("#fechaRegSanitarioVenc").prop("value", "");
        }
        else
        {
          $("#fechaRegSanitarioVenc").prop("value", value);
        }
        value = $(this).find("td:eq(38)").text();
        if (value === "-")
        {
          $("#numCerBPMVenc").prop("value", "");
        }
        else
        {
          $("#numCerBPMVenc").prop("value", value);
        }
        value = $(this).find("td:eq(39)").text();
        if (value === "-")
        {
          $("#fechaCerBPMVenc").prop("value", "");
        }
        else
        {
          $("#fechaCerBPMVenc").prop("value", value);
        }
        
        value = $(this).find("td:eq(40)").text();
        $("#cantidadEmpaqueTerciario").prop("value", value);
        
        value = $(this).find("td:eq(41)").text();
        $("#ObserRespuestaProveedor").prop("value", value);

        $("#advertenciaVaciado").collapse("hide");
        $("#vaciado").collapse("show"); 
        
        $("#idItemRequerimiento").prop("value", $(this).find("td:eq(42)").text());
        
        GetNumSanitario_BPM($(this).find("td:eq(43)").text());
        
        var options = document.getElementById("registroSanitario").options;
    	  for (var i = 0; i < options.length; i++) {
    	    if (options[i].text == $(this).find("td:eq(44)").text()) {
    	      options[i].selected = true;
    	      break;
    	    }
    	  }
        
      });

      $("#sinOferta").on("change", function () {
        if($(this).prop("checked"))
        {
          $("#cantidadOfertada").prop("readonly", true);
          $("#vidaUtilOfertada").prop("readonly", true);
          $("#tiempoEntregaOfertado").prop("readonly", true);
          $("#cantidadEmpaquePrimario").prop("readonly", true);
          $("#cantidadEmpaqueSecundario").prop("readonly", true);
          $("#cantidadEmpaqueTerciario").prop("readonly", true);
          $("#registroSanitarioVenc").prop("readonly", true);
          $("#numCertBPMVenc").prop("readonly", true);          
          $("#numRegSanitarioVenc").prop("readonly", true);
          $("#fechaRegSanitarioVenc").prop("readonly", true);
          $("#numCerBPMVenc").prop("readonly", true);
          $("#fechaCerBPMVenc").prop("readonly", true);
          $("#registroSanitario").prop("disabled", true);
        }
        else
        {
          $("#cantidadOfertada").prop("readonly", false);
          $("#vidaUtilOfertada").prop("readonly", false);
          $("#tiempoEntregaOfertado").prop("readonly", false);
          $("#cantidadEmpaquePrimario").prop("readonly", false);
          $("#cantidadEmpaqueSecundario").prop("readonly", false);
          $("#cantidadEmpaqueTerciario").prop("readonly", false);
          $("#registroSanitarioVenc").prop("readonly", false);
          $("#numCertBPMVenc").prop("readonly", false);
          $("#numRegSanitarioVenc").prop("readonly", false);
          $("#fechaRegSanitarioVenc").prop("readonly", false);
          $("#numCerBPMVenc").prop("readonly", false);
          $("#fechaCerBPMVenc").prop("readonly", false);
          $("#registroSanitario").prop("disabled", false);
        }
      });

      $("#solicitudAclaracion").on("change", function () {
        if($(this).prop("checked"))
        {
          $("#detallesAclaracion").prop("disabled", false);
        }
        else
        {
          $("#detallesAclaracion").prop("disabled", true);
        }
      });

      $("#resetInputsButton").on("click", function () {
        cleanFields();
      });
      
      /* $('input[name=vidaUtilOfertada]').bind('keypress', function(event) {
    	  var regex = new RegExp("^[a-zA-Z0-9 ]+$");
    	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    	  if (!regex.test(key)) {
    	    event.preventDefault();
    	    return false;
    	 }
    	}); */
    	
    	function format(input)
        {
        var num = input.value.replace(/\,/g,"");
        if(!isNaN(num)){
        num = num.toString().split("").reverse().join("").replace(/(?=\d*\,?)(\d{3})/g,'$1,');
        num = num.split("").reverse().join("").replace(/^[\,]/, "");
        input.value = num;
        }

        else{ alert("Solo se permiten numeros");
        input.value = input.value.replace(/[^\d\.]*/g,"");
        }
        }
      
    	$('input[name=cantidadOfertada]').bind('keypress', function(event) {
      	  var regex = new RegExp("^[0-9]+$");
      	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
      	  if (!regex.test(key)) {
      	    event.preventDefault();
      	    return false;
      	 }
      	});
    	
    	$('input[name=cantidadEmpaquePrimario]').bind('keypress', function(event) {
        	  var regex = new RegExp("^[0-9]+$");
        	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        	  if (!regex.test(key)) {
        	    event.preventDefault();
        	    return false;
        	 }
        	});
    	
    	$('input[name=cantidadEmpaqueSecundario]').bind('keypress', function(event) {
        	  var regex = new RegExp("^[0-9]+$");
        	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        	  if (!regex.test(key)) {
        	    event.preventDefault();
        	    return false;
        	 }
        	});
    	
    	$('input[name=cantidadEmpaqueTerciario]').bind('keypress', function(event) {
        	  var regex = new RegExp("^[0-9]+$");
        	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        	  if (!regex.test(key)) {
        	    event.preventDefault();
        	    return false;
        	 }
        	});
    	
    	
    	function GetNumSanitario_BPM(noOfertaCatalogo_Param) {
    		
    		var url = getAbsolutePath() + "RecomendacionContratacionAPI" + "?submit=GetNumSanitario_BPM&noOfertaCatalogo_Param="+noOfertaCatalogo_Param;
            console.log(url);
        	$.ajax({
                url:   url,
                type:  'GET',
                beforeSend: function () 
                {},
                success:  function (r) 
                {
                	var m=r.split(",");

                    $(m).each(function(i, v){ 
                    })
                    
                    //console.log(m)
                    
                    $("#numRegistroSanitarioCatalogo").val(m[0]); 
                    $("#registroSanitarioVencCatalogo").val(m[1]);  
                    $("#numCertBPMCatalogo").val(m[2]); 
                    $("#numCertBPMVencCatalogo").val(m[3]);  
                    $("#registroSanitarioCatalogo").val(m[4]);  
                    
                },
                error: function()
                {
                    alert('Ocurrio un error en el servidor ..');
                }
            });
		}
    	
    	
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
