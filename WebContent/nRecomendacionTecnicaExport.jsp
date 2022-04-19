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

    <!-- <style>
      body { zoom: 67%; } 
    </style>
    Customized template style mandatory starts

    Customized template style mandatory ends

    Styles Area Ends
    
    
    <style>
    .ocultar {
        display: none;
    }
</style>
 -->
 
 <style>
      .checkboxes label {
        display: block;
        padding-right: 10px;
        padding-left: 22px;
        text-indent: -22px;
      }
      .checkboxes input {
        vertical-align: middle;
      }
      .checkboxes label span {
        vertical-align: middle;
      }
      
    </style>
    
    
    
    
    <style>
      .my-custom-scrollbar {
position: relative;
height: 600px;
overflow: auto;
}
.table-wrapper-scroll-y {
display: block;
}
    </style>
    
    <style>
      #reqTable th:nth-child(1){
        display: none;
      }
      #reqTable td:nth-child(1){
        display: none;
      }
    </style>
    
    
    
    

  </head>

  <body class="sidemenu-open header-fixed-top body-general-styles">


    <!-- wrapper starts -->
       
        <!-- Main container starts -->
        <% 
          int codPadre = (int)session.getAttribute("codPadre");
          String medi = request.getParameter("medi");
          System.out.println("codPadre "+ codPadre);
        %>
        <div class="card-body">
          <button
                class="btn btn-sm btn-success ml-2"
                data-target="#newRegModal"
                data-toggle="modal"
                data-backdrop="false"
                id="openmodal"
              >
                <i class="material-icons md-18">add_circle</i> EDITAR TABLA
          </button>
          <button
                        class="btn btn-sm btn-success ml-2"
                        data-target="#newEditReg"
                        data-toggle="modal"
                        id="recommendationButton"
                        data-backdrop="false"
                      >
                        <i class="material-icons md-18">add_circle</i> APLICAR RECOMENDACION
                      </button>
        </div>
        <div class="table-wrapper-scroll-y my-custom-scrollbar">
              <!--Table Section Starts-->
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles "
                  
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                    <th class="min-desktop">ID DB OFERTA</th>
                     <th class="all">COD. SIST</th>
                      <th class="min-desktop">NO. OFERTA PROVEEDOR</th>
                      <th class="min-tablet">PROVEEDOR</th>
                      <th class="min-desktop">NO. ITEM</th>
                      <th class="min-desktop">CODIGO ATC</th>
                      <th class="min-desktop">CODIGO SESAL</th>
                      <th class="min-tablet">PRODUCTO REQUERIDO</th>
                      <th class="min-tablet">PRODUCTO OFERTADO</th>
                      <th class="min-tablet">DESCRIPCION TECNICA REQUERIDA</th>
                      <th class="min-desktop">DESCRIPCION TECNICA OFERTADA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION REQUERIDA</th>
                      <th class="min-desktop">UNIDAD DE PRESENTACION OFERTADA</th>
                      <th class="min-desktop">NOMBRE DEL FABRICANTE</th>
                      <th class="min-desktop">PAIS DE ORIGEN</th>
                      <th class="min-desktop">CANTIDAD REQUERIDA</th>
                      <th class="min-desktop">CANTIDAD OFERTADA</th>
                      <th class="min-desktop">PRECIO UNITARIO</th>
                      <th class="min-desktop">PRECIO TOTAL</th>  
                      <th class="min-desktop">REGISTRO SANITARIO/OTROS</th>
                      <th class="min-desktop">NO. REGISTRO SANITARIO/OTROS</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>
                      <th class="min-desktop">FECHA DE EMISION</th>    
                      <th class="min-desktop">CERTIFICADO DE BUENAS PRACTICAS/OTROS</th> 
                      <th class="min-desktop">NO. CERTIFICADO DE BUENAS PRACTICAS/OTROS</th>
                      <th class="min-desktop">FECHA DE VENCIMIENTO</th>                      
                      <th class="min-desktop">FECHA DE EMISION</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUE PRIMARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUE SECUNDARIO OFERTADO</th>
                      <th class="min-desktop">ETIQUETADO Y EMPAQUE TERCIARIO OFERTADO</th>
                      <th class="min-desktop">MUESTRA PRESENTADA</th>
                      <th class="min-desktop">NO. FOLIOS DE LA OFERTA</th>
                      <th class="min-desktop">OBSERVACIONES DE OFERTAS DE PROVEEDORES</th>
                      <th class="min-desktop">SOLICITUDES DE ACLARACION</th>
                      <th class="min-desktop">RESPUESTA DE SOLICITUDES DE ACLARACIONES</th>
                      <th class="min-desktop">CONSULTAS/OBSERVACIONES ARSA</th>
                      <th class="min-desktop">CONSULTAS BENEFICIARIO</th>
                      <th class="min-desktop">OBSERVACIONES A LA OFERTA DEL CEO</th>
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CALIDAD</th> 
                      <th class="min-desktop">HISTORIAL DE CUMPLIMIENTO DE CONTRATOS</th>
                      <th class="min-desktop">RECOMENDACION DEL COMITE</th>
                      <th class="min-desktop">PRELACION-RALP</th> 
                      <th class="min-desktop">CRITERIO DE RECOMENDACION</th>
                      <th class="min-desktop">OBSERVACIONES</th>
                      <th class="min-desktop">RECOMENDACION AL BENEFICIARIO</th>                    
                      
                      <%
								try {
									Connection con = null;
									Statement state = null;
									int st = 0;
									ResultSet rs = null;
									String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
									Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
									con = DriverManager.getConnection(url, "admin", "system123");
									state = con.createStatement();
									
									String QueryString = "select ce.NombreCriterio \r\n"
											+ "	from [dbo].[CriterioEvaluacionDetalleALP] as cedalp \r\n"
											+ "	inner join [dbo].[CriteriosEvaluacion] as ce on ce.id = cedalp.idCriterio  \r\n"
											+ "	inner join [dbo].[CriteriosEvaluacionDetalle] as ced on ced.id = cedalp.idCDFK  \r\n"
											+ "	inner join [dbo].[CriterioEvaluacionALP] as cealp on cedalp.idCriterio = cealp.idC  \r\n"
											+ "	inner join [dbo].[ofertaALP]  as o on o.noOferta = cedalp.noOferta \r\n"
											+ "	inner join vaciadoOfertasALP as vo on vo.procesoCompra = o.procesoCompra \r\n"
											+ "	where vo.cod = "+codPadre+" and cealp.Estado = 'true' \r\n"
											+ "	group by ce.NombreCriterio";
									rs = state.executeQuery(QueryString);
							
									while (rs.next()) {										 
										 %>
										 <th class="min-desktop"><%= rs.getString(1).toUpperCase() %></th>
										 <%
										 
									}%>
									<th class="min-desktop"></th>
									<%
								
								
								rs.close();
								state.close();
								con.close();
								} catch (Exception e) {
								System.out.println(e);
								}
								%>                
                     
                     <!--  <th class="min-desktop">CRITERIO DE EVALUACION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                      -->
                      
                    
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
        <!-- <div class="wrap-fixed-float wrap-fixed-bottom-left">
          <button
            class="btn btn-primary btn-rounded shadow"
            name="submit"
            value="cancelar"
          >
            <i class="material-icons vm">close</i> CANCELAR
          </button>
        </div> -->
      </form>
      <!-- Submit Float Button -->
      <!-- <div class="wrap-fixed-float wrap-fixed-bottom-right main-font">
        <button
          id="submitButton"
          type="button"
          class="btn btn-primary btn-rounded shadow"
        >
          <span>GUARDAR </span>
          <i class="material-icons vm">done</i>
        </button>
      </div> -->
    </div>
    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Confirmation Modal -->
      <!--New modal-->
      <!--New Reg Modal-->
      <div
      class="modal fade main-font"
      id="newRegModal"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form id="TableForm" method="post" action="" onsubmit="return false">
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
                <h3 class="mb-0 text-white">
                SELECCIONE LAS COLUMNAS QUE QUIERE OCULTAR/MOSTRAR
                </h3>
              </div>

              <div class="row top-40">
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
                      <div class="row">
                        <div class="card-body">
                          <div class="row justify-content-center">
                            <div class="col-md-12 mx-auto">
                              <!--DATA Section-->
                              <div id="dataSection" class="checkboxes">
                              	<div class="row">
                              		<div class="col-lg-4 col-md-4">
                              			<!--label id="textoselect"></label-->
                              			<button id="buttonselect" class="btn btn-sm btn-success">SELECCIONAR TODOS</button>
                              			<input type="hidden" id="inputselect" value="0"/>
                              		</div>
                              	</div>
                                <div class="row">
                                  <div class="col-lg-4 col-md-4">
                                    <div class="form-group">
                                       <label><input type="checkbox" id="2" name="activo2"/><span> NOM. OFERTA PROVEEDOR</span></label>
                                      <label><input type="checkbox" id="3" name="activo3"/><span> PROVEEDOR</span></label>
                                      <label><input type="checkbox" id="4" name="activo4"/><span> NO. ITEM</span></label>
                                      <label><input type="checkbox" id="5" name="activo5"/><span> CODIGO ATC</span></label>
                                      <label><input type="checkbox" id="6" name="activo6"/><span>CODIGO SESAL</span></label>
                                      <label><input type="checkbox" id="7" name="activo7"/><span> PRODUCTO REQUERIDO</span></label>
                                      <label><input type="checkbox" id="8" name="activo8"/><span> PRODUCTO OFERTADO</span></label> 
                                      <label><input type="checkbox" id="9" name="activo9"/><span> DESCRIPCION TECNICA REQUERIDA</span></label> 
                                      <label><input type="checkbox" id="10" name="activo10"/><span> DESCRIPCION TECNICA OFERTADA</span></label>
                                      <label><input type="checkbox" id="11" name="activo11"/><span> UNIDAD DE PRESENTACION REQUERIDA</span></label>
                                      <label><input type="checkbox" id="12" name="activo12"/><span> UNIDAD DE PRESENTACION OFERTADA</span></label>
                                      <label><input type="checkbox" id="13" name="activo13"/><span> NOMBRE DEL FABRICANTE</span></label>
                                      <label><input type="checkbox" id="14" name="activo14"/><span> PAIS DE ORIGEN</span></label>
                                      <label><input type="checkbox" id="15" name="activo15"/><span> CANTIDAD REQUERIDA</span></label>  
                                      <label><input type="checkbox" id="16" name="activo16"/><span> CANTIDAD OFERTADA</span></label>
                                      <label><input type="checkbox" id="17" name="activo17"/><span> PRECIO UNITARIO</span></label>                                  
                                      </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                      <label><input type="checkbox" id="18" name="activo18"/><span> PRECIO TOTAL</span></label>
                                      <label><input type="checkbox" id="19" name="activo19"/><span>REGISTRO SANITARIO/OTROS</span></label>
                                      <label><input type="checkbox" id="20" name="activo20"/><span> NO. REGISTRO SANITARIO/OTROS</span></label>
                                      <label><input type="checkbox" id="21" name="activo21"/><span> FECHA DE VENCIMIENTO</span></label>
                                      <label><input type="checkbox" id="22" name="activo22"/><span> FECHA DE EMISION</span></label> 
                                      <label><input type="checkbox" id="23" name="activo23"/><span> CERTIFICADO BUENAS PRACTICAS/OTROS</span></label> 
                                      <label><input type="checkbox" id="24" name="activo24"/><span> NO. CERTIFICADO DE BUENAS PRACTICAS/OTROS</span></label>
                                      <label><input type="checkbox" id="25" name="activo25"/><span> FECHA DE VENCIMIENTO</span></label>
                                      <label><input type="checkbox" id="26" name="activo26"/><span> FECHA DE EMISION</span></label>
                                      <label><input type="checkbox" id="27" name="activo27"/><span> ETIQUETADO EMPAQUETADO PRIMARIO OFERTADO</span></label>
                                      <label><input type="checkbox" id="28" name="activo28"/><span> ETIQUETADO EMPAQUETADO SECUNDARIO OFERTADO</span></label>   
                                      <label><input type="checkbox" id="29" name="activo29"/><span> ETIQUETADO EMPAQUETADO TERCIARIO OFERTADO</span></label>
                                      <label><input type="checkbox" id="30" name="activo30"/><span> MUESTRA PRESENTADA</span></label>
                                      <label><input type="checkbox" id="31" name="activo31"/><span> NO. FOLIOS DE LA OFERTA</span></label>
                                      <label><input type="checkbox" id="32" name="activo32"/><span> OBSERVACIONES DE OFERTAS DE PROVEEDORES</span></label>   
                                   	  </div>
                                  	</div>
                                  	<div class="col-lg-4 col-md-4">
                                      <div class="form-group">
                                      <label><input type="checkbox" id="33" name="activo33"/><span> SOLICITUDES DE ACLARACION</span></label>
                                      <label><input type="checkbox" id="34" name="activo34"/><span> RESPUESTA DE SOLICITUDES DE ACLARACIONES</span></label>
                                      <label><input type="checkbox" id="35" name="activo35"/><span> CONSULTAS/OBSERVACIONES ARSA</span></label>
                                      <label><input type="checkbox" id="36" name="activo36"/><span> CONSULTAS BENEFICIARIO</span></label>
                                      <label><input type="checkbox" id="37" name="activo37"/><span> OBSERVACIONES A LA OFERTA DEL CEO</span></label> 
                                      <label><input type="checkbox" id="38" name="activo38"/><span> HISTORIAL DE CUMPLIMIENTO DE CALIDAD</span></label> 
                                      <label><input type="checkbox" id="39" name="activo39"/><span> HISTORIAL DE CUMPLIMIENTO DE CONTRATOS</span></label>
                                      
                                      <label><input type="checkbox" id="40" name="activo40"/><span> RECOMENDACION DEL COMITE</span></label>
                                      <label><input type="checkbox" id="41" name="activo41"/><span> PRELACION-RALP</span></label> 
                                      <label><input type="checkbox" id="42" name="activo42"/><span> CRITERIO DE RECOMENDACION</span></label>
                                      <label><input type="checkbox" id="43" name="activo43"/><span> OBSERVACIONES</span></label>   
                                      <label><input type="checkbox" id="44" name="activo44"/><span> RECOMENDACION AL BENENFICIARIO</span></label>
                                      <label><input type="checkbox" id="45" name="activo45"/><span> CRITERIO DE EVALUACION</span></label>
                                   	  </div>
                                  	</div>
                                </div>
                              </div>
                              <!--DATA Section ends-->
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
                      id="cancelButtontable"
                      data-dismiss="modal"
                      aria-label="Close"
                      class="mb-2 shadow-sm mr-2 btn btn-lg btn-success"
                    >
                      CANCELAR
                    </button>
                  </div>
                  <div class="col-12 col-md-6 text-center">
                    <button
                      id="buttontable"
                      name="submit"
                      type="submit"
                      data-dismiss="modal"
                      value=""
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
        <!--Form Edit Reg ends-->
      </div>
    </div>
    <!--Custom New Modal-->
      <!-- End New Modal-->
    <!-- Modal Section ends-->
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
                              <label>RECOMENDACION DEL COMITE</label>
                              <input type="hidden" id="noOferta" name="noOferta" >
                              
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
                          <div class="col-lg-12 col-md-12">
                            <div class="form-group" style="text-align:left;">
                              <label>RECOMENDACIONES AL BENEFICIARIO</label>
                              <textarea
                                autocomplete="off"
                                class="form-control"
                                id="benefRecomendations"
                                name="benefRecomendations"
                                placeholder=""
                                style="min-height:75px;"
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
                      data-dismiss="modal"
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
         
          //scroller:       true,
          columnDefs: [
             {
              targets: 43,
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
          /* scrollX: true, */
        });

        
        
        
        
        var ofertaEditar = 0;
        //const rowSelected = null;
        $("#reqTable tbody").on("click", "tr", function () {
          $(this).addClass("selected").siblings().removeClass("selected");
          $("#recommendationSection").addClass("hide");
          $("#PrelacionSection").addClass("hide");
          var value;
          value = $(this).find("td:eq(3)").text();
          $("#tempNo").prop("value", value);
          value = $(this).find("td:eq(2)").text();
          $("#tempDist").prop("value", value);
          value = $(this).find("td:eq(4)").text();
          $("#tempATC").prop("value", value);
          value = $(this).find("td:eq(6)").text();
          $("#tempMedReq").prop("value", value);
          value = $(this).find("td:eq(7)").text();
          $("#tempMedOff").prop("value", value);
          value = $(this).find("td:eq(8)").text();
          $("#tempDesc").prop("value", value);
          value = $(this).find("td:eq(10)").text();
          $("#tempUp").prop("value", value);
          value = $(this).find("td:eq(11)").text();
          $("#tempPrice").prop("value", value);
         
          $("#isRecomended").prop("value", $(this).find("td:eq(40)").text());
          $("#criteria").prop("value", $(this).find("td:eq(42)").text());
          $("#observations").prop("value", $(this).find("td:eq(43)").text());
          $("#benefRecomendations").prop("value", $(this).find("td:eq(44)").text());
          $("#noOferta").prop("value", $(this).find("td:eq(0)").text());
          $("#prelacion").prop("value", $(this).find("td:eq(41)").text());
          
          ofertaEditar = $(this).find("td:eq(0)").text();
         

          const rowSelected = $(this);
         
          
	
          if ($("#tempNo").val() != "" && $("#tempNo").val() != "No hay datos disponibles en la tabla.") {
              $("#recommendationSection").removeClass("hide");
          }
          if($("#isRecomended").val()!=null){
        	  if ($("#isRecomended").val().trim() ==="SI") {
                  $("#PrelacionSection").removeClass("hide");
              }
          }
          
          /*Delete Reg Function*/

          $("#deleteRegButton").on("click", function (event) {
            event.preventDefault();
            reqTable.row(rowSelected).remove().draw();
            $("#confirMessage").text("EXITOSO! REGISTRO BORRADO CORRECTAMENTE...");
            cleanFields();
          });

          $("#addRegButton").on("click", function (event) {
            event.preventDefault();
            if ($("#tempNo").val() === "" || $("#tempNo").val() === "No hay datos disponibles en la tabla.") {
              $("#confirMessage").text(
                "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
              );
            } else {
              var Datar=reqTable.rows('.selected').data()[0];
              reqTable.row('.selected').remove().draw( false );
              //reqTable.row(rowSelected).remove().draw();
            /*   Datar[9]=$("#isRecomended").val();
              Datar[10]=$("#criteria").val();
              Datar[11]=$("#observations").val();
              Datar[12]=$("#benefRecomendations").val();
              reqTable.row.add(Datar).draw(); */

              //Actualizar CommitRecomendacion
              
               var url = getAbsolutePath() + "UpdateOfertaRecomendacionAPI";		          
		           var isRecomended = $("#isRecomended").val();
		           var criteria = $("#criteria").val();
		           var observations = $("#observations").val();
		           var benefRecomendations = $("#benefRecomendations").val();
		           var noOferta = $("#noOferta").val();
              
		           $.ajax({
		        	    url:url,
		        	    type:"POST",
		        	    dataType:'json',
		        	    data: {noOferta:noOferta, isRecomended:isRecomended, criteria:criteria, observations:observations, benefRecomendations:benefRecomendations},
		        	    success:function(data){		        	     		        	        
		             	 cleanFields()		            	
		             	 
		                 $("#PrelacionSection").addClass("hide");
		                 cleanFields();
		                 $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
		        	}
		           });
              
              
            }
          });
          
          $("#addRegButtonPrelacion").on("click", function (event) {
              event.preventDefault();
              if ($("#tempNo").val() === "" || $("#tempNo").val() === "No hay datos disponibles en la tabla.") {
                $("#confirMessage").text(
                  "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
                );
              } else {
                $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
            	var indicador="";
                var Datar=reqTable.rows('.selected').data()[0];
                reqTable.row('.selected').remove().draw( false );
                var data = reqTable.rows().data();
                data.each(function (value, index) {
                if($("#prelacion").val()==value[13])
                	if($("#tempNo").val()!=value[0]){
                		indicador="Hay Coincidencia";
                    	$("#confirMessage").text("YA HAY UN PRODUCTO CON ESA PRELACION");
                	}
                });
                if(indicador!="Hay Coincidencia"){
                	Datar[13]=$("#prelacion").val();
                }
                else{
                	$("#confirMessage").text("YA HAY UN PRODUCTO CON ESA PRELACION");
                }
                reqTable.row.add(Datar).draw();

                $('#newEditRegPrelacion').modal('hide');
                $("#PrelacionSection").addClass("hide");
                $("#prelacion").prop("value", "");
              }
            });
          
          
        });
        
        reqTable.ajax.url(getAbsolutePath() + "ALPListaOfertasForRecomendationAllAPI?codPadreBus="+<%=codPadre%> +"").load();
        
        
       
        
       
        /* $('#reqTable tr > *:nth-child(1)').hide();
        
        $('td:nth-child(2),th:nth-child(2)').hide();
        $('td:nth-child(2),th:nth-child(2)').hide(); */
        
     
        	/*  var fila = document.getElementById('reqTable').getElementsByTagName('tr');
        	  for(var i=0;i<fila.length;i++){
        	    fila[i].getElementsByTagName('td')[1].style.display='none';
        	    reqTable.column( $(this).attr("id") ).visible( true ); 
        
        	  } */
        
        $("#addRegButton").on("click", function (event) {
            event.preventDefault();
            if ($("#tempNo").val() === "" || $("#tempNo").val() === "No hay datos disponibles en la tabla.") {
              $("#confirMessage").text(
                "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
              );
            } else {
              var Datar=reqTable.rows('.selected').data()[0];
              reqTable.row('.selected').remove().draw( false );
              //reqTable.row(rowSelected).remove().draw();
                Datar[40]=$("#isRecomended").val();
		                     Datar[42]=$("#criteria").val().toUpperCase();
		                     Datar[43]=$("#observations").val().toUpperCase();
		                     Datar[44]=$("#benefRecomendations").val().toUpperCase();
		                     reqTable.row.add(Datar).draw();
              //Actualizar CommitRecomendacion
              //$('#newEditReg').modal('hide');
               var url = getAbsolutePath() + "UpdateOfertaRecomendacionAPI";		          
		           var isRecomended = $("#isRecomended").val();
		           var criteria = $("#criteria").val();
		           var observations = $("#observations").val();
		           var benefRecomendations = $("#benefRecomendations").val();
		           var noOferta = $("#noOferta").val();
              
		           $.ajax({
		        	    url:url,
		        	    type:"POST",
		        	    dataType:'json',
		        	    data: {noOferta:noOferta, isRecomended:isRecomended, criteria:criteria, observations:observations, benefRecomendations:benefRecomendations},
		        	    success:function(data){		        	     		        	        
		             	 cleanFields()		            	
		             	 
		                 $("#PrelacionSection").addClass("hide");
		                 cleanFields();
		                 $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
		        	}
		           });
              
              
            }
          });
		
        
        ///Tabla Dinamica
        $('#buttontable').on('click', function (e) {
          e.preventDefault();

          $("input:checkbox:not(checked)").each(function() {
            reqTable.column( $(this).attr("id") ).visible( true );
          });

          $('input[type=checkbox]:checked').each(function(){  
            reqTable.column( $(this).attr("id") ).visible( false );
          });
          
          //$('#newRegModal').modal('hide');
        });
        
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
        
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
