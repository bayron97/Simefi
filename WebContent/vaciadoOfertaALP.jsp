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
                  <div class="col-12 col-xs-12 col-md-12">
                    <h2 class="mb-4 large-title">
                      VACIADO DE OFERTAS RECIBIDAS POR PROCESO DE COMPRA
                    </h2>
                    <h5 class="font-weight-light main-font">
                      ACUERDO A LARGO PLAZO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <%
			String tipo = (String) session.getAttribute("tipoAcceso");
			String servlet = (String) request.getAttribute("throughServlet");
			String acceso = "none";
			if ((tipo != null && !tipo.isEmpty()) && (servlet != null && !servlet.isEmpty())) {
			acceso = tipo;
			}
			boolean auth = true;
			if (!acceso.contentEquals("administrar") && !acceso.contentEquals("digitar") && !acceso.contentEquals("consultar") && !acceso.contentEquals("verificar") ) {
				auth = false;								
			}
		%>
          
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-header border-0 bg-none">
              <div class="row">
                <div class="col-12 col-md">
                  <p class="fs15"></p>
                </div>
                <div class="col-auto align-self-center main-font">
                  <div class="form-group float-right" id="instructionsMessage">
                    <label class="mr-3">NOTA: PARA EDITAR SELECCIONE UN REGISTRO DE LA TABLA</label>
                  </div>
                  <form action="ofertasALPRouting" method="post" id="buttonsSection" class="hide">
                  <input type="hidden" id="codPadre" name="codPadre" />
                  <input type="hidden" id="procesoCompra" name="proc" />
                 
                  
                  
                  <%if (acceso.contentEquals("administrar") || acceso.contentEquals("digitar")) { %>
                  
                   <button 
                    id="offerControlButton"
                  	class="btn btn-sm btn-success ml-2"
                  	name="submit"
                  	value="actaApertura"
                  >  
                   <i class="material-icons md-18">done_all</i> VACIADO DEL ACTA DE APERTURA    
                   </button>
                  
                  <!-- <button 
                    id="offerControlButton"
                  	class="btn btn-sm btn-success ml-2"
                    data-target="#offerControlModal"
                    data-toggle="modal"
                    onclick="event.preventDefault();"
                  >
                    <i class="material-icons md-18">done_all</i> VACIADO DEL ACTA DE APERTURA
                  </button> -->
                  <button 
                    id="newOfertas"
                  	class="btn btn-sm btn-success ml-2"
                  	name="submit"
                  	value="nuevaOferta"
                  >
                    <i class="material-icons md-18">add_circle</i> AGREGAR OFERTAS
                  </button>
                   <%} %>
                   <%if (acceso.contentEquals("administrar") || acceso.contentEquals("consultar")) {%>
                  <button
                    class="btn btn-sm btn-success ml-2"
                    
                    id="consulButton"
                    name="submit"
                    value="consultarOferta"
                  >
                    <i class="material-icons md-18">chrome_reader_mode</i>
                    CONSULTAR
                  </button>
                   <%} %>
                  </form>
                </div>
              </div>
            </div>
              <%if (auth == true) {%>
            <div class="card-body main-font">
              <!--Table Section starts-->
              <table
                id="datatable"
                class="table table-bordered w-100 mb-0 table-aditional-styles"
                aria-describedby="Tabla de Vaciados de Ofertas"
              >
                <thead>
                  <tr>
                    <th class="hide">COD</th>
                    <th class="min-tablet">NO. PROCESO DE COMPRA</th>
                    <th class="min-desktop">NO. PRODUCTOS ESTIMADOS ORIGINALMENTE</th>
                    <th class="min-desktop">NO. PRODUCTOS ANULADOS</th>
                    <th class="min-desktop">NO. FINAL DE PRODUCTOS REQUERIDOS</th>
                    <th class="min-desktop">NO. PRODUCTOS OFERTADOS</th>
                    <th class="min-desktop">NO. PRODUCTOS DESIERTOS</th>
                    <th class="min-desktop">NO. PRODUCTOS COMPLETADOS</th>
                    <th class="min-desktop">CANTIDAD PROVEEDORES</th>
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

							        //String QueryString = "SELECT cod, procesoCompra, fecha, productosEstimados, productosConOfertas, productosAnulados, productosCompletados,canProveedores, productosDesiertos from dbo.vaciadoOfertasALP";
							        String QueryString = "select cod, procesoCompra, productosEstimados, productosAnulados, productosEstimados, productosConOfertas, productosDesiertos, productosCompletados, canProveedores from vaciadoOfertasALP";
							        rs = state.executeQuery(QueryString);
						      %>
						      <% 	
						        while(rs.next()){
						        	
                    /* String nuevaFecha = rs.getString(3);
                    if (nuevaFecha == null || nuevaFecha.isEmpty())
                    {
                      nuevaFecha = "";
                    }
                    Integer productosEstimadosCount = (Integer)rs.getInt(4);
                    if (productosEstimadosCount == null)
                    {
                      productosEstimadosCount = 0;
                    }
                    Integer productosOfertasCount = (Integer)rs.getInt(5);
                    if (productosOfertasCount == null)
                    {
                      productosOfertasCount = 0;
                    }

                    Integer productosAnuladosCount = (Integer)rs.getInt(6);
                    if (productosAnuladosCount == null)
                    {
                      productosAnuladosCount = 0;
                    }
                    Integer productosCompletadosCount = (Integer)rs.getInt(7);
                    if (productosCompletadosCount == null)
                    {
                      productosCompletadosCount = 0;
                    }
                    Integer canProveedores = (Integer)rs.getInt(8);
                    if (canProveedores == null)
                    {
                    	canProveedores = 0;
                    }

                    Integer productosDesiertos = (Integer)rs.getInt(9);
                    if(productosDesiertos == null){
                    	productosDesiertos = 0;
                    }
                    Integer productosRequeridosOriginal = productosEstimadosCount; */
                    
						      %>
						        <tr>
							        <%-- <td class="hide"><%=rs.getInt(1)%></td>
							        <td><%=rs.getString(2).toUpperCase()%></td>
							        <td><%=productosRequeridosOriginal%></td>							        
							        <td><%=productosAnuladosCount%></td>							        
									<td><%=productosEstimadosCount%></td>							        
							        <td><%=productosOfertasCount%></td>
                      				<td><%=productosDesiertos%></td>							        
                      				<td><%=productosCompletadosCount%></td>
                      				<td><%=canProveedores%></td> --%>
                      				
                      				<td class="hide"><%=rs.getInt(1)%></td>
							        <td><%=rs.getString(2).toUpperCase()%></td>
							        <td><%=rs.getInt(3)%></td>							        
							        <td><%=rs.getInt(4)%></td>							        
									<td><%=rs.getInt(5)-rs.getInt(4)%></td>							        
							        <td><%=rs.getInt(6)%></td>
                      				<td><%=rs.getInt(7)%></td>							        
                      				<td><%=rs.getInt(8)%></td>
                      				<td><%=rs.getInt(9)%></td>
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
        <%}%>
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

    <!--Offer Control Modal-->
    <div
      class="modal fade main-font"
      id="offerControlModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Offer Control starts-->
        <form id="offerControlContent" action="ofertaALPServlet" method="post">
          <div class="modal-content shadow-lg-dark overflow-hidden">
            <button
              type="button"
              class="closePersonalize"
              data-dismiss="modal"
              aria-label="Close"
            >
              <span aria-hidden="true">x</span>
            </button>
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5">
                <h1 class="mb-0 text-white">
                  VACIADO DE PRODUCTOS PARA ACTA DE APERTURA
                </h1>
                <h4
                  id="subtitleChange"
                  class="mb-5 text-white font-weight-light"
                >
                  LISTA CONSOLIDADA
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
                        background-size: cover;
                      "
                    >
                      <div class="row">
                        <div class="card-body">
                          <div class="container main-container">
                            <div class="row">
                              <div class="col-lg-4 col-md-4">
                                <div
                                  class="form-group"
                                  style="text-align: right;"
                                >
                                  <label>PROCESO DE COMPRA</label>
                                </div>
                              </div>
                              <div class="col-lg-7 col-md-7">
                                <div class="form-group">
                                  <input
                                    autocomplete="off"
                                    type="text"
                                    class="form-control"
                                    id="buyProcessNumberForModal"
                                    name="buyProcessNumberForModal"
                                    placeholder=""
                                    value=""
                                    required
                                    readonly
                                  />
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-lg-4 col-md-4">
                                <div
                                  class="form-group"
                                  style="text-align: right;"
                                >
                                  <label>DESCRIPCION PROCESO DE COMPRA</label>
                                </div>
                              </div>
                              <div class="col-lg-7 col-md-7">
                                <div class="form-group">
                                  <textarea
                                    autocomplete="off"
                                    class="form-control"
                                    id="buyProcessDescriptionForModal"
                                    name="buyProcessDescriptionForModal"
                                    style="min-height:80px;"
                                    readonly
                                  ></textarea>
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-lg-4 col-md-4">
                                <div
                                  class="form-group"
                                  style="text-align: right;"
                                >
                                  <label>CANTIDAD DE PROVEEDORES</label>
                                </div>
                              </div>
                              <div class="col-lg-7 col-md-7">
                                <div class="form-group">
                                  <input
                                    autocomplete="off"
                                    type="number"
                                    class="form-control"
                                    id="provCant"
                                    name="provCant"
                                    value="0"
                                  />
                                </div>
                              </div>
                            </div>
                          </div>
                          <div class="row justify-content-center">
                            <div class="col-md-10 mx-auto">
                              <!--Ben Final Table Section starts-->
                              <table
                                id="offerControlTable"
                                class="table table-bordered w-100 mb-0 table-aditional-styles"
                                aria-describedby="Tabla de control de ofertas"
                              >
                                <thead>
                                  <tr>
                                    <th class="all">NO. ITEM</th>
                                    <th class="min-tablet">
                                      NOMBRE DEL PRODUCTO
                                    </th>
                                    <th class="min-tablet">
                                      NO. OFERTAS RECIBIDAS
                                    </th>
                                  </tr>
                                </thead>
                                <tbody>
								                  <tr>
									                  <td>-</td>
									                  <td>-</td>
									                  <td>-</td>
								                  </tr>
                                </tbody>
                              </table>
                              <!--Ben Final Table Section ends-->
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
                  <div class="col-12 col-md-6 text-center">
                    <button
                      id="submitOffersControl"
                      type="submit"
                      name="submit"
                      value="offersControl"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      GUARDAR
                    </button>
                  </div>
                </div>
              </div>
              <!--Submit Buttons Section ends-->
            </div>
          </div>
        </form>
        <!--Offer Control ends-->
      </div>
    </div>

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
        });

        var offerControlTable = $("#offerControlTable").DataTable({
          responsive: true,
          searching: false,
          scrollY:        200,
          deferRender:    true,
          scroller:       true,
          columnDefs: [
            {
              targets: 2,
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

        $("#offerControlButton").on("click", function () {
          const searchValue = $("#buyProcessNumberForModal").val();
          $.post('ALPBuyPurchaseDescriptionAPI', {
				    search : searchValue,
			    }, function(responseText) {
				    $("#buyProcessDescriptionForModal").prop("value", responseText);
			    });
          offerControlTable.ajax.url(getAbsolutePath() + "ALPListaRequerimientosConsolidadaAPI?search=" + searchValue).load();
        });

        $("#submitOffersControl").on("click", function () {
          var container = document.getElementById("offerControlContent");
          var table = document.getElementById('offerControlTable');

          if(table.rows.length > 0){
		 	      for (var r = 1, n = table.rows.length; r < n; r++) {
		          var inputID = document.createElement("input");
	            inputID.setAttribute("type", "hidden");
              inputID.setAttribute("name", "productId");
	            if(table.rows[r].cells[0].innerHTML){
	              inputID.setAttribute("value", table.rows[r].cells[0].innerHTML);
	            }
              container.appendChild(inputID);
            }
          }
          $("#offerControlContent").submit();
        });
      });

      $("#datatable tr").click(function () {    	
        $(this).addClass("selected").siblings().removeClass("selected");
        $("#buttonsSection").removeClass("hide");
        $("#instructionsMessage").addClass("hide");
        var value;
        value = $(this).find("td:eq(0)").text();
        $("#codPadre").prop("value",value);
        value = $(this).find("td:eq(1)").text();
        $("#procesoCompra").prop("value",value);
        $("#buyProcessNumberForModal").prop("value",value);
        value = $(this).find("td:eq(9)").text();        
        $("#provCant").prop("value",value);
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
