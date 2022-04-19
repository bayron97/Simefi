<%@ page language="java" contentType="text/html"%>
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	//Retrieve your list from the request, with casting
  ArrayList<oficioSolicitudCompraALP> oficiosList = (ArrayList<oficioSolicitudCompraALP>) request.getAttribute("oficiosList");
  ArrayList<beneficiarioFinal> benfList = (ArrayList<beneficiarioFinal>) request.getAttribute("benfList");
  ArrayList<vaciadoOfertasALP> purchaseActiveList = (ArrayList<vaciadoOfertasALP>) request.getAttribute("purchaseActiveList");
  ArrayList<descripcioncompra> purchaseDescList = (ArrayList<descripcioncompra>) request.getAttribute("purchaseDescList");
  ArrayList<ofertaALP> procesosCompra = (ArrayList<ofertaALP>) request.getAttribute("procesosCompra");

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

	<style>
		#legalTable th:nth-child(1){
			   display: none;
			}
		#legalTable td:nth-child(1){
			   display: none;
			}
	</style>
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
                <form method="post" action="solicitudCompraALPStepRouting">
                <input type="submit" class="hide" id="criteriosEvaluacionRoute" name="submit" value="criteriosEvaluacion">
                <input type="submit" class="hide" id="listaRequerimientoRoute" name="submit" value="listaRequerimiento">
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
                      <a type="button" class="dropdown-item active" href="#"
                        >DATOS GENERALES</a
                      >
                      <label class="dropdown-item" for="criteriosEvaluacionRoute">
                        CRITERIOS DE EVALUACION
                      </label>
                      <label class="dropdown-item" for="listaRequerimientoRoute">
                        LISTA DE REQUERIMIENTO
                      </label>
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
                      <a class="nav-link active" href="#">DATOS GENERALES</a>
                    </li>                    
                    <li class="nav-item">
                      <label class="nav-link" for="listaRequerimientoRoute">LISTA DE REQUERIMIENTO</label>
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
            <form id="newEditRegForm" action="solicitudCompraALPServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" name="id" value="${codPadreSolCompra}">
              <input type="hidden" id="accionRealizar" name="accionRealizar" value="<%=funcion %>" />
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <div class="row">
                    <div class="col-lg-12 col-md-12">
                      <h5
                        id="instructionSubtitle"
                        class="mb-3 text-center float-left"
                        style="font-weight:bold;"
                      >
                        1) DATOS GENERALES
                      </h5>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>1.1) BENEFICIARIO*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                
                       <%-- <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="benef"
                        name="benef"
                        value="${beneficiarioTemp}"
                        required
                        
                        <%=openMode%>
                      />  --%>
                  
                       <select
                        autocomplete="off"
                        class="form-control"
                        id="benef"
                        name="benef"
                        <%=openMode%>
                      >
                        <%
                          String benefGuardado = (String)request.getAttribute("benefGuardado");
                          for(beneficiarioFinal beneficiario : benfList){
                            if (benefGuardado != null && benefGuardado.equalsIgnoreCase(beneficiario.getBeneficiarioFinal()))
                            {
                        %>
                          <option value="<%=beneficiario.getBeneficiarioFinal().toUpperCase()%>" selected>
                            <%=beneficiario.getBeneficiarioFinal().toUpperCase()%>
                          </option>
                        <%
                            } 
                            else
                            {
                        %>
                          <option value="<%=beneficiario.getBeneficiarioFinal().toUpperCase()%>">
                            <%=beneficiario.getBeneficiarioFinal().toUpperCase()%>
                          </option>
                        <%
                            }
                          }
                        %>
                      </select>                                        
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>1.2) NO. DE SOLICITUD DE COMPRA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="noCorrelativoSolicitud"
                        name="noCorrelativoSolicitud"
                        value="${noSolCompra}"
                        required                        
                        <%=openMode%>
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>1.3) FECHA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <input
                        autocomplete="off"
                        type="date"
                        class="form-control"
                        id="fechaSolicitud"
                        name="fechaSolicitud"
                        value="${fecha}"
                        required
                        <%=openMode%>
                      />
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>1.4) NO. PROCESO DE COMPRA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                    <%--  <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="noProcesoCompraRecomendado"
                        name="noProcesoCompraRecomendado"
                        value="${proCompra}"
                        required
                        <%=openMode%>
                      />  --%>
                        <select
                        autocomplete="off"
                        class="form-control"
                        id="noProcesoCompraRecomendado"
                        name="noProcesoCompraRecomendado"
                        required
                        <%=openMode%>
                      >
                        <%
                          String noProcesoCompraGuardado = (String)request.getAttribute("noProcesoCompraGuardado");
                          for(ofertaALP noProcesoCompra : procesosCompra){
                            if (noProcesoCompraGuardado != null && noProcesoCompraGuardado.equalsIgnoreCase(noProcesoCompra.getProcesoCompra()))
                            {
                        %>
                          <option value="<%=noProcesoCompra.getProcesoCompra().toUpperCase()%>" selected>
                            <%=noProcesoCompra.getProcesoCompra().toUpperCase()%>
                          </option>
                        <%
                            } 
                            else
                            {
                        %>
                          <option value="<%=noProcesoCompra.getProcesoCompra().toUpperCase()%>">
                            <%=noProcesoCompra.getProcesoCompra().toUpperCase()%>
                          </option>
                        <%
                            }
                          }
                        %>
                      </select>  
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>1.5) DESCRIPCION DE COMPRA*</label>
                    </div>
                    <div class="col-lg-8 col-md-8">
                      <select
                        autocomplete="off"
                        class="form-control"
                        id="descripcionCompra"
                        name="descripcionCompra"
                        required
                        <%=openMode%>
                      >
                        <%
                          String descripcionCompraGuardado = (String)request.getAttribute("descripcionCompraGuardado");
                          for(descripcioncompra descripcionCompraSC : purchaseDescList){
                            if (descripcionCompraGuardado != null && descripcionCompraGuardado.equalsIgnoreCase(descripcionCompraSC.getNombreCompra()))
                            {
                        %>
                          <option value="<%=descripcionCompraSC.getNombreCompra().toUpperCase()%>" selected>
                            <%=descripcionCompraSC.getNombreCompra().toUpperCase()%>
                          </option>
                        <%
                            } 
                            else
                            {
                        %>
                          <option value="<%=descripcionCompraSC.getNombreCompra().toUpperCase()%>">
                            <%=descripcionCompraSC.getNombreCompra().toUpperCase()%>
                          </option>
                        <%
                            }
                          }
                        %>
                      </select>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-12 col-md-12">
                      <h5>1.6) OFICIOS*</h5>
                    </div>
                  </div>
                  <div class="row mt-3">
                    <div class="col-lg-4 col-md-4">
                      <label>NO. DE OFICIO*</label>
                      <input
                        autocomplete="off"
                        type="text"
                        class="form-control"
                        id="legalFileNo"
                        <%=openMode%>
                      />
                    </div>
                    <div class="col-lg-4 col-md-4">
      
                      <button
                        autocomplete="off"
                        type="button"
                        class="btn btn-success mt-4"
                        id="addLegalButton"
                        <%=openMode%>
                      >
                        AGREGAR OFICIO
                      </button>
                       
                    </div>
                    <div class="col-lg-4 col-md-4">
                     
                    </div>
                  </div>
                  <div class="row mt-3 mb-4">
                    <div class="col-lg-12 col-md-12">
                    <!--Legal Table Section starts-->
                      <table
                        id="legalTable"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de Oficios"
                      >
                        <thead>
                          <tr>
                            <th class="all">NO.</th>
                            <th class="min-tablet">NO. OFICIO</th>
                            <th class="min-tablet">OFICIO CARGADO</th>
                          </tr>
                        </thead>
                        <tbody>
                        <%
                          if (oficiosList != null)
                          {
                            for(oficioSolicitudCompraALP oficio : oficiosList){
                        %>
                            <tr>
							                <td>-1</td>
							                <td><%=oficio.getNoOficio()%></td>
							                <td><a href="assets/files/purchaseRequestALPFiles/${noSolCompra}/legalFiles/<%=oficio.getNombreDocumento()%>" target="_blank"><%=oficio.getNombreDocumento()%></td>
						                </tr>
                        <%
                            }
                          }
                        %>
                        </tbody>
                      </table>
                    <!--Legal Table Section ends-->
                    </div>
                  </div>
                </div>
              </div>
              
    <div class="row">
       <div class="col-lg-12 col-md-12">
       <div class="form-group float-left">
       <button  class="btn btn-sm btn-success ml-3" data-target="#CriteriosEvalaucionModal" data-toggle="modal"
       type = "button" id="CriteriosEvaluacionParamModalButton"><i class="material-icons md-18">list</i>
       		    CRITERIOS DE EVALUACION PARA <br/> VACIADO DE OFERTAS
             </button>
           </div>
          </div>
     </div>
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
      <div class="modal-dialog modal-dialog-scrollable" style="max-width: 100%;padding-left: 15%;padding-right: 15%;" role="document">
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
                        SELECCIONE LOS CRITERIOS DE EVALUACION PARA SOLICITUD DE COMPRA:
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
                        <%
                        ArrayList<CriterioEvaluacionDTO> Criterios = (ArrayList<CriterioEvaluacionDTO>) request.getAttribute("criterios");
                          if (Criterios != null)
                          {
                            for(CriterioEvaluacionDTO criterio : Criterios){                           	             
                         %>
                            <tr>                            
                            <td><%=criterio.getIdCE()%></td>
                            <td><%=criterio.getNombreCriterio().toUpperCase()%></td>
							    <td>
							    <% if(criterio.getEstado() == true){							    	
							    %>
							    	<input <%=openMode%> type="checkbox" checked/>							    	
							    	<%
							    }else{
							    	%>
							    	<input <%=openMode%> type="checkbox" />							    	
							    	<%							    	
							    } 
							    %>							    
							    </td>
							    </tr>
                        <%
                            }
                          }
                        %>
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
                      <%=openMode%>
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
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
              
              <!--Submit section starts-->
              <div class="wrap-fixed-float wrap-fixed-bottom-right">
                 <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  ></button>
                <button
                  id="submitButton"
                  class="btn btn-primary btn-rounded shadow main-font"
                  type="button"
                  value="continuaras"
                >
                  <%if(!funcion.equalsIgnoreCase("CONSULTAR")) {
                	 %>
                	 <span id="submitButtonText">GUARDAR Y CONTINUAR </span>
                	 <% }else{
                		 %>
                		 <span id="submitButtonText">CONTINUAR </span>
                		 <% 
                	 }%>
                  <i class="material-icons vm">done</i>
                </button>
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
    <form method="post" action="solicitudCompraALPStepRouting">
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
    
      "use strict";
      $(document).ready(function () {
          
    	/*Tabla de Oficios Subidos*/
        var lTable = $("#legalTable").DataTable({
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
    	
    	
        var reqTableCriterio = $("#criteriosEvalaucionTableParam").DataTable({
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
              [-1],
              ["Todos"],
            ],
            order: [[0, "asc"]],
          }); 
    	
        var archivos="";
        var contador=-1;
        $("#addLegalButton").click(function () {
        	if($("#legalFileNo").val()){
            	contador++;
           		var container = document.getElementById("newEditRegForm")
            	var inputPT = document.createElement("input");
           	 	inputPT.setAttribute("type", "file");
            	inputPT.setAttribute("name", "oficioFiles_"+contador);
            	inputPT.setAttribute("id", "oficioFiles_"+contador);
            	inputPT.setAttribute("style","display:none");
            	container.appendChild(inputPT);
            	$("#oficioFiles_"+contador).trigger('click');
            	var solicitudcompra="${noSolCompra}";
            
            	var numReg = lTable.rows().count();
            	var x = document.createElement('td');
           		var y = document.createElement('td');
            	var z = document.createElement('td');
            	x.innerHTML = $("#legalFileNo").val().toUpperCase();
            	y.innerHTML = solicitudcompra+"_"+$("#legalFileNo").val()+".pdf"; 
            	z.innerHTML =contador;

           	 	lTable.row.add([contador, 
           	 					$("#legalFileNo").val().toUpperCase(), 
           	 					solicitudcompra+"_"+$("#legalFileNo").val().toUpperCase()+".pdf"]).draw();
            
            	$("#legalFileNo").val("");
            
            	$("#oficioFiles_"+contador).change(function(){
      		  	if(!this.files.length == 0){
      				  $("#archivos").val("HAYARCHIVO");
      		 	}
      		 	else{
      			  $("#archivos").val("NOHAYARCHIVO");
      		  	}   
      	  		});
        	}
        	else{
        		alert("INGRESE UN NUMERO DE OFICIO");
        	}
        });
        
        $("#submitButton").click(function (){
        	if(document.getElementById("accionRealizar").value == "NUEVO"){
       
        	$.post('SolicitudCompraALPAPI', {
          	  noCorrelativoSolicitud : document.getElementById("noCorrelativoSolicitud").value,
          	  noProcesoCompraRecomendado : document.getElementById("noProcesoCompraRecomendado").value,            		  
          	  accion: "VerificarNoSolicitud"
      			}, function(responseText) {
      				console.log("responseText "+ responseText)
      				if(responseText == "0"){
      					var container = document.getElementById("newEditRegForm");
      		        	if(lTable.data().any()){
      		  		    	for (var r = 0, n = lTable.rows().count(); r < n; r++) {
      		                var cell = lTable.row(r).data();
      		                
      		                	var inputPT = document.createElement("input");
      					        inputPT.setAttribute("type", "hidden");
      					        inputPT.setAttribute("name", "idArchivo");
      					        inputPT.setAttribute("value", cell[0]);
      					        container.appendChild(inputPT);
      					        
      					        var inputBF = document.createElement("input");
      		  			        inputBF.setAttribute("type", "hidden");
      		  			        inputBF.setAttribute("name","noOficio");
      		  			      	inputBF.setAttribute("value",cell[1]);
      		  			      	container.appendChild(inputBF);
      					        
      		  		         	var inputPT = document.createElement("input");
      		  			        inputPT.setAttribute("type", "hidden");
      		  			        inputPT.setAttribute("name", "oficioNombre");
      		  			        inputPT.setAttribute("value", cell[2]);
      		  			        container.appendChild(inputPT);
      		  			        
      		  			        
      		  		    	}
      		  		    }
      		        	
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
      		 		     
      		 		      	
      		 		    	var inputBF = document.createElement("input");
      		 		        inputBF.setAttribute("type", "hidden");
      		 		        inputBF.setAttribute("name","NombreCriterio");
      		 		      	inputBF.setAttribute("value", $(this).find( "td:last" ).html());
      		 		      	container.appendChild(inputBF);           	  
      		 		      	    			  
      		             });  
      		        	
      		        	
      		        	document.getElementById("submit").value = document.getElementById("submitButton").value;
      		        	document.getElementById("submit").click();
      				}else{
      					alert("ESTE NO SOLICITUD COMMPRA YA ESTA EN USO PARA ESTE PROCESO")
      				}
      			}
      		  );
           
        	}else{
        		var container = document.getElementById("newEditRegForm");
		        	if(lTable.data().any()){
		  		    	for (var r = 0, n = lTable.rows().count(); r < n; r++) {
		                var cell = lTable.row(r).data();
		                
		                	var inputPT = document.createElement("input");
					        inputPT.setAttribute("type", "hidden");
					        inputPT.setAttribute("name", "idArchivo");
					        inputPT.setAttribute("value", cell[0]);
					        container.appendChild(inputPT);
					        
					        var inputBF = document.createElement("input");
		  			        inputBF.setAttribute("type", "hidden");
		  			        inputBF.setAttribute("name","noOficio");
		  			      	inputBF.setAttribute("value",cell[1]);
		  			      	container.appendChild(inputBF);
					        
		  		         	var inputPT = document.createElement("input");
		  			        inputPT.setAttribute("type", "hidden");
		  			        inputPT.setAttribute("name", "oficioNombre");
		  			        inputPT.setAttribute("value", cell[2]);
		  			        container.appendChild(inputPT);
		  			        
		  			        
		  		    	}
		  		    }
		        	
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
		 		     
		 		      	
		 		    	var inputBF = document.createElement("input");
		 		        inputBF.setAttribute("type", "hidden");
		 		        inputBF.setAttribute("name","NombreCriterio");
		 		      	inputBF.setAttribute("value", $(this).find( "td:last" ).html());
		 		      	container.appendChild(inputBF);           	  
		 		      	    			  
		             });  
		        	
		        	
		        	document.getElementById("submit").value = document.getElementById("submitButton").value;
		        	document.getElementById("submit").click();
        	}
         	
        });
        
        
        function saveData() {
        	
		}
        
        
      });

      $("#benef").on("change", function (){
        var element = $(this);

        var jsonTest = {
              "1": "TEST 1 - NO USAR",
              "2": "TEST 2 - NO USAR",
            };
    	  $.post('#', {
				  search : element.val(),
			  },
        function(responseText) {
          var count = 0;
          //$("#noProcesoCompraRecomendado").empty();
          for (let value in responseText) {
            if (jsonTest.hasOwnProperty(value))
            {
              $("#noProcesoCompraRecomendado").append("<option value='"+ jsonTest[value] +"' >"+ jsonTest[value] +"</option>");
              count++;
            }
          }

          if (count === 0)
          {
            $("#noProcesoCompraRecomendado").append("<option value='NINGUNO' disabled>NINGUN PROCESO DE COMPRA ASOCIADO</option>");
          }
			  });
      });
    </script>
    <!-- Java Script section ends -->
  </body>
</html>
