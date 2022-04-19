<%@page import="main.model.Gral_controlGarantias"%>
<%@page import="main.model.Gral_aperturaProceso"%>
<%@page import="java.util.ArrayList"%>
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
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <%
            /* String read = (String)session.getAttribute("read"); */
            String disable = (String)session.getAttribute("disable"); 
            String accion = (String)session.getAttribute("accion");
            System.out.println("accion 2 " + accion);
          /*   String func = (String)session.getAttribute("funcion"); */
            /* int cod = (Integer)session.getAttribute("procesocompra"); */
            /* int idControlGarantias = (int)session.getAttribute("idControlGarantias"); */
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTROL DE GARANTIAS
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO GENERAL
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-5">
	              <h4 class="text-white font-weight-light ml-2 mr-3">
	              <% if (accion.toUpperCase().contentEquals("NUEVO") && accion != null) {%>
	                <i class="material-icons vm">add_circle</i>
	              <% } else if (accion.toUpperCase().contentEquals("MODIFICAR") && accion != null) {%>
	                <i class="material-icons vm">edit</i>
	              <% } else if (accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
	                <i class="material-icons vm">chrome_reader_mode</i>
	              <% } else if (accion.toUpperCase().contentEquals("REVISAR") && accion != null) {%>
	                <i class="material-icons vm">done_all</i>
	              <% } else {%>
	                <i class="material-icons vm">error</i>
	              <% } %>
	                <%=accion.toUpperCase()%>
	              </h4>
	            </span>
            </div>
          </div>
          <form id="formControlGarantias" action="Gral_controlGarantiasServlet" method="post" enctype="multipart/form-data">
            <div class="card border-0 shadow-sm mb-4 main-content-div">
              <div class="card-header border-0 bg-none">
                <div class="card-body">
                  <div class="col-md-12">
                    <div id="dataSection">
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group">
                              <!-- <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <label class="float-left">GARANTIA DE CUMPLIMIENTO Y CALIDAD</label>
                                </div>
                              </div> -->
                              <!--Inputs Section starts-->
                               <h6>I. DATOS GENERALES</h6>
                               <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>TIPO GARANTIA</label>
                                    <input type="hidden" name="tGarantia" id="tGarantia" value="${tipoGarantia}" /> 
                                    <select
                                      autocomplete="off"
                                      class="form-control"
                                      id="tipoGarantia"
                                      name="tipoGarantia"
                                      required
                                      <%=disable%>
                                    >
                                      <option selected disabled value="">SELECCIONA UNA OPCION...</option>
                                      <option value="GARANTIA DE SOSTENIMIENTO DE OFERTA">GARANTIA DE SOSTENIMIENTO DE OFERTA</option>
                                      <option value="GARANTIA DE CUMPLIMIENTO">GARANTIA DE CUMPLIMIENTO</option>
                                      <option value="GARANTIA DE CALIDAD">GARANTIA DE CALIDAD</option>
                                      <option value="GARANTIA DE CUMPLIMIENTO Y CALIDAD">GARANTIA DE CUMPLIMIENTO Y CALIDAD</option>
                                    </select>
                                  </div>
                                </div>
                              </div>     
                              
                              
                               <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                  <input type="hidden" name="tDocumento" id="tDocumento" value="${tipoDocumento}" /> 
                                    <label>TIPO DOCUMENTO</label>
                                    <select
                                      autocomplete="off"
                                      class="form-control"
                                      id="tipoDocumento"
                                      name="tipoDocumento"
                                      required
                                      <%=disable%>
                                    >
                                      <option selected disabled value="">SELECCIONA UNA OPCION...</option>
                                      <option value="GARANTIA BANCARIA">GARANTIA BANCARIA</option>
                                      <option value="FIANZA">FIANZA</option>
                                      <option value="MANIFIESTO">MANIFIESTO</option>
                                      <option value="GARANTIA DE CUMPLIMIENTO Y CALIDAD">OTRAS GARANTIAS</option>
                                    </select>
                                  </div>
                                </div>
                              </div> 
                              
                              <div class="row">
                                          <div class="col-lg-12 col-md-12">
                                            <div class="float-left">
                                            <label for="esEnmienda">HACER ENMIENDA A UNA GARANTIA</label>
                                              <input
                                                autocomplete="off"
                                                type="checkbox"
                                                class="form-control"
                                                id="esEnmienda" 
                                                name="esEnmienda"
                                                
                                              />
                                              
                                            </div>
                                          </div>
                                        </div>
                                        <br>   
                              
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">   
                                  <input type="hidden" id="idControlGarantias" name="idControlGarantias" value="${idControlGarantias}"/>                              
                                    <label>ENMIENDA GARANTIA</label>
                                    <%if(accion.contentEquals("nuevo")){
                        	  %>
                        	  <select autocomplete="off" 
                        	 		  class="form-control" 
                        	 		  id="numGarantiaEnmienda" 
                        	 		  name="numGarantiaEnmienda" 
                        	 		  disabled
                        	 		  
                        	 		   <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                     <%ArrayList<Gral_controlGarantias> procesoList = (ArrayList<Gral_controlGarantias>) request.getAttribute("garantiasList");
                                        if (procesoList != null){
                                              for(Gral_controlGarantias proceso : procesoList){%>
                                       			  <option value="<%=proceso.getNumGarantia()%>"><%=proceso.getNumGarantia().toUpperCase()%></option>
                                       	<%}};%>
                                        </select>                       	                         	  
                        	  <%}else{ %>
                        		  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numGarantiaEnmienda" 
			                      		 name="numGarantiaEnmienda" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${numGarantiaEnmienda}"/>   
                        		  <%}%> 
                                      
                                  </div>
                                </div>
                              </div> 
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">   
                                                              
                                    <label>BENEFICIARIO</label>
                                    <%if(accion.contentEquals("nuevo")){
                        	  %>
                        	  <select autocomplete="off" 
                        	 		  class="form-control" 
                        	 		  id="idBeneficiario" 
                        	 		  name="idBeneficiario" 
                        	 		  required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                                     <%ArrayList<Gral_aperturaProceso> procesoList = (ArrayList<Gral_aperturaProceso>) request.getAttribute("beneficiarioAperturaList");
                                        if (procesoList != null){
                                              for(Gral_aperturaProceso proceso : procesoList){%>
                                       			  <option value="<%=proceso.getIdBeneficiario()%>"><%=proceso.getbeneficiario().toUpperCase()%></option>
                                       	<%}};%>
                                        </select>                       	                         	  
                        	  <%}else{ %>
                        		  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="beneficiario" 
			                      		 name="beneficiario" 
			                      		 readonly="readonly"
			                      		 class="form-control" 
			                      		 value="${beneficiario}"/>   
                        		  <%}%> 
                                      
                                  </div>
                                </div>
                              </div>
                              
                              
                             
                                                      
                                                     
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">
                                    
                                    <input type="hidden" id="procesocompracod" name="numeroProcesoCompra" value="${procesocompracod}"/>
                                    <input type="hidden" id="myfileName" name="myfileName" value="${myfile}"/>
                                    <label>NO. PROCESO DE COMPRA</label>
                                    
                                    <%if(accion.contentEquals("nuevo")){%>
                          <select autocomplete="off" 
                        	 		 class="form-control" 
                        	 		 id="idAperturaProceso" 
                        	 		 name="idAperturaProceso" 
                        	 		 required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                         </select>    
                          <%}else{%>
                           <input type="hidden" id="idAperturaProceso" name="idAperturaProceso" value="${idAperturaProceso}"/>   
                        	  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numProcesoCompra" 
			                      		 name="numProcesoCompra" 
			                      		 class="form-control" 
			                      		 value="${numProcesoCompra}"/>  
                           <%}%>
                                      
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>NO. ORDEN DE COMPRA/CONTRATO</label>
                                    
                                     <%if(accion.contentEquals("nuevo")){%>
                          <select autocomplete="off" 
                        	 		 class="form-control" 
                        	 		 id="idcontratoOrdenCompra" 
                        	 		 name="idcontratoOrdenCompra" 
                        	 		 required <%=disable%>>
                                     <option  value = "NINGUNO">SELECCIONA UNA OPCION...</option>
                         </select>    
                          <%}else{%>
                           <input type="hidden" id="idcontratoOrdenCompra" name="idcontratoOrdenCompra" value="${idcontratoOrdenCompra}"/>   
                        	  <input type="text" 
			                      		 readonly="readonly"
			                      		 id="numDocumento" 
			                      		 name="numDocumento" 
			                      		 class="form-control" 
			                      		 value="${numDocumento}"/>  
                           <%}%>
                                  </div>
                                </div>
                              </div>
                              
                               <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                  <input type="hidden" name="mCompra" id="mCompra" value="${monedaCompra}" /> 
                                    <label>MONEDA DE COMPRA</label>
                                    <select autocomplete="off" class="form-control" id="monedaCompra" name="monedaCompra">
				                            <option selected disabled value="">SELECCIONA UNA OPCION...</option>
				                            <option value="USD">DOLARES AMERICANOS (USD)</option>
				                            <option value="L">LEMPIRAS (LPS.)</option>
				                          </select>
                                  </div>
                                </div>
                              </div>
                              
                               <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>FECHA FIRMA ORDEN DE COMPRA/CONTRATO</label>
                                    <input type="date" id="fechaFirma" required value="${fechaFirma}" name="fechaFirma" class="form-control" />
                                    
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>PRECIO CONTRATADO</label>
                                    <input type="text" id="precioTotal" required value="${precioTotal}" name="precioTotal" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>NOMBRE INSTITUCION FINANCIERA</label>
                                    <input type="text" id="nombreInstitucionFinanciera" required value="${nombreInstitucionFinanciera}" name="nombreInstitucionFinanciera" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                               <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                  
                                    <label>NO. DE GARANTIA</label>
                                    <input type="text" id="numGarantia" required value="${numGarantia}" name="numGarantia" class="form-control"/>
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                   <div class="form-group" style="text-align: left">
                                   <input type="hidden" name="mGarantia" id="mGarantia" value="${monedaGarantia}" /> 
				                          <label>MONEDA DE LA GARANTIA</label>
				                          <select autocomplete="off" class="form-control" id="monedaGarantia" name="monedaGarantia">
				                            <option selected disabled value="">SELECCIONA UNA OPCION...</option>
				                            <option value="USD">DOLARES AMERICANOS (USD)</option>
				                            <option value="L">LEMPIRAS (LPS.)</option>
				                          </select>
				                        </div>
                                </div>
                              </div>
                              
                              
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>TASA DE CAMBIO</label>
                                    <input type="text" id="tasaCambio"  
                                    value="${tasaCambio}" 
                                    name="tasaCambio"  
                                    class="form-control validanumericos decimales" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>VALOR DE GARANTIA</label>
                                    <input type="text" id="valorGarantia" required value="${valorGarantia}" name="valorGarantia" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">                                  
                                    <label>PROVEEDOR</label>
                                   <input id="proveedor" name="proveedor" required value="${proveedor}"  type="text" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group">                                  
                                    <label>USUARIO RESPONSABLE</label>
                                   <input id="usuarioResponsable" name="usuarioResponsable" required value="${usuarioResponsable}"  type="text" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <h6>II. DATOS DE VIGENCIA</h6>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>FECHA DE EMISION</label>
                                    <input id="fechaEmision" name="fechaEmision" required value="${fechaEmision}"  type="date" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>PERIODO DE VALIDEZ</label>
                                    <div class="form-group row">
                                      <label for="inputEmail3" class="col-sm-4 col-form-label">INICIANDO EL</label>
                                      <div class="col-sm-8">
                                        <input type="date" required value="${fechaInicioValidez}" id="fechaInicioValidez" name="fechaInicioValidez" class="form-control" >
                                      </div>
                                    </div>
                                    <div class="form-group row">
                                      <label for="inputEmail3" class="col-sm-4 col-form-label">Y FINALIZANDO EL</label>
                                      <div class="col-sm-8">
                                        <input type="date" id="fechaFinValidez" required value="${fechaFinValidez}" name="fechaFinValidez" class="form-control" />
                                      </div>
                                    </div>
                                    
                                    <div class="form-group row">
                                      <label for="inputEmail3" class="col-sm-4 col-form-label">HORA DE VENCIMIENTO</label>
                                      <div class="col-sm-8">
                                        <input autocomplete="off" type="time" class="form-control" id="horaVencimiento" name="horaVencimiento" placeholder="" value="${horaVencimiento}" />
                                      </div>
                                    </div>
                                    
                                    
                                  </div>
                                </div>
                              </div>
                             
                              
                              <h6>III. DATOS DE NOTIFICACION</h6>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>DIAS DE ANTICIPACION DE ALERTA (DIAS HABILES)</label>
                                    <input type="number" id="diasAnticipacion" required value="${diasAnticipacion}" name="diasAnticipacion" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 1</label>
                                    <input type="email" id="correo1"  value="${correo1}" name="correo1" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 2</label>
                                    <input type="email" id="correo2" value="${correo2}" name="correo2" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 3</label>
                                    <input type="email" id="correo3" value="${correo3}" name="correo3" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 4</label>
                                    <input type="email" id="correo4" value="${correo4}" name="correo4" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 5</label>
                                    <input type="email" id="correo5" value="${correo5}" name="correo5" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>CORREO 6</label>
                                    <input type="email" id="correo6" value="${correo6}" name="correo6" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              
                              <div class="row">
                                <div class="col-lg-12 col-md-12">
                                  <div class="form-group"> 
                                    <label>OBSERVACIONES</label>
                                    <input type="text" id="observaciones" value="${observaciones}" name="observaciones" class="form-control" />
                                  </div>
                                </div>
                              </div>
                              <!--Inputs Section ends-->
                            </div>
                          </div>
                          
                          <div class="col-lg-6 col-md-6">
                            <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" for="myfile" id="myDropzone" style="height:650px;">
                              <div class="col-lg-12 col-md-12">
                                <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                                  <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                                  <p>
                                    SELECCIONE EL ARCHIVO A PREVISUALIZAR
                                  </p>
                                  <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
                                       <input type="file" id="myfile" name="myfile" required>
                                  <%} %>
                                </div>
                                <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                                  height="520" class="container-fluid hide">
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
            
            <% if (!accion.toUpperCase().contentEquals("CONSULTAR") && accion != null) {%>
    <!-- Submit Button -->
    <div class="wrap-fixed-float wrap-fixed-bottom-right">
      <button
        id="submitExternalButton"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
        form="formControlGarantias"
      >
        GUARDAR
        <i class="material-icons vm">done</i>
      </button>
    </div>
    <% } %>
            
          </form>
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
    <form id="back" method="post" action="controlGarantiasGeneral.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="backwardApertura"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

    

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

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
      $(document).ready(function () {
    	  
        <% if (!accion.toUpperCase().contentEquals("NUEVO") && accion != null) {%>
	        var nombreDocumento = "${nombreDocumento}";
	        if (nombreDocumento === "")
	        {
	          $("#previewDocumentInput").addClass("hide");
	          $("#previewDocumentInput").prop("src", "");
	          $("#myfile").prop("required", true);
	        }
	        else{
	          var ruta = getAbsolutePath() + "assets/files/warrantyControlFiles/" + nombreDocumento;
	          $("#previewDocumentInput").prop("src", ruta);
	          $("#previewDocumentInput").removeClass("hide");
	          $("#myfile").prop("required", false);
	        }
	        
	        var ordencomprainput = $("#ordencompra");
	        var ordencompravariable="${ordencompra}";
	        ordencomprainput.append('<option selected value="' + ordencompravariable + '">' + ordencompravariable + '</option>');
	        $("#myfile").prop('required',false);
	       /*  $('#tipogarantia > option[value="${tipogarantia}"]').attr('selected', 'selected'); */
	       
	        var options = document.getElementById("tipoGarantia").options;
      	  	for (var i = 0; i < options.length; i++) {
      	    	if (options[i].value ==  document.getElementById("tGarantia").value) {
      	      	options[i].selected = true;
      	      	break;
      	    	}
      	  	}
      	  	
      	  var options = document.getElementById("tipoDocumento").options;
    	  	for (var i = 0; i < options.length; i++) {
    	    	if (options[i].value ==  document.getElementById("tDocumento").value) {
    	      	options[i].selected = true;
    	      	break;
    	    	}
    	  	}
    	  	
    	  	 var options = document.getElementById("monedaCompra").options;
     	  	for (var i = 0; i < options.length; i++) {
     	    	if (options[i].value ==  document.getElementById("mCompra").value) {
     	      	options[i].selected = true;
     	      	break;
     	    	}
     	  	}
     	  	
     	  	var options = document.getElementById("monedaGarantia").options;
     	  	for (var i = 0; i < options.length; i++) {
     	    	if (options[i].value ==  document.getElementById("mGarantia").value) {
     	      	options[i].selected = true;
     	      	break;
     	    	}
     	  	}
	        
        <%}%>
        
      });
      
      
      /* $("#beneficiario").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var ordencomprainput = $("#procesocompra");
	        var combo = document.getElementById("beneficiario");
		    var selected = combo.options[combo.selectedIndex].text;
		   	
	        // Guardamos el select de procesocomprainput
	        var procesocomprainput = $(this);
	
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "procesosCompraByBenediciarioGeneralAPI" + "?submit="+"&beneficiario="+selected;
	           
	        	$.ajax({
	                //data: { id : procesocomprainput.val() },
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                    procesocomprainput.prop('disabled', true);
	                },
	                success:  function (r) 
	                {
	                	var m=r.split("SEPARAR");
	                    procesocomprainput.prop('disabled', false);
	                    ordencomprainput.prop('disabled', false);
	                    // Limpiamos el select
	                    ordencomprainput.find('option').remove();
	                    ordencomprainput.append('<option>SELECCIONE UNA OPCION...</option>');

	                    $(m).each(function(i, v){ // indice, valor
		                	
		                	if(m[i]!=''){
	                        ordencomprainput.append(m[i]);
	                        console.log(m[i])
		                	}
	                    })
	
	                    ordencomprainput.prop('disabled', false);
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    procesocomprainput.prop('disabled', false);
	                }
	            });
	        }
	        else
	        {
	            solicitudcomprainput.find('option').remove();
	            solicitudcomprainput.prop('disabled', true);
	        }
	    }) */
	    
   
      
