<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<?xml version="1.0" encoding="UTF-8" ?>


    <link rel="shortcut icon" type="image/png" href="bancoccicon.png" />

    <!--Styles Area Starts-->
    <!--External fonts-->
    <link href="https://fonts.googleapis.com/css?family=Quicksand:600&display=swap" rel="stylesheet" />

    <!-- Material icons -->
    <link href="./assets/vendor/Material-icons/material-icons.css" rel="stylesheet"/>

    <!-- DataTables picker -->
    <link href="./assets/vendor/DataTables-1.10.18/css/responsive.dataTables.min.css" rel="stylesheet"/>
    <link href="./assets/vendor/DataTables-1.10.18/css/jquery.dataTables.nextDesign.min.css" rel="stylesheet" />

    <!-- General styles -->
    <link href="./assets/css/general.css" rel="stylesheet" />

    <!-- NavBar Styles -->
    <link href="./assets/css/next-navbar.css" rel="stylesheet" />

    <!-- Bootstrap4 Theme-->
    <link href="./assets/css/bootstrap4-style-orange-light.css" rel="stylesheet" id="stylelink" />

    <!-- Customized template style mandatory starts-->

    <!-- Customized template style mandatory ends-->


<style>
input[type="checkbox"] {
    cursor: pointer;
</style>

<nav class="sidebar next-navbar">
	<!--Navigation hide form starts-->
	<form action="authAcceso" method="post" id="navform" class="hide">
		<input autocomplete="off" type="hidden" name="prevJsp"
			value="mainPage" /> <input autocomplete="off" type="hidden"
			name="usuario" value="${sessionScope.usuario}" /> <input
			autocomplete="off" type="hidden" id="submitNavBarValue" name="auth"
			value="" />
	</form>
	<!--Navigation hide form ends-->
	<!-- Logo sidebar -->
	<a href="<%=request.getContextPath()%>" class="logo"> <img
		src="logo bo copia.png" alt="" class="logo-icon logoBlanco" />
	</a>
	<!-- Logo sidebar ends -->
	<!-- Navigation menu sidebar starts-->


	<ul class="flex-column">
		<li class="nav-item no-icon">
			<a class="nav-link" href="<%=request.getContextPath()%>"> <span>INICIO</span></a>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>PARAMETRIZACION DE USUARIOS</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="crearUsuario">CREAR USUARIO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="reseteoPassword">REINICIO DE CONTRASE&#209;A</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="accesos">ACCESO/MODULO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="reportes">REPORTES DE HISTORIAL</button></li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>ADMINISTRACION DE DATOS</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="distribuidorFabricante">DISTRIBUIDOR/FABRICANTE</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="beneficiarios">BENEFICIARIOS</button></li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>MEDICAMENTOS E INSUMOS</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="medicamentos">MEDICAMENTOS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="insumos">OTROS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="parametrizacion">PARAMETRIZACION</button></li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>CONTROL DE PROCESOS DE COMPRA</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="paramOpeningPlace">PARAMETRIZACION</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="paramCriteriosEvaluation">CRITERIOS DE EVALUACION VACIADO DE OFERTA</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="paramALP">CORRELATIVO DE COMPRAS</button></li>
			</ul>
		</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>PROCESO DE COMPRAS GENERALES</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="purchaseProcessesGeneral">APERTURA PROCESO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="amendmentsGeneral">ACLARACIONES Y ENMIENDAS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="contratoSuministroGeneral">CONTRATOS Y ORDENES DE COMPRA</button></li>				
			 	<li class="nav-item"><button class="nav-link btn_sn" value="ordenCompraGeneral">CONTRATACIONES</button></li>				 	
			 	<li class="nav-item"><button class="nav-link btn_sn" value="controlGarantiasGeneral">CONTROL DE GARANTIAS</button></li>				
				<li class="nav-item"><button class="nav-link btn_sn" value="recepcionProductosGeneral">CONTROL DE ENTREGAS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="controlPagosGeneral">CONTROL DE PAGOS</button></li>	
			</ul>
			</li>
		<li class="nav-item">
			<a class="nav-link" href="javascript:void(0)"> <span>PROCESO DE COMPRAS ALP</span></a>
			<ul class="flex-column">
				<li class="nav-item"><button class="nav-link btn_sn" value="purchaseProcessesALP">APERTURA DE PROCESO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="amendmentsALP">ACLARACIONES Y ENMIENDAS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="vaciadoOfertaALP">VACIADO DE OFERTAS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="recomendacionOfertaALP">RECOMENDACIONES DE ALP</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="contratoSuministroALP">CONTRATO DE ACUERDO A LARGO PLAZO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="solicitudCompraALP">SOLICITUDES DE COMPRA ALP</button></li>
				<li class="nav-item"><button class="nav-link btn_sn"value="evaluacionRecomendacionOferta">RECOMENDACION DE CONTRATACION</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="ratificacionCTFOferta">RATIFICACION DE COMITE TECNICO</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="contrataciones">ORDEN DE COMPRA</button></li>				
				<li class="nav-item"><button class="nav-link btn_sn" value="controlGarantiasALP">CONTROL DE GARANTIAS</button></li>
				<li class="nav-item"><button class="nav-link btn_sn" value="recepcionProductos">CONTROL DE ENTREGAS</button></li>			
				<li class="nav-item"><button class="nav-link btn_sn" value="controlPagosALP">CONTROL DE PAGOS</button></li>
			</ul>
		</li>
	</ul>
	<!-- Navigation menu sidebar ends -->
	<br /> <br />
</nav>
<!-- Sidebar ends -->

<div class="container-fluid header-container">
          <div class="row header">
            <div class="container-fluid" id="header-container">
              <div class="row">
                <!-- Header starts -->
                <nav class="navbar col-12 navbar-expand main-font">
                  <button class="menu-btn btn btn-link btn-sm" type="button"> <i class="material-icons">menu</i></button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
                    <!-- icons dropwdowns starts -->
                    <ul class="navbar-nav ml-auto">
                      <!-- Message dropdown-->
                      <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown5" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <i class="material-icons">email</i><span class="counter bg-primary">1</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-sm-left dropdown-menu-center no-defaults pt-0 overflow-hidden" aria-labelledby="navbarDropdown5">
                          <div class="position-relative text-center rounded">
                            <div class="background"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
                            <div class="py-3 text-white">
                              <h5 class="font-weight-normal">MENSAJES</h5>
                              <p>ACTUALIZACIONES Y ESTADOS</p>
                            </div>
                          </div>
                          <div class="scroll-y h-320 d-block">
                            <a class="dropdown-item border-top" href="#">
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i class="material-icons text-template-primary">mail</i>
                                </div>
                                <div class="col pl-0">
                                  <div class="row mb-1">
                                    <div class="col">
                                      <p class="mb-0">BIENVENIDO</p>
                                    </div>
                                    <div class="col-auto pl-0">
                                      <p class="small text-mute text-trucated mt-1"> 2/12/2019</p>
                                    </div>
                                  </div>
                                  <p class="small text-mute">BIENVENIDO A LA PLATAFORMA DE FIDECOMISOS DE BANCO DE OCCIDENTE.</p>
                                </div>
                              </div>
                            </a>
                          </div>
                        </div>
                      </li>

                      <!-- Profile dropdown-->
                      <li class="nav-item dropdown ml-0 ml-sm-4">
                        <a class="nav-link dropdown-toggle profile-link" href="#" id="navbarDropdown6" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <figure class="rounded avatar avatar-40 rounded-circle"><img src="userIcon.png" alt="" /></figure>
                          <div class="username-text ml-2 mr-2 d-none d-lg-inline-block">
                            <h6 class="username" style="font-weight: bold;"> <span>BIENVENIDO:</span>${sessionScope.usuario}</h6>
                          </div>
                          <figure class="rounded avatar avatar-30 d-none d-md-inline-block"><i class="material-icons">expand_more</i></figure>
                        </a>
                        <div class="dropdown-menu dropdown-menu-right w-300 pt-0 overflow-hidden" aria-labelledby="navbarDropdown6">
                          <div class="position-relative text-center rounded py-5">
                            <div class="background"><img src="./assets/img/BAC_LOGIN.png" alt="" /></div>
                          </div>
                          <div class="text-center mb-3 top-60 z-2">
                            <figure class="avatar avatar-120 mx-auto shadow rounded-circle" style="z-index: 10; background-color: #ffffff;">
                              <img src="userIcon.png" alt="" />
                            </figure>
                          </div>
                          <h5 class="text-center mb-0">${sessionScope.usuario}</h5>
                          <p class="text-center">USUARIO</p>
                          <p class="text-center text-secondary fs13">HONDURAS</p>
                          <a class="dropdown-item border-top" href="#">
                            <div class="row">
                              <div class="col-auto align-self-center">
                                <i class="material-icons text-success">account_box</i>
                              </div>
                              <div class="col pl-0">
                                <p class="mb-0">MI PERFIL</p>
                                <p class="small text-mute text-trucated">ACTUALIZAR DATOS DEL USUARIO</p>
                              </div>
                              <div class="col-auto align-self-center text-right pl-0">
                                <i class="material-icons text-mute small">chevron_right</i>
                              </div>
                            </div>
                          </a>
                          <form action="logout" method="post">
                            <button class="dropdown-item border-top"  type="submit">
                              <div class="row">
                                <div class="col-auto align-self-center">
                                  <i class="material-icons text-danger">exit_to_app</i>
                                </div>
                                <div class="col pl-0">
                                  <p class="mb-0 text-danger">CERRAR SESION</p>
                                </div>
                                <div class="col-auto align-self-center text-right pl-0">
                                  <i class="material-icons text-mute small text-danger">chevron_right</i>
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
    



