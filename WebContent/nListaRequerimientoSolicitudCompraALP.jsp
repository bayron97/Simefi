<%@ page language="java" contentType="text/html"%> 
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	//Retrieve your list from the request, with casting
  ArrayList<oficioSolicitudCompraALP> oficiosList = (ArrayList<oficioSolicitudCompraALP>) request.getAttribute("oficiosList");
  // ArrayList<listaRequerimientoSolicitudCompraALP> reqList = (ArrayList<listaRequerimientoSolicitudCompraALP>) request.getAttribute("reqList");
  ArrayList<productoSolicitudCompraALP> reqList = (ArrayList<productoSolicitudCompraALP>) request.getAttribute("reqList");

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

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
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
                <input type="submit" class="hide" id="preSeleccionItemProveedorRoute" name="submit" value="preSeleccionItemProveedor">
                <input type="submit" class="hide" id="solicitudDisponibilidadRoute" name="submit" value="solicitudDisponibilidad">
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
                      <a type="button" class="dropdown-item active" href="#"
                        >LISTA DE REQUERIMIENTO</a
                      >
                      <label class="dropdown-item" for="preSeleccionItemProveedorRoute">
                        PRE SELECCION ITEM-PROVEEDOR
                      </label>
                      <label class="dropdown-item" for="solicitudDisponibilidadRoute">
                        SOLICITUD DE DISPONIBILIDAD
                      </label>
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link" for="datosGeneralesRoute">DATOS GENERALES</label>
                    </li>                    
                    <li class="nav-item">
                      <a class="nav-link active" href="#">LISTA DE REQUERIMIENTO</a>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="preSeleccionItemProveedorRoute">PRE SELECCION ITEM-PROVEEDOR</label>
                    </li>
                      <%if(!funcion.equalsIgnoreCase("CONSULTAR")) {%>
                    <li class="nav-item">
                      <label class="nav-link" for="solicitudDisponibilidadRoute">SOLICITUD DE DISPONIBILIDAD</label>
                    </li>
                      <%}%>
                  </ul>
                </nav>
                </form>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                SOLICITUD DE COMPRA Y DISPONIBILIDAD
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO A LARGO PLAZO (ALP)
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-1">
                <h6 class="text-white font-weight-bold ml-2 mr-3">
                  <% if(funcion.equalsIgnoreCase("MODIFICAR")) {%>
                  <i class="material-icons vm">edit</i> MODIFICAR
                  <% } else if(funcion.equalsIgnoreCase("CONSULTAR")) {%>
                  <i class="material-icons vm">chrome_reader_mode</i> CONSULTAR
                  <% } else {%>
                  <i class="material-icons vm">add_circle</i> NUEVO
                  <% } %>
                </h6>
              </span>
            </div>
          </div>
          <!--Content starts-->
          <div class="main-content-div main-font">
            <form id="newEditRegForm">
              <input type="hidden" name="id" value="${codPadreSolCompra}">
              
              <input type="hidden" name="codSesal" id="codSesal" value="">
              <input type="hidden" name="item" id="item" value="">
              
              <div class="row">
              <div class="col-lg-12 col-md-12">
              <div class="row mb-4">
                    <div class="col-lg-12 col-md-12">
                      <h5
                        id="instructionSubtitle"
                        class="mb-3 text-center float-left"
                        style="font-weight:bold;"
                      >
                        LISTA DE REQUERIMIENTO: NUEVO PRODUCTO
                      </h5>                          
                    </div>
                    <div class="col-lg-12 col-md-12">                                        
                      <label>NOTA: LOS CAMPOS CON * SON OBLIGATORIOS</label>
                    </div>                    
                  </div>
                
              </div>              
                <div class="col-lg-6 col-md-6">                  
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <div class="form-group" style="text-align: left">
                        <label>PROCESO DE COMPRA*</label>
                      </div>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <div class="form-group" style="text-align: left">
                        <input
                          autocomplete="off"
                          type="text"
                          class="form-control"
                          id="purchaseProc"
                          name="purchaseProc"
                          value="${noProcesoCompra}"
                          readonly
                        />
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>1) NO. DE OFICIO*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <select
                        autocomplete="off"
                        class="form-control"
                        id="legalNumber"
                        name="legalNumber"
                        required
                      >
                        <option value="" selected disabled>SELECCIONE UN OFICIO...</option>
                        <%
                          if (oficiosList != null)
                          {
                            for(oficioSolicitudCompraALP oficio : oficiosList){
                        %>
                              <option value="<%=oficio.getNoOficio().toUpperCase()%>">
                                <%=oficio.getNoOficio().toUpperCase()%>
                              </option>
                        <%
                            }
                          }
                        %>
                      </select>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <input type="hidden" id="offerNoID" name="offerNoID">
                    <input type="hidden" id="idEditar" name="idEditar">
                    <div class="col-lg-4 col-md-4">
                      <label>2) NOMBRE DEL PRODUCTO SEGUN CATALOGO*</label>
                    </div>
                    <div class="col-lg-6 col-md-6">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="nombreProducto"
                        name="nombreProducto"
                        required
                        readonly
                      />
                    </div>
                    <div class="col-lg-2 col-md-2 align-self-end">
                      <div class="form-group">
                        <button
                          class="btn btn-sm btn-success ml-2"
                          style="height: 60px"
                          data-target="#medInsumosModal"
                          data-toggle="modal"
                          id="medInsumosModalButton"
                        >
                          <i class="material-icons md-18">add_box</i>
                        </button>
                      </div>
                    </div>
                  </div>                  
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>3) UNIDAD DE PRESENTACION*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="up"
                        name="up"
                        required
                        readonly
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>4) CODIGO ATC*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="codAtc"
                        name="codAtc"
                        required
                        readonly
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>5) CANTIDAD REQUERIDA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="reqCant"
                        name="reqCant"
                        onkeyup="format(this)"
                        maxlength="20"
                        required
                      />
                    </div>
                  </div>                  
                </div>
                <div class="col-lg-6 col-md-6">  
                <div class="row">
                    <div class="col-lg-4 col-md-4">
                      <label>6) TIEMPO DE ENTREGA REQUERIDO (EN DIAS CALENDARIO)*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="tiempoEntReq"
                        name="tiempoEntReq"
                        maxlength="500"
                        required
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>7) VIDA UTIL REQUERIDA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="vidaUtilReq"
                        name="vidaUtilReq"
                        maxlength="100"
                        required
                      />
                    </div>
                  </div>                
                  <div class="row mt-3">
                    <div class="col-lg-12 col-md-12">
                      <label>8) OBSERVACIONES DEL BENEFICIARIO</label>
                      <textarea 
                        autocomplete="off"
                        class="form-control"
                        id="benfObs"
                        name="benfObs"
                        style="min-height:200px;"
                        maxlength="1000"
                      ></textarea>
                    </div>
                  </div>
                  
                  <input id="descripcionTecnica" name="descripcionTecnica" hidden />
                  
                </div>
              </div>
              <%if(!funcion.equalsIgnoreCase("CONSULTAR")) { %>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-right mr-2">
                    <button
                      class="btn btn-sm btn-success ml-2"
                      id="resetInputsButton"
                      type="button"
                    >
                      <i class="material-icons md-18">replay</i>
                      REINICIAR CAMPOS
                    </button>
                    <button
                      class="btn btn-sm btn-success ml-2"
                      id="addRegButton"
                      type="button"
                      data-toggle="modal"
                      data-target="#confirmationModalCenter"
                    >
                      <i class="material-icons md-18">done</i>ACEPTAR
                    </button>
                    <button
                      class="btn btn-sm btn-success ml-2 hide"
                      id="confirmEditRegButton"
                      type="button"
                    >
                      <i class="material-icons md-18">done</i>CONFIRMAR
                      EDICION
                    </button>
                  </div>
                </div>
              </div>
               <% }%>
              <div class="row mt-4">
                <div class="col-lg-12 col-md-12">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h5>LISTA DE REQUERIMIENTO: PRODUCTOS REGISTRADOS</h5>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <div class="float-left">
                       <!--  <button
                          class="btn btn-sm btn-danger"
                          id="deleteRegButton"
                          type="button"
                          data-toggle="modal"
                          data-target="#deleteModalCenter"
                        >
                          <i class="material-icons md-18">close</i>ELIMINAR
                          SELECCIONADO
                        </button> -->
                         <%if(!funcion.equalsIgnoreCase("CONSULTAR")) {%>
                        <button
                          type="button"
                          class="btn btn-sm btn-success ml-2"
                          id="editRegButton"
                        >
                          <i class="material-icons md-18">create</i>EDITAR
                          SELECCIONADO
                        </button>
                         <% }%>
                      </div>
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-12 col-md-12">
                    <!--Legal Table Section starts-->
                      <table
                        id="reqTable"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de Productos Requeridos"
                      >
                        <thead>
                          <tr>
                            <th class="all">ID</th> 
                            <th class="all">NO. OFICIO</th>  
                            <th class="all">NO ITEM</th>                            
                            <th class="min-tablet">CODIGO ATC</th>
                            <th class="min-tablet">CODIGO SESAL</th>                            
                            <th class="all">NOMBRE DEL PRODUCTO OFERTADO</th>
                            <th class="min-tablet">UNIDAD DE PRESENTACION OFERTADA</th>
                            <th class="min-tablet">CANTIDAD REQUERIDA</th>
                            <th class="min-tablet">TIEMPO DE ENTREGA (DIAS CALENDARIO REQUERIDOS)</th>
                            <th class="min-desktop">VIDA UTIL REQUERIDA</th>
                            <th class="min-desktop">OBSERVACIONES DEL BENEFICIARIO</th>
                            <th class="min-desktop">DESCRIPCION TECNICA ACORDADA</th>
                          </tr>
                        </thead>
                        <%-- <tbody>
                        <%
                          if (reqList != null)
                          {
                            for(productoSolicitudCompraALP requerimiento : reqList){
                        %>
                            <tr>
							                <td><%=requerimiento.getid()%></td>	
							                
							                <td><%=requerimiento.getnOficio()%></td>							              
							                <td><%=requerimiento.getcodigoATC()%></td>                              
                              <td><%=requerimiento.getnombreProductoSegunCatalogo()%></td>                             
                              <td><%=requerimiento.getUnidadPresentacion()%></td>
                              
                              <% String sss = String.format("%,d", requerimiento.getcantidadRequerida()); 
                              System.out.println("sss "+ sss);
                              %>
                              
                              <td><%=sss.replace(".", ",")%></td>
                              <td><%=requerimiento.gettiempoEntregaRequerido()%></td>
                              <td><%=requerimiento.getvidaUtilRequerida()%></td>
                              <td><%=requerimiento.getobservacionBeneficiario()%></td>
						                </tr>
                        <%
                            }
                          }
                        %> 
                        </tbody> --%>
                      </table>
                    <!--Legal Table Section ends-->
                    </div>
                  </div>
                </div>
              </div>
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
    <!-- por mientras -->
   <!--  <form method="post" action="solicitudCompraALPStepRouting">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="criteriosEvaluacion"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form> -->

    <!-- Continue Float Button -->
    <form method="post" action="listaRequerimientoSolicitudCompraALPServlet">
      <div class="wrap-fixed-float wrap-fixed-bottom-right">
        <button
          id="submitButton"
          class="btn btn-primary btn-rounded shadow main-font"
        >
          CONTINUAR <i class="material-icons vm">arrow_forward</i>
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--Med Insumos Modal-->
    <div
      class="modal fade main-font"
      id="medInsumosModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Med Insumos starts-->
        <div id="medInsumosContent">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5" style="z-index: 0">
                <h1 class="mb-0 text-white">
                  LISTADO DE PRODUCTOS APROBADOS EN PROCESO DE COMPRA
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  SELECCIONE UN PRODUCTO
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
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--Med Insumos Table Section starts-->
                              <table
                                id="medInsumosTableParam"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de productos Estimados"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">ITEM</th>
                                    <th class="all">CODIGO ATC</th>
                                    <th class="all">CODIGO SESAL</th>
                                    <th class="all">PRODUCTO</th>
                                    <th class="all">UNIDAD DE PRESENTACION</th>
                                     <th class="all">DESCRIPCION TECNICA ACORDADA</th>
                                  </tr>
                                </thead>
                                </tbody></tbody>
                              </table>
                              <!--Med Insumos Table Section ends-->
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
              style="background-color: #f1f1f1"
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
        </div>
        <!--Med Insumos ends-->
      </div>
    </div>

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

    <!-- DELETE REG Modal -->
    <div class="modal fade " id="deleteModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
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
              <div class="modal-body main-font" id="deleteConfirMessage">
                &#191;ESTA SEGURO QUE DESEA ELIMINAR EL REGISTRO? ESTA ACCION ES IRREVERSIBLE
              </div>
              <div>
                <div class="row">
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="confirmDelModalButton"
                    >
                      SI <i class="material-icons md-18">done</i>
                    </button>
                  </div>
                  <div class="col-6 col-md-6">
                    <button 
                      class="btn btn-primary btn-block main-font"
                      id="exitModalButton"
                      data-dismiss="modal"
                    >
                      NO <i class="material-icons md-18">highlight_off</i>
                    </button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
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
    
    
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>

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

      var idEditar = "";
      var legalNumber = "";
      var codAtc = "";
      var nombreProducto = "";
      var up = "";
      var reqCant = "";
      var tiempoEntReq = "";
      var vidaUtilReq = "";
      var benfObs = "";
      var item = "";
      var codSesal = "";
      var descripcionTecnica = "";
      
      function cleanFields(){
          $("#offerNoID").prop("value", "");
          $("#nombreProducto").prop("value", "");        
          $("#up").prop("value", "");
          $("#codAtc").prop("value", "");
          $("#reqCant").prop("value", "");
          $("#tiempoEntReq").prop("value", "");
          $("#vidaUtilReq").prop("value", "");
          $("#descripcionTecnica").prop("value", "");
          $("#benfObs").prop("value", "");
          $("#idEditar").prop("value", "");
          
          
          idEditar = "";
          legalNumber = "";
          codAtc = "";
          codSesal = "";
          nombreProducto = "";
          up = "";
          reqCant = "";
          tiempoEntReq = "";
          vidaUtilReq = "";
          benfObs = "";
          item = "";
          descripcionTecnica = "";
        }
      $(document).ready(function () {
        /*Tabla de Modal de Ofertas Aprobadas*/

        var medInsumosTable = $("#medInsumosTableParam").DataTable({
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
          order: [[0, "asc"]],
        });

        /*Modal Select add info in Main Form*/
        $("#medInsumosTableParam tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");     
          
          $("#item").prop("value", $(this).find("td:eq(0)").text()); 
		  $("#codAtc").prop("value", $(this).find("td:eq(1)").text());           
          $("#codSesal").prop("value", $(this).find("td:eq(2)").text());
          $("#nombreProducto").prop("value", $(this).find("td:eq(3)").text());          
          $("#up").prop("value", $(this).find("td:eq(4)").text());      
          $("#descripcionTecnica").prop("value", $(this).find("td:eq(5)").text());      
          
        });

        $("#medInsumosModalButton").on("click", function (event) {
          event.preventDefault();
          var searchValue = $("#purchaseProc").val();          
          medInsumosTable.ajax.url(getAbsolutePath() + "ALPmedEstPureTableAPI?searchByBuyProcess=" + searchValue).load();
        });

        var reqTable = $("#reqTable").DataTable({
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
          order: [[1, "asc"]],
          dom: 'Bfrtip',
          buttons: [
               'excel'
          ],
        });
        
        reqTable.ajax.url(getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
        
        /*Modal Select add info in Main Form*/
        $("#reqTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");        
          idEditar =  $(this).find("td:eq(0)").text();          
          legalNumber =  $(this).find("td:eq(1)").text();
          item  =  $(this).find("td:eq(2)").text();
          codAtc = $(this).find("td:eq(3)").text();
          codSesal = $(this).find("td:eq(4)").text();
          nombreProducto = $(this).find("td:eq(5)").text();
          up = $(this).find("td:eq(6)").text();
          reqCant = $(this).find("td:eq(7)").text();          
          tiempoEntReq =  $(this).find("td:eq(8)").text();          
          vidaUtilReq =  $(this).find("td:eq(9)").text();
          benfObs =  $(this).find("td:eq(10)").text();         
        });
        
        $("#editRegButton").on("click", function (event) {
        	$("#idEditar").prop("value",  idEditar);
            $("#legalNumber").prop("value",  legalNumber);
            $("#codAtc").prop("value",  codAtc);
            $("#nombreProducto").prop("value",  nombreProducto);
            $("#up").prop("value",  up);
            $("#reqCant").prop("value",  reqCant);          
            $("#tiempoEntReq").prop("value",  tiempoEntReq);          
            $("#vidaUtilReq").prop("value",  vidaUtilReq);
            $("#benfObs").prop("value",  benfObs);   
            
            $("#confirmEditRegButton").removeClass("hide");
            $("#addRegButton").addClass("hide");
        });

        /*New Reg Button function*/

        $("#addRegButton").on("click", function (event) {
          event.preventDefault();

          if (
          $("#purchaseProc").prop("value") === "" ||
          $("#legalNumber").prop("value") === "" ||
          $("#nombreProducto").prop("value") === "" ||         
          $("#up").prop("value") === "" ||
          $("#codAtc").prop("value") === "" ||
          $("#reqCant").prop("value") === "" ||
          $("#tiempoEntReq").prop("value") === "" ||
          $("#vidaUtilReq").prop("value") === "" 
         	
        ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL NUEVO REQUERIMIENTO..."
            );
          } else {
        	  
        	  
        	  var url = getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?mode=verificarRequerimiento";
           	 //var url = getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?mode=new";
           	 console.log($("#newEditRegForm").serialize())
               console.log("Enviando...")
               $("#confirMessage").text("NUEVO REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
               $.ajax({
                 type: "POST",
                 url: url,
                 data: $("#newEditRegForm").serialize(),
                 success: function(data)          
                 {
                   console.log(data);
                   if (data === "existe"){
                   
                     
                     $("#confirMessage").text(
                       "ERROR! ESTE ITEM YA ESTA REGISTRADO PARA ESTA SOLICITUD"
                     );
                     $("#confirmationModalCenter").modal('show');
                     cleanFields();
                   }
                   else{
                     
                	   var url = getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?mode=new";
                    	 //var url = getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?mode=new";
                    	 console.log($("#newEditRegForm").serialize())
                        console.log("Enviando...")
                        $("#confirMessage").text("NUEVO REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
                        $.ajax({
                          type: "POST",
                          url: url,
                          data: $("#newEditRegForm").serialize(),
                          success: function(data)          
                          {
                            console.log(data);
                            if (data === "successful"){
                              //reqTable.ajax.url(getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                              reqTable.ajax.url(getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                              $("#confirMessage").text(
                                "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
                              );
                              $("#confirmationModalCenter").modal('show');
                              cleanFields();
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
        

        /*Edit Reg Button function*/

        $("#confirmEditRegButton").on("click", function (event) {
          event.preventDefault();

          if (
          $("#purchaseProc").prop("value") === "" ||
          $("#legalNumber").prop("value") === "" ||
          $("#nombreProducto").prop("value") === "" ||         
          $("#up").prop("value") === "" ||
          $("#codAtc").prop("value") === "" ||
          $("#reqCant").prop("value") === "" ||
          $("#tiempoEntReq").prop("value") === "" ||
          $("#vidaUtilReq").prop("value") === "" 
         	
        ) {
            $("#confirMessage").text(
              "ERROR! HAY CAMPOS REQUERIDOS VACIOS EN EL NUEVO REQUERIMIENTO..."
            );
          } else {
              var url = getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?mode=edit";
          	 //var url = getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?mode=new";
          	 console.log($("#newEditRegForm").serialize())
              console.log("Enviando...")
              $("#confirMessage").text("NUEVO REGISTRO: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
              $.ajax({
                type: "POST",
                url: url,
                data: $("#newEditRegForm").serialize(),
                success: function(data)          
                {
                  console.log(data);
                  if (data === "successful"){
                    //reqTable.ajax.url(getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                    reqTable.ajax.url(getAbsolutePath() + "productoSolicitudCompraALPAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                    $("#confirMessage").text(
                      "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
                    );
                    $("#confirmationModalCenter").modal('show');
                    cleanFields();
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
              $("#confirmEditRegButton").addClass("hide");
              $("#addRegButton").removeClass("hide")
            }
        });

        /*Delete Reg Function*/

        $("#confirmDelModalButton").on("click", function (event) {
          event.preventDefault();
          var url = getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?mode=delete";
          console.log("Enviando...")
          $("#confirMessage").text("BORRAR REGISTRO: EN PROCESO, POR FAVOR ESPERE...");
          $("#deleteModalCenter").modal('hide');
          $("#confirmationModalCenter").modal('show');
          $.ajax({
            type: "POST",
            url: url,
            data: $("#newEditRegForm").serialize(),
            success: function(data)          
            {
              console.log(data);
              if (data === "successful"){
                reqTable.ajax.url(getAbsolutePath() + "ALPManageReqOffersForSCAPI" + "?purchaseProc=" + $("#purchaseProc").val()).load();
                $("#confirMessage").text(
                  "EXITOSO! REGISTRO ELIMINADO CORRECTAMENTE"
                );
                $("#confirmationModalCenter").modal('show');
                cleanFields();
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

      });

      $("#resetInputsButton").on("click", function (event) {
        event.preventDefault();
        cleanFields();
        $("#confirmEditRegButton").addClass("hide");
        $("#addRegButton").removeClass("hide");
      });

     
      
     
      
      $('input[name=vidaUtilReq]').bind('keypress', function(event) {
    	  var regex = new RegExp("^[a-zA-Z0-9 ]+$");
    	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    	  if (!regex.test(key)) {
    	    event.preventDefault();
    	    return false;
    	 }
    	});
      
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
      
      $('input[name=reqCant]').bind('keypress', function(event) {
    	  var regex = new RegExp("^[0-9]+$");
    	  var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
    	  if (!regex.test(key)) {
    	    event.preventDefault();
    	    return false;
    	 }
    	});
      
    </script>
    <!-- Java Script section ends -->
  </body>
</html>