$("#idBeneficiario").change(function(){
	var idAperturaProceso = $("#idAperturaProceso");
    // Guardamos el select de solicitudcomprainput	       
    var combo = document.getElementById("idBeneficiario");
    var idBeneficiario = combo.options[combo.selectedIndex].value;	
    
   	
    // Guardamos el select de procesocomprainput	        
    var procesocomprainput = $(this);
    if($(this).val() != '')
    {
    	var url = getAbsolutePath() + "Gral_controlGarantiasAPI" + "?accion=GetNumProcesoCompra&idBeneficiario="+idBeneficiario;
        console.log(url);
    	$.ajax({	             
            url:   url,
            type:  'GET',
            beforeSend: function ()
            {
                procesocomprainput.prop('disabled', true);
            },
            success:  function (r) 
            {
            	var m=r.split(",");
            	console.log(m)
                procesocomprainput.prop('disabled', false);
            	idAperturaProceso.prop('disabled', false);
            	idAperturaProceso.find('option').remove();
            	idAperturaProceso.append('<option>SELECCIONE UNA OPCION...</option>');
                $(m).each(function(i, v){ 		                	
                	if(m[i]!=''){
                		idAperturaProceso.append(m[i]);
                		console.log(m[i]);
                	}
                })	
                idAperturaProceso.prop('disabled', false);
            },
            error: function()
            {
                alert('Ocurrio un error en el servidor ..');
                procesocomprainput.prop('disabled', false);
            }
        });
    }
    else
    {
    	procesocomprainput.find('option').remove();
    	procesocomprainput.prop('disabled', true);
    }
})
      
