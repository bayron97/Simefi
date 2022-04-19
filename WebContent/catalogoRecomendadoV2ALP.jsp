<%@ page language="java" contentType="text/html"%>
<%@ page import="main.model.*" %>
<%@ page import="java.util.*" %>

<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML starts --%>
<%
	//Retrieve your list from the request, with casting
  ArrayList<ofertaALP> offerRecommendList = (ArrayList<ofertaALP>) request.getAttribute("offerRecommendList");
%>
<%-- Seccion de Preparacion de codigo JAVA para preprocesado de la vista HTML ends --%>

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
        <div class="container main-container main-font" id="main-container">
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="modal-body" style="background-color: #f1f1f1;">
              <div class="background h-320" style="border-radius: 5px;">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <div class="text-center pb-5 mb-5">
                <h1 class="mb-0 text-white">
                  <span class="mr-2">CATALOGO DE OFERTAS RECOMENDADAS</span>
                  <i class="material-icons vm">done_all</i>
                </h1>
              </div>
              <div class="row top-60">
                <div class="col-12 col-md-12">
                  <div class="card border-0 shadow bg-white h-100">
                    <div
                      class="card-body"
                      style="
                        background: url(./assets/img/BAC.png) no-repeat center center fixed;
                        background-size: cover;
                      "
                    >
                      <h5
                        id="instructionSubtitle"
                        class="mb-3"
                        style="font-weight: bold;"
                      >
                        PROCESO DE COMPRA: 
                        <span class="mb-2 btn btn-outline-dark btn-rounded">${proCod}</span>
                      </h5>
                      <div style="overflow-x: auto;">
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
                      <!--Table Section starts-->
                      <table
                        id="datatable"
                        class="table table-bordered w-100 mb-0 table-aditional-styles"
                        aria-describedby="Tabla de productos ofertados recomendados"
                      >
                        <thead>
                          <tr>
                            
                            <th class="min-desktop">NO. ITEM</th>
                            <th class="min-desktop">COD. ATC</th>
                            <th class="min-desktop">COD. SESAL</th>
                            <th class="min-tablet">PRODUCTO OFERTADO</th>
                            <th class="min-desktop">DESCRIPCION TECNICA OFERTADA</th>
                            <th class="min-desktop">UNIDAD DE PRESENTACION OFERTADA</th>
                            <th class="min-desktop">PRELACION DE RECOMENDACION R-ALP</th>
                              
                          </tr>
                        </thead>
                        <tbody>
                          <%
                            int count = 0;
                            for(ofertaALP oferta : offerRecommendList){
                              count++;
                          %>
                            <tr>
                           	  <td><%=oferta.getIdItem()%></td>									 
                              <td><%=oferta.getCodATC()%></td>
                              <td><%=oferta.getcodSesal()%></td>
                              <td><%=oferta.getMedicamentoOfertado()%></td>
                              <td><%=oferta.getDescripcionTecnica()%></td>
                              <td><%=oferta.getUp()%></td>
                             
                              <td><%=oferta.getprelacionRALP()%></td>
                              
                             </tr>
                          <%} %>
                        </tbody>
                      </table>
                      </div>
                      <!--Table Section ends-->
                    </div>
                  </div>
                </div>
              </div>
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

    <!-- Cancel Float Button -->
    <form method="post" action="ofertasALPRouting">
      <div class="wrap-fixed-float wrap-fixed-bottom-left">
        <button
          class="btn btn-primary btn-rounded shadow"
          name="submit"
          id="submit"
          value="recomendacionOfertaALP"
        >
        <input hidden name="proc" value ="1" /> 
        <input hidden name="codPadre" value ="1" /> 
          <i class="material-icons vm">close</i> SALIR
        </button>
      </div>
    </form>

	<form target="_blank"
    	action="reportStep4Creator" 
    	id="reportForm" 
    	class="hide">
    </form>
    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!--**********No Modals in this page**********-->

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
		  var reqTable =  $("#datatable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          pageLength: 10,          
          columnDefs: [
            {
              targets: 4,
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
                inputDIST.setAttribute("value", cell[2]);
              }
              container.appendChild(inputDIST);

              var inputATC = document.createElement("input");
              inputATC.setAttribute("type", "hidden");
              inputATC.setAttribute("name", "nombre");
              if (cell[2]) {
                inputATC.setAttribute("value", cell[3]);
              }
              container.appendChild(inputATC);

              var inputMR = document.createElement("input");
              inputMR.setAttribute("type", "hidden");
              inputMR.setAttribute("name", "descripciones");
              if (cell[3]) {
                inputMR.setAttribute("value", cell[3]);
              }
              container.appendChild(inputMR);

              var inputMO = document.createElement("input");
              inputMO.setAttribute("type", "hidden");
              inputMO.setAttribute("name", "unidad");

              if (cell[4]) {
                inputMO.setAttribute("value", cell[6]);
              }

              container.appendChild(inputMO);

              var inputDesc = document.createElement("input");
              inputDesc.setAttribute("type", "hidden");
              inputDesc.setAttribute("name", "cantidad");
              if (cell[5]) {
                inputDesc.setAttribute("value", cell[34]);
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
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
