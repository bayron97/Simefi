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
        </div>

        <!-- Main container starts -->
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-6">
                    <h2 class="mb-4 large-title">
                      CREAR USUARIO
                    </h2>
                    <h5 class="font-weight-light main-font">
                      PARAMETRIZACION/CREAR USUARIO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
                <%
                String tipo = (String)session.getAttribute("tipoAcceso");
                String servlet = (String)request.getAttribute("throughServlet");
                String acceso = "none";
                if((tipo != null && !tipo.isEmpty()) && (servlet != null && !servlet.isEmpty())){
                  acceso = tipo;
                }
                boolean auth = true;
                switch(acceso){
                  case "administrar":
                %>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="newRegButton"
                  >
                    <i class="material-icons md-18">add_circle</i> NUEVO
                  </button>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="editRegButton"
                  >
                    <i class="material-icons md-18">edit</i> MODIFICAR
                  </button>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="consultRegButton"
                  >
                    <i class="material-icons md-18">chrome_reader_mode</i>
                    CONSULTAR
                  </button>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="changeStateButton"
                  >
                    <i class="material-icons md-18">done_all</i>
                    REVISAR / APROBAR
                  </button>
                  <% break;
                  case "digitar":
                  %>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="newRegButton"
                  >
                    <i class="material-icons md-18">add_circle</i> NUEVO
                  </button>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="editRegButton"
                  >
                    <i class="material-icons md-18">edit</i> MODIFICAR
                  </button>
                  <% break;
                  case "consultar":
                  %>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    data-target="#newEditReg"
                    data-toggle="modal"
                    id="consultRegButton"
                  >
                    <i class="material-icons md-18">chrome_reader_mode</i>
                    CONSULTAR
                  </button>
                  <% break;			
                  default:
                  auth = false;
                  break;
                  } %>
                </div>
              </div>
            </div>
            <div class="card-body main-font">
              <!--Table Section starts-->
              <%if(auth == true){ %>
              <table
                id="datatable"
                class="table table-bordered w-100 mb-0 table-aditional-styles"
              >
                <thead>
                  <tr>
                    <th class="all">#</th>
                    <th class="none">CODIGO EMPLEADO</th>
                    <th class="min-tablet">USUARIO</th>
                    <th class="min-tablet">CORREO</th>
                    <th class="min-tablet">NOMBRE</th>
                    <th class="min-tablet">PUESTO</th>
                    <th class="min-tablet">ESTADO 1</th>
                    <th class="min-tablet">ESTADO 2</th>
                    <th class="none">OBSERVACIONES</th>
                    <th class="hide">ID</th>
                    <th class="hide">FUNCION</th>
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
							      String QueryString = "SELECT * from dbo.usuario";
							      rs = state.executeQuery(QueryString);
						      %>
						      <% 	
						      while(rs.next()){
							    String st = rs.getString(10);
							    if(rs.wasNull()){
								    st = " ";
							    }
							    String st2 = rs.getString(11);
							    if(rs.wasNull()){
								    st2 = " ";
							    }
							    String ob = rs.getString(9);
							    if(rs.wasNull()){
								    ob = " ";
							    }
						      %>
						      <tr>
							      <td><%=rs.getInt(14)%></td>
							      <td><%=rs.getInt(1)%></td>
							      <td><%=rs.getString(2)%></td>
							      <td><%=rs.getString(3)%></td>
							      <td><%=rs.getString(6).toUpperCase()%></td>
							      <td><%=rs.getString(5).toUpperCase()%></td>
                    <%
                      if(st.toUpperCase() == null || 
                      st.toUpperCase().isEmpty() || 
                      st.toUpperCase().contentEquals("RECHAZADO") || 
                      st.toUpperCase().contentEquals("NO APROBADO")){
                    %>
                    <td>
                      <div class="btn-danger btn btn-sm">RECHAZADO</div>
                    </td>
                    <%
							        }
							        else
                      {
							      %>
                    <td>
                      <div class="btn-success btn btn-sm">APROBADO</div>
                    </td>
                    <%
                      }
                    %>
                    <%
                      if(st2.toUpperCase()== null || st2.toUpperCase().isEmpty() || st2.toUpperCase().contentEquals("INACTIVO")){
                    %>
                    <td>
                      <div class="btn-secondary btn btn-sm">INACTIVO</div>
                    </td>
                    <%
							        }
							        else
                      {
							      %>
                    <td>
                      <div class="btn-success btn btn-sm">ACTIVO</div>
                    </td>
                    <%
                      }
                    %>
							      <td><%=ob.toUpperCase()%></td>
							      <td class="hide"><%=rs.getString(7).toUpperCase()%></td>
							      <td class="hide"><%=rs.getString(8).toUpperCase()%></td>
						      </tr>
						    <%i = i + 1;}
						    rs.close();
						    state.close();
						    con.close();
						    }
                catch(Exception e){
							    System.out.println(e);
						    }
						    %>
                </tbody>
              </table>
              <%} %>
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

    <!-- Navigation Float Buttons section starts -->

    <!-- NO Navigation Buttons -->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <%if(auth == true){ %>
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
                  INFORMACION DEL USUARIO REGISTRADO
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
                              <!--DATA Section-->
                              <div id="dataSection">
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>CODIGO DE EMPLEADO*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayCod"
                                        name="overlayCod"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>USUARIO*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayUsuario"
                                        name="overlayUsuario"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>NOMBRE*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayNombre"
                                        name="overlayNombre"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>NO. DE IDENTIDAD*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayId"
                                        name="overlayId"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <label>PUESTO*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayPuesto"
                                        name="overlayPuesto"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>FUNCION*</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayFunc"
                                        name="overlayFunc"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>CORREO ELECTRONICO*</label>
                                      <input
                                        autocomplete="off"
                                        type="email"
                                        class="form-control"
                                        id="overlayCorreo"
                                        name="overlayCorreo"
                                        placeholder=""
                                        required
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>OBSERVACIONES</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="overlayObs"
                                        name="overlayObs"
                                        placeholder=""
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--DATA Section ends-->

                              <!--STATE Section-->
                              <div
                                id="stateSection"
                                class="state-section-aditional-styles"
                              >
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <h5
                                      class="mb-3 text-center"
                                      style="font-weight: bold;"
                                    >
                                      ESTADO 1*
                                    </h5>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="activ1"
                                        name="activ1"
                                      />
                                      <label for="activ1">APROBADO</label>
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="in1"
                                        name="in1"
                                      />
                                      <label for="in1">RECHAZADO</label>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>MOTIVO DE RECHAZO</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="m1"
                                        name="m1"
                                        placeholder=""
                                      />
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <h5
                                      class="mb-3 text-center"
                                      style="font-weight: bold;"
                                    >
                                      ESTADO 2*
                                    </h5>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="activ2"
                                        name="activ2"
                                      />
                                      <label for="activ2">ACTIVO</label>
                                    </div>
                                  </div>
                                  <div class="col-lg-6 col-md-6">
                                    <div class="form-group">
                                      <input
                                        type="checkbox"
                                        id="in2"
                                        name="in2"
                                      />
                                      <label for="in2">INACTIVO</label>
                                    </div>
                                  </div>
                                </div>
                                <div class="row">
                                  <div class="col-lg-12 col-md-12">
                                    <div class="form-group">
                                      <label>MOTIVO DE INACTIVACION</label>
                                      <input
                                        autocomplete="off"
                                        type="text"
                                        class="form-control"
                                        id="m2"
                                        name="m2"
                                        placeholder=""
                                      />
                                    </div>
                                  </div>
                                </div>
                              </div>
                              <!--STATE Section ends-->

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
                      id="submitButton"
                      name="submit"
                      type="submit"
                      value="enviar"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      GUARDAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center hide" id="ovModificarDiv">
                    <button
                      id="ovModificar"
                      name="submit"
                      type="submit"
                      value="guardar"
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

    <!--Custom New Modal-->

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

      function setinputFilter(textbox, inputFilter) {
        [
          "input",
          "keydown",
          "keyup",
          "mousedown",
          "mouseup",
          "select",
          "contextmenu",
          "drop",
        ].forEach(function (event) {
          textbox.addEventListener(event, function () {
            if (inputFilter(this.value)) {
              this.oldValue = this.value;
              this.oldSelectionStart = this.selectionStart;
              this.oldSelectionEnd = this.selectionEnd;
            } else if (this.hasOwnProperty("oldValue")) {
              this.value = this.oldValue;
              this.setSelectionRange(
                this.oldSelectionStart,
                this.oldSelectionEnd
              );
            } else {
              this.value = "";
            }
          });
        });
      }

      $(document).ready(function () {
        /* data Table */
        $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 8,
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

        setinputFilter(document.getElementById("overlayCod"), function (value) {
          return /^\d*$/.test(value);
        });

        setinputFilter(document.getElementById("overlayId"), function (value) {
          return /^\d*$/.test(value);
        });
      });

      $("#datatable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value = $(this).find("td:eq(1)").text();
        $("#overlayCod").prop("value", value);
        value = $(this).find("td:eq(2)").text();
        $("#overlayUsuario").prop("value", value);
        value = $(this).find("td:eq(3)").text();
        $("#overlayCorreo").prop("value", value);
        value = $(this).find("td:eq(4)").text();
        $("#overlayNombre").prop("value", value);
        value = $(this).find("td:eq(5)").text();
        $("#overlayPuesto").prop("value", value);
        value = $(this).find("td:eq(6) div").text();
        if (
          value === "aprobado" ||
          value === "Aprobado" ||
          value === "APROBADO"
        ) {
          $("#activ1").prop("checked", true);
          $("#in1").prop("checked", false);
        } else if (
          value === "rechazado" ||
          value === "Rechazado" ||
          value === "RECHAZADO"
        ) {
          $("#activ1").prop("checked", false);
          $("#in1").prop("checked", true);
        } else {
          $("#activ1").prop("checked", false);
          $("#in1").prop("checked", false);
        }

        value = $(this).find("td:eq(7) div").text();
        if (value === "activo" || value === "Activo" || value === "ACTIVO") {
          $("#activ2").prop("checked", true);
          $("#in2").prop("checked", false);
        } else if (
          value === "inactivo" ||
          value === "Inactivo" ||
          value === "INACTIVO"
        ) {
          $("#activ2").prop("checked", false);
          $("#in2").prop("checked", true);
        } else {
          $("#activ2").prop("checked", false);
          $("#in2").prop("checked", false);
        }

        value = $(this).find("td:eq(8)").text();
        $("#overlayObs").prop("value", value.split("/")[0]);

        value.split("/")[1] === "undefined" ||
        value.split("/")[1] === "UNDEFINED"
          ? $("#m1").prop("value", "")
          : $("#m1").prop("value", value.split("/")[1]);

        value.split("/")[2] === "undefined" ||
        value.split("/")[2] === "UNDEFINED"
          ? $("#m2").prop("value", "")
          : $("#m2").prop("value", value.split("/")[2]);

        value = $(this).find("td:eq(9)").text();
        $("#overlayId").prop("value", value);

        value = $(this).find("td:eq(10)").text();
        $("#overlayFunc").prop("value", value);
      });

      $("#newRegButton").on("click", function () {
        $("#subtitleChange").text("NUEVO REGISTRO");
        $("#infoIcon").text("format_shapes");
        $("#instructionSubtitle").text(
          "INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):"
        );
        $("#instructionSubtitle").removeClass("hide");
        $("#editRegForm #dataSection div div div input").prop(
          "readonly",
          false
        );
        $("#editRegForm #stateSection div div div input").prop(
          "disabled",
          true
        );
        $("#editRegForm")[0].reset();
        $("#editRegForm #dataSection").removeClass("hide");
        $("#editRegForm #stateSection").addClass("hide");
        $("#editRegForm #errorSection").addClass("hide");
        $("#editRegForm #submitButtonsSection").removeClass("hide");
        $("#ovModificarDiv").addClass("hide");
        $("#submitButtonDiv").removeClass("hide");
        document.getElementById("overlayUsuario").readOnly = false;
      });

      $("#editRegButton").on("click", function () {
        var value = $("#overlayUsuario").val();
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
          $("#instructionSubtitle").removeClass("hide");
          $("#editRegForm #dataSection div div div input").prop(
            "readonly",
            false
          );
          $("#editRegForm #stateSection div div div input").prop(
            "disabled",
            true
          );
          document.getElementById("overlayUsuario").readOnly = true;
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #errorSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").removeClass("hide");
          $("#ovModificar").prop("value", "guardar");
          $("#ovModificarDiv").removeClass("hide");
          $("#submitButtonDiv").addClass("hide");
        }
      });

      $("#consultRegButton").on("click", function () {
        var value = $("#overlayUsuario").val();
        if (value === "") {
          $("#subtitleChange").text("CONSULTAR REGISTRO");
          $("#infoIcon").text("error");
          $("#editRegForm #errorSection").removeClass("hide");
          $("#instructionSubtitle").addClass("hide");
          $("#editRegForm #dataSection").addClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        } else {
          $("#subtitleChange").text("CONSULTAR REGISTRO");
          $("#infoIcon").text("format_shapes");
          $("#instructionSubtitle").removeClass("hide");
          $("#instructionSubtitle").text("FICHA DE USUARIO");
          $("#editRegForm #dataSection div div div input").prop(
            "readonly",
            true
          );
          $("#editRegForm #stateSection div div div input").prop(
            "disabled",
            true
          );
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").removeClass("hide");
          $("#editRegForm #errorSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        }
      });

      $("#changeStateButton").on("click", function () {
        var value = $("#overlayUsuario").val();
        if (value === "") {
          $("#subtitleChange").text("CAMBIAR ESTADO");
          $("#infoIcon").text("error");
          $("#editRegForm #errorSection").removeClass("hide");
          $("#instructionSubtitle").addClass("hide");
          $("#editRegForm #dataSection").addClass("hide");
          $("#editRegForm #stateSection").addClass("hide");
          $("#editRegForm #submitButtonsSection").addClass("hide");
        } else {
          $("#subtitleChange").text("CAMBIAR ESTADO");
          $("#infoIcon").text("format_shapes");
          $("#editRegForm #errorSection").addClass("hide");
          $("#instructionSubtitle").text(
            "INGRESE LOS DATOS SOLICITADOS(* ES OBLIGATORIO):"
          );
          $("#instructionSubtitle").removeClass("hide");
          $("#editRegForm #dataSection div div div input").prop(
            "readonly",
            true
          );
          $("#editRegForm #stateSection div div div input").prop(
            "disabled",
            false
          );
          $("#editRegForm #dataSection").removeClass("hide");
          $("#editRegForm #stateSection").removeClass("hide");
          $("#editRegForm #submitButtonsSection").removeClass("hide");
          $("#ovModificar").prop("value", "rev");
          $("#ovModificarDiv").removeClass("hide");
          $("#submitButtonDiv").addClass("hide");
        }
      });

      $("#activ1").on("change", function () {
        $("#in1").prop("checked", false);
      });

      $("#in1").on("change", function () {
        $("#activ1").prop("checked", false);
      });

      $("#activ2").on("change", function () {
        $("#in2").prop("checked", false);
      });

      $("#in2").on("change", function () {
        $("#activ2").prop("checked", false);
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
