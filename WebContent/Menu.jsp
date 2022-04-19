<%@ page language="java" contentType="text/html"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>

<?xml version="1.0" encoding="UTF-8" ?>

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




