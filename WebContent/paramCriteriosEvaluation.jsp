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
                <% 
            String tipo = (String)session.getAttribute("tipoAcceso");
            String servlet = (String)request.getAttribute("throughServlet");
            String acceso = "none"; 
            if((tipo != null && !tipo.isEmpty()) && (servlet != null && !servlet.isEmpty()))
            { 
              acceso = tipo;
            } 
            boolean auth = true;            
            if (!acceso.contentEquals("administrar") && !acceso.contentEquals("digitar") && !acceso.contentEquals("consultar") && !acceso.contentEquals("verificar") ) {
				auth = false;								
			}            
          %>
          <% if(!acceso.contentEquals("none")){ %>
           <% } %>
          
              </div>
            </div>
          </div>
        </div>

		
		  
        <!-- Main container starts -->
        <div class="container main-container main-font" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-6">
                    <h2 class="mb-4 large-title">
                      PARAMETRIZACION DE APERTURA DE PROCESOS
                    </h2>
                    <h5 class="font-weight-light">CRITERIOS DE EVALUACION PARA VACIADO DE OFERTA</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
        
         
          
          <div class="card-body main-font">
           <%
		if (auth == true) {
		%>
		
		<form action="CriteriosEvaluacionDetalleServlet" method="post">
            <div class="card border-0 shadow-sm mb-4 main-content-div">
              <div class="card-header border-0 bg-none">
                <div class="card-body">
                  <div class="col-md-12">
                    <div class="row">
                      <div class="col-lg-6 col-md-6">
                      
                      
                        <div class="form-group" style="text-align: left">
                          <label>CRITERIO DE EVALUACION</label>
                          <input type="hidden" name="CrEvaluacionN" id="CrEvaluacionN">
                          <select
                            autocomplete="off"
                            class="form-control"
                            id="CrEvaluacion"
                            name="CrEvaluacion"
                            required="required"
                            onchange="funcionchange()"
                          >
                            <option selected value="">
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
                                String QueryString = "select * from CriteriosEvaluacion";
                                rs = state.executeQuery(QueryString);
                                while(rs.next()){%>
                                  <option value="<%=rs.getString(1)%>">
                                    <%=rs.getString(2).toUpperCase() %>
                                  </option>
                            <%} } catch(Exception e){ System.out.println(e); }
                            %>
                          </select>
                        </div>
                      </div>
                      <div class="col-lg-4 col-md-4">
                        <div class="form-group">
                          <label style="text-transform: uppercase"
                            >OPCION</label
                          >
                          <input
                            type="text"
                            class="form-control"
                            id="CrEvaluacionDetalle"
                            name="CrEvaluacionDetalle"
                            required="required"
                          />
                        </div>
                      </div>
                      <div class="col-lg-2 col-md-2">
                        <div class="form-group">
                          <br />
                           <% if (acceso.contentEquals("administrar")){
                	%>
                          <button
                         hidden
                            class="btn btn-sm btn-success ml-2"
                            id="newRegButton"
                          >
                            <i class="material-icons md-18">add_circle</i> CREAR
                          </button>
                          
                          
                          <button
                            class="btn btn-sm btn-success ml-2"
                            id="ButtonModal" type="button"
                          >
                            <i class="material-icons md-18">add_circle</i> CREAR
                          </button>
                          
                          
                           <% } %>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </form>
		
            <!--Table Section starts-->
            <table
              id="datatable"
              class="table table-bordered w-100 mb-0 table-aditional-styles"
            >
              <thead>
                <tr>
                  <th class="min-tablet" hidden>ID</th>
                  <th class="min-tablet">CRITERIO DE EVALUACION</th>
                  <th class="min-tablet">OPCIONES</th>
                </tr>
              </thead>
              <tbody>
                <% try{ 
                  Connection con = null;
                  Statement state = null;
                  int i = 1; 
                  ResultSet rs = null;
                  String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                  con = DriverManager.getConnection(url,"admin","system123");
                  state = con.createStatement(); 
                  String QueryString = "select * from CriteriosEvaluacionDetalle order by idCE";
                  rs = state.executeQuery(QueryString); 
                %> <% while(rs.next()){  %>
                          <tr>
                            <td hidden><%=rs.getInt(2)%></td>
                            <td><%=rs.getString(4).toUpperCase()%></td>
                            <td><%=rs.getString(3).toUpperCase()%></td>
                          </tr>
                        <%i = i + 1;} 
                        rs.close();
                        state.close();
                        con.close();
                }catch(Exception e){ System.out.println(e); } %>
              </tbody>
            </table>
            <!--Table Section ends-->
            <%
						}
						%>
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

    <!-- Back Float Button -->
    <form method="post" action="pCompraParamRouting">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded-circle shadow"
          name="submit"
          value="backwardApertura"
        >
          <i class="material-icons vm">arrow_back</i>
        </button>
      </div>
    </form>

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--New Reg Modal-->
    
    <!-- Confirmation Modal -->
	<div class="modal fade " id="confirmationModalCenter" tabindex="-1"
		role="dialog" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered "
			role="document">
			<div class="modal-content box-shadow">
				<div class="card text-center shadow-sm border-0">
					<div class="card-body"
						style="background: url(BAC.png) no-repeat center center">
						<div class="background h-50">
							<img src="./assets/img/BAC_LOGIN.png" alt="" />
						</div>
						<figure class="avatar avatar-100 mx-auto mb-5"> <img
							src="./bancoccicon.png" alt=""></figure>
						<div class="modal-body main-font mt-2" id="confirMessage">
							-DESCRIPCION MOTIVO DE LA MODAL-</div>
						<div>
							<button class="btn btn-primary btn-block main-font"
								id="confirModalButton" data-dismiss="modal">
								ACEPTAR <i class="material-icons md-18">done</i>
							</button>
						</div>
					</div>
				</div>
			</div>
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
      function funcionchange() {
        var combo = document.getElementById("CrEvaluacion");
        var selected = combo.options[combo.selectedIndex].text;
        $("#CrEvaluacionN").val(selected);
      }

      "use strict";
      $(document).ready(function () {
        var fecha = new Date();
        var ano = fecha.getFullYear();
        $("#anio").val(ano);

        /* data Table */
        $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 1,
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
    
   				 $("#ButtonModal").on("click",function(event) {
					event.preventDefault();
					var url = getAbsolutePath() + "ValidarDuplicadosAPI";
					var CrEvaluacion = document.getElementById("CrEvaluacionN").value;
					var CrEvaluacionDetalle = document.getElementById("CrEvaluacionDetalle").value;
					var validar = "ValidarOpcionCriterio";
					var modifId = 0;
					$.ajax({
								url : url,
								type : "POST",
								dataType : 'json',
								data : {
									CrEvaluacion : CrEvaluacion,
									CrEvaluacionDetalle : CrEvaluacionDetalle,
									validar : validar,
									modifId : modifId
								},
								success : function(data) {

									if (parseInt(data) == 0) {										
										$("#newRegButton").trigger(
										"click");
										return true;
									} else {
										$("#confirMessage")
												.text(
														"ALERTA! ESTE CRITERIO YA CONTIENE ESTA OPCION");
										$("#confirmationModalCenter")
												.modal('show');
										return false;
									}

								},
							});
				});
      
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
