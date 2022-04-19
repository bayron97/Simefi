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
    <meta content="Plataforma de Fidecomisos de Banco de Occidente" name="description"/>
    <meta content="Authcode" name="author" />
    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

   <!--  <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 	<script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
 -->
    <!--Styles Area Ends-->
    <style>
   		/* #datatable th:nth-child(1){
			   display: none;
			}
		#datatable td:nth-child(1){
			   display: none;
			}  */
    </style>
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
    <!-- Sidebar starts -->
    <jsp:include page="Header.jsp" flush="true" />
    <!-- Sidebar ends -->

    <!-- wrapper starts -->
    <div class="wrapper">
      <div class="content shadow-sm main-content-div">      
        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-6">
                    <h2 class="mb-4 large-title">APERTURA DE PROCESOS DE COMPRA</h2>
                    <h5 class="font-weight-light main-font">COMPRAS GENERALES</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
          	<!-- <form method="post" action="pCompraGeneralWizardRouting" onsubmit="return submitform(true);"> -->
          	<form method="post" action="pCompraGeneralWizardRouting" onsubmit="return submitform(true);">
            <input type="hidden" id="idAperturaProceso" name="idAperturaProceso" value="0"/>
            <input type="hidden" id="estado" name="estado"/>
          	<input type="hidden" id="type" name="type" value="General"/>
          	<input type="hidden" id="type" name="next" value="purchaseProcessesGeneral.jsp"/>
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
                  <button id="newRegButton" class="btn btn-sm btn-success ml-2" name="submit" value="nuevo" onclick="Evaluarestado('nuevo')"><i class="material-icons md-18">add_circle</i> NUEVO </button>
                  <button class="btn btn-sm btn-success ml-2" id="editRegButton" name="submit" value="modificar" onclick="Evaluarestado('modificar')"><i class="material-icons md-18">edit</i> MODIFICAR</button>
                  <button class="btn btn-sm btn-success ml-2" id="consulButton" name="submit" value="consultar" onclick="Evaluarestado('consultar')"><i class="material-icons md-18">chrome_reader_mode</i>CONSULTAR</button>
                  <button class="btn btn-sm btn-success ml-2" id="revAprovButton" name="submit" value="revisar" onclick="Evaluarestado('revisar')"><i class="material-icons md-18">done_all</i> REVISAR Y APROBAR</button>
                </div>
              </div>
            </div>
            </form>
            <div class="card-body main-font">
              <!--Table Section starts-->
              <table id="datatable" class="table table-bordered w-100 mb-0 table-aditional-styles">
                <thead>
                  <tr>
                   <th class="all">ID APERTURA</th>
                    <th class="all">COD</th>                   
                    <th class="min-tablet">NO. PROCESO DE COMPRA</th>
                    <th class="min-tablet">TIPO DE COMPRA</th>
                    <th class="min-desktop">BENEFICIARIO</th>
                    <th class="min-tablet">NO. ITEMS REQUERIDOS</th>
                    <th class="min-desktop">FECHA DE PRESENTACION</th>
                    <th class="min-desktop">FECHA DE APERTURA</th>
                    <th class="min-tablet">ESTADO</th>     
                    <th class="none">OBSERVACIONES</th>                 
                  </tr>
                </thead>
                <tbody>
                	<%
						try{
							Connection con = null;
							Statement state = null;
							int i = 1;
							ResultSet rs = null;
							String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
							Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
							con = DriverManager.getConnection(url,"admin","system123");
							state = con.createStatement();
							String QueryString = "select ap.idAperturaProceso, ap.numProcesoCompra, ap.descripcionCompra, ap.beneficiario, count(lr.idlistaRequerimiento) as itemsRequeridos, ap.fechaLimite, ap.fechaApertura, ap.estado, ap.observaciones  from  Gral.aperturaProceso as ap left join Gral.oficioBeneficiario as ob on  ob.idAperturaProceso = ap.idAperturaProceso left join Gral.listaRequerimiento as lr on lr.idOficioBeneficiario = ob.idOficioBeneficiario group by ap.idAperturaProceso, ap.numProcesoCompra, ap.descripcionCompra, ap.beneficiario, ap.fechaLimite, ap.fechaApertura, ap.estado, ap.observaciones";
							rs = state.executeQuery(QueryString);
						%>
						<% 	
						while(rs.next()){							
							
						%>
						<tr>
							<td><%=rs.getInt(1)%></td>
							<td><%=i++%></td>							
							<td><%=rs.getString(2)%></td>
							<td><%=rs.getString(3) %></td>
							<td><%=rs.getString(4)%></td>
              				<td><%=rs.getString(5)%></td>
							<td><%=rs.getString(6)%></td>
							<td><%=rs.getString(7)%></td>
							<td><%=rs.getString(8)%></td>
							<td><%=rs.getString(9)%></td>							
						</tr>
						<%}
						rs.close();
						state.close();
						con.close();
						}catch(Exception e){
							System.out.println(e);
						}
						%>
                </tbody>
              </table>
              <!--Table Section ends-->
            </div>
          </div>
        </div>
        <!-- Main container ends -->
      </div>
      <jsp:include page="Footer.jsp" flush="true" />
       </div>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <!--**********No Buttons in this page**********-->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Confirmation Modal -->
    <div class="modal fade " id="confirmationModalCenter" tabindex="-1" role="dialog" aria-hidden="true">
      <div class="modal-dialog modal-sm modal-dialog-centered " role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div class="card-body" style="background: url(BAC.png) no-repeat center center">
              <div class="background h-50"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
              <figure class="avatar avatar-100 mx-auto mb-4"><img src="./bancoccicon.png" alt=""></figure>
              <div class="modal-body main-font" id="confirMessage">-DESCRIPCION MOTIVO DE LA MODAL-</div>
              <div>
                <button class="btn btn-primary btn-block main-font" id="confirModalButton" data-dismiss="modal">ACEPTAR <i class="material-icons md-18">done</i></button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  
    
  
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>

  
    <!-- Customized page level js -->
    <script>
      "use strict";
      $(document).ready(function () {
        /* data Table */
        $("#datatable").DataTable({
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
          order: [[0, "asc"]],
          dom: 'Bfrtip',
          buttons: [
               {
		        	  extend: 'pdf', orientation: 'landscape'
		        	  },
		        	  {
		        		  extend: 'excel'
		        	  }
          ],
        });
      });



      $("#datatable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");       
        $("#idAperturaProceso").prop("value", $(this).find("td:eq(0)").text());
        $("#estado").prop("value", $(this).find("td:eq(8)").text());
        
      });
      
      var statusform=null;
      function Evaluarestado(opcion){    	  
        var est=$("#estado").val();       
        if(opcion=="modificar"){
        	if(est=="EN REVISION" || est=="APROBADO"){
                $("#confirMessage").text("NO SE PUEDE MODIFICAR EL PROCESO DE COMPRA PORQUE ESTA " + est);
                $("#confirmationModalCenter").modal();
                statusform=false;
             }
        	
        	else{
        		statusform=true;
        	}
        }
        else if(opcion=="revisar"){
    		if(est=="EN PROCESO" || est=="RECHAZADO"){
                $("#confirMessage").text("NO SE PUEDE REVISAR Y APROBAR ESTE PROCESO DE COMPRA PORQUE ESTA " + est);
                $("#confirmationModalCenter").modal();
                statusform=false;
             }
    		else{
        		statusform=true;
        	}
    	}
        else{
          statusform=true;
        }
        
      }
      
      function submitform(value){
          if(statusform!=null){
        	  return statusform;
          }
          else{
        	  return value;
          }
      }
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
