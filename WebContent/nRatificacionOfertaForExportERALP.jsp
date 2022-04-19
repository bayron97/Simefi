<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<?xml version="1.0" encoding="UTF-8" ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="es">
<head>
<meta charset="utf-8" />
<title>Banco de Occidente - Plataforma de Fidecomisos</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta content="width=device-width, initial-scale=1" name="viewport" />
<meta content="Plataforma de Fidecomisos de Banco de Occidente"
	name="description" />
<meta content="Authcode" name="author" />
<link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

<!--Styles Area Starts-->
<!--External fonts-->
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap"
	rel="stylesheet" />

<!-- Material icons -->
<link href="./assets/vendor/Material-icons/material-icons.css"
	rel="stylesheet" />

<!-- DataTables picker -->
<link
	href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css"
	rel="stylesheet" />
<link
	href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css"
	rel="stylesheet" />

<!-- General styles -->
<link href="./assets/css/general.css" rel="stylesheet" />

<!-- NavBar Styles -->
<link href="./assets/css/next-navbar.css" rel="stylesheet" />

<!-- Bootstrap4 Theme-->
<link href="./assets/css/bootstrap4-style-orange-light.css"
	rel="stylesheet" id="stylelink" />

<style>
body {
	zoom: 67%;
}
</style>

 <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
   
<!-- Customized template style mandatory starts-->

<!-- Customized template style mandatory ends-->

<!--Styles Area Ends-->
</head>

