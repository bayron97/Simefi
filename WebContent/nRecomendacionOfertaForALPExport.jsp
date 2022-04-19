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
<!-- Customized template style mandatory starts-->

<!-- Customized template style mandatory ends-->

<!--Styles Area Ends-->
</head>

<body class="sidemenu-open header-fixed-top body-general-styles">


	<!-- wrapper starts -->

	<!-- Main container starts -->
	<%
	//int codPadre = (int)session.getAttribute("codPadre");
	String SD = request.getParameter("SD");
	String idSolicitud = (String)request.getAttribute("SDID");
	
	System.out.println(SD);
	System.out.println(idSolicitud);
	%>
	<div class="card-body">
		<button class="btn btn-sm btn-success ml-2" data-target="#newRegModal"
			data-toggle="modal" data-backdrop="false" id="openmodal">
			<i class="material-icons md-18">add_circle</i> EDITAR TABLA
		</button>
		<button class="btn btn-sm btn-success ml-2" data-target="#newEditReg"
			data-toggle="modal" id="recommendationButton" data-backdrop="false">
			<i class="material-icons md-18">add_circle</i> APLICAR RECOMENDACION
		</button>
	</div>
	<div class="card-body" style="overflow-x: auto;">
		<input type="hidden" id="parametroBusca" name="parametroBusca" value="<%=SD%>" />
		
		
		
		<!--Table Section Starts-->
		 <table
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                 		 <th class="all">NO. SYSTEM</th>
                      <th class="min-desktop">NOM. OEFERTA PROVEEDOR</th>
                      <th class="min-tablet">PROVEEDOR</th>
                      <th class="min-desktop">NO. ITEM</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">CODIGO SESAL</th>
                      <th class="min-tablet">PRODUCTO REQUERIDO</th>
                      <th class="min-tablet">PRODUCTO OFERTADO</th>
                      <th class="min-tablet">DESCRIPCION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCROCION TECNICA OFERTADA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION REQUERIDA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION OFERTADA</th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">MONEDA</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>                      
                      <th class="min-desktop">FABRICANTE</th>
                      <th class="min-desktop">PAIS DE ORIGEN</th>
                      <th class="min-desktop">REGISTRO SANITARIO/OTROS</th>
                      <th class="min-desktop">NO. REGISTRO SANITARIO/OTROS</th>                      
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>
                      <th class="min-desktop">FECHA DE EMISION</th>                      
                      <th class="min-desktop">CERTIFICADO DE BUENAS PRACTICAS/OTROS</th>
                      <th class="min-desktop">NO. CERTIFICADO DE BUENAS PRACTICAS/OTROS</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>                      
                      <th class="min-desktop">FECHA DE EMISION</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUETADO PRIMARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUETADO SECUNDARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO EMPAQUETADO TERCIARIO OFERTADO</th>
                      <th class="min-desktop">OBSERVACIONES DE OFERTAS DE PROVEEDORES</th>                      
                      <th class="min-desktop">NO. FOLIO DE LA ORDEN</th>
                      <th class="min-desktop">MUESTRA PRESENTADA</th>
                      <th class="min-desktop">SOLICITUDES DE ACLARACION</th>
                      <th class="min-desktop">RESPUESTA DE SOLICITUDES DE ACLARACIONES</th>
                      <th class="min-desktop">CONSULTAS/OBSERVACIONES ARSA</th>
                      <th class="min-desktop">CONSULTAS BENEFICIARIO</th>
                      <th class="min-desktop">OBSERVACIONES A LA OFERTA DEL CEO</th>
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CALIDAD</th> 
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CONTRATOS</th>      
                      
                      <th class="min-desktop">RECOMENDACION DEL COMITE</th>              
                      <th class="min-desktop">CRITERIO DE RECOMENDACION</th>                                  
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">RECOMENDACION AL BENENFICIARIO</th>
                      <th class="min-desktop">PRELACION DE RECOMENDACION TECNICA</th>
                           <%
								try {
									Connection con = null;
									Statement state = null;
									int st = 0;
									ResultSet rs = null;
									String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
									
									int idPadre = Integer.parseInt(session.getAttribute("codPadreVaciadoER").toString());
									
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									con = DriverManager.getConnection(url, "admin", "system123");
									state = con.createStatement();
									
									String QueryString = "SELECT ce.NombreCriterio FROM CriterioEvaluacionOpcionVaciadoRecomendacionALP as ceovalp\r\n"
											+ "inner join CriteriosEvaluacion as ce on ceovalp.idC = ce.id\r\n"
											+ "inner join CriteriosEvaluacionDetalle as ced on ceovalp.idCD = ced.id\r\n"
											+ "where ceovalp.idPadre = '"+ idPadre +"' \r\n"
											+ "group by ce.NombreCriterio ";
									rs = state.executeQuery(QueryString);
							
								
									while (rs.next()) {										 
										 %>
										 <th class="min-desktop"><%= rs.getString(1).toUpperCase() %></th>
										 <%
									}								
								
								rs.close();
								state.close();
								con.close();
								} catch (Exception e) {
								System.out.println(e);
								}
								%>          
                      
                      
                      <th class="min-desktop">RECOMENDACION DEL COMITE</th>
                       <th class="min-desktop">PRELACION-RALP</th>
                      <th class="min-desktop">CRITERIO DE RECOMENDACION</th>                                  
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">RECOMENDACION AL BENENFICIARIO</th>
                      
                      
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
                <form id="recommendForm">
                  <input type="hidden" id="SDCod" name="SDCod"/>
                  <input type="hidden" id="noItemSelected" name="noItemSelected"/>
                  
                  <div  id="recomendacion">
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
	<script
		src="./assets/vendor/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.responsive.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedHeader.min.js"></script>
	<script
		src="./assets/vendor/DataTables-1.10.18/js/dataTables.fixedColumns.min.js"></script>

	<!--Bootstrap Javascript-->
	<script src="./assets/js/bootstrap.min.js"></script>

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

		$(document)
				.ready(
						function() {
							/* data Table */
							var reqTable = $("#reqTable").DataTable({
						          responsive: true,
						          searching: true,
						          bLengthChange: true,
						          scrollY:        600,
						          deferRender:    true,
						          scroller:       true,
						          columnDefs: [
						        	  /* {
						              targets: 49,
						              orderable: false, 
						            },*/
						            	{
						                    "targets": [40],
						                    "visible": false
						                    
						                },
						                {
						                    "targets": [41],
						                    "visible": false,
						                   
						                },
						                {
						                    "targets": [42],
						                    "visible": false,
						                    
						                },
						                {
						                    "targets": [43],
						                    "visible": false,
						                   
						                }, 
						                {
						                    "targets": [44],
						                    "visible": false,
						                   
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

							var searchValue = 0;
							var SDCod = "";
							
							 $("#reqTable tbody").on("click", "tr", function () {
								 var dt = $('#reqTable').DataTable();
					             //hide the second and third columns
					             dt.columns([40,41,42,43,44]).visible(true);
								 
							        $(this).addClass("selected").siblings().removeClass("selected");
							        var value;
							        value = $(this).find("td:eq(40)").text();							       
							        if (value === "-"){
							          $("#recomendacionCE").prop("value", "NO");
							        }
							        else{
							          $("#recomendacionCE").prop("value", value);
							        }
							        value = $(this).find("td:eq(41)").text();
							        $("#criterioRecomendacion").prop("value", value);
							       
							        value = $(this).find("td:eq(44)").text();
							        if(value === "-"){
							          $("#prelacionRT").prop("value", 5);
							        }
							        else{
							          $("#prelacionRT").prop("value", value);
							        }
							        
							        value = $(this).find("td:eq(42)").text();
							        $("#observaciones").prop("value", value);

							      //PENDIENTE HALARA CAMPO
							        value = $(this).find("td:eq(0)").text();
							        SDCod = value;
							       
							        
							        value = $(this).find("td:eq(3)").text();
							        searchValue = value;
							        
							        dt.columns([40,41,42,43,44]).visible(false);
							          const rowSelected = $(this);
							        
							        $("#noItemSelected").prop("value", searchValue);

							        $("#advertenciaRecomendacion").collapse("hide");
							        $("#recomendacion").collapse("show");
							      });
							//alert(document.getElementById("parametroBusca").value)
							
							reqTable.ajax.url(getAbsolutePath() + "ALPRecomendacionExportAPI" + "?buyRequestCodAll=" + document.getElementById("parametroBusca").value).load();
							
							
							$("#confirmModalButton").on("click", function (event) {
					            event.preventDefault();
					            $("#newRegModalCenter").modal('hide');

					            $("#confirMessage").text(
					                "GUARDANDO REGISTRO, PORFAVOR ESPERE..."
					            );
					            $("#confirmationModalCenter").modal('show');

					            
					            if ($("#tempNo").val() === "" || $("#tempNo").val() === "No hay datos disponibles en la tabla.") {
					              $("#confirMessage").text(
					                "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
					              );
					            } else {
					              
					             
					              $('#newEditReg').modal('hide');
					               var url = getAbsolutePath() + "ALPManageRecommendOffersForERAPI" + "?mode=new";		          
							           var recomendacionCE = $("#recomendacionCE").val();
							           var criterioRecomendacion = $("#criterioRecomendacion").val();
							           var observaciones = $("#observaciones").val();
							           var prelacionRT = $("#prelacionRT").val();
							           
							          	var  noItemSelected = document.getElementById("noItemSelected").value;
							           
							          	
							          	
							           $.ajax({
							        	    url:url,
							        	    type:"POST",
							        	    dataType:'json',
							        	    data: {recomendacionCE:recomendacionCE, 
							        	    	   criterioRecomendacion:criterioRecomendacion, 
							        	    	   observaciones:observaciones, 
							        	    	   prelacionRT:prelacionRT, 
							        	    	   SDCod:SDCod, 
							        	    	   noItemSelected:noItemSelected },
							        	    success:function(data){	
							        	    	 $("#confirMessage").text("EXITOSO! REGISTRO GUARDADO CORRECTAMENTE");
							        	                $("#confirmationModalCenter").modal('show');
							             	
							        	                var Datar=reqTable.rows('.selected').data()[0];
								              			 reqTable.row('.selected').remove().draw( false );
								             
								               			 Datar[40]=recomendacionCE;
										      			 Datar[41]=criterioRecomendacion.toUpperCase();
										        		 Datar[42]=observaciones.toUpperCase();
										        		 Datar[44]=prelacionRT;
										        		 reqTable.row.add(Datar).draw();
										             	 
										                 $("#PrelacionSection").addClass("hide");
										                 
							                 cleanFields();
							                 $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
							        	}
							           });
					              
					              
					            }
					          });
							
						});
		
		function cleanFields(){
	        $("#recomendacionCE").prop("value", "NO");
	        $("#criterioRecomendacion").prop("value", "");
	        $("#prelacionRT").prop("value", 5);
	        $("#observaciones").prop("value", "");
	      }
		
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
