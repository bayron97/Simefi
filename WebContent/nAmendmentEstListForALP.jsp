<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %> 

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
    <style>
      * {
        box-sizing: border-box;
      }
      body {
        font: 16px Arial;
      }
      .autocomplete {
        /*the container must be positioned relative:*/
        position: relative;
        display: inline-block;
      }
      input {
        border: 1px solid transparent;
        background-color: #f1f1f1;
        padding: 10px;
        font-size: 16px;
      }
      input[type="text"] {
        background-color: #f1f1f1;
        width: 100%;
      }
      input[type="submit"] {
        background-color: DodgerBlue;
        color: #fff;
      }
      .autocomplete-items {
        position: absolute;
        border: 1px solid #d4d4d4;
        border-bottom: none;
        border-top: none;
        z-index: 99;
        /*position the autocomplete items to be the same width as the container:*/
        top: 100%;
        left: 0;
        right: 0;
      }
      .autocomplete-items div {
        padding: 10px;
        cursor: pointer;
        background-color: #fff;
        border-bottom: 1px solid #d4d4d4;
      }
      .autocomplete-items div:hover {
        /*when hovering an item:*/
        background-color: #e9e9e9;
      }
      .autocomplete-active {
        /*when navigating through the items using the arrow keys:*/
        background-color: DodgerBlue !important;
        color: #ffffff;
      }
    </style>
    <!-- Customized template style mandatory ends-->

    <!--Styles Area Ends-->
    
    <script type="stylesheet" src="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css"></script>
 <script type="stylesheet" src="https://cdn.datatables.net/buttons/1.7.0/css/buttons.dataTables.min.css"></script>
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
          <div class="row submenu">
            <div class="container-fluid" id="submenu-container">
              <div class="row">
                <!-- Submenu section starts -->
                <% if (!openMode.equalsIgnoreCase("disabled")) { %>
                <form method="post" action="amendmentsBarALPRouting">
                  <nav class="navbar col-12 main-font">
                    <div class="dropdown mr-auto d-flex d-sm-none">
                      <input type="hidden" name="id" id="id" value="${cod}" />
                      <input
                        class="hide"
                        type="submit"
                        name="submit"
                        id="apertData"
                        value="apertData"
                      />
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
                        <label class="dropdown-item" for="apertData"
                          >DATOS DE ENMIENDA</label
                        >
                        <a type="button" class="dropdown-item active" href="#"
                          >LISTA DE ESTIMACIONES DE COMPRA</a
                        >
                      </div>
                    </div>
                    <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                      <li class="nav-item">
                        <label class="nav-link" for="apertData"
                          >DATOS DE ENMIENDA</label
                        >
                      </li>
                      <li class="nav-item">
                        <a class="nav-link active" href="#"
                          >LISTA DE ESTIMACIONES DE COMPRA</a
                        >
                      </li>
                    </ul>
                  </nav>
                </form>
                <% } else { %>
                <nav class="navbar col-12 main-font">
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
                      <a class="dropdown-item" href="#">DATOS DE ENMIENDA</a>
                      <a type="button" class="dropdown-item active" href="#"
                        >LISTA DE ESTIMACIONES DE COMPRA</a
                      >
                    </div>
                  </div>
                  <ul class="nav nav-pills mr-auto d-none d-sm-flex">
                    <li class="nav-item">
                      <a class="nav-link" href="#">DATOS DE ENMIENDA</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" href="#"
                        >LISTA DE ESTIMACIONES DE COMPRA</a
                      >
                    </li>
                  </ul>
                </nav>
                <% } %>
                <!-- Submenu section ends -->
              </div>
            </div>
          </div>
        </div>

        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <!--Form Edit Reg starts-->
            <div class="modal-body" style="background-color: #f1f1f1">
              <div class="background h-320" style="border-radius: 5px">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">ACLARACION Y ENMIENDA</h1>
                <span class="badge badge-primary mb-5">
                  <h4 class="text-white font-weight-light ml-2 mr-3">
                    <i class="material-icons vm">edit</i>
                    MODIFICACION DE LISTA DE ESTIMACION
                  </h4>
                </span>
              </div>

              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body text-center"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center
                          center fixed;
                        background-size: cover;
                      "
                    >
                      <i
                        id="infoIconExternal"
                        class="avatar avatar-60 md-36 material-icons text-template-primary"
                        >assignment</i
                      >
                      <h5
                        id="instructionSubtitleExternal"
                        class="mb-3 text-center"
                        style="font-weight: bold"
                      >
                        LISTA DE ESTIMACIONES DE COMPRA CONSOLIDADAS
                      </h5>
                      <% if (!openMode.equalsIgnoreCase("disabled")) { %>
                      <div class="card-body main-font">
                        <div class="row">
                          <div class="col-12 col-md">
                            <p class="fs15 float-left">
                              NOTA: SELECCIONE UN REGISTRO PARA EDITAR
                            </p>
                          </div>
                          <div class="col-auto align-self-center main-font">
                            <button
                              id="newRegButton"
                              class="btn btn-sm btn-success ml-2"
                              data-target="#newEditReg"
                              data-toggle="modal"
                            >
                              <i class="material-icons md-18">add_circle</i>
                              NUEVO
                            </button>
                            <button
                              class="btn btn-sm btn-success ml-2"
                              id="editRegButton"
                              data-target="#newEditReg"
                              data-toggle="modal"
                            >
                              <i class="material-icons md-18">edit</i> MODIFICAR
                              & CAMBIAR ESTADO
                            </button>
                          </div>
                        </div>
                      </div>
                      <% } %>
                      <div class="card-body main-font">
                        <div class="row">
                          <!--Table Section starts-->
                          <table
                            id="reqTable"
                            class="table table-bordered w-100 mb-0 table-aditional-styles"
                            aria-describedby="Tabla de Estimacion Consolidada"
                          >
                            <thead>
                              <tr>
                                <th class="all">NO. ITEM</th>
                                <th class="min-tablet">CODIGO ATC</th>
                                <th class="min-tablet">NOMBRE DEL PRODUCTO</th>
                                <th class="min-tablet">DESCRIPCION TECNICA</th>
                                <th class="min-desktop">
                                  UNIDAD DE PRESENTACION
                                </th>
                                <th class="min-desktop">CANTIDAD</th>
                                <th class="min-tablet">CODIGO SESAL</th>
                                <th class="min-desktop">ESTADO</th>
                              </tr>
                            </thead>
                            <tbody>
                              <% 
                                String purchaseCod = "";
                                try{ 
                                  Connection con = null;
                                  Statement state = null;
                                  int i = 1;
                                  ResultSet rs1 = null;
                                  ResultSet rs2 = null;
                                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                  con = DriverManager.getConnection(url,"admin","system123");
                                  state = con.createStatement();
                                  String purchaseNumber = (String)session.getAttribute("noProcesoCompra");
                                  System.out.println("purchaseNumber cabo "+ purchaseNumber);
                                  String QueryString1 = "select cod from dbo.procesoCompraALP where noProcesoCompra = '" + purchaseNumber + "'";
                                  rs1 = state.executeQuery(QueryString1);
                                  String purchaseCodTemp = "";
                                  while(rs1.next()){
                                    purchaseCodTemp = rs1.getString(1); 
                                  }
                                  rs1.close();
                                  if (purchaseCodTemp != null) { 
                                    purchaseCod = purchaseCodTemp;
                                  } 
                                  String QueryString2 = "select * from dbo.listaRequerimientoConsolidadaALP where procesoCompra = '" + purchaseCodTemp + "'";
                                  rs2 = state.executeQuery(QueryString2);
                                  while(rs2.next()){ 
                                    String st = rs2.getString(8);
                                    if (st == null) { 
                                      st = ""; 
                                    } 
                              %>
                                    <tr>
                                      <td><%=rs2.getString(1)%></td>
                                      <td><%=rs2.getString(3)%></td>
                                      <td><%=rs2.getString(4)%></td>
                                      <td><%=rs2.getString(5)%></td>
                                      <td><%=rs2.getString(6)%></td>
                                      <td><%=rs2.getFloat(7)%></td>
                                      <td><%=rs2.getString(12)%></td>
                                      
                              <% 
                                    if(st == null || st.toUpperCase().isEmpty() || st.toUpperCase().contentEquals("ACTIVO")){
                              %>
                                      <td>
                                        <div class="btn-success btn btn-sm">
                                          ACTIVO
                                        </div>
                                      </td>
                              <% } 
                                  else { 
                              %>
                                      <td>
                                        <div class="btn-secondary btn btn-sm">
                                          INACTIVO
                                        </div>
                                      </td>
                              <% } %>
                              
                                    </tr>
                              <%i = i + 1; } 
                                rs2.close();
                                state.close();
                                con.close(); 
                              }catch(Exception e){System.out.println(e); }
                              %>
                            </tbody>
                          </table>
                          <!--Table Section ends-->
                        </div>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <p>&nbsp;</p>
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
              style="background-color: #f1f1f1"
            ></div>
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

    <form method="post" action="amendmentsALPRoutingServlet">
      <!-- Cancel Float Button -->
     
      <!-- Submit Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-right">
        <button
          class="btn btn-primary btn-rounded shadow main-font"
          name="submit"
          value="cancelar"
        >
          <span>SALIR </span>
          <i class="material-icons vm">done</i>
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <% if (!openMode.equalsIgnoreCase("disabled")) { %>
    <!--New Reg Modal-->
    <div
      class="modal fade main-font"
      id="newEditReg"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form
          action="listEstAmendmentALPServlet"
          id="editRegForm"
          method="post"
        >
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true" class="">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">
                  INFORMACION DE MEDICAMENTO CONSOLIDADO
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  -ACCION DEL FORMULARIO-
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
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--STATE Section-->
                              <div
                                id="stateSection"
                                class="state-section-aditional-styles mb-3 hide"
                              >
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <h5
                                      class="mb-3 text-center"
                                      style="font-weight: bold"
                                    >
                                      ESTADO*
                                    </h5>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="checkboxActivo"
                                        name="checkboxActivo"
                                      />
                                      <label for="checkboxActivo">ACTIVO</label>
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="checkboxInactivo"
                                        name="checkboxInactivo"
                                      />
                                      <label for="checkboxInactivo"
                                        >INACTIVO</label
                                      >
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--STATE Section ends-->

                              <!--BENEFICIARY Section-->
                              <div id="benSection">
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>OFICIO*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="legalID"
                                        name="legalID"
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>BENEFICIARIO*</label>
                                      <select
                                        autocomplete="off"
                                        class="form-control"
                                        id="beneficiary"
                                        name="beneficiary"
                                        required
                                      >
                                        <option selected disabled value="">
                                          SELECCIONA UNA OPCION...
                                        </option>
                                        <% try{
                                            Connection con = null;
                                            Statement state = null;
                                            ResultSet rs = null;
                                            String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                            con = DriverManager.getConnection(url,"admin","system123");
                                            state = con.createStatement();
                                            String QueryString = "SELECT beneficiarioFinal from dbo.beneficiarioFinal where estado = 'ACTIVO'";
                                            rs = state.executeQuery(QueryString);
                                            while(rs.next()){ 
                                        %>
                                              <option value="<%=rs.getString(1)%>">
                                                <%=rs.getString(1).toUpperCase()%>
                                              </option>
                                        <%} 
                                          rs.close();
                                          state.close();
                                          con.close();
                                        }catch(Exception e){System.out.println(e);}
                                        %>
                                      </select>
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--BENEFICIARY Section ends-->

                              <!--DATA Section-->
                              <div id="dataSection">
                                <input
                                  type="hidden"
                                  name="purchaseCodNumber"
                                  value="<%=purchaseCod%>"
                                />
                                <input
                                  type="hidden"
                                  name="productId"
                                  id="productId"
                                />
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <div class="autocomplete">
                                        <label>NOMBRE DEL PRODUCTO*</label>
                                        <input
                                          type="text"
                                          class="form-control"
                                          autocomplete="off"
                                          id="productName"
                                          name="productName"
                                          required
                                        />
                                      </div>
                                      <input
                                        type="button"
                                        onclick="LlenarCampos()"
                                        class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                                        value="LLENAR DATOS"
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>DESCRIPCION TECNICA*</label>
                                      <textarea
                                        autocomplete="off"
                                        class="form-control"
                                        id="technicDescription"
                                        name="technicDescription"
                                        placeholder=""
                                        readonly
                                        style="min-height: 230px"
                                        required
                                      ></textarea>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>UNIDAD DE PRESENTACION*</label>
                                      <input
                                        class="form-control"
                                        id="presentationUnit"
                                        readonly
                                        name="presentationUnit"
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>CODIGO ATC*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="medInsumoCod"
                                        readonly
                                        name="medInsumoCod"
                                      />
                                       <input
                                        type="hidden"
                                        class="form-control"
                                        id="codatc"                                        
                                        name="codatc"
                                      />
                                      <input
                                        type="hidden"
                                        class="form-control"
                                        id="codsesal"                                        
                                        name="codsesal"
                                      />
                                      
                                      
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div
                                      class="form-group"
                                      style="text-align: left"
                                    >
                                      <label>CANTIDAD*</label>
                                      <input
                                        autocomplete="off"
                                        type="number"
                                        min="1"
                                        class="form-control"
                                        id="requiredCant"
                                        name="requiredCant"
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--DATA Section ends-->

                              <!--ERROR Section-->
                              <div id="errorSection" class="hide">
                                <div class="row">
                                  <div class="col-lg-12 col-md-12 text-center">
                                    <h1>ERROR</h1>
                                    <p class="text-mute">
                                      CIERRE LA MODAL Y SELECCIONE EL REGISTRO A
                                      MODIFICAR EN LA TABLA
                                    </p>
                                  </div>
                                </div>
                              </div>
                              <!--ERROR Section ends-->
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
              style="background-color: #f1f1f1"
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
                  <div
                    class="col-12 col-md-6 text-center"
                    id="newSubmitButtonDiv"
                  >
                    <button
                      id="newSubmitButton"
                      name="submit"
                      onclick="habilitarCampos()"
                      type="submit"
                      value="nuevo"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      GUARDAR
                    </button>
                  </div>
                  <div
                    class="col-12 col-md-6 text-center hide"
                    id="editSubmitButtonDiv"
                  >
                    <button
                      id="editSubmitButton"
                      name="submit"
                      type="submit"
                      onclick="habilitarCampos()"
                      value="editar"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      MODIFICAR
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
    <% } %>
    <!--Custom New Modal Here-->

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

    <link
      rel="stylesheet"
      href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css"
    />
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/dataTables.buttons.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.html5.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.7.0/js/buttons.print.min.js"></script>
    <!-- Customized page level js -->
    <% if (!openMode.equalsIgnoreCase("disabled")) { %>

    <script>
      var url = getAbsolutePath() + "ProductosAPI";

      function LlenarCampos() {
        var element = document.getElementById("productName").value;

        $.post(
          "ProductoSeleccionadoAPI",
          {
            search: element,
          },
          function (responseText) {
            var res = responseText.split(";");
            console.log(res)
            $("#technicDescription").prop("value", res[0].replace(/\"/g, ""));
            $("#presentationUnit").prop("value", res[1].replace(/\"/g, ""));
            $("#medInsumoCod").prop("value", res[2].replace(/\"/g, "")); 
            $("#codatc").prop("value", res[2].replace(/\"/g, "")); 
            $("#codsesal").prop("value", res[3].replace(/\"/g, "")); 
            
           /*  $("#technicDescription").prop("value", res[0]);
            $("#presentationUnit").prop("value", res[1]);
            $("#medInsumoCod").prop("value", res[2]); */
          }
        );
      }

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

      var url = getAbsolutePath() + "ProductosAPI";
      var array = [];
      $.ajax({
        type: "GET",
        url: url,
        data: $("#EditRegForm").serialize(),
        success: function (data) {
          Object.entries(data).forEach(([key, value]) => {
            var medicamentos = value;
            for (var i = 0; i <= medicamentos.length; i++) {
              var med = medicamentos[i];
              if (med === undefined) {
              } else {
                array.push(medicamentos[i]);
              }
            }
          });
        },
      });

      function autocomplete(inp, arr) {
        var currentFocus;
        inp.addEventListener("input", function (e) {
          var a,
            b,
            i,
            val = this.value;
          closeAllLists();
          if (!val) {
            return false;
          }
          currentFocus = -1;
          a = document.createElement("DIV");
          a.setAttribute("id", this.id + "autocomplete-list");
          a.setAttribute("class", "autocomplete-items");
          this.parentNode.appendChild(a);
          for (i = 0; i < arr.length; i++) {
            if (
              arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()
            ) {
              b = document.createElement("DIV");
              b.innerHTML =
                "<strong>" + arr[i].substr(0, val.length) + "</strong>";
              b.innerHTML += arr[i].substr(val.length);
              b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
              b.addEventListener("click", function (e) {
                inp.value = this.getElementsByTagName("input")[0].value;
                closeAllLists();
              });
              a.appendChild(b);
            }
          }
        });
        inp.addEventListener("keydown", function (e) {
          var x = document.getElementById(this.id + "autocomplete-list");
          if (x) x = x.getElementsByTagName("div");
          if (e.keyCode == 40) {
            currentFocus++;
            addActive(x);
          } else if (e.keyCode == 38) {
            currentFocus--;
            addActive(x);
          } else if (e.keyCode == 13) {
            e.preventDefault();
            if (currentFocus > -1) {
              if (x) x[currentFocus].click();
            }
          }
        });
        function addActive(x) {
          if (!x) return false;
          removeActive(x);
          if (currentFocus >= x.length) currentFocus = 0;
          if (currentFocus < 0) currentFocus = x.length - 1;
          x[currentFocus].classList.add("autocomplete-active");
        }
        function removeActive(x) {
          for (var i = 0; i < x.length; i++) {
            x[i].classList.remove("autocomplete-active");
          }
        }
        function closeAllLists(elmnt) {
          var x = document.getElementsByClassName("autocomplete-items");
          for (var i = 0; i < x.length; i++) {
            if (elmnt != x[i] && elmnt != inp) {
              x[i].parentNode.removeChild(x[i]);
            }
          }
        }
        document.addEventListener("click", function (e) {
          closeAllLists(e.target);
        });
      }
      
      autocomplete(document.getElementById("productName"), array);
    </script>

    <script>
     
    </script>

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
               'excel', 'pdf'
          ],
        });
      });

      $("#reqTable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(0)").text();
        $("#productId").prop("value", value);
        value = $(this).find("td:eq(1)").text();
        $("#medInsumoCod").prop("value", value);
        $("#codatc").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#productName").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#technicDescription").prop("value", value);
        value = $(this).find("td:eq(4)").text();
        $("#presentationUnit").prop("value", value);
        value = $(this).find("td:eq(5)").text();
        $("#requiredCant").prop("value", value);

        value = $(this).find("td:eq(6) div").text();
        if (value === "activo" || value === "Activo" || value === "ACTIVO") {
          $("#checkboxActivo").prop("checked", true);
          $("#checkboxInactivo").prop("checked", false);
        } else if (
          value === "inactivo" ||
          value === "Inactivo" ||
          value === "INACTIVO"
        ) {
          $("#checkboxActivo").prop("checked", false);
          $("#checkboxInactivo").prop("checked", true);
        } else {
          $("#checkboxActivo").prop("checked", false);
          $("#checkboxInactivo").prop("checked", false);
        }
      });

      $("#newRegButton").on("click", function () {
        $("#editRegForm #benSection").removeClass("hide");
        $("#editRegForm #benSection input").prop("required", true);
        $("#editRegForm #benSection select").prop("required", true);
        $("#editRegForm #benSection input").prop("disabled", false);
        $("#editRegForm #benSection select").prop("disabled", false);

        $("#subtitleChange").text("NUEVO REGISTRO");
        $("#infoIcon").text("format_shapes");
        $("#instructionSubtitle").text(
          "INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):"
        );
        $("#medInsumoCod").prop("disabled", false);
        $("#instructionSubtitle").removeClass("hide");
        $("#editRegForm")[0].reset();
        $("#editRegForm #dataSection").removeClass("hide");
        $("#editRegForm #stateSection").addClass("hide");
        $("#editRegForm #errorSection").addClass("hide");
        $("#editRegForm #submitButtonsSection").removeClass("hide");
        $("#editSubmitButtonDiv").addClass("hide");
        $("#newSubmitButtonDiv").removeClass("hide");
      });

      $("#editRegButton").on("click", function () {
        var value = $("#productId").val();
        $("#editRegForm #benSection").addClass("hide");
        $("#editRegForm #benSection input").prop("required", false);
        $("#editRegForm #benSection select").prop("required", false);
        $("#editRegForm #benSection input").prop("disabled", true);
        $("#editRegForm #benSection select").prop("disabled", true);

        if (value === "") {
          $("#subtitleChange").text("EDITAR REGISTRO");
          $("#infoIcon").text("error");
          $("#editRegForm #errorSection").removeClass("hide");
          $("#instructionSubtitle").addClass("hide");
          $("#editRegForm #dataSection").addClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        } else {
          $("#subtitleChange").text("EDITAR REGISTRO");
          $("#infoIcon").text("format_shapes");
          $("#instructionSubtitle").text(
            "INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):"
          );
          $("#medInsumoCod").prop("disabled", true);
          $("#instructionSubtitle").removeClass("hide");
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").removeClass("hide");
          $("#editRegForm #errorSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").removeClass("hide");
          $("#editSubmitButtonDiv").removeClass("hide");
          $("#newSubmitButtonDiv").addClass("hide");
        }
      });

      $("#checkboxActivo").on("change", function () {
        $("#checkboxActivo").prop("checked", true);
        $("#checkboxInactivo").prop("checked", false);
      });

      $("#checkboxInactivo").on("change", function () {
        $("#checkboxActivo").prop("checked", false);
        $("#checkboxInactivo").prop("checked", true);
      });
    </script>

    <% } else { %>

    <script>
      $(document).ready(function () {
        /*Tabla de Requerimientos*/
        $("#reqTable").DataTable({
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
               'excel', 'pdf'
          ],
        });
      });
      
      function habilitarCampos() {
      document.getElementById('medInsumoCod').disabled=false;
           
      }
      
    </script>

    <% } %>
    <!-- Java Script section ends -->
  </body>
</html>
