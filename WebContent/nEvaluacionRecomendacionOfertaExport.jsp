<%@ page language="java" contentType="text/html"%>

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
    <style>
      body { zoom: 67%; } 
    </style>
    <!-- Customized template style mandatory ends-->
    <!--Styles Area Ends-->
  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">
  
    <!-- wrapper starts -->
       
        <!-- Main container starts -->
        <% 
          int codPadre = (int)session.getAttribute("codPadre");
          String medi = request.getParameter("medi");
        %>
        <div class="card-body">
          <button
                class="btn btn-sm btn-success ml-2"
                data-target="#newRegModal"
                data-toggle="modal"
                id="openmodal"
              >
                <i class="material-icons md-18">add_circle</i> EDITAR TABLA
          </button>
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <div class="form-group float-left" id="recommendationSection">
                <button
                  class="btn btn-sm btn-success ml-2"
                  data-target="#newEditReg"
                  data-toggle="modal"
                  id="recommendationButton"
                >
                  <i class="material-icons md-18">add_circle</i> APLICAR RECOMENDACION
                </button>
              </div>
            </div>
          </div>
        </div>
        <div class="card-body" style="overflow-x: auto; ">
              <!--Table Section Starts-->
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  style="overflow-x: auto; width:100px;"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                      <th class="all">FECHA VACIADO</th>
                      <th class="min-desktop">NO. PROCESO DE COMPRA</th>
                      <th class="min-tablet">NO. SOLICITUD DE COMPRA</th>
                      <th class="min-desktop">NO. SOLICITUD DE DISPONIBILIDAD</th>
                      <th class="min-desktop">PROVEEDOR</th>
                      <th class="min-tablet">NO. ITEM</th>
                      <th class="min-tablet">CODIGO ATC</th>
                      <th class="min-tablet">PRODUCTO REQUERIDO</th>
                      <th class="min-desktop">PRODUCTO ACORDADO</th>
                      <th class="min-desktop">DESCRIPCION/ESPECIFICACION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCRIPCION/ESPECIFICACION TECNICA ACORDADA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION REQUERIDA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION ACORDADA</th>
                      <th class="min-desktop">FABRICANTE / PAIS DE ORIGEN</th>
                      <th class="min-desktop">CERTIFICADO DE REGISTRO SANITARIO</th>
                      <th class="min-desktop">CERTIFICADO DE BPM / CPP</th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">PRECIO UNITARIO ACORDADO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>
                      <th class="min-desktop">TIEMPOS DE ENTREGA OFERTADO</th>
                      <th class="min-desktop">VIDA UTIL OFERTADA</th>
                      <th class="min-desktop">CANTIDAD UNIDAD DE EMPAQUE PRIMARIA</th>
                      <th class="min-desktop">CANTIDAD UNIDAD DE EMPAQUE SECUNDARIO</th>
                      <th class="min-desktop">FECHA DE EVALUACION Y RECOMENDACION</th>
                      <th class="min-desktop">RECOMENDACIÓN DEL COMITÉ DE EVALUACION</th>
                      <th class="min-desktop">CRITERIO DE RECOMENDACIÓN</th>
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">RECOMENDACIONES A LOS BENEFICIARIOS</th>
                      <th class="min-desktop">ESTATUS DE COMPRA</th>                        
                      <th class="min-desktop">OBSERVACION DE ESTADO ORDEN DE COMPRA</th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              <!--Table Section ends-->
        </div>

        <!-- Main container ends -->

    <form action="reportStep4Creator" id="reportForm" class="hide"></form>

    <form
      id="regListForm"
      method="post"
      action="recomendacionALPServlet"
      class="hide"
    ></form>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->
    <div class="card-body">
      <form
        class=""
        action="recomendacionALPServlet"
        method="post"
        id="newEditRegForm"
      >
        <!--*****Total Form Info Here*****-->

        <!-- Cancel Float Button -->
        <div class="wrap-fixed-float wrap-fixed-bottom-left">
          <button
            class="btn btn-primary btn-rounded shadow"
            name="submit"
            value="cancelar"
          >
            <i class="material-icons vm">close</i> CANCELAR
          </button>
        </div>
      </form>

      <!-- Submit Float Button -->
      <div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
        <button
          id="submitButton"
          type="button"
          class="btn btn-primary btn-rounded shadow"
        >
          <span>GUARDAR </span>
          <i class="material-icons vm">done</i>
        </button>
      </div>
    </div>
    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->
      <!--Custom New Modal-->
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
                COMPRA ACUERDO A LARGO PLAZO       
              </h1>
              <h4
                  class="mb-5 text-white font-weight-light"
                >
                  RECOMENDACION DEL COMITE
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
                      <div id="dataSection">
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>HABILITAR PROVEEDOR</label>
                              <input type="hidden" id="" >
                              
                              <select
                                autocomplete="off"
                                class="form-control"
                                id="isRecomended"
                                name="isRecomended"
                              >
                                <option selected disabled value="">
                                  SELECCIONA UNA OPCION...
                                </option>
                                <option value="SI">SI</option>
                                <option value="NO">NO</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-lg-6 col-md-6">
                            <div class="form-group" style="text-align:left;">
                              <label>PRELACION DE RECOMENDACION TECNICA</label>
                              <input
                                autocomplete="off"
                                type="number"
                                min="1"
                                class="form-control"
                                id="prelacion"
                                name="prelacion"
                                placeholder=""
                                required
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>CRITERIO DE RECOMENDACION</label>
                              <textarea
                                autocomplete="off"
                                class="form-control mt-3"
                                id="criteria"
                                name="criteria"
                                placeholder=""
                                style="min-height:80px;"
                              ></textarea>
                            </div>
                          </div>
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>OBSERVACIONES</label>
                              <textarea
                                autocomplete="off"
                                class="form-control mt-3"
                                id="observations"
                                name="observations"
                                placeholder=""
                                style="min-height: 80px"
                              ></textarea>
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
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                      id="addRegButton"
                      type="button"
                      data-toggle="modal"
                      data-target="#confirmationModalCenter"
                    >
                      ACEPTAR
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

      function cleanFields(){
        document.getElementById("isRecomended").selectedIndex = 0;
        $("#criteria").prop("value", "");
        $("#observations").prop("value", "");
        $("#benefRecomendations").prop("value", "");
        $("#prelacion").prop("value", "");
      }

      $(document).ready(function () {
        /* data Table */
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
          columnDefs: [
            {
              targets: 30,
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
          scrollX: true,
        });

        reqTable.ajax.url(getAbsolutePath() + "ALPListaOfertasForRecomendationAPI?searchATC=" + <%=medi%>).load();
		
        $("#buttonselect").on('click', function (e) {
        	if($("#inputselect").val()=="0"){
        		document.getElementById('buttonselect').innerText = "DESELECCIONAR TODOS";
            	$("#inputselect").val("1");
            	$('input[type=checkbox]').attr('checked', true)
                $('input[type=checkbox]').prop('checked', true);

        	}
        	else{
        		document.getElementById('buttonselect').innerText = "SELECCIONAR TODOS";
            	$("#inputselect").val("0");
            	$('input[type=checkbox]').attr('checked', false)
                $('input[type=checkbox]').prop('checked', false);
        	}
          });
        
        $("input[type=checkbox]").click(function(){
	 		  if($("input[type=checkbox]").length == $("input[type=checkbox]:checked").length) 
	 		  {
	       		document.getElementById('buttonselect').innerText = "DESELECCIONAR TODOS";
            	$("#inputselect").val("1");
	 		  } 
	 		  else 
	 		  {
	       		document.getElementById('buttonselect').innerText = "SELECCIONAR TODOS";
            	$("#inputselect").val("0");
	 		  }
        });
        ///Tabla Dinamica
        $('#buttontable').on( 'click', function (e) {
          e.preventDefault();
          var table = $('#reqTable').DataTable(); 

          $("input:checkbox:not(checked)").each(function() {
            table.column( $(this).attr("id") ).visible( true ); 
          });

          $('input[type=checkbox]:checked').each(function(){  
          table.column( $(this).attr("id") ).visible( false ); 
          });
          
          $('#newRegModal').modal('hide')
 
        } );
       
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