<body class="sidemenu-open header-fixed-top body-general-styles">


	<!-- wrapper starts -->

	<!-- Main container starts -->
	<%
	//int codPadre = (int)session.getAttribute("codPadre");
	String SDEX =  (String)request.getParameter("SDEX");
	String PROEX = (String)request.getParameter("PROEX");
	
	%>
	
	<div class="card-body">
		
		<button class="btn btn-sm btn-success ml-2" data-target="#newEditReg"
			data-toggle="modal" id="recommendationButton" data-backdrop="false">
			<i class="material-icons md-18">add_circle</i> APLICAR RACTIFICACION
		</button>
	</div>
	
	<div class="card-body" style="overflow-x: auto;">
		<input type="hidden" name="SDEX"  id="SDEX" value="<%=SDEX%>"/>
		<input type="hidden"  id="PROEX" value="<%=PROEX%>"/>
		<!--Table Section Starts-->
		 <table id="tablaReportExport" class="table table-bordered w-100 mb-0 table-aditional-styles">
                  <thead>
                    <tr>
                      <th class="min-desktop">ID DB</th>
                      <th class="min-desktop">RESOLUCION COMITE TECNICO</th>
                      <th class="min-desktop">CRITERIO DE RESOLUCION COMITE TECNICO</th>
                      <th class="min-desktop">COMENTARIOS</th>
                      <th class="min-desktop">SEGUNDA RCC</th>
                      <th class="min-desktop">ESTADO COMPRA</th>
                      <th class="min-desktop">PRELACION RT</th>
                      <th class="min-desktop">COD SD</th>
                                            
                      <th class="min-desktop">PROVEEDOR</th>
                      <th class="min-desktop">NO. ITEM</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">CODIGO SESAL</th>
                      <th class="min-desktop">PRODUCTO REQUERIDO</th>
                      <th class="min-desktop">PRODUCTO ACORDADO</th>
                      <th class="min-desktop">DESCRIPCION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCRIPCION TECNICA ACORDADA</th>
                      <th class="min-desktop">UNIDAD DE PRECENTACION REQUERIDA</th>
                      <th class="min-desktop">UNIDAD DE PRECENTACION ACORDADA</th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">PRECIO UNITARIO ACORDADO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">FABRICANTE PAIS/ORIGEN</th>
                      <th class="min-desktop">DOCUMENTO REGISTRO SANTARIO/OTROS</th>
                      <th class="min-desktop">NO. REGISTRO SANITARIO</th>
                      <th class="min-desktop">FECHA VENCIMIENTO</th>
                      <th class="min-desktop">FECHA EMISION</th>
                      <th class="min-desktop">DOCUMENTO BPM/OTROS</th>
                      <th class="min-desktop">NO. BPM/OTROS</th>
                      <th class="min-desktop">FECHA VENCIMIENTO</th>
                      <th class="min-desktop">FECHA EMISION</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUETADO PRIMARIO</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUETADO SECUNDARIO</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUETADO TERCIARIO</th>
                      <th class="min-desktop">VIDA UTIL REQUERIDA</th>
                      <th class="min-desktop">VIDA UTIL OFERTADA</th>
                      <th class="min-desktop">TIEMPOS DE ENTREGA REQUERIDOS</th>
                      <th class="min-desktop">TIEMPO DE ENTREGA OFERTADOS</th>
                      <th class="min-desktop">NO. SOLICITUD DE COMPRA</th>
					  <th class="min-desktop">COD. SOLICITUD DE DISPONIBILIDAD</th>
					  <th class="min-desktop">PRELACION DE RECOMENDACION DE ALP</th>
					  <th class="min-desktop">CRITERIO DE RECOMENDACION</th>
					  <th class="min-desktop">PBSERVACIONES INFORME RCC</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
                 
		<!--Table Section ends-->
	</div>

	<!-- Main container ends -->

	<form action="reportStep4Creator" id="reportForm" class="hide"></form>

	<form id="regListForm" method="post" action="recomendacionALPServlet"
		class="hide"></form>
	<!-- wrapper ends -->

	<!-- Navigation Float Buttons section starts -->
	<div class="card-body">
		<form class="" action="recomendacionALPServlet" method="post"
			id="newEditRegForm">
			<!--*****Total Form Info Here*****-->

			<!-- Cancel Float Button -->
			<div class="wrap-fixed-float wrap-fixed-bottom-left">
				<button class="btn btn-primary btn-rounded shadow" name="submit"
					value="cancelar">
					<i class="material-icons vm">close</i> CANCELAR
				</button>
			</div>
		</form>

		<!-- Submit Float Button -->
		<div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
			<button id="submitButton" type="button"
				class="btn btn-primary btn-rounded shadow">
				<span>GUARDAR </span> <i class="material-icons vm">done</i>
			</button>
		</div>
	</div>
	<!-- Navigation Float Buttons section ends -->

	<!-- Modal Section starts-->

	<!-- Confirmation Modal -->
	<!--New modal-->

		<div
      class="modal fade main-font"
      id="newEditReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form  id="ratificacionForm" method="post">
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
                APLICAR RECOMENDACION   
               </h1>
               <h4
                  class="mb-5 text-white font-weight-light"
                >
                  COMITE
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
                      
                      <!--form Section starts-->
              <div class="card-body main-font mt-1">
               
          
                  <input type="hidden" id="SDCod" name="SDCod"/>
                  <input type="hidden" id="noItemSelected" name="noItemSelected"/>
                   <input type="hidden" id="idModificar" name="idModificar"/>
                  
                  <div  id="ratificacion">                    
                    <div class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label><strong>RESOLUCION COMITE TECNICO*</strong></label>
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="ratificacionCT"
                            name="ratificacionCT"
                          >
                            <option value="PENDIENTE" selected>PENDIENTE</option>
                            <option value="RATIFICADO">RATIFICADO</option>
                            <option value="NO RATIFICADO">NO RATIFICADO</option>
                          </select>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-3 col-md-3">
                        <div class="form-group">
                          <label>CRITERIO DE RESOLUCION COMITE TECNICO*</label>
                        </div>
                      </div>
                      <div class="col-lg-9 col-md-9">
                        <div class="form-group">
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="criterioResolucionCT"
                            name="criterioResolucionCT"
                          />
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-12 col-md-12">
                        <div class="form-group">
                        
                       
                          <label>COMENTARIOS*</label>
                          <input
                            autocomplete="off"
                            type="text"
                            class="form-control"
                            id="comentariosRatificacion"
                            name="comentariosRatificacion"
                          />
                        </div>
                      </div>
                    </div>
                    <div id="AplicaraSegundaRecomendacionDIV"  class="row">
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label>APLICAR SEGUNDA RCC*</label>
                          <input
                            autocomplete="off"
                            type="checkbox"
                            class="form-control"
                            id="aplicasegundaRCC"
                            name="aplicasegundaRCC"
                          />
                          <input id="segundaRCC" name="segundaRCC" hidden />
                          <input id="prelacionRTC" name="prelacionRTC" hidden />
                          
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
               
            
                 </div>
              <!--form Section ends-->
                      
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
             
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </form>
        <!--Form Edit Reg ends-->
      </div>
    </div> 
    
    
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
    
 
	<!-- End New Modal-->
	<!-- Modal Section ends-->
	<!--Custom New Modal-->
	<!--Custom New Modal-->
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
	
	
	<!--  <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script> -->
    

	<!-- Customized page level js -->
	<script>
		"use strict";

		function getAbsolutePath() {
			var loc = window.location;
			var pathName = loc.pathname.substring(0, loc.pathname
					.lastIndexOf("/") + 1);
			return loc.href
					.substring(
							0,
							loc.href.length
									- ((loc.pathname + loc.search + loc.hash).length - pathName.length));
		}

		function cleanFields(){
	        $("#ratificacionCT").prop("value", "NO");
	        $("#criterioResolucionCT").prop("value", "");
	        $("#comentariosRatificacion").prop("value", "");
	      }
		
		$(document).ready(function() {
							/* data Table */
							var reqTable = $("#tablaReportExport").DataTable({
						          responsive: true,
						          searching: true,
						          bLengthChange: true,
						          scrollY:        600,
						          deferRender:    true,
						          scroller:       true,
						          columnDefs: [
						            //{
						              /* targets: 38,
						              orderable: false, */
						              {
						                    "targets": [0],
						                    "visible": false,
						                   
						                },	
						              {
						                    "targets": [1],
						                    "visible": false
						                    
						                },
						                {
						                    "targets": [2],
						                    "visible": false,
						                   
						                },
						                {
						                    "targets": [3],
						                    "visible": false,
						                    
						                },
						                {
						                    "targets": [4],
						                    "visible": false,
						                   
						                }, 
						                {
						                    "targets": [5],
						                    "visible": false,
						                   
						                },
						                {
						                    "targets": [6],
						                    "visible": false,
						                    
						                },
						                {
						                    "targets": [7],
						                    "visible": false,
						                   
						                }, 
						                
						            //},
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
						          /* order: [[0, "asc"]],
						          dom: 'Bfrtip',
						          buttons: [
						              'excel'
						          ], */
						        });
							
							
							$("#confirmModalButton").on("click", function (event) {
						          event.preventDefault();
						          $("#newRegModalCenter").modal('hide');

						          $("#confirMessage").text(
						              "GUARDANDO REGISTRO, PORFAVOR ESPERE..."
						          );
						          $("#confirmationModalCenter").modal('show');
						         
						          var url = getAbsolutePath() + "ALPManageRatifiedOffersForRCTFAPI" + "?mode=new";
						          console.log("Enviando...")
						          $("#confirMessage").text("RATIFICACION: GUARDADO EN PROCESO, POR FAVOR ESPERE...");
						          $.ajax({
						            type: "POST",
						            url: url,
						            data: $("#ratificacionForm").serialize(),
						            success: function(data)          
						            {
						              console.log(data);
						              if (data === "successful"){
						            	  reqTable.ajax.url(getAbsolutePath() + "PantallasExportAPI" + "?submit=RactificacionExport&codSolicitudCompraParam="+codSolicitudCompraParam+"&procesoCompraParam="+procesoCompraParam).load();
											
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
							
							
							
							var codSolicitudCompraParam =document.getElementById("SDEX").value;
							var procesoCompraParam = document.getElementById("PROEX").value;
							
							reqTable.ajax.url(getAbsolutePath() + "PantallasExportAPI" + "?submit=RactificacionExport&codSolicitudCompraParam="+codSolicitudCompraParam+"&procesoCompraParam="+procesoCompraParam).load();
							
						});
		
		
		
		$("#tablaReportExport tbody").on("click", "tr", function () {
			 var dt = $('#tablaReportExport').DataTable();        
             dt.columns([0,1,2,3,4,5,6,7]).visible(true);
             
	        $(this).addClass("selected").siblings().removeClass("selected");
	   
	        if( $(this).find("td:eq(5)").text() == 'RATIFICACION REALIZADA' && $(this).find("td:eq(4)").text() == 'SIN SOLICITAR'){        	
	        	var value;
	            value = $(this).find("td:eq(7)").text();
	            $("#SDCod").prop("value", value);
	            value = $(this).find("td:eq(9)").text();
	            $("#noItemSelected").prop("value",value);
	            
	            
	            value = $(this).find("td:eq(2)").text();
	            $("#criterioResolucionCT").prop("value", value);
	            
	            value = $(this).find("td:eq(3)").text();
	            $("#comentariosRatificacion").prop("value", value);
	            
	            
	            var options = document.getElementById("ratificacionCT").options;
	      	  for (var i = 0; i < options.length; i++) {
	      	    if (options[i].text == $(this).find("td:eq(1)").text()) {
	      	      options[i].selected = true;
	      	      break;
	      	    }
	      	  }
	      	  
	      	if( $(this).find("td:eq(4)").text() == 'REALIZADA'){
	      		
	      		var div = document.getElementById('AplicaraSegundaRecomendacionDIV');
	      		div.style.visibility = "hidden";
	      		//div.style.display = "none";
	      	}else{
	      		var div = document.getElementById('AplicaraSegundaRecomendacionDIV');
	      		div.style.visibility = "show";
	      	}
	      	  
	            value = $(this).find("td:eq(0)").text();
	            $("#idModificar").prop("value", value);
	            
	            value = $(this).find("td:eq(6)").text();
	            $("#prelacionRTC").prop("value", value);
	            
	            /* $("#advertenciaRatificacion").collapse("hide");
	            $("#ratificacion").collapse("show"); */
	       }
	        else if( $(this).find("td:eq(4)").text() == 'SOLICITADA'){        	
	       	 $("#confirMessage").text("ALERTA! ESTE ITEM NO SE PUEDE RACTIFICAR NECESITA UNA SEGUNDA RECOMENDACION");
	            $("#confirmationModalCenter").modal('show');
	       }
	        else if( $(this).find("td:eq(5)").text() == 'RATIFICACION REALIZADA'){        	
	        	 $("#confirMessage").text("ALERTA! ESTE ITEM NO SE PUEDE MODIFICAR YA ESTA RATIFICADO");
	             $("#confirmationModalCenter").modal('show');
	        }else{
	        	var value;
	        	 value = $(this).find("td:eq(7)").text();
		            $("#SDCod").prop("value", value);
		            value = $(this).find("td:eq(9)").text();
		            $("#noItemSelected").prop("value", value);
	            
	            
	            value = $(this).find("td:eq(2)").text();
	            $("#criterioResolucionCT").prop("value", value);
	            
	            value = $(this).find("td:eq(3)").text();
	            $("#comentariosRatificacion").prop("value", value);
	            
	            
	            var options = document.getElementById("ratificacionCT").options;
	      	  for (var i = 0; i < options.length; i++) {
	      	    if (options[i].text == $(this).find("td:eq(1)").text()) {
	      	      options[i].selected = true;
	      	      break;
	      	    }
	      	  }
	      	  
	      	if( $(this).find("td:eq(4)").text() == 'REALIZADA'){
	      		
	      		var div = document.getElementById('AplicaraSegundaRecomendacionDIV');
	      		div.style.visibility = "hidden";
	      		//div.style.display = "none";
	      	}else{
	      		var div = document.getElementById('AplicaraSegundaRecomendacionDIV');
	      		div.style.visibility = "show";
	      	}
	      	  
	            value = $(this).find("td:eq(0)").text();
	            $("#idModificar").prop("value", value);
	            
	            value = $(this).find("td:eq(6)").text();
	            $("#prelacionRTC").prop("value", value);
	            
	           /*  $("#advertenciaRatificacion").collapse("hide");
	            $("#ratificacion").collapse("show"); */
	        }
	        dt.columns([0,1,2,3,4,5,6,7]).visible(false);
	      });
		
		
		$("#aplicasegundaRCC").on("change", function () {
	    	  var x=$("#aplicasegundaRCC").is(":checked");
	    	  if ( x == true) {
	    		  
	    		  document.getElementById('segundaRCC').value='SOLICITADA';
	    	  }
	    	  else
	    		  document.getElementById('segundaRCC').value='SIN SOLICITAR';
	        });
		
	</script>

	<!-- Java Script section ends -->
</body>
</html>
