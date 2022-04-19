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
            String read = (String)session.getAttribute("read"); 
            String disable = (String)session.getAttribute("disable");
            String funcion = (String)session.getAttribute("funcion");
            String func = (String)session.getAttribute("funcion");
            String type = (String)session.getAttribute("type");
            int cod = (Integer)session.getAttribute("procesocompra");
          %>
          <div class="row">
            <div class="col-8 col-xs-8 col-md-8">
              <h2 class="mb-4 large-title">
                CONTROL DE PAGOS
              </h2>
              <h5 class="font-weight-light main-font mb-4">
                ACUERDO GENERAL
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
          <form action="controlPagosGeneralServlet" method="post">
            <div class="card border-0 shadow-sm mb-4 main-content-div">
              <div class="card-header border-0 bg-none">
                <div class="card-body">
                  <div class="col-md-12">
                    <div id="dataSection">
                      <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#pills-home" role="tab" aria-controls="pills-home" aria-selected="true">GENERAR ORDEN DE PAGO</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="pills-profile-tab" data-toggle="pill" href="#pills-profile" role="tab" aria-controls="pills-profile" aria-selected="false">RESUMEN DE ORDEN</a>
                        </li>
                      </ul>
                      <div class="tab-content" id="pills-tabContent">
                        <div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab">
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <div class="form-group">
                                    <input type="hidden" id="Id" name="Id" value="${Id}"/>
                                    <input type="hidden" id="procesocompracod" name="procesocompracod" value="${procesocompracod}"/>
                                    <label>NO. PROCESO DE COMPRA</label>
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
                                        String QueryString = "SELECT * FROM procesoCompraGeneral where estado1='APROBADO'"; 
                                        if(func != null && !func.contentEquals("nuevo")){
                                          QueryString = "SELECT * from dbo.procesoCompraGeneral where cod = " + cod; 
                                        }
                                        rs = state.executeQuery(QueryString);
                                      %>
                                        <select
                                          autocomplete="off"
                                          class="form-control"
                                          id="procesocompra"
                                          name="procesocompra"
                                          required
                                          onchange="ShowSelected();"
                                          <%=disable%>
                                        >
                                        <option selected disabled value="">
                                        SELECCIONA UNA OPCION...
                                      	</option>
                                        <%
                                          while(rs.next()){ 
                                            if(!funcion.contentEquals("nuevo")){
                                               
                                        %>
                                          <option selected value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
                                        <%  } else{ %>
                                          <option value="<%=rs.getString(1)%>"><%=rs.getString(2).toUpperCase()%></option>
                                        <%}i = i + 1;} %>
                                        </select>
                                      <%
                                        rs.close(); 
                                        state.close();
                                        con.close(); 
                                        }catch(Exception e){System.out.println(e); }
                                      %>
                                  </div>
                              </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>NO. ORDEN DE COMPRA</label>
                                <select
                                  autocomplete="off"
                                  class="form-control"
                                  id="ordencompra"
                                  name="ordencompra"
                                  required
                                  <%=disable%>
                                >
                                  <option selected disabled value="">
                                    SELECCIONA UNA OPCION...
                                  </option>
                                </select>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>PROVEEDOR</label>
                                <input type="text" readonly="readonly" id="proveedor" name="proveedor" class="form-control" required value="${proveedor}" <%=read%>>
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>CUENTA BANCARIA</label>
                                <input type="text" readonly="readonly" id="cuentabancaria" name="cuentabancaria" class="form-control" required value="${cuentabancaria}" <%=read%>>
                              </div>
                            </div>
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>BANCO</label>
                                <input type="text" readonly="readonly" id="banco" name="banco" class="form-control" required value="${banco}" <%=read%>>
                              </div>
                            </div>
                          </div>
                          <hr noshade="noshade" size="10" width="100%" />
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>NO. ITEM</label>
                                <input type="number" id="noItem" name="noItem" required value="${noitem}" <%=read%> class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>NO. FACTURA</label>
                                <input type="text" id="noFactura" name="noFactura" required value="${nofactura}" <%=read%> class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA LIMITE ENTREGA</label>
                                <input type="date" id="fechalimiteentrega" name="fechalimiteentrega" required value="${fechalimiteentrega}" <%=read%> class="form-control">
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>FECHA SOLICITUD CITA</label>
                                <input type="date" id="fechasolicitudcita" name="fechasolicitudcita" required value="${fechasolicitudcita}" <%=read%>  class="form-control">
                              </div>
                            </div>
                            <div class="col-lg-4 col-md-4">
                              <div class="form-group"> 
                                <label>DIAS DE ATRASO</label>
                                <input type="number" id="diasAtraso" name="diasAtraso" required value="${diasatraso}" <%=read%> class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>TOTAL PAGADO</label>
                                <input type="number" onchange="CalculoTotal();" id="totalPagado" name="totalPagado" required value="${totalpagado}" <%=read%> class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>MULTAS</label>
                                <input type="number" onchange="CalculoTotal();" id="multa" name="multa" required value="${multa}" <%=read%> class="form-control">
                              </div>
                            </div>
                          </div>
                          <div class="row">
                            <div class="col-lg-6 col-md-6">
                              <div class="form-group"> 
                                <label>PAGO TOTAL</label>
                                <input type="number" readonly="readonly" id="PagoTotal" name="PagoTotal" required value="${pagototal}" <%=read%> class="form-control">
                              </div>
                            </div>
                            <div class="col-lg-3 col-md-3">
                              <div class="form-group">   
                              <label>INFORME CALIDAD</label>  <br />                           
                                <input autocomplete="off" 
                                	   name="informeCalidadcheck"
                                	   class="form-control" 
                                	   id="informeCalidadcheck"                        	
                                	   type="checkbox"
                                	   />     
                                	    <input 
                                	   id="informeCalidad" 
                                	   name="informeCalidad" hidden value="NO APLICA" />                               	          
                              </div>                              
                            </div>   
                            <div class="col-lg-3 col-md-3">                              
                              <div class="form-group"> 
                              <label>ACTA RECEPCION</label><br />
                                <input autocomplete="off" 
                                	   id="actaRecepcioncheck" 
                                	   name="actaRecepcioncheck" 
                                	   class="form-control" 
                                	   type="checkbox" 
                                	   />	
                                	   <input 
                                	   id="actaRecepcion" 
                                	   name="actaRecepcion" hidden value="NO APLICA" />                              
                            </div>                                                 
                          </div>
                          </div>
                          
                          
                          
                          <% if(!func.toUpperCase().contentEquals("CONSULTAR") && func != null) { %>
                          <div class="row float-right">
                            <button class="btn btn-sm btn-success ml-2"
                              id="AddRegButton"
                              type="submit"
                            >
                              <i class="material-icons md-18">done</i>
                              GUARDAR
                            </button>
                          </div>
                          <%} %>
                        </div>
                        <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab">
                            <div class="text-center">
                            <p class="mb-3 text-center" style="font-weight: bold;">${procesocompracod} </p>
                            <p class="mb-3 text-center" style="font-weight: bold;">${proveedor}</p>
                            <p class="mb-3 text-center" style="font-weight: bold;">${fechalimiteentrega}</p>
                            </div>
                            <!--div class="row">
                              <div class="col-lg-12 col-md-12">
                                <div class="float-right">
                                  <button type="button" class="mb-2 mr-2 btn-rounded-circle shadow btn btn-info"><i class="material-icons">edit</i></button>
                                  <button type="button" class="mb-2 mr-2 btn-rounded-circle shadow btn btn-danger"><i class="material-icons">close</i></button>
                                </div>
                              </div>
                            </div-->
                            <div class="row" id="Imprimible">
                                    
                              <!--Table Section starts-->
                              <table
                                id="reqTable"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                              >
                              <thead>
                                <tr>
                                  <th class="all">NO. ITEM</th>
                                  <th class="min-tablet">NO. FACTURA</th>
                                  <th class="min-tablet">FECHA LIMITE DE ENTREGA</th>
                                  <th class="min-tablet">FECHA SOLICITUD CITA</th>
                                  <th class="min-desktop">DIAS DE ATRASO</th>
                                  <th class="min-desktop">TOTAL PAGADO</th>
                                  <th class="min-desktop">TOTAL MULTA</th>
                                  <th class="min-desktop">PAGO TOTAL</th>
                                </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td>L. 0.00</td>
                                    <td>L. 0.00</td>
                                    <td>L. 0.00</td>
                                  </tr>
                              </tbody>
                              </table>
                              <!--Table Section ends-->
                            </div> 
                        </div>
                      </div>
                      </div>
                  </div>
                </div>
              </div>
            </div>
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
    
    <form target="_blank"
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!-- Navigation Float Buttons section starts -->

    <!-- Cancel Float Button -->
    <form id="back" method="post" action="controlPagosGeneral.jsp">
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
      <button
        id="reportepago"
        class="btn btn-primary btn-rounded shadow main-font"
        type="button"
        style="display:none;"
      >
        GENERAR REPORTE DE PAGO 
        <i class="material-icons vm">done</i>
      </button>
    </div>
    <% } %>

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
    $(document).ready(function () {
		    var reqTable = $("#reqTable").DataTable({
		        responsive: true,
		        searching: true,
		        bLengthChange: true,
		        pageLength: 10,
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
		      <%
		      	 String informe = (String)request.getAttribute("informeCalidad");
		    	 String acta = (String)request.getAttribute("actaRecepcion");
			 	 if(funcion != null && !funcion.contentEquals("nuevo")){
			 	 %>
				 	var ordencomprainput = $("#ordencompra");
			        var ordencompravariable="${ordencompra}";
			        ordencomprainput.append('<option selected value="' + ordencompravariable + '">' + ordencompravariable + '</option>');
		     		reqTable.ajax.url(getAbsolutePath() + "controlPagosGeneral" + "?submit=ConsultarTabla&ordencompra="+$("#ordencompra").val()).load();
				<%
				
				if(informe.contentEquals("APLICA")){
					%>
					$("#informeCalidad").val('APLICA');
					 $("#informeCalidadcheck").prop("checked", true);
					<%
				}
				
				if(acta.contentEquals("APLICA")){
					%>
					$("#actaRecepcion").val('APLICA');
					$("#actaRecepcioncheck").prop("checked", true);
					<%
				}				
				}
				%>
				
				//Generador de Reporte
		        $("#reportepago").on("click", function (event) {
		          var container = document.getElementById("reportForm");
		          if (reqTable.data().any()) {
		            for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
		              var cell = reqTable.row(r).data();
		              var inputNo = document.createElement("input");
		              inputNo.setAttribute("type", "hidden");
		              inputNo.setAttribute("name", "noItem");
		              inputNo.setAttribute("value", cell[0]);
		              container.appendChild(inputNo);

		              var inputDIST = document.createElement("input");
		              inputDIST.setAttribute("type", "hidden");
		              inputDIST.setAttribute("name", "noFactura");
		              inputDIST.setAttribute("value", cell[1]);
		              container.appendChild(inputDIST);

		              var inputATC = document.createElement("input");
		              inputATC.setAttribute("type", "hidden");
		              inputATC.setAttribute("name", "fechaLimiteEntrega");
		              inputATC.setAttribute("value", cell[2]);
		              container.appendChild(inputATC);

		              var inputMR = document.createElement("input");
		              inputMR.setAttribute("type", "hidden");
		              inputMR.setAttribute("name", "fechaSolicitudCita");
		              inputMR.setAttribute("value", cell[3]);
		              container.appendChild(inputMR);

		              var inputMO = document.createElement("input");
		              inputMO.setAttribute("type", "hidden");
		              inputMO.setAttribute("name", "diasAtraso");
		              inputMO.setAttribute("value", cell[4]);
		              container.appendChild(inputMO);

		              var inputDesc = document.createElement("input");
		              inputDesc.setAttribute("type", "hidden");
		              inputDesc.setAttribute("name", "totalPagado");
		              inputDesc.setAttribute("value", cell[5]);
		              container.appendChild(inputDesc);
		              
		              var inputDesc = document.createElement("input");
		              inputDesc.setAttribute("type", "hidden");
		              inputDesc.setAttribute("name", "totalMulta");
		              inputDesc.setAttribute("value", cell[6]);
		              container.appendChild(inputDesc);
		              
		              var inputDesc = document.createElement("input");
		              inputDesc.setAttribute("type", "hidden");
		              inputDesc.setAttribute("name", "pagoTotal");
		              inputDesc.setAttribute("value", cell[7]);
		              container.appendChild(inputDesc);
		            }
		          }
		          var inputOrigin = document.createElement("input");
		          inputOrigin.setAttribute("type", "hidden");
		          inputOrigin.setAttribute("name", "origin");
		          inputOrigin.setAttribute("value", "ordenpago");
		          container.appendChild(inputOrigin);
		          event.preventDefault();
		          $("#reportForm").submit();
		        });
				
		    })
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
      $('#pills-profile-tab').on('click', function (e) {
        e.preventDefault()
        var btn_1 = document.getElementById('reportepago');
        btn_1.style.display = 'inline';
      })
      $('#pills-home-tab').on('click', function (e) {
        e.preventDefault()
        var btn_1 = document.getElementById('reportepago');
        btn_1.style.display = 'none';
      })
      $('#pills-contact-tab').on('click', function (e) {
        e.preventDefault()
        var btn_1 = document.getElementById('reportepago');
        btn_1.style.display = 'none';
      })
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
	
     function ShowSelected(){
	      /* Para obtener el valor */
	      var cod = document.getElementById("procesocompra").value;
	      /* Para obtener el texto */
	      var combo = document.getElementById("procesocompra");
	      var selected = combo.options[combo.selectedIndex].text;
	      $("#procesocompracod").val(selected);
	    }
     
     function CalculoTotal(){
			var totalpagado=$("#totalPagado").val();
			var multa=$("#multa").val();
			var total=0;
			if(totalpagado!=""){
				total=total+parseInt(totalpagado);
			}
			if(multa!=""){
				total=total-parseInt(multa);
			}
			$("#PagoTotal").val(total);

	    }
     
      $("#procesocompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var ordencomprainput = $("#ordencompra");
	        var combo = document.getElementById("procesocompra");
		    var selected = combo.options[combo.selectedIndex].text;
		    $("#proveedor").val("");
	        $("#cuentabancaria").val("");
	        $("#banco").val("");
	
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
	                    ordencomprainput.append('<option selected disabled value="">SELECCIONE UNA OPCION...</option>');

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
	    })
	    
	    $("#ordencompra").change(function(){
	    	
	        // Guardamos el select de solicitudcomprainput
	        var proveedorinput = $("#proveedor");
	        var cuentabancariainput = $("#cuentabancaria");
	        var bancoinput = $("#banco");
	
	        // Guardamos el select de procesocomprainput
	        var procesocomprainput = $(this);
	
	        if($(this).val() != '' && $(this).val() != 'SELECCIONE UNA OPCION...')
	        {
	        	var url = getAbsolutePath() + "controlPagosGeneral" + "?submit=Consultar&ordencompra="+$("#ordencompra").val();
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
	                    procesocomprainput.prop('disabled', false);
	                    // Limpiamos 
	                    proveedorinput.val("");
	                    cuentabancariainput.val("");
	                    bancoinput.val("");

	                    $(m).each(function(i, v){ // indice, valor
		                	console.log(m[i])
		                	proveedorinput.val(m[0]);
	                    	if(m[1]=="null"){
	                    		cuentabancariainput.val("CHEQUE");
	                    	}
	                    	else{
	                    		cuentabancariainput.val(m[1]);
	                    	}
	                    	if(m[2]=="null"){
	                    		bancoinput.val("NA");
	                    	}
	                    	else{
	                    		bancoinput.val(m[2]);
	                    	}
		                    
	                    })
	
	                },
	                error: function()
	                {
	                    alert('Ocurrio un error en el servidor ..');
	                    procesocomprainput.prop('disabled', false);
	                }
	            });
	        }
	    })
	    
	    $("#informeCalidadcheck").on("change", function () {	    	
	    	 if ($("#informeCalidadcheck").prop("checked")){	    	
	    		$("#informeCalidad").val('APLICA');
	    	 }else{
	    		 $("#informeCalidad").val('NO APLICA'); 		
	    	 }
	    });
      $("#actaRecepcioncheck").on("change", function () {	    	
	    	 if ($("#actaRecepcioncheck").prop("checked")){
	    		 $("#actaRecepcion").val('APLICA');
	    	 }else{
	    		 $("#actaRecepcion").val('NO APLICA');
	    	 }
	    });
	    
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
