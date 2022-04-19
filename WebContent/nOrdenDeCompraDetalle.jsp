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
	   /*  #reqTable th:nth-child(7){
		    display: none;
		  }
	    #reqTable td:nth-child(7){
		    display: none; */
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
            String read = (String)session.getAttribute("read"); 
            String disable = (String)session.getAttribute("disable");
            String funcion = (String)session.getAttribute("funcion");
            String func = (String)session.getAttribute("funcion");
            String type = (String)session.getAttribute("type");
            int cod = (Integer)session.getAttribute("procesocompra");
            int ben = (Integer)session.getAttribute("beneficiario");
            int sc = (Integer)session.getAttribute("solicitudcompra");
            String pro = (String)session.getAttribute("nombreproveedor");
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTRATACIONES
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO A LARGO PLAZO (ALP)
              </h5>
            </div>
            <div class="col-4 col-xs-4 col-md-4 text-right">
              <span class="badge badge-primary mb-5">
	              <h4 class="text-white font-weight-light ml-2 mr-3">
	              <% if (func.toUpperCase().contentEquals("NUEVO") && func != null) {%>
	                <i class="material-icons vm">add_circle</i>
	              <% } else if (func.toUpperCase().contentEquals("MODIFICAR") && func != null) {%>
	                <i class="material-icons vm">edit</i>
	              <% } else if (func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
	                <i class="material-icons vm">chrome_reader_mode</i>
	              <% } else if (func.toUpperCase().contentEquals("REVISAR") && func != null) {%>
	                <i class="material-icons vm">done_all</i>
	              <% } else {%>
	                <i class="material-icons vm">error</i>
	              <% } %>
	                <%=func.toUpperCase()%>
	              </h4>
	            </span>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-body">
              <form id="newEditRegForm" action="contratacionesServlet" method="post" enctype="multipart/form-data">
              <input type="hidden" id="Id" name="Id" value="${Id}"/>
              <input type="hidden" id="nombreprocesocompra" name="procesocompracod" value="${procesocompracod}"/>
              <input type="hidden" id="myfileName" name="myfileName" value="${myfile}"/>
              <input type="hidden" id="tempNoItem" value=""/>
						  <input type="hidden" id="tempNombreProducto"/>
						  <input type="hidden" id="tempTiemposEntrega"/>
						  <input type="hidden" id="tempCantidadComprado"/>
						  <input type="hidden" id="tempCantidadEntregar"/>
						  <input type="hidden" id="tempFechaLimiteEntrega"/>
						  <input type="hidden" id="idListarequerimientoSolicitudDisponibilidad"/>
						  <input type="hidden" id="idDetalle"/>

              <!--DATA Section-->
              <div id="dataSection">
                <div class="row">
                  <div class="col-lg-6 col-md-6">
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                          <label>NO. PROCESO DE COMPRA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="ordencompra"
                            name="ordencompra"
                            required
                            readonly="readonly"
                            value="${procesocompracod}"
                        	<%=read%>
                          />                         
                        </div>
                      </div>
                    </div>
                    <div class="form-group" style="text-align: left">
                      <label>BENEFICIARIO</label>
                      <input type="" id="nombrebeneficiario" class="form-control"  name="nombrebeneficiario" value="${nombrebeneficiario}"/>
                      
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>SOLICITUD DE COMPRA</label>
                          <input id="nombresolicitudcompra" class="form-control"  name="nombresolicitudcompra" value="${nombresolicitudcompra}"/>
                          
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>PROVEEDOR</label>
                          <input id="nombreproveedor" class="form-control"  name="nombreproveedor" value="${nombreproveedor}"/>                   		  
                                                     
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>NO. ORDEN DE COMPRA</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="ordencompra"
                            name="ordencompra"
                            required
                            readonly="readonly"
                            value="${ordencompra}"
                        	<%=read%>
                          />
                        </div>
                      </div>
                    </div> 
                    <div class="row d-flex align-items-center">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group" style="text-align: left">
                          <label>FECHA DE SUSCRIPCION DE ORDEN DE COMPRA</label>
                          	<input
                        	autocomplete="off"
                        	type="date"
                        	class="form-control"
                        	id="fechasuscripcion"
                        	name="fechasuscripcion"
                        	placeholder=""
                        	required                        	
                        	value="${fechasuscripcion}"
                        	<%=read%>
                      		/>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                       <div class="col-lg-12 col-md-12">
                         <div class="form-group"> 
                           <label>OBSERVACIONES</label>
                           <textarea id="observaciones" name="observaciones" type="text" class="form-control" <%=read%>>${observaciones}</textarea>
                         </div>
                       </div>
                     </div>   
                     <div class="row">
                       <div class="col-lg-12 col-md-12">
                         <div class="form-group"> 
                           <label>NO. ITEM</label>
                           <select
                             autocomplete="off"
                             class="form-control"
                             id="noIteminput"
                             name="noIteminput"
                             <%=disable%>
                           >
                             <option selected disabled value="">
                               SELECCIONA UNA OPCION...
                             </option>
                           </select>
                           <br />
                           <input type="button" id="AbririModal" value="Agregar item" class="btn btn-sm btn-success ml-2" disabled>
                         </div>
                       </div>                                                                    
                     </div>
                  </div>
                  <div class="col-lg-6 col-md-6">
                    <label class="custom-dropzone text-center align-items-center dz-clickable align-middle row" id="myDropzone" for="myfile" style="height:700px;">
                      <div class="col-lg-12 col-md-12">
                        <div class="dz-default dz-message mb-2 mt-2" data-dz-message="">
                          <h3 class="mt-1"><i class="material-icons">chrome_reader_mode</i></h3>
                          <p>
                            SELECCIONE EL ARCHIVO A PREVISUALIZAR
                          </p>
                          <% if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
                          <input type="file" id="myfile" name="myfile" required>
                          <% } %>
                        </div>
                        <iframe title="document preview" src="" id="previewDocumentInput" name="SubHtml"
                          height="520" class="container-fluid hide"
                        >
                          <p>ESTA FUNCIONALIDAD NO ESTA SOPORTADA POR ESTE NAVEGADOR</p>
                        </iframe>
                      </div>
                    </label>
                  </div>
                </div>
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-right mr-2">
                      <button 
                        id="submit"
		                  	style="display:none;"
		                  	type="submit"
		                  	name="submit"
		                  >
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!--DATA Section ends-->
              </form>
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
                </div>
              </div>
              <div class="row" id="recommendationSection">
                <div class="col-lg-12 col-md-12">
                  <div class="form-group float-left ml-2">
                   <!--  <button
                      class="btn btn-sm btn-danger ml-2"
                      id="deleteRegButton"
                      type="button"
                    >
                      <i class="material-icons md-18">close</i>ELIMINAR
                      SELECCIONADO
                    </button> -->
                    <button
                      type="button"
                      class="btn btn-sm btn-success ml-2"
                      data-target="#newEditReg"
                      data-toggle="modal"
                      id="editRegButton"
                    >
                      <i class="material-icons md-18">create</i>EDITAR
                      SELECCIONADO
                    </button>
                  </div>
                </div>
              </div>
              
              <!--Table Section starts-->
              <% int codPadre = 0; %>
              <div class="card-body main-font" style="overflow-x:auto">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width: 100px;"
                  aria-describedby="Tabla de ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">NO. ITEM</th>
                      <th class="min-desktop">NOMBRE DEL PRODUCTO</th>
                      <th class="min-desktop">TIEMPOS DE ENTREGA OFERTADOS</th>
                      <th class="min-desktop">CANTIDAD COMPRADO (UNIDADES)</th>
                      <th class="min-desktop">CANTIDAD ENTREGADO SEGUN PLAZOS ENTREGA</th>
                      <th class="min-desktop">FECHA LIMITE ENTREGA</th>
                      <th class="min-desktop">ID DETALLE</th>  
                      <th class="min-desktop">ID SD</th>                  
                    </tr>
                  </thead>
                  <tbody>   
                   
                   </tbody>
                </table>
              </div>
              <!--Table Section ends-->
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

    <form
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="contrataciones.jsp">
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

    <% if (!func.toUpperCase().contentEquals("CONSULTAR") && func != null) {%>
    <!-- Submit Button -->
    <div class="wrap-fixed-float wrap-fixed-bottom-right">
     <form id="newEditRegForm" action="ReturViewServlet" method="post" enctype="multipart/form-data">
      <button
        id="vistaARetornar"
        name="vistaARetornar"
        class="btn btn-primary btn-rounded shadow main-font"
        type="submit"
        value="contratacionesIndex"
      >
        GUARDAR
        <i class="material-icons vm">done</i>
      </button>
      </form>
    </div>
    <% } %>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
   
    <!--Custom New Modal-->

    <!-- Confirmation Modal -->
    <div
      class="modal fade"
      id="confirmationModalCenter"
      style="position: absolute;"
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

    <!--Item Modal-->
   <div
      class="modal fade main-font"
      id="newEditReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form action="insertU" id="editRegForm" method="post">
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
                COMPRA ACUERDO A LARGO PLAZO       
               </h1>
               <h4
                  class="mb-5 text-white font-weight-light"
                >
                  EDITAR ITEM
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
                      <div id="dataSection">
                        <div class="row">
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD COMPRADO FALTANTE</label>
                              <input type="number" min="1" readonly="readonly" id="cantidadcompradoinput" class="form-control"/>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD COMPRADO UNIDADES</label>
                              <input type="number" min="1" readonly="readonly" id="cantidadcompradoinputREAL" class="form-control"/>
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>CANTIDAD A ENTREGAR SEGUN PLAZOS ENTREGA</label>
                              <label id="Messagevalidate" >La cantidad debe se igual a la cantidad de unidades</label>
                              <input
                                autocomplete="off"
                                type="text"                            
                                onclick="OcultarValidacion();"
                                class="form-control"
                                id="cantidadentregarinput"
                                name="cantidadentregarinput"
                                onkeyup="format(this)"
                        		
                                placeholder=""
                                required
                              />
                            </div>
                            <script>
                            function OcultarValidacion(){
                          	  document.getElementById('Messagevalidate').style.display = 'none';
                            }                            
                            </script>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>FECHA LIMITE ENTREGA</label>
                              <input
                                autocomplete="off"
                                type="date"
                                class="form-control"
                                id="fechalimiteentregainput"
                                name="fechalimiteentregainput"
                                placeholder=""
                                required
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>TIEMPO DE ENTREGA</label>
                              <input
                                autocomplete="off"
                                type="text"
                                class="form-control"
                                id="tiempoentregainput"
                                name="tiempoentregainput"
                                placeholder=""
                                required
                              />
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
                  <div class="col-12 col-md-6 text-center" id="submitButtonDiv">
                    <button
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      id="addRegButton"
                      type="button"
                      data-toggle="modal"
                      data-target="#confirmationModalCenter"
                    >
                      ACEPTAR
                    </button>
                    
                    <button
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      id="GuardarItem"
                      type="button"
                      
                    >
                      ACEPTAR
                    </button>                    
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
          $("#cantidadcompradoinput").prop("value", "");
          $("#cantidadentregarinput").prop("value", "");
          $("#fechalimiteentregainput").prop("value", "");
          $("#tiempoentregainput").prop("value", "");
        }
      
     
      $(document).ready(function () {
          var reqTable = $("#reqTable").DataTable({
              responsive: true,
              searching: true,
              bLengthChange: false,
              pageLength: 3,
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
              order: [[0, "asc"]],
            });  
      
          <% if (func != null) {%>
	        var nombreDocumento = "${myfile}";
	        if (nombreDocumento === "")
	        {
	          $("#previewDocumentInput").addClass("hide");
	          $("#previewDocumentInput").prop("src", "");
	          $("#documentFile").prop("required", true);
	        }
	        else{
	          var ruta = getAbsolutePath() + "assets/files/contractsFiles/" + nombreDocumento;
	          $("#previewDocumentInput").prop("src", ruta);
	          $("#previewDocumentInput").removeClass("hide");
	          $("#documentFile").prop("required", false);
	        }
	        $("#myfile").prop('required',false);
	        
	        //Load Table
	        reqTable.ajax.url(getAbsolutePath() + "Contrataciones"+ "?submit=ConsultarTabla&id="+ $("#Id").val()).load();	
	        
	
	       //cargar items	       
	        CargarItems()
	        	
        <%}%>
          
        
        function CargarItems() {
        	 var noiteminput = $("#noIteminput");
 	        var combo = document.getElementById("nombresolicitudcompra").value;
 		    var selected = combo;
 		    
 		    var combo1 = document.getElementById("nombreproveedor").value;
 		    var selected1 = combo1;
 		  
 	        // Guardamos el select de procesocomprainput
 	        var procesocomprainput = $(this);
 	
 	        if(combo != '')
 	        {
 	        	var url = getAbsolutePath() + "Contrataciones" + "?submit=ConsultarItem&solicitudCompra="+selected+"&proveedor="+selected1;
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
 	                	var m=r.split(";");
 	                    procesocomprainput.prop('disabled', false);
 	                    noiteminput.prop('disabled', false);
 	                    // Limpiamos el select
 	                    noiteminput.find('option').remove();
 	                    noiteminput.append('<option>SELECCIONE UNA OPCION...</option>');

 	                    $(m).each(function(i, v){ // indice, valor
 		                	console.log(m[i])
 		                	var p=m[i].split(",");
 		                	if(m[0]!=''){
 		                		noiteminput.append('<option value="' + p[0] + '">' + p[1] + '</option>');
 		                	}
 	                    })
 	
 	                    noiteminput.prop('disabled', false);
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
		}
        
          //const rowSelected = null;
          $("#reqTable tbody").on("click", "tr", function () {
        	  document.getElementById('addRegButton').style.display = 'none';
        	  document.getElementById('GuardarItem').style.display = 'block'; 
        	  
            $(this).addClass("selected").siblings().removeClass("selected");
            var value;
            value = $(this).find("td:eq(0)").text();
            $("#tempNoItem").prop("value", value);
            value = $(this).find("td:eq(1)").text();
            $("#tempNombreProducto").prop("value", value);
            value = $(this).find("td:eq(2)").text();
            $("#tempTiemposEntrega").prop("value", value);
            value = $(this).find("td:eq(3)").text();
            $("#tempCantidadComprado").prop("value", value);
            value = $(this).find("td:eq(4)").text();
            $("#tempCantidadEntregar").prop("value", value);
            value = $(this).find("td:eq(5)").text();
            $("#tempFechaLimiteEntrega").prop("value", value);
            
            value = $(this).find("td:eq(0)").text();
            $("#noIteminput").prop("value", value);
            
            value = $(this).find("td:eq(6)").text();
            $("#idDetalle").prop("value", value);
            
            
            
            value = $(this).find("td:eq(7)").text();
            $("#idListarequerimientoSolicitudDisponibilidad").prop("value", value);
            
            
            
            
            var noIteminput = value;
    	      	
  	        if(noIteminput != '')
  	        {
  	        	
  	        	
  	        	var url = getAbsolutePath() + "Contrataciones" + "?submit=Consultar&id="+noIteminput;
  	            console.log(url);
  	        	$.ajax({
  	                url:   url,
  	                type:  'GET',
  	                beforeSend: function () 
  	                {
  	                	
  	                },
  	                success:  function (r) 
  	                {
  	                	var m=r.split(",");

  	                    $(m).each(function(i, v){ 
  	                    })
  	                   
  	                    $("#cantidadcompradoinput").val(m[3]);  
  	                    
  	                },
  	                error: function()
  	                {
  	                    alert('Ocurrio un error en el servidor ..');
  	                  
  	                }
  	            });
  	        } 
            
            

  		  document.getElementById('Messagevalidate').style.display = 'none';
      	  document.getElementById('addRegButton').style.display =  'block';
      	  document.getElementById('GuardarItem').style.display =  'none';        	
      	 // $('#newEditReg').modal('show');   
      	  
      	  var idContratacion = $(this).find("td:eq(6)").text();
      	  
      	  var noIteminput = $(this).find("td:eq(0)").text();
      	  var url = getAbsolutePath() + "Contrataciones" + "?submit=ConsultarCantidadPlazos&id="+noIteminput+"&idContratacion="+ document.getElementById("Id").value;
	            console.log(url);
	        	$.ajax({
	                url:   url,
	                type:  'GET',
	                beforeSend: function ()
	                {
	                	
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(",");

	                	console.log(m)
	                    $(m).each(function(i, v){ 
	                    })
	                     
	                    var cantidadPlazsos = m[0];
	                    
	                    var cantSolicitada = document.getElementById("cantidadcompradoinput").value 
	                    $("#cantidadcompradoinputREAL").val(cantSolicitada); 
	                    $("#cantidadcompradoinput").val(cantSolicitada-cantidadPlazsos); 
	                   
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                   
	                }
	            });
            
            
            
            const rowSelected = $(this);
  	
            if ($("#tempNoItem").val() != "" && $("#tempNoItem").val() != "No hay datos disponibles en la tabla.") {
                $("#recommendationSection").removeClass("hide");
            }
              /*Delete Reg Function*/

            $("#deleteRegButton").on("click", function (event) {
              event.preventDefault();
              reqTable.row(rowSelected).remove().draw();
              $("#confirMessage").text("EXITOSO! REGISTRO BORRADO CORRECTAMENTE...");
              cleanFields();
            });
              
            
            $("#editRegButton").on("click", function (event) {               	          	              	
            	
            	CargarItems()
        	      
        	      	
        	    
            	
            	 $("#cantidadcompradoinput").val($("#tempCantidadComprado").val());
                $("#cantidadentregarinput").val($("#tempCantidadEntregar").val());
                $("#fechalimiteentregainput").val($("#tempFechaLimiteEntrega").val());
                $("#tiempoentregainput").val($("#tempTiemposEntrega").val()); 
            })

            $("#addRegButton").on("click", function (event) {
              /* event.preventDefault()
              

              var url = getAbsolutePath() + "Contrataciones" + "?submit=ConsultarItem&solicitudCompra="+selected+"&proveedor="+selected1;
	           
	          var Id = document.getElementById("Id").value;		
	           	
	          		           
	           $.ajax({
	        	    url:url,
	        	    type:"POST",
	        	    dataType:'json',
	        	    data: {json:Item, Id:Id},
	        	    success:function(data){
	        	    	 reqTable.ajax.url(getAbsolutePath() + "Contrataciones"+ "?submit=ConsultarTabla&id="+ $("#Id").val()).load();	
	        		        
	             	 $("#ModalEnvioData").modal('hide');
	             	 $("#confirmationModalCenter").modal('show');				 				 
						 $("#confirMessage").text("ITEM  AGREGADO EXITISAMENTE...");
						 Item = [];
	        	    },
	        	}); */
              
            	var canEntregarPlazo = parseInt(document.getElementById("cantidadentregarinput").value);
          	  var fechaLimiteEntrega = document.getElementById("fechalimiteentregainput").value;
          	  var tiemposEntrega = parseInt($("#tiempoentregainput").val());
          	  var cantidadComprada = parseInt($("#cantidadcompradoinput").val());
          	 var IdDetalle = document.getElementById("idDetalle").value;
          	 console.log(canEntregarPlazo+" , "+canEntregarPlazo +" , "+fechaLimiteEntrega+" , "+tiemposEntrega+" , "+cantidadComprada);
          	  
          	  
          	  if(cantidadComprada < canEntregarPlazo)  {        		  
          		  
          		  document.getElementById('Messagevalidate').style = "color: red";
          		  document.getElementById('Messagevalidate').style.display = 'block';
          		  return false;
          	  }  
          	  
               if(canEntregarPlazo == 0)  {        		  
          		  
          		  document.getElementById('Messagevalidate').style = "color: red";
          		  document.getElementById('Messagevalidate').style.display = 'block';
          		  return false;
          	  } 
                
                var url = getAbsolutePath() + "ContratacionesDetalle";
  	           
               
                var canEntre = document.getElementById("cantidadentregarinput").value;
                var fechEntre = document.getElementById("fechalimiteentregainput").value
                var tiemEntre = document.getElementById("tiempoentregainput").value;
                
                var datos = [];  
                datos.push(document.getElementById("idDetalle").value)
                datos.push(canEntre)
                datos.push(fechEntre)
                datos.push(tiemEntre)
                
                console.log("datos " + datos)
                
  	        
  	          
                $.ajax({
	                type: "POST",
	                url: url,
	                
	                data:  {json:datos},
	                success: function(data)          
	                {
	                  if (data === "success"){
	                	 
	                	  //Load Table
	                	   CargarItems()
	                
	        			reqTable.ajax.url(getAbsolutePath() + "Contrataciones"+ "?submit=ConsultarTabla&id="+ $("#Id").val()).load();	
	        
	                    $("#confirMessage").text(
	                      "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
	                    );
	                    $("#confirmationModalCenter").modal('show');
	                    cleanFields();
	                   
	                  }
	                  else{
	                	  alert("error")
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
                
  	   		
          	  
          	  
          	  $('#newEditReg').modal('hide'); 
          	  $("#confirmationModalCenter").modal('show');				 				 
  				 $("#confirMessage").text("ITEM AGREDADO EXITOSAMENTE ...");
  	              
  				 $("#cantidadentregarinput").prop("value", "");
  				 $("#fechalimiteentregainput").prop("value", "");
  				 $("#tiempoentregainput").prop("value", "");
  				 document.getElementById('Messagevalidate').style.display = 'none';
              

            });
          });
          
         /*  $('#submitExternalButton').click(function (){
      		  var container = document.getElementById("newEditRegForm");
      		  var table = document.getElementById('benFinalTable');
      		  //console.log(table.rows[2].cells[1].innerHTML);
      		    if(reqTable.data().any()){
      		    	for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
                  var cell = reqTable.row(r).data();

      		          var inputPT = document.createElement("input");
      			      inputPT.setAttribute("type", "hidden");
      			      inputPT.setAttribute("name", "noItem");
      			      inputPT.setAttribute("value", cell[0]);
      			      container.appendChild(inputPT);
      			        
      			      var inputBF = document.createElement("input");
      			      inputBF.setAttribute("type", "hidden");
      			      inputBF.setAttribute("name","nombreProducto");
      			      inputBF.setAttribute("value",cell[1]);
      			      container.appendChild(inputBF);

                      var inputBC = document.createElement("input");
      			      inputBC.setAttribute("type", "hidden");
      			      inputBC.setAttribute("name","tiemposEntrega");
      			      inputBC.setAttribute("value",cell[2]);
      			      container.appendChild(inputBC);
      			      	
      			        var inputBC = document.createElement("input");
    			        inputBC.setAttribute("type", "hidden");
    			        inputBC.setAttribute("name","cantidadComprado");
    			      	inputBC.setAttribute("value",cell[3]);
    			      	container.appendChild(inputBC);
    			      	
    			      	var inputBC = document.createElement("input");
      			        inputBC.setAttribute("type", "hidden");
      			        inputBC.setAttribute("name","cantidadEntregar");
      			        inputBC.setAttribute("value",cell[4]);
      			        container.appendChild(inputBC);
      			      	
      			        var inputBC = document.createElement("input");
    			        inputBC.setAttribute("type", "hidden");
    			        inputBC.setAttribute("name","fechaLimiteEntrega");
    			      	inputBC.setAttribute("value",cell[5]);
    			      	container.appendChild(inputBC);
    			      	
    			      	var inputBC = document.createElement("input");
    			        inputBC.setAttribute("type", "hidden");
    			        inputBC.setAttribute("name","IdDetalle");
    			      	inputBC.setAttribute("value",cell[6]);
    			      	container.appendChild(inputBC);
      		    	}
      		    }
      		    document.getElementById("submit").value = document.getElementById("submitExternalButton").value;
          	  document.getElementById("submit").click();
            }); */
          
          $("#cancelButton").on("click", function (event) { 
        	  
        	  CargarItems()
        	  var AbririModal = $("#AbririModal");
        	  AbririModal.prop('disabled', true);
          })
          
          $("#GuardarItem").on("click", function (event) {      	  
        	        	  
        	  var canEntregarPlazo = parseInt(document.getElementById("cantidadentregarinput").value);
        	  var fechaLimiteEntrega = document.getElementById("fechalimiteentregainput").value;
        	  var tiemposEntrega = parseInt($("#tiempoentregainput").val());
        	  var cantidadComprada = parseInt($("#cantidadcompradoinput").val());
        	  
        	  
        	  if(cantidadComprada < canEntregarPlazo)  {        		  
        		  
        		  document.getElementById('Messagevalidate').style = "color: red";
        		  document.getElementById('Messagevalidate').style.display = 'block';
        		  return false;
        	  }  
        	  
             if(canEntregarPlazo == 0)  {        		  
        		  
        		  document.getElementById('Messagevalidate').style = "color: red";
        		  document.getElementById('Messagevalidate').style.display = 'block';
        		  return false;
        	  } 
              
              var url = getAbsolutePath() + "Contrataciones" + "?submit=NewAndUpdateItem";
	           
	          var Id = document.getElementById("Id").value;		          
	          var noItem = item1;
              var nombreProducto = item2;
              var tiemposEntrega = parseInt($("#tiempoentregainput").val());  
              //var fechaLimiteEntrega = item4;
              var IdDetalle = "-1";
              var nombreproveedor = document.getElementById("nombreproveedor").value;
              var ordencompra = document.getElementById("ordencompra").value;
              var AbririModal = $("#AbririModal");
              var idListarequerimientoSolicitudDisponibilidad = document.getElementById("idListarequerimientoSolicitudDisponibilidad").value;
              var idItemMedicamento = document.getElementById("noIteminput").value;
              
	           $.ajax({
	                type: "POST",
	                url: url,
	                data:  {Id:Id,noItem:noItem, nombreProducto:nombreProducto, tiemposEntrega:tiemposEntrega,canEntregarPlazo:canEntregarPlazo, fechaLimiteEntrega:fechaLimiteEntrega, cantidadComprada:cantidadComprada, nombreproveedor:nombreproveedor, ordencompra:ordencompra, IdDetalle:IdDetalle, idListarequerimientoSolicitudDisponibilidad:idListarequerimientoSolicitudDisponibilidad, idItemMedicamento:idItemMedicamento},
	                success: function(data)          
	                {
	                  if (data === "successful"){
	                	 
	                	  //Load Table
	                	   CargarItems()
	                
	        			reqTable.ajax.url(getAbsolutePath() + "Contrataciones"+ "?submit=ConsultarTabla&id="+ $("#Id").val()).load();	
	        
	                    $("#confirMessage").text(
	                      "EXITOSO! REGISTRO GUARDADO CORRECTAMENTE"
	                    );
	                    $("#confirmationModalCenter").modal('show');
	                    cleanFields();
	                    AbririModal.prop('disabled', true);
	                  }
	                  else{
	                	  alert("error")
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
	          
	   		
        	  
        	  
        	  $('#newEditReg').modal('hide'); 
        	  $("#confirmationModalCenter").modal('show');				 				 
				 $("#confirMessage").text("ITEM AGREDADO EXITOSAMENTE ...");
	              
				 $("#cantidadentregarinput").prop("value", "");
				 $("#fechalimiteentregainput").prop("value", "");
				 $("#tiempoentregainput").prop("value", "");
				 document.getElementById('Messagevalidate').style.display = 'none';
          });
          
                              
          var item1 = "";
          var item2 = "";
          var item3 = "";
          var item4 = "";
          $("#AbririModal").on("click", function (event) {        	 
        	  document.getElementById('Messagevalidate').style.display = 'none';
        	  document.getElementById('addRegButton').style.display = 'none';
        	  document.getElementById('GuardarItem').style.display = 'block';        	
        	  $('#newEditReg').modal('show');   
        	  
        	  console.log(item1 +" "+ document.getElementById("Id").value)
        	  
        	  var noIteminput = document.getElementById("noIteminput").value;
        	  var url = getAbsolutePath() + "Contrataciones" + "?submit=ConsultarCantidadPlazos&id="+item1+"&idContratacion="+ document.getElementById("Id").value;
	            console.log(url);
	        	$.ajax({
	                url:   url,
	                type:  'GET',
	                beforeSend: function ()
	                {
	                	
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(",");

	                    $(m).each(function(i, v){ 
	                    })
	                     
	                    var cantidadPlazsos = m[0];
	                    
	                    
	                    
	                    var cantSolicitada = document.getElementById("cantidadcompradoinput").value 
	                    $("#cantidadcompradoinputREAL").val(cantSolicitada-0); 
	                    $("#cantidadcompradoinput").val(cantSolicitada-cantidadPlazsos); 
	                   
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                   
	                }
	            });
        	  
        	  
        
        	   	       	  
            });
          
          
          $("#noIteminput").change(function(){        	  
  	       
  	      	var noIteminput = document.getElementById("noIteminput").value;
  	      var AbririModal = $("#AbririModal");
  	      	
	        if(noIteminput != '')
	        {
	        	
	        	AbririModal.prop('disabled', false);
	        	
	        	var url = getAbsolutePath() + "Contrataciones" + "?submit=Consultar&id="+noIteminput;
	            console.log(url);
	        	$.ajax({
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                	//noIteminput.prop('disabled', true);
	                },
	                success:  function (r) 
	                {
	                	var m=r.split(",");

	                    $(m).each(function(i, v){ 
	                    })
	                    //reqTable.row.add([m[0],m[1],m[2],m[3],"","","-1"]).draw();    	                    
	                     item1 = m[0];
	                     item2 = m[1];
	                     item3 = m[2];  
	                     item4 = m[3];  
	                    $("#cantidadcompradoinput").val(m[3]);  
	                    $("#idListarequerimientoSolicitudDisponibilidad").val( noIteminput); 
	                    
	                    //noIteminput.prop('disabled', false);
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    //noIteminput.prop('disabled', false);
	                }
	            });
	        } 
  	    })
          
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

      function ShowSelected(campo){
	      /* Para obtener el valor */
	      console.log(campo)
	      var cod = document.getElementById(campo).value;
	      /* Para obtener el texto */
	      var combo = document.getElementById(campo);
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#nombre"+campo).val(selected);
	  }
      
     
	    
	    
	    
	 
      
	
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
	
      
  	</script>
    <!-- Java Script section ends -->
  </body>
</html>