$("#idAperturaProceso").change(function(){
	var idcontratoOrdenCompra = $("#idcontratoOrdenCompra");
    // Guardamos el select de solicitudcomprainput	       
    var combo = document.getElementById("idAperturaProceso");
    var idAperturaProceso = combo.options[combo.selectedIndex].value;	
    
   	
    // Guardamos el select de procesocomprainput	        
    var procesocomprainput = $(this);
    if($(this).val() != '')
    {
    	var url = getAbsolutePath() + "Gral_controlGarantiasAPI" + "?accion=GetNumDocumento&idAperturaProceso="+idAperturaProceso;
        console.log(url);
    	$.ajax({	             
            url:   url,
            type:  'GET',
            beforeSend: function ()
            {
                procesocomprainput.prop('disabled', true);
            },
            success:  function (r) 
            {
            	var m=r.split(",");
            	console.log(m)
                procesocomprainput.prop('disabled', false);
            	idcontratoOrdenCompra.prop('disabled', false);
            	idcontratoOrdenCompra.find('option').remove();
            	idcontratoOrdenCompra.append('<option>SELECCIONE UNA OPCION...</option>');
                $(m).each(function(i, v){ 		                	
                	if(m[i]!=''){
                		idcontratoOrdenCompra.append(m[i]);
                		console.log(m[i]);
                	}
                })	
                idcontratoOrdenCompra.prop('disabled', false);
            },
            error: function()
            {
                alert('Ocurrio un error en el servidor ..');
                procesocomprainput.prop('disabled', false);
            }
        });
    }
    else
    {
    	procesocomprainput.find('option').remove();
    	procesocomprainput.prop('disabled', true);
    }
})      

 $("#idcontratoOrdenCompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	  
	        var combo = document.getElementById("idcontratoOrdenCompra");
		    var selected = combo.options[combo.selectedIndex].value;
	
		     $.post("Gral_controlGarantiasAPI",
          		{
        	  		accion: 'GetProveedor', idcontratoOrdenCompra : selected
          		},
          		function (responseText) {        	  	
        	  	$("#proveedor").val(responseText);            	
           		}
        	);
		}); 

 /* $("#idAperturaProceso").change(function(){
	
    // Guardamos el select de solicitudcomprainput

    var combo = document.getElementById("idAperturaProceso");
    var selected = combo.options[combo.selectedIndex].value;
    alert(combo.value +" viene");
    
      $.post("Gral_controlGarantiasAPI",
  		{
	  		accion: 'GetNumDocumento', idAperturaProceso : selected
  		},
  		function (responseText) {        	  	
	  	$("#numDocumentoOrdenCompra").val(responseText);            	
   		}
	); 
});  */
      
      /* $("#procesocompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var ordencomprainput = $("#ordencompra");
	        var combo = document.getElementById("procesocompra");
		    var selected = combo.options[combo.selectedIndex].text;
	
	        // Guardamos el select de procesocomprainput
	        var procesocomprainput = $(this);
	
	        if($(this).val() != '')
	        {
	        	var url = getAbsolutePath() + "contratoSuministrosGeneral" + "?submit=Consultar&noProcesoCompra="+selected;
	            console.log(url);
	        	$.ajax({
	                //data: { id : procesocomprainput.val() },
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                    procesocomprainput.prop('disabled', true);
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(",");
	                    procesocomprainput.prop('disabled', false);
	                    ordencomprainput.prop('disabled', false);
	                    // Limpiamos el select
	                    ordencomprainput.find('option').remove();
	                    ordencomprainput.append('<option>SELECCIONE UNA OPCION...</option>');

	                    $(m).each(function(i, v){ // indice, valor
		                	console.log(m[i])
		                	if(m[i]!=''){
	                        ordencomprainput.append('<option value="' + m[i] + '">' + m[i] + '</option>');
		                	}
	                    })
	
	                    ordencomprainput.prop('disabled', false);
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    procesocomprainput.prop('disabled', false);
	                }
	            });
	        }
	        else
	        {
	            solicitudcomprainput.find('option').remove();
	            solicitudcomprainput.prop('disabled', true);
	        }
	    }) */
      
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
    
