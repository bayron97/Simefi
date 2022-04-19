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
    
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
  </head>

  <body class="header-fixed-top body-general-styles">
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
                <form method="post" action="pcALPRouting">
                <nav class="navbar col-12 main-font">
                <input class="hide" type="submit" name="nextJsp" value ="apertura" id="aper" />
                <input class="hide" type="submit" name="nextJsp" value ="criteria" id="criteria" />
                <input class="hide" type="submit" name="nextJsp" value ="listaest" id="listaest" />
                <input class="hide" type="submit" name="nextJsp" value ="requerimientos" id="req" />
                <input class="hide" type="submit" name="nextJsp" value ="digitalizacion" id="dig" />
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
                      <label class="dropdown-item" for="aper">DATOS DE APERTURA</label>
                      <label class="dropdown-item" for="criteria">CRITERIOS DE EVALUACION</label>
                      <label class="dropdown-item" for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                      <a type="button" class="dropdown-item" href="#">LISTA DE ESTIMACIONES DE COMPRA</a>
                      <label class="dropdown-item" for="dig">TERMINOS DE REFERENCIA</label>
                    </div>
                  </div>

                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <label class="nav-link" for="aper">DATOS DE APERTURA</label>
                    </li>
                    
                    <li class="nav-item">
                      <label class="nav-link"for="req">VACIADO DE REQUERIMIENTO SEGUN OFICIO</label>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#" >LISTA DE ESTIMACIONES DE COMPRA</a>
                    </li>
                    <li class="nav-item">
                      <label class="nav-link" for="dig">TERMINOS DE REFERENCIA</label>
                    </li>
                  </ul>
                </nav>
                </form>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            <%
              String read = (String)session.getAttribute("read"); 
              String disable = (String)session.getAttribute("disable");
              String funcion = (String)session.getAttribute("funcion");
              String func = (String)session.getAttribute("funcion");
              String type = (String)session.getAttribute("type");
              int co = (int)session.getAttribute("noCompra");
            %>
            <form id="newEditRegForm">
              <div class="modal-body" style="background-color: #f1f1f1;">
                <div class="background h-320" style="border-radius: 5px;">
                  <img src="./assets/img/BAC_LOGIN.png" alt="" />
                </div>
                <div class="text-center pb-5">
                  <h1 class="mb-0 text-white">
                    PROCESO DE COMPRA A LARGO PLAZO
                  </h1>
                  <span class="badge badge-primary mb-5">
                    <h4 class="text-white font-weight-light ml-2 mr-3">
                      <% if (func.toUpperCase().contentEquals("NUEVO")) {%>
                      <i class="material-icons vm">add_circle</i>
                      <% } else if (func.toUpperCase().contentEquals("MODIFICAR")) {%>
                      <i class="material-icons vm">edit</i>
                      <% } else if (func.toUpperCase().contentEquals("CONSULTAR")) {%>
                      <i class="material-icons vm">chrome_reader_mode</i>
                      <% } else if (func.toUpperCase().contentEquals("REVISAR")) {%>
                      <i class="material-icons vm">done_all</i>
                      <% } else {%>
                      <i class="material-icons vm">error</i>
                      <% } %>
                      <%=func.toUpperCase()%>
                    </h4>
                  </span>
                </div>

                <div class="row top-60">
                  <div class="col-12 col-md-12">
                    <div class="card border-0 shadow bg-white h-100">
                      <div
                        class="card-body text-center"
                        style="
                          background: url(./assets/img/BAC.png) no-repeat center center fixed;
                          background-size: cover;
                        "
                      >
                        <i
                          id="infoIcon"
                          class="avatar avatar-60 md-36 material-icons text-template-primary"
                          >assignment</i
                        >
                        <h5
                          id="instructionSubtitle"
                          class="mb-3 text-center"
                          style="font-weight: bold;"
                        >
                          LISTA DE ESTIMACIONES DE COMPRA
                        </h5>
                        
                        <div class="card-body main-font">
                          <div class="row" id="Imprimible">
                          <div class="col-lg-12 col-md-12">
                            <!--Table Section starts-->
                            <table
                              id="reqTable"
                              class="table table-bordered w-100 mb-0 table-aditional-styles"
                            >
                            <thead>
                              <tr>
                                <th class="all">NO. ITEM</th>
                                <th class="min-tablet">CODIGO ATC</th>
                                <th class="min-tablet">CODIGO SESAL</th>
                                <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                                <th class="min-tablet">DESCRIPCION TECNICA</th>
                                <th class="min-desktop">UNIDAD DE PRESENTACION</th>
                                <th class="min-desktop">CANTIDAD</th>
                              </tr>
                            </thead>
                            <tbody>
                              <% 
                                try{ 
                                  Connection con = null;
                                  Statement state = null;
                                  Statement state1 = null;
                                  int i = 1;
                                  ResultSet rs = null;
                                  ResultSet rs1 = null;
                                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                  con = DriverManager.getConnection(url,"admin","system123");
                                  state = con.createStatement(); 
                                  int pC = (Integer)session.getAttribute("noCompra"); 
                                  /* String QueryString = "select * from dbo.listaRequerimientoConsolidadaALP where procesoCompra = " + pC; */
                                  String QueryString = "select LC.IDLISTREQUIREMENT, LC.CODIGOATC, M.codSesal, LC.NOMBREPRODUCTO, LC.DESCRIPCIONTECNICA, LC.UNIDADPRESENTACION, LC.CANTIDADREQUERIDA from listaRequerimientoConsolidadaALP AS LC INNER JOIN MEDICAMENTOS AS M ON LC.CODIGOATC = M.CODATC AND LC.nombreProducto = M.nombre and LC.codSesal = M.codSesal and LC.unidadPresentacion = M.up  where procesoCompra = " + pC+" and esEnmienda = 'false' group by LC.IDLISTREQUIREMENT, LC.CODIGOATC, M.codSesal, LC.NOMBREPRODUCTO, LC.DESCRIPCIONTECNICA, LC.UNIDADPRESENTACION, LC.CANTIDADREQUERIDA ";
                                  rs = state.executeQuery(QueryString); %> <%
                                  while(rs.next()){ 
                              %>
                                  <tr>
                                    <td><%=rs.getString(1)%></td>
                                    <td><%=rs.getString(2)%></td>
                                    <td><%=rs.getString(3)%></td>
                                    <td><%=rs.getString(4)%></td>
                                    <td><%=rs.getString(5)%></td>
                                    <td><%=rs.getString(6)%></td>
                                    
                                    
                                    
                                    <%
                                    
                                    System.out.println(rs.getString(4)+ " medicamento");
                                    
                                     state1 = con.createStatement(); 
                                 //String QueryString1 = "SELECT SUM(cantidadRequerida) FROM dbo.listaRequerimientoALP WHERE procesoCompra = " + pC+"   and esEnmienda = 'false'";
                                 String QueryString1 = "SELECT SUM(cantidadRequerida) FROM dbo.listaRequerimientoALP WHERE procesoCompra = " + pC+" and nombreMedicamento = '"+rs.getString(4)+"'  and esEnmienda = 'false'";
                                  
                                 rs1 = state1.executeQuery(QueryString1); %> <%
                                  while(rs1.next()){ 
                              %>
                                  
                                    <td><%=rs1.getFloat(1)%></td>
                             
                                <%} 
                                  rs1.close(); 
                                  state1.close();
                                  
                                    
                                  %>
                                  
                                    
                                    
                                  </tr>
                                <%i = i + 1;
                                  } 
                                  rs.close(); 
                                  state.close();
                                  con.close(); 
                                  }catch(Exception e){System.out.println(e); }
                                %>
                            </tbody>
                            </table>
                            <!--Table Section ends-->
                            </div>
                          </div>
                          <!-- <div class="row">
                            <div class="col-lg-12 col-md-12">
                              <div class="form-group float-right">
                                <button
                                  class="btn btn-sm btn-success ml-2"
                                  id="GenerateReport"
                                  type="button"
                                >
                                  <i class="material-icons md-18">reorder</i>
                                    GENERAR REPORTE
                                </button>
                                <button
                                  class="btn btn-sm btn-success ml-2"
                                  id="PrintReport"
                                  type="button"
                                >
                                  <i class="material-icons md-18">assessment</i>
                                    IMPRIMIR
                                </button>
                              </div>
                            </div>
                          </div> -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
            </form>
            <div
                class="modal-footer border-0 pt-0"
                style="background-color: #f1f1f1;"
              >
                <!-- Submit Float Button -->
                <form
				      id="regListForm"
				      method="post"
				      action="nPurchaseProcessDigForALP.jsp"
				    >
                <div class="wrap-fixed-float wrap-fixed-bottom-right">
                
                    <button
                  	  id="submit"
                  	  type="submit"
                  	  name="submit"
                  	  style="display: none"
                  	></button>
                  
                  
                  <%
                  
                  if(func.contentEquals("nuevo")|| func.contentEquals("modificar")| func.contentEquals("revisar")){%>
                	<button
                    id="siguiente"
                    type="submit"
                    class="btn btn-primary btn-rounded shadow main-font"
                    
                  >
                    <span> GUARDAR Y CONTINUAR</span>
                    <i class="material-icons vm">arrow_forward</i>
                  </button>
                	<%}
                  else {%>
                  <button
                    id="siguiente"
                    type="submit"
                    class="btn btn-primary btn-rounded shadow main-font"
                    
                  >
                    <span>CONTINUAR</span>
                    <i class="material-icons vm">arrow_forward</i>
                  </button>
                  <% 
                	  
                	  
                  }%>
                  
                  
                </div>
              </div>
              </form>
            <!--Form Edit Reg ends-->
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
   <!-- por mientras -->
   <!--  <form method="post" action="nPurchaseProcessRequirementsListForALP.jsp">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button 
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit1"
          value="cancelar"
        >
          <i class="material-icons vm">arrow_back</i> REGRESAR
        </button>
      </div>
    </form> -->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--Med Insumos Modal-->

    <!--Rev Aprov Reg Modal-->


    <!-- Confirmation Modal -->

    <!--Custom New Modal Here-->

    <!-- Modal Section ends-->

    <!--Special Section starts-->
    <form
      id="regListForm"
      method="post"
      action="listaRequerimientoALPServlet"
      class="hide"
    ></form>
    
    <form target="_blank"
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>

    <!--Special Section ends-->

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
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>

    <!--Bootstrap Javascript-->
    <script src="./assets/js/bootstrap.min.js"></script>

    <!-- Customized page level js -->
    <script>
      $(document).ready(function () {
        /*Tabla de Requerimientos*/
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          pageLength: 10,
          columnDefs: [
            {
              targets: 5,
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
               'excel','pdf'
          ],
        });
        
      //Generador de Reporte
        $("#GenerateReport").on("click", function (event) {
          var container = document.getElementById("reportForm");
          if (reqTable.data().any()) {
            for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();
              var inputNo = document.createElement("input");
              inputNo.setAttribute("type", "hidden");
              inputNo.setAttribute("name", "numero");
              if (cell[0]) {
                inputNo.setAttribute("value", cell[0]);
              }
              container.appendChild(inputNo);

              var inputDIST = document.createElement("input");
              inputDIST.setAttribute("type", "hidden");
              inputDIST.setAttribute("name", "codigoatc");
              if (cell[1]) {
                inputDIST.setAttribute("value", cell[1]);
              }
              container.appendChild(inputDIST);

              var inputATC = document.createElement("input");
              inputATC.setAttribute("type", "hidden");
              inputATC.setAttribute("name", "nombre");
              if (cell[3]) {
                inputATC.setAttribute("value", cell[3]);
              }
              container.appendChild(inputATC);

              var inputMR = document.createElement("input");
              inputMR.setAttribute("type", "hidden");
              inputMR.setAttribute("name", "descripciones");
              if (cell[4]) {
                inputMR.setAttribute("value", cell[4]);
              }
              container.appendChild(inputMR);

              var inputMO = document.createElement("input");
              inputMO.setAttribute("type", "hidden");
              inputMO.setAttribute("name", "unidad");

              if (cell[5]) {
                inputMO.setAttribute("value", cell[5]);
              }

              container.appendChild(inputMO);

              var inputDesc = document.createElement("input");
              inputDesc.setAttribute("type", "hidden");
              inputDesc.setAttribute("name", "cantidad");
              if (cell[6]) {
                inputDesc.setAttribute("value", cell[6]);
              }
              container.appendChild(inputDesc);
            }
          }
          var inputOrigin = document.createElement("input");
          inputOrigin.setAttribute("type", "hidden");
          inputOrigin.setAttribute("name", "origin");
          inputOrigin.setAttribute("value", "consolidado");
          container.appendChild(inputOrigin);
          event.preventDefault();
          $("#reportForm").submit();
        });

      });
      
      document.querySelector("#PrintReport").addEventListener("click", function() {
    	  var div = document.querySelector("#Imprimible");
    	  imprimirElemento(div);
    	});
      function imprimirElemento(elemento) {
	    	  var ventana = window.open('', 'PRINT');
	    	  ventana.document.write('<html><head><title>' + document.title + '</title>');
	    	  ventana.document.write('<link href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css" rel="stylesheet"/>');
	    	  ventana.document.write('<link href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css" rel="stylesheet" />'); 
	    	  ventana.document.write('</head><body >');
	    	  ventana.document.write('<h3>LISTA DE ESTIMACIONES DE COMPRA</h3>');
	    	  ventana.document.write(elemento.innerHTML);
	    	  ventana.document.write('</body></html>');
	    	  ventana.document.close();
	    	  ventana.focus();
	    	  ventana.onload = function() {
	    	  ventana.print();
	    	  ventana.close();
    	  };
    	  return true;
    	}
      
    </script>
    <!-- Java Script section ends -->
  </body>
</html>
