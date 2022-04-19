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
    <nav class="sidebar next-navbar">
      <!--Navigation hide form starts-->
      <form
        action="authAcceso"
        method="post"
        id="navform"
        class="hide"
      >
        <input
          autocomplete="off"
          type="hidden"
          name="prevJsp"
          value="mainPage"
        />
        <input
          autocomplete="off"
          type="hidden"
          name="usuario"
          value="${sessionScope.usuario}"
        />
        <input
          autocomplete="off"
          type="hidden"
          id="submitNavBarValue"
          name="auth"
          value=""
        />
      </form>
      <!--Navigation hide form ends-->

      <!-- Logo sidebar -->
      <a href="<%=request.getContextPath()%>" class="logo">
        <img src="logo bo copia.png" alt="" class="logo-icon logoBlanco" />
      </a>
      <!-- Logo sidebar ends -->

      <!-- Navigation menu sidebar starts-->
      <ul class="flex-column">
        <li class="nav-item no-icon">
          <a class="nav-link" href="<%=request.getContextPath()%>">
            <span>INICIO</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>PARAMETRIZACION DE USUARIOS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="crearUsuario">
                CREAR USUARIO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="reseteoPassword">
                REINICIO DE CONTRASE&#209;A
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="accesos">
                ACCESO/MODULO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="reportes">
                REPORTES DE HISTORIAL
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>ADMINISTRACION DE DATOS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="distribuidorFabricante">
                DISTRIBUIDOR/FABRICANTE
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="beneficiarios">
                BENEFICIARIOS
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>MEDICAMENTOS Y OTROS</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="medicamentos">
                MEDICAMENTOS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="insumos">
                OTROS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="parametrizacion">
                PARAMETRIZACION
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>CONTROL PROCESOS DE COMPRA</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramOpeningPlace">
                PARAMETRIZACION
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramCriteriosEvaluation">
                CRITERIOS DE EVALUACION VACIADO OFERTA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="paramALP">
                CORRELATIVO DE COMPRAS
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>COMPRAS GENERALES</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="purchaseProcessesGeneral">
                APERTURA PROCESO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="amendmentsGeneral">
                 ACLARACIONES Y ENMIENDAS 
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="vaciadoOfertaGeneral">
                 VACIADO DE OFERTAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recomendacionOfertaGeneral">
                RECOMENDACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="ratificacionOfertaGeneral">
                 RATIFICACIONES
              </button>
            </li>
          </ul>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="javascript:void(0)">
            <span>COMPRAS A LARGO PLAZO</span>
          </a>
          <ul class="flex-column">
            <li class="nav-item">
              <button class="nav-link btn_sn" value="purchaseProcessesALP">
                APERTURA DE PROCESO
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="amendmentsALP">
                 ACLARACIONES Y ENMIENDAS 
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="vaciadoOfertaALP">
                VACIADO DE OFERTAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recomendacionOfertaALP">
                RECOMENDACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="solicitudCompraALP">
                SOLICITUD DE COMPRA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="evaluacionRecomendacionOferta">
                RECOMENDACION DE COMPRA
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="ratificacionCTFOferta">
                RATIFICACION CTF
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="contrataciones">
                CONTRATACIONES
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="contratoSuministroALP">
                CONTRATOS DE SUMINISTROS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="controlGarantiasALP">
                CONTROL DE GARANTIAS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="controlPagosALP">
                CONTROL DE PAGOS
              </button>
            </li>
            <li class="nav-item">
              <button class="nav-link btn_sn" value="recepcionProductos">
                RECEPCION DE PRODUCTOS
              </button>
            </li>
          </ul>
        </li>
      </ul>
      <!-- Navigation menu sidebar ends -->
      <br />
      <br />
    </nav>
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
                      REPORTE GENERAL HISTORIAL DE USUARIOS
                    </h2>
                    <h5 class="font-weight-light main-font">
                      PARAMETRIZACION / REPORTE GENERAL HISTORIAL DE USUARIOS
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
			              if (!acceso.contentEquals("consultar") ) {
			  				auth = false;								
			  			}   
			              
			              if (acceso.contentEquals("consultar") ) {			  													  			
   		            %>
   		            
                  <form action="reportesServlet" method="post">
                    <input autocomplete="off" type="hidden" name="codEmp" id="codEmp">
				            <input autocomplete="off" type="hidden" name="usuario" id="usuario">
                    <button
                      class="btn btn-sm btn-success ml-2"
                      id="historialUsuario" 
                      name="submit" 
                      value="historialUsuario"
                    >
                      <i class="material-icons md-18">chrome_reader_mode</i> HISTORIAL USUARIO
                    </button>
                    <button
                      class="btn btn-sm btn-success ml-2"
                      id="historialAcceso" 
                      name="submit" 
                      value="historialAcceso"
                    >
                      <i class="material-icons md-18">playlist_add_check</i> HISTORIAL ACCESO
                    </button>
                  </form>
                  <%
                  }  
   		          %>
                </div>
              </div>
            </div>
            <div class="card-body main-font">
              <%if (auth == true) {%>
              <!--Table Section starts-->
              <table
                id="datatable"
                class="table table-bordered w-100 mb-0 table-aditional-styles"
              >
                <thead>
                  <tr>
                    <th class="all">#</th>
                    <th class="min-tablet">FECHA DE CREACION</th>
                    <th class="min-tablet">FECHA DE MODIFICACION</th>
                    <th class="min-tablet">CODIGO DE EMPLEADO</th>
                    <th class="min-tablet">USUARIO</th>
                    <th class="min-tablet">NOMBRE</th>
                    <th class="min-tablet">CARGO</th>
                    <th class="min-tablet">IDENTIDAD</th>
                    <th class="min-tablet">ESTADO ACTUAL</th>
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
							      <td><%=i%></td>
							      <td><%=rs.getString(12)%></td>
							      <td><%=rs.getString(13)%></td>
							      <td><%=rs.getInt(1)%></td>
							      <td><%=rs.getString(2).toUpperCase()%></td>
							      <td><%=rs.getString(6).toUpperCase()%></td>
							      <td><%=rs.getString(5).toUpperCase()%></td>
							      <td><%=rs.getString(7)%></td>
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
							        else if (st.toUpperCase().contentEquals("PENDIENTE APROBAR"))
                      {
							      %>
                    <td>
                      <div class="btn-primary btn btn-sm">PENDIENTE APROBAR</div>
                    </td>
                    <%
                      }
                      else
                      {
                    %>
                      <td>
                        <div class="btn-success btn btn-sm">APROBADO</div>
                      </td>
                    <% } %>
							      <td><%=ob.toUpperCase()%></td>
						      </tr>
						      <%i = i + 1;} 
						      rs.close();
						      state.close();
						      con.close();
						      }catch(Exception e){System.out.println(e);}
						      %>
                </tbody>
              </table>
              <!--Table Section ends-->
               <%}%>
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

    <!--**********No Buttons in this page**********-->

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--**********No MODALS in this page**********-->

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
      });

      $("#datatable tr").click(function () {
        $(this).addClass("selected").siblings().removeClass("selected");
        var value;
        value=$(this).find("td:eq(3)").text();
        $("#codEmp").prop("value", value);
        value=$(this).find("td:eq(4)").text();
        $("#usuario").prop("value", value);
      });
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
