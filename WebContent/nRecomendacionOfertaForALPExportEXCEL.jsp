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
	
	
	<div class="card-body" style="overflow-x: auto;">
		<input type="hidden" name="SDEX"  id="SDEX" value="<%=SDEX%>"/>
		<input type="hidden"  id="PROEX" value="<%=PROEX%>"/>
		<!--Table Section Starts-->
		 <table id="tablaReportExport" class="table table-bordered w-100 mb-0 table-aditional-styles">
                  <thead>
                    <tr>
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
	
	
	 <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
			var pathName = loc.pathname.substring(0, loc.pathname
					.lastIndexOf("/") + 1);
			return loc.href
					.substring(
							0,
							loc.href.length
									- ((loc.pathname + loc.search + loc.hash).length - pathName.length));
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
						            {
						              targets: 34,
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
						          dom: 'Bfrtip',
						          buttons: [
						              'excel'
						          ],
						        });
							
							
							
							
							var codSolicitudCompraParam =document.getElementById("SDEX").value;
							var procesoCompraParam = document.getElementById("PROEX").value;
							
							reqTable.ajax.url(getAbsolutePath() + "InformesDataALPAPI" + "?submit=infRecContratacion&codSolicitudCompraParam="+codSolicitudCompraParam+"&procesoCompraParam="+procesoCompraParam).load();
							
						});
		
		
		
		
	</script>

	<!-- Java Script section ends -->
</body>
</html>