$("#esEnmienda").on("change", function () {
    if ($("#esEnmienda").prop("checked"))
    {
      
      
      $("#numGarantiaEnmienda").prop('disabled', false);
      $("#numGarantiaEnmienda").prop("required", true);
    }
    else
    {
     
    	$("#numGarantiaEnmienda").prop('disabled', true);
      $("#numGarantiaEnmienda").removeAttr("required");
    }
  });
	
     /*  function ShowSelected(){ */
	      /* Para obtener el valor */
	      /* var cod = document.getElementById("procesocompra").value; */
	      /* Para obtener el texto */
	      /* var combo = document.getElementById("procesocompra");
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#procesocompracod").val(selected);
	    } */
	    
	    onload = function () {
	        var ele = document.querySelectorAll('.validanumericos')[0];
	        ele.onkeypress = function (e) {
	            if (isNaN(this.value + String.fromCharCode(e.charCode)))
	                return false;
	        }
	        ele.onpaste = function (e) {
	            e.preventDefault();
	        }
	    }
	    
	    $(".decimales").on("keypress keyup blur", function (event) {
	        var patt = new RegExp(/[0-9]*[.]{1}[0-9]{4}/i);
	        var matchedString = $(this).val().match(patt);
	        if (matchedString) {
	            $(this).val(matchedString);
	        }
	        if ((event.which != 46 || $(this).val().indexOf('.') != -1) && (event.which < 48 || event.which > 57)) {
	            event.preventDefault();
	        }
	    });
	    
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
