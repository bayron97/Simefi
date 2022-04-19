<%@ page language="java" contentType="text/html"%> 
<%@ page import="main.model.*" %> 
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
  //Retrieve your list from the request, with casting
  ArrayList<distribuidor> distList = (ArrayList<distribuidor>) request.getAttribute("distList");
  ArrayList<listaRequerimientoConsolidadaALP> reqConsList = (ArrayList<listaRequerimientoConsolidadaALP>) request.getAttribute("reqConsList");
%> 
<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML ends --%>

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
.sinborde {
  border: 0;
  background: transparent;
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
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <form action="ofertaALPServlet" method="post">
              <div class="modal-body" style="background-color: #f1f1f1">
                <div class="background h-320" style="border-radius: 5px">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-5 mb-5">
                  <h1 class="mb-0 text-white">
                    <span class="mr-2"
                      >ACTA DE APERTURA PARA OFERTAS (ALP)</span
                    >
                    <i class="material-icons vm">done_all</i>
                  </h1>
                </div>
                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div
                        class="card-body"
                        style="
                          background: url(./assets/img/BAC.png) no-repeat center
                            center fixed;
                          background-size: cover;
                        "
                      >
                        <h5
                          id="instructionSubtitle"
                          class="mb-3"
                          style="font-weight: bold"
                        >
                          PROCESO DE COMPRA: 
                          <span class="mb-2 btn btn-outline-dark btn-rounded">${buyProcessNumber}</span>
                        </h5>
                        <input
                            autocomplete="off"
                            type="hidden"
                            class="form-control"
                            id="noProceso"
                            value="${buyProcessNumber}"
                            readonly
                          />
                        <div class="form-group">
                          <label for="purchaseType">TIPO DE COMPRA: </label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="purchaseType"
                            value="${purchaseDescription}"
                            readonly
                          />
                        </div>
                        <div class="row">
                         <div class="col-lg-8 col-md-8">
                        <div class="form-group">
                          <label for="prov">PROVEEDOR AUTORIZADO: </label>
                          <select
                            class="form-control"
                            id="prov"
                            name="prov"
                          >
                            <%
                              String provSaved = (String)request.getAttribute("provSaved");
                              if (provSaved == null || provSaved.isEmpty()){
                            %>
                            <option value="" disabled selected>SELECCIONE UN PROVEEDOR...</option>
                            <%
                              } else {
                            %>
                              <option value="" disabled>SELECCIONE UN PROVEEDOR...</option>
                            <%
                              }
                            %>
                            <%
                              if (distList != null) {
                                for(distribuidor item : distList){
                                  if (item.getDenominacion().equals(provSaved)){
                            %>
                            <option value="<%=item.getDenominacion()%>" selected><%=item.getDenominacion()%> - <%=item.getDistribuidor()%></option>
                            <% } else {%>
                            <option value="<%=item.getDenominacion()%>"><%=item.getDenominacion()%> - <%=item.getDistribuidor()%></option>
                            <% } } } %>
                          </select>
                        </div>
                        </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>NUMERO DE OFERTADOR</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="noOfertador"
                            name="noOfertador"
                            value=""
                            required
                            
                          />
                        </div>
                      </div>
                    </div>
                        <!--Table Section starts-->
                        <div style="overflow-x: auto">
                          <table
                            id="datatable"
                            class="table table-bordered w-100 mb-0 table-aditional-styles"
                            aria-describedby="Tabla de control de ofertas"
                          >
                            <thead>
                              <tr>
                                <th class="all">NO. ITEM</th>
                                <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                                <th class="min-tablet">
                                  NO. OFERTAS RECIBIDAS
                                </th>
                              </tr>
                            </thead>
                            <tbody>
                             <%--  <% 
                                if (reqConsList != null) {
                                  for(listaRequerimientoConsolidadaALP requerimiento : reqConsList){ 
                              %>
                              <tr>
                                <td>
                                  <input
                                    type="hidden"
                                    name="productId"
                                    value="<%=requerimiento.getIdListRequirement()%>"
                                  />
                                  <%=requerimiento.getIdListRequirement()%>
                                </td>
                                <td><%=requerimiento.getNombreProducto()%></td>
                                <td>
                                  <input
                                    type="number"
                                    name="recOffer"
                                    value="<%=requerimiento.getNoOfertasRecibidas()%>"
                                  />
                                </td>
                              </tr>
                              <% } } %> --%>
                            </tbody>
                          </table>
                        </div>
                        <!--Table Section ends-->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div
                class="modal-footer border-0 pt-0"
                style="background-color: #f1f1f1"
              >
                <!-- Submit Float Button -->
                <button id="submit"
                  	style="display: none;"
                  	type="submit"
                  	name="submit"
                  	 onclick="myFunction()"
                  ></button>
                
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                  <button
                    class="btn btn-primary btn-rounded shadow main-font"
                    type="button"
                    id="submitButton"                   
                    value="offersControl"
                  >
                    <span>GUARDAR Y FINALIZAR</span
                    ><i class="material-icons vm">done_all</i>
                  </button>
                </div>
              </div>
            </form>
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

    <!-- Cancel Float Button -->
    <form method="post" action="ofertasALPRouting">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="back"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--**********No Modals in this page**********-->

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
		  var pathName = loc.pathname.substring(0, loc.pathname.lastIndexOf("/") + 1);
		  return loc.href.substring(0,loc.href.length - ((loc.pathname + loc.search + loc.hash).length - pathName.length));
	  }
    
      "use strict";

      $(document).ready(function () {
        /* data Table */
        var ItemConsolidados = $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: false,
          pageLength: -1,
          paging: false,
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
        
        
        
        
        
        function myFunction() {
        	
        	document.getElementById("productId").readOnly = false;
        	}
        
        $("#prov").change(function(){          	
        	 var proveedor = document.getElementById("prov").value;        	
        	 var noProceso = document.getElementById("noProceso").value;   
        	 
        	 ItemConsolidados.ajax.url(getAbsolutePath()+ "ActaAperturaAPI"+ "?submit=ConsultarTablaByProveedor&proveedor="+ proveedor +"&noProceso="+ noProceso).load();	
        	//---------------------------------------
        	 url = getAbsolutePath() + "ActaAperturaAPI" + "?submit=noOfertador&proveedor="+ proveedor +"&noProceso="+ noProceso+"";
	        	
        	$.ajax({	                
	                url:   url,
	                type:  'GET',
	                beforeSend: function () 
	                {
	                	
	                },
	                success:  function (r) 
	                {
	                	if(r == "0"){
	                		$("#noOfertador").prop("value", "");
	                		document.getElementById("noOfertador").readOnly = false;
	                	}else{
	                		document.getElementById("noOfertador").readOnly = true;
	                		$("#noOfertador").prop("value", r);
	                	}
	                	
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    procesocomprainput.prop('disabled', false);
	                }
	            });
        	 
        });
        
      });
      
      
      $('#submitButton').click(function (){	
    
    	
    		  $.post('ActaAperturaAPI', {
              	noProceso: document.getElementById("noProceso").value,
            	  	noOfertador: document.getElementById("noOfertador").value,
            	  submit: "VerificarNumeroOfertador"
        			}, function(responseText) {      				
        				if(responseText == "0"){
        					document.getElementById("submit").value = document.getElementById("submitButton").value;
        			    	  document.getElementById("submit").click();
        				}else{
        					alert("ESTE NUMERO DE OFERTADOR YA ESTA EN USO PARA ESTE PROCESO")
        				}
        		  });  
    	  
                 
      });
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
