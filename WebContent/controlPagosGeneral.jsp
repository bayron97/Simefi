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

<script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
   
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
                    <h2 class="mb-4 large-title">
                      CONTROL DE PAGOS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      ACUERDO GENERAL
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
          	<form id="editRegForm" method="post" action="Gral_controlPagosServlet">
          	<input type="hidden" id="idAperturaProceso" name="idAperturaProceso"/>
          	<input type="hidden" id="numProcesoCompra" name="numProcesoCompra"/> 
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
                  <button 
                    type="submit"
                    id="newRegButton"
                  	class="btn btn-sm btn-success ml-2"
                  	name="accion"
                  	value="nuevo"
                  >
                    <i class="material-icons md-18">add_circle</i> ORDEN DE PAGO
                  </button>                  
                  <button
                    type="submit"
                    class="btn btn-sm btn-success ml-2"
                    id="consulButton"
                    name="accion"
                    value="consultar"
                  >
                    <i class="material-icons md-18">chrome_reader_mode</i>
                    CONSULTAR
                  </button>
                  <div class="hide" id="buttonGuardar">                  
                  </div>
                </div>
              </div>
            </div>
            </form>
            <div class="card-body main-font">
              <!--Table Section starts-->
              <table
                id="datatable"
                class="table table-bordered w-100 mb-0 table-aditional-styles"
                aria-describedby="Tabla de control de pagos para ALP"
              >
                 <thead>
                  <tr>
                    <th class="all">ID APERTURA PROCESO</th>
                    <th class="all">CODIGO</th>
                    <th class="min-tablet">BENEFICIARIO</th>
                    <th class="min-tablet">NO. PROCESO DE COMPRA</th> 
                    <th class="min-tablet">MONEDA DE LA COMPRA</th>  
                    <th class="min-tablet">VALOR ENTREGADO</th>
	                <th class="min-tablet">DESEMBOLSOS EFECTUADOS</th>
	                <th class="min-tablet">DESEMBOLSOS PENDIENTES</th>
	                <th class="min-tablet">DESEMBOLSOS EFECTUADOS(LPS)</th>
	                <th class="min-tablet">ESTADO DE LA COMPRA</th>
                  </tr>
                </thead>
                <tbody>
                <%
			        try{
				        Connection con = null;
				        Statement state = null;
				        ResultSet rs = null;
				        String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
				        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				        con = DriverManager.getConnection(url,"admin","system123");
				        state = con.createStatement();
				        String QueryString = "SELECT idAperturaProceso, beneficiario, numProcesoCompra, monedaCompra, sum(valorEntregado), sum(desembolsosEfectuado), sum(desembolsosPendientes), CASE  WHEN monedaCompra = 'DOLARES AMERICANOS (USD)' THEN  sum(desembolsoEfectuadoLPS)  ELSE 0  END AS desembolsosEfectuados  FROM Gral.View_ControlPagos group by idAperturaProceso, beneficiario, numProcesoCompra, monedaCompra";
				        rs = state.executeQuery(QueryString);
			  			int count = 1;
			        while(rs.next()){
			        
			      %>
						        <tr>
							        <td><%=rs.getInt(1)%></td>
							        <td><%=count++ %></td>
							        <td><%=rs.getString(3)%></td>
							        <td><%=rs.getString(2)%></td>							        
							        <td><%=rs.getString(4)%></td>
							        <td><%=rs.getString(5)%></td>
							        <td><%=rs.getString(6)%></td>
							        <td><%=rs.getString(7)%></td>
							        <td><%=rs.getString(8)%></td>
							         <td><%if(rs.getFloat(7) == 0){%>
							         CERRADA
							        	 <%}else{%>
							        		 VIGENTE
							        	 <%}%></td>
							       
                      				
						        </tr>
			      <%}
			        rs.close();
			        state.close();
			        con.close();
			        }catch(Exception e){System.out.println(e);}
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

      $(document).ready(function () {
        /* data Table */
        $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 9,
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
               'excel', 'pdf'
          ],
        });
      });

      $("#datatable tr").click(function () {
    	  $(this).addClass("selected").siblings().removeClass("selected");      
          $("#idAperturaProceso").prop("value",$(this).find("td:eq(0)").text());
          $("#numProcesoCompra").prop("value",$(this).find("td:eq(2)").text());
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
