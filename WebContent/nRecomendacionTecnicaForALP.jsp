<%@page import="main.model.CriterioEvaluacionDTO"%>
<%@page import="main.model.CriterioEvaluacion"%>
<%@page import="java.util.ArrayList"%>
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
      #reqTable th:nth-child(1){
        display: none;
      }
      #reqTable td:nth-child(1){
        display: none;
      }
      
      #reqTable th:nth-child(21){
        text-transform: uppercase;
      }
      
       #reqTable td:nth-child(21){
        text-transform: uppercase;
      }
      
      #reqTable th:nth-child(25){
        text-transform: uppercase;
      }
      
       #reqTable td:nth-child(25){
        text-transform: uppercase;
      }
    </style>
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
        <%
        String temp = "";
        temp = (String)request.getAttribute("openMode");
        String openMode = "";
      	if(temp != null && !temp.isEmpty()){
      		openMode = temp;
      	}
      %> 
  
        <!-- Main container starts -->
        <% int codPadre = (int)session.getAttribute("codPadre"); %>
        <div class="container main-container" id="main-container">
          <div class="container-fluid">
            <div class="row">
              <div class="container main-container">
                <div class="row align-items-center">
                  <div class="col-12 col-xs-12 col-md-12">
                    <h2 class="mb-4 large-title">
                      CRITERIO E INFORME DE RECOMENDACION
                    </h2>
                    <h5 class="font-weight-light main-font">
                      COMPRA ACUERDO A LARGO PLAZO
                    </h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <div class="card border-0 shadow-sm mb-4 main-content-div">
            <div class="card-body main-font">
              <!-- Hidden inputs for editing row starts-->
							<input type="hidden" id="tempNo" value=""/>
							<input type="hidden" id="tempDist"/>
							<input type="hidden" id="tempATC"/>
							<input type="hidden" id="tempMedReq"/>
							<input type="hidden" id="tempMedOff"/>
							<input type="hidden" id="tempDesc"/>
							<input type="hidden" id="tempUp"/>
              <input type="hidden" id="tempPrice"/>
              <input type="hidden" id="tempmoned"/>

              <!-- Hidden inputs for editing row ends-->
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-5 col-md-5">
                    <div class="form-group">
                      <select
                        autocomplete="off"
                        class="form-control"
                        id="medicamentoEstimadoSelect"
                        name="medicamentoEstimadoSelect"
                      >
                        <option selected disabled value="">
                          SELECCIONA UN MEDICAMENTO...
                        </option>
                        <% 
                          try{
                            Connection con = null;
                            Statement state = null; 
                            Statement stat1 = null; 
                            Statement stat2 = null; 
                            Statement stat3 = null; 
                            Statement stat4 = null; 
                            ResultSet rs = null; 
                            ResultSet rs1 = null;
                            ResultSet rs2 = null;
                            ResultSet rs3 = null;
                            ResultSet rs4 = null;
                            String url = "jdbc:sqlserver://database-3.ckhpxsdh3wlg.us-east-2.rds.amazonaws.com:1433;DatabaseName=BancOcci";
                            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                            con = DriverManager.getConnection(url,"admin","system123");
                            state = con.createStatement();
                            stat1 = con.createStatement();
                            stat2 = con.createStatement();
                            stat3 = con.createStatement();
                            stat4 = con.createStatement();
                            
                            
                            String QueryString1 = "select procesoCompra from vaciadoOfertasALP where cod = " + codPadre;
                            rs1 = state.executeQuery(QueryString1);
                            String proceso = "";
                            if(rs1.next()){
                            	proceso = rs1.getString(1);
                            };
                            
                            String QueryString = "SELECT DISTINCT medicamentoEstimado, codSesal, idItem from dbo.ofertaALP where codPadre = " + codPadre;
                            rs = state.executeQuery(QueryString);
                            
                            
                            
                            while(rs.next()){
                            	
                            	int ofertasRecividas = 0;
                            	int ofertasRealizadas = 0;
                            	
                            	String QueryString3 = "select sum(ofertasRecividas) from actaApertura where procesoCompra ='"+proceso+"'  AND idListRequirement = '"+rs.getString(3)+"'";
                            	rs3 = stat3.executeQuery(QueryString3);
                              
                                if(rs3.next()){
                                	ofertasRecividas = rs3.getInt(1);
                                }; 
                                
                                String QueryString4 = "select count(*) from dbo.ofertaALP where idConsolidado = '"+rs.getString(3)+"' and procesoCompra ='"+proceso+"'and estado = 'FINALIZADO'";
                            	rs4 = stat4.executeQuery(QueryString4);
                              
                                if(rs4.next()){
                                	ofertasRealizadas = rs4.getInt(1);
                                }; 
                                 
                                if (ofertasRealizadas >= ofertasRecividas) {%>
        							<option value="<%=rs.getString(1)%>"><%=rs.getString(1).toUpperCase()%></option>
        						<%}
                                
                            }
                            	
                              
                         rs.close(); 
                        state.close();
                        con.close(); }catch(Exception e){System.out.println(e);} %>
                      </select>
                    </div>
                  </div>
                  <div class="col-lg-3 col-md-3">
                    <div class="form-group float-left">
                      <button
                        class="btn btn-sm btn-success ml-2"
                        id="searchTableButton"
                      >
                        <i class="material-icons md-18">find_replace</i> CARGAR TABLA
                      </button>
                    </div>
                  </div>
                  <div class="col-lg-4 col-md-4">
                    <div class="form-group float-right">
                      MEDICAMENTO CARGADO: 
                      <label class="btn btn-sm btn-success text-white mr-2" id="chargedTable">TABLA VACIA</label>
                    </div>
                  </div>
                </div>
              </div>
              <div class="card-body">
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <p>&nbsp;</p>
                  </div>
                </div>
                
                <div class="row">
                  <div class="col-lg-12 col-md-12">
                    <div class="form-group float-left hide" id="recommendationSection">
                      <button
                      hidden
                        class="btn btn-sm btn-danger ml-2"
                        id="deleteRegButton"
                        type="button"
                        data-toggle="modal"
                        data-target="#confirmationModalCenter"
                      >
                        <i class="material-icons md-18">close</i>
                        ELIMINAR OFERTA SELECCIONADA
                      </button>
                      <button
                        class="btn btn-sm btn-success ml-2"
                        data-target="#newEditReg"
                        data-toggle="modal"
                        id="recommendationButton"
                      >
                        <i class="material-icons md-18">add_circle</i> APLICAR RECOMENDACION
                      </button>
                    </div>
                    <div class="form-group float-left hide" id="PrelacionSection">
                      <button
                        class="btn btn-sm btn-success ml-2"
                        data-target="#newEditRegPrelacion"
                        data-toggle="modal"
                        id="prelacionButton"
                      >
                        <i class="material-icons md-18">add_circle</i> INGRESAR PRELACION
                      </button>
                    </div>
                    <div class="form-group float-right">
                      <label class="mr-3">NOTA: PARA EDITAR SELECCIONE UN REGISTRO DE LA TABLA</label>
                    </div>
                  </div>
                </div>
              </div>
              <!--Section Filter Table-->
              <div class="card-body">
                <button
                      class="btn btn-sm btn-success ml-2"
                      data-target="#newRegModal"
                      data-toggle="modal"
                      id="openmodal"
                    >
                      <i class="material-icons md-18">add_circle</i> EDITAR TABLA
                </button>
                <form
                  id="ExportTable"
                  method="post"
                  action="nRecomendacionTecnicaExport.jsp"
                  class="main-font"
                  target="_blank"
                >
                <input name="medi" id="medi" type="hidden">
                <button
                type="submit"
                class="btn btn-sm btn-success ml-2"
                data-target="#"
                data-toggle="modal"
                id="export"
                >
                  <i class="material-icons md-18">add_circle</i> EXPORTAR TABLA 
                </button>
                </form>
                
              </div>
              
              <!--Section Filter Table Ends-->
              <!--Table Section Starts-->
              <div class="card-body main-font" style="overflow-x: auto;">
                <table 
                  id="reqTable"
                  class="table table-bordered w-100 mb-0 table-aditional-styles"
                  aria-describedby="Tabla de recomendaciones por ofertas"
                >
                  <thead>
                    <tr>
                      <th class="min-desktop">ID DB OFERTA</th>
                      <th class="all">COD. SIST</th>
                      <th class="min-desktop">NO OFERTA PROVEEDOR</th>
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
                      int ColumnasDefault = 45;
                      int canCtiterios = 0;
                      int totalColumnas = ColumnasDefault + canCtiterios;
                      
                      String cod = (String)session.getAttribute("cod");                        
                      ArrayList<CriterioEvaluacionDTO> Criterios = (ArrayList<CriterioEvaluacionDTO>) request.getAttribute("HeaderCriterios");
                      if (Criterios != null)
                      {
                        for(CriterioEvaluacionDTO criterio : Criterios){
                        	canCtiterios++;
                    %>
                       
                        
                        <th class="min-desktop"><%=criterio.getNombreCriterio().toUpperCase()%></th>
                      
                    <%
                        }
                      }
                    %>
                       <th class="min-desktop"></th>
                    </tr>
                  </thead>
                  <tbody>
                  </tbody>
                </table>
              </div>
              <!--Table Section ends-->
              <div class="row">
                <div class="col-lg-12 col-md-12">
                  <p>&nbsp;</p>
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

    <form action="reportStep4Creator" id="reportForm" class="hide"></form>

    <form
      id="regListForm"
      method="post"
      action="recomendacionALPServlet"
      class="hide"
    ></form>
    <!-- wrapper ends -->

    <!-- Navigation Float Buttons section starts -->

    <form
      class="main-font"
      action="ofertasALPRouting"
      method="post"
      id="newEditRegForm"
    >
      <!--*****Total Form Info Here*****-->

      <!-- Cancel Float Button -->
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

    <!-- Submit Float Button -->
   

    <!-- Navigation Float Buttons section ends -->

    <!-- Modal Section starts-->

    <!-- Confirmation Modal -->
    <div
      class="modal fade"
      id="confirmationModalCenter"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
        <div class="modal-content box-shadow">
          <div class="card text-center shadow-sm border-0">
            <div
              class="card-body"
              style="background: url(BAC.png) no-repeat center center"
            >
              <div class="background h-50">
                <img src="./assets/img/BAC_LOGIN.png" alt="" />
              </div>
              <figure class="avatar avatar-100 mx-auto mb-4">
                <img src="./bancoccicon.png" alt="" />
              </figure>
              <div class="modal-body main-font" id="confirMessage">
                -DESCRIPCION MOTIVO DE LA MODAL-
              </div>
              <div>
                <button
                  class="btn btn-primary btn-block main-font"
                  id="confirModalButton"
                  data-dismiss="modal"
                >
                  ACEPTAR <i class="material-icons md-18">done</i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

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
                      data-dismiss="modal"
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
    <!-- Prelacion Modal -->
    <div
      class="modal fade main-font"
      id="newEditRegPrelacion"
      tabindex="-1"
      role="dialog"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <!--Form Edit Reg starts-->
        <form action="" id="editRegFormPrelacion" method="">
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
                              <label>PRELACION</label>
                              <input
                                autocomplete="off"
                                type="number"
                                min="1"
                                class="form-control"
                                id="prelacion"
                                name="prelacion"
                                placeholder=""
                                min="1" max="6"
                                required
                              />
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
                      id="cancelButtonPrelacion"
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
                      id="addRegButtonPrelacion"
                      data-dismiss="modal"
                      type="button"                      
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
    <!-- End Prelacion Modal -->

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
                                     
                                      <label hidden><input type="checkbox" id="1" name="activo1"/><span> ID DB OFERTA</span></label>   
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
      }

      $(document).ready(function () {
        /* data Table */
        var cC = <%=totalColumnas%>;
        var reqTable = $("#reqTable").DataTable({
          responsive: true,
          searching: true,
          bLengthChange: true,
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
        
        
        //Generador de Reporte
        $("#generalReportButton").on("click", function (event) {
          var container = document.getElementById("reportForm");
          if (reqTable.data().any()) {
            for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();
              var inputNo = document.createElement("input");
              inputNo.setAttribute("type", "hidden");
              inputNo.setAttribute("name", "no");
              if (cell[0]) {
                inputNo.setAttribute("value", cell[0]);
              }
              container.appendChild(inputNo);

              var inputDIST = document.createElement("input");
              inputDIST.setAttribute("type", "hidden");
              inputDIST.setAttribute("name", "distribuidor");
              if (cell[1]) {
                inputDIST.setAttribute("value", cell[1]);
              }
              container.appendChild(inputDIST);

              var inputATC = document.createElement("input");
              inputATC.setAttribute("type", "hidden");
              inputATC.setAttribute("name", "atc");
              if (cell[2]) {
                inputATC.setAttribute("value", cell[2]);
              }
              container.appendChild(inputATC);

              var inputMR = document.createElement("input");
              inputMR.setAttribute("type", "hidden");
              inputMR.setAttribute("name", "medicamentoReg");
              if (cell[3]) {
                inputMR.setAttribute("value", cell[3]);
              }
              container.appendChild(inputMR);

              var inputMO = document.createElement("input");
              inputMO.setAttribute("type", "hidden");
              inputMO.setAttribute("name", "medicamentoOFF");

              if (cell[4]) {
                inputMO.setAttribute("value", cell[4]);
              }

              container.appendChild(inputMO);

              var inputDesc = document.createElement("input");
              inputDesc.setAttribute("type", "hidden");
              inputDesc.setAttribute("name", "descripcion");
              if (cell[5]) {
                inputDesc.setAttribute("value", cell[5]);
              }
              container.appendChild(inputDesc);

              var inputUP = document.createElement("input");
              inputUP.setAttribute("type", "hidden");
              inputUP.setAttribute("name", "up");

              if (cell[6]) {
                inputUP.setAttribute("value", cell[6]);
              }

              container.appendChild(inputUP);
            }

            var inputPU = document.createElement("input");
            inputPU.setAttribute("type", "hidden");
            inputPU.setAttribute("name", "precio");
            if (cell[7]) {
              inputPU.setAttribute("value", cell[7]);
            }
            container.appendChild(inputPU);

            var inputRecC = document.createElement("input");
            inputRecC.setAttribute("type", "hidden");
            inputRecC.setAttribute("name", "reC");
            if (cell[8]) {
              inputRecC.setAttribute("value", cell[8]);
            }
            container.appendChild(inputRecC);

            var inputCrit = document.createElement("input");
            inputCrit.setAttribute("type", "hidden");
            inputCrit.setAttribute("name", "crit");
            if (cell[9]) {
              inputCrit.setAttribute("value", cell[9]);
            }
            container.appendChild(inputCrit);

            var inputObs = document.createElement("input");
            inputObs.setAttribute("type", "hidden");
            inputObs.setAttribute("name", "obs");
            if (cell[10]) {
              inputObs.setAttribute("value", cell[10]);
            }
            container.appendChild(inputObs);

            var inputReB = document.createElement("input");
            inputReB.setAttribute("type", "hidden");
            inputReB.setAttribute("name", "reB");
            if (cell[11]) {
              inputReB.setAttribute("value", cell[11]);
            }
            container.appendChild(inputReB);
          }
          var inputOrigin = document.createElement("input");
          inputOrigin.setAttribute("type", "hidden");
          inputOrigin.setAttribute("name", "origin");
          inputOrigin.setAttribute("value", "recomendacion");
          container.appendChild(inputOrigin);
          event.preventDefault();
          $("#reportForm").submit();
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
         
          
          <% if (!openMode.equalsIgnoreCase("consultarRecomendacionTecnica")) {%> 
          if ($("#tempNo").val() != "" && $("#tempNo").val() != "No hay datos disponibles en la tabla.") {
              $("#recommendationSection").removeClass("hide");
          }
          if($("#isRecomended").val()!=null){
        	  if ($("#isRecomended").val().trim() ==="SI") {
                  $("#PrelacionSection").removeClass("hide");
              }
          }
          <% }%>
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
              /* $("#confirMessage").text(
                "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO VALIDO DE LA TABLA..."
              ); */
            } else {
              var Datar=reqTable.rows('.selected').data()[0];
              reqTable.row('.selected').remove().draw( false );
              //reqTable.row(rowSelected).remove().draw();
             

              //Actualizar CommitRecomendacion
             // $('#newEditReg').modal('hide');
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
		        	    	
		        	    	 Datar[40]=$("#isRecomended").val();
		                     Datar[42]=$("#criteria").val().toUpperCase();
		                     Datar[43]=$("#observations").val().toUpperCase();
		                     Datar[44]=$("#benefRecomendations").val().toUpperCase();
		                     reqTable.row.add(Datar).draw();
		        	    	
		             	 cleanFields()		             	
		             	 
		                 $("#recommendationSection").addClass("hide");
		                 $("#PrelacionSection").addClass("hide");
		                 cleanFields();
		                 $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
		        	}
		           });              
            }
          });
          
          $("#addRegButtonPrelacion").on("click", function (event) {
              event.preventDefault();                          
              
            if($("#prelacion").val()  > 6){
            	alert("El numero de prelacion debe de ser entre 1 y 6")
            	
            }  else{
            	var Datar=reqTable.rows('.selected').data()[0];
                reqTable.row('.selected').remove().draw( false );
                //reqTable.row(rowSelected).remove().draw();
                Datar[41]=$("#prelacion").val();
               
                reqTable.row.add(Datar).draw();
                //Actualizar CommitRecomendacion
                	// $('#newEditRegPrelacion').modal('hide');
  				   var url = getAbsolutePath() + "UpdateOfertaPrelacionRALPAPI";		          
  		           var prelacion = $("#prelacion").val();
  		           var noOferta = ofertaEditar;
                	
  		           $.ajax({
  		        	    url:url,
  		        	    type:"POST",
  		        	    dataType:'json',
  		        	    data: {noOferta:noOferta, prelacion:prelacion},
  		        	    success:function(data){		        	     		        	        
  		             	 cleanFields()		             	
  		             	 
  		                 $("#recommendationSection").addClass("hide");
  		                 $("#PrelacionSection").addClass("hide");
  		                 cleanFields();
  		                 $("#confirMessage").text("EXITOSO! REGISTRO EDITADO CORRECTAMENTE...");
  	 	       	}
  		           });
            	
            }            
              
              
             /*  if ($("#tempNo").val() === "" || $("#tempNo").val() === "No hay datos disponibles en la tabla.") {
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
                $("#recommendationSection").addClass("hide");
                $("#PrelacionSection").addClass("hide");
                $("#prelacion").prop("value", "");
              } */
                            
            });         
          
        });



        $("#submitButton").click(function () {
          var container = document.getElementById("regListForm");
          if (reqTable.data().any()) {
            for (var r = 0, n = reqTable.rows().count(); r < n; r++) {
              var cell = reqTable.row(r).data();
              var inputDF = document.createElement("input");
              inputDF.setAttribute("type", "hidden");
              inputDF.setAttribute("name", "dist");
              inputDF.setAttribute("value", cell[1]);
              container.appendChild(inputDF);

              var inputATC = document.createElement("input");
              inputATC.setAttribute("type", "hidden");
              inputATC.setAttribute("name", "atc");
              inputATC.setAttribute("value", cell[2]);
              container.appendChild(inputATC);

              var inputMR = document.createElement("input");
              inputMR.setAttribute("type", "hidden");
              inputMR.setAttribute("name", "medReq");
              inputMR.setAttribute("value", cell[3]);
              container.appendChild(inputMR);

              var inputMO = document.createElement("input");
              inputMO.setAttribute("type", "hidden");
              inputMO.setAttribute("name", "medOff");
              inputMO.setAttribute("value", cell[4]);
              container.appendChild(inputMO);

              var inputDT = document.createElement("input");
              inputDT.setAttribute("type", "hidden");
              inputDT.setAttribute("name", "desc");
              inputDT.setAttribute("value", cell[5]);
              container.appendChild(inputDT);

              var inputUP = document.createElement("input");
              inputUP.setAttribute("type", "hidden");
              inputUP.setAttribute("name", "up");
              inputUP.setAttribute("value", cell[6]);
              container.appendChild(inputUP);

              var inputPU = document.createElement("input");
              inputPU.setAttribute("type", "hidden");
              inputPU.setAttribute("name", "precio");
              inputPU.setAttribute("value", cell[7]);
              container.appendChild(inputPU);
              
              var inputMD = document.createElement("input");
              inputMD.setAttribute("type", "hidden");
              inputMD.setAttribute("name", "moneda");
              inputMD.setAttribute("value", cell[8]);
              container.appendChild(inputMD);

              var inputRC = document.createElement("input");
              inputRC.setAttribute("type", "hidden");
              inputRC.setAttribute("name", "recCom");
              inputRC.setAttribute("value", cell[9]);
              container.appendChild(inputRC);

              var inputCR = document.createElement("input");
              inputCR.setAttribute("type", "hidden");
              inputCR.setAttribute("name", "criteria");
              inputCR.setAttribute("value", cell[10]);
              container.appendChild(inputCR);

              var inputObs = document.createElement("input");
              inputObs.setAttribute("type", "hidden");
              inputObs.setAttribute("name", "obs");
              inputObs.setAttribute("value", cell[11]);
              container.appendChild(inputObs);

              var inputRB = document.createElement("input");
              inputRB.setAttribute("type", "hidden");
              inputRB.setAttribute("name", "recBen");
              inputRB.setAttribute("value", cell[12]);
              container.appendChild(inputRB);

              var inputPre = document.createElement("input");
              inputPre.setAttribute("type", "hidden");
              inputPre.setAttribute("name", "prelacion");
              inputPre.setAttribute("value", cell[13]);
              container.appendChild(inputPre);
            }
          }
          document.getElementById("regListForm").submit();
        });

        $("#searchTableButton").on("click", function () {
        	debugger
          var searchValue = String($("#medicamentoEstimadoSelect").prop("value"));
          var textOption = $("#medicamentoEstimadoSelect option:selected").text();
          if(textOption.trim()!="SELECCIONA UN MEDICAMENTO..."){
        	  console.log(getAbsolutePath() + "ALPListaOfertasForRecomendationAPI?searchATC=" + searchValue)
        	  reqTable.ajax.url(getAbsolutePath() + "ALPListaOfertasForRecomendationAPI?searchATC=" + searchValue).load();
             
        	  $("#chargedTable").text(textOption);
              $("#medi").val(searchValue); 
          }
        });
      });

      /* $("#addRegButton").on("click", function () {
        $("#confirMessage").text(
          "ERROR! 1ERO DEBES SELECCIONAR UN ELEMENTO DE LA TABLA..."
        );
      }); */

      $("#resetInputsButton").on("click", function () {
        cleanFields();
      });
    </script>

    <!-- Java Script section ends -->
  </body>
</html>
