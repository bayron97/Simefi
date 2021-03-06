<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<html>
<head>
<meta/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
tr{
	font-family: 'Arial'; 
	font-size: 11px; 
	height: 40px;
	text-align: center;
	color: black;
}
tr:nth-child(even){
	background-color: #F8D7CD;
}
tr:nth-child(odd){
	background-color: #FCECE8;
}
.overlayBtn{
	background-color: #51AA91; 
	color: white; 
	border-radius: 8px; 
	border: none; 
	padding: 8px 25px;
	text-align: center;
	font-family: 'Arial';
	font-size: 12px;
	box-shadow: 2px 5px 5px #232b2b;
}
.cuBtn{
	background-color: #51AA91; 
	color: white; 
	border-radius: 8px; 
	border: none;
	
	max-height: 15px; 
	max-width: 55px;
	
	padding: 15px 55px;
	text-align: center;
	font-family: 'Arial';
	font-size:9px;
	margin-bottom: 15px;
	margin-top: 10px;
	box-shadow: 5px 5px 5px #888888;
	line-height: 6px;
}
/* Fixed sidenav, full height */
.sidenav {
  height: 100%;
  width: 280px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #32404F;
  overflow-x: hidden;
  padding-top: 20px;
}
/* Style the sidenav links and the dropdown button */
.sidenav a, .dropdown-btn {
  font-family: 'Arial';
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 14px;
  color: white;
  display: block;
  border: none;
  background: none;
  width: 100%;
  text-align: left;
  cursor: pointer;
  outline: none;
  padding-bottom: 20px;
}
/* On mouse-over */
.sidenav a:hover, .dropdown-btn:hover {
  color: #f1f1f1;
}
/* Main content */
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
  font-size: 20px; /* Increased text to enable scrolling */
  padding: 0px 25px;
  background-color: #f2f2f2
}
/* Add an active class to the active dropdown button */
.active {
  background-color: #2B3746;
  color: white;
}
.row{
	display: flex;
}
.column{
	flex: 50%;
}
#overlay{
	position: absolute;
	width: 700px;
	height: 380px;
	left: 20%;
	background-color: #32404F;
	line-height: 6px;
	z-index: 2;
}
/* Dropdown container (hidden by default). Optional: add a lighter background color and some left padding to change the design of the dropdown content */
.dropdown-container {
  display: none;
  background-color: #2B3746;
  padding-left: 2px;
  border-left: 5px solid #51AA91;
  font-family: 'Arial';
}
/* Optional: Style the caret down icon */
.fa-caret-down {
  float: right;
  padding-right: 8px;
}
label textarea{
 vertical-align: middle;
}
/* Some media queries for responsiveness */
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
.card{
	background:#C5E0B4;
	height: 40px;
	border-radius: 1em 0em 1em 0em;
	font-family: 'Arial';
	font-size: 14px;
	width: 220px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	border-spacing: 5px;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    /* display: none; <- Crashes Chrome on hover */
    -webkit-appearance: none;
    margin: 0; /* <-- Apparently some margin are still there even though it's hidden */
}

input[type=number] {
    -moz-appearance:textfield; /* Firefox */
}

.cardU{
	background:#A9D18E;
	height: 40px;
	border-radius: 1em 0em 1em 0em;
	font-family: 'Arial';
	font-size: 14px;
	width: 220px;
	text-align: center;
	display: table-cell;
	vertical-align: middle;
	border-spacing: 5px;
}

.altBtn{
	background-color: #51AA91; 
	color: white; 
	border-radius: 8px; 
	border: none;
	height: 20px;
	text-align: center;
	font-family: 'Arial';
	font-size:10px;
	margin-left: 15px;
}
</style>

<script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"> 
    </script>

</head>
<body style="background-color: #f2f2f2">

<div class="sidenav">
  <img  src="bologo.fw.png" style="height: auto; width: 90%; padding-bottom: 40px; padding-top: 20px; padding-left: 10px;"/>
  <a href="mainP.html">INICIO</a>
  <button class="dropdown-btn">PARAMETRIZACI??N DE USUARIOS
  	<i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="crearUsuario.jsp">CREAR USUARIO</a>
    <a href="reseteoPassword.jsp">RESETEO DE CONTRASE??A</a>
    <a href="accesos.jsp">ACCESO/M??DULO</a>
    
    <a href="reportes.jsp">REPORTES DE HISTORIAL</a>
  </div>
  <button class="dropdown-btn active">ADMINISTRACI??N DE DATOS
  	<i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container" style="display: block;">
    <a href="distribuidorFabricante.jsp">DISTRIBUIDOR/FABRICANTE</a>
    <a href="beneficiarios.jsp">BENEFICIARIOS</a>
  </div>
  <button class="dropdown-btn">MEDICAMENTOS Y OTROS
  	<i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="medicamentos.jsp">MEDICAMENTOS</a>
    <a href="insumos.jsp">OTROS</a>
    <a href="parametrizacion.jsp">PARAMETRIZACI??N</a>
  </div>
  <button class="dropdown-btn">PROCESOS DE COMPRA 
    <i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
  </div>
  <button class="dropdown-btn">GARANT??AS
  	<i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
  </div>
  <button class="dropdown-btn">REPORTES
  	<i class="fa fa-caret-down"></i>
  </button>
  <div class="dropdown-container">
    <a href="#">Link 1</a>
  </div>
</div>

<div class="main" style="background-color: #f2f2f2; position: relative;">
	<form autocomplete="off" action="beneficirioServlet" method="post">
		<div style="height: 100px;">
			<img src="userIcon.png" align="right" style="top: 0; max-width: 80px; height: auto;"></img>
		</div>

		<div style="background: #ffffff; padding-left: 70px; margin-top: 0px; width: 96.8%; left:0;  height: 60px; position: relative;">
			<h2 style="margin-top: 0px; margin-bottom: 0px; font-family: 'Arial'; color: #F08C3F">DISTRIBUIDOR/FABRICANTE</h1>
			<p style="font-family: 'Arial'; font-size: 18px; margin-top: 0px">ADMINISTRACI??N DE DATOS/DISTRIBUIDOR/FABRICANTE</p>
		</div>
		<div align="right">		
			<button type="button" id="consultarBtn" class="cuBtn" style="position: relative;" onclick="window.location.href='distribuidorFabricante.jsp';">
				<span style="margin-top: 0px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">CANCELAR</span>
			</button>
			<button type="button" id="consultarBtn" onclick="guardarBorrador()"class="cuBtn" style="position: relative;">
				<span style="margin-top: 0px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">GUARDAR<br></br>BORRADOR</span>
			</button>
			<button id="revisar" class="cuBtn" name="submit" value="contact"  style="position: relative;">	
				<span style="margin-top: 0px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%);">GUARDAR Y<br></br>ENVIAR</span>
			</button>
		</div>
		
		<div style="margin-left: 70px; position: absolute; width: 1200px; height: 450px;">
			<div style="display: table; border-spacing: 3px;">
				<p class="cardU" style="border-spacing: 5px;" onclick="window.location.href='nDFDistribuidor.jsp';" id="tag">DISTRIBUIDOR</p>
				<p class="card" style="border-spacing: 5px;">FABRICANTE</p>
				<p class="cardU" style="border-spacing: 5px;">DIGITALIZACI??N</p>
			</div>
			<div id="overlay" style="display: none;" >
					<p style="color: white; font-family: 'Arial'; margin-left: 30px; font-size: 14px;">NUEVO CONTACTO</p>
					<div style="padding-bottom: 5px;">
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							NOMBRE
							<input autocomplete="nope" id="overlayNombre" name="overlayNombre" style="margin-left: 55px; width: 535px; height: 20px;" type="text" enabled/>
						</label>
					</div>
					<div style="padding-bottom: 5px;">
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							CARGO
							<input autocomplete="nope" id = "overlayCargo" name = "overlayCargo" style="margin-left: 63px; width: 535px; height: 20px;" type="text" enabled/>
						</label>
					</div>
					<div style="padding-bottom: 5px;">
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							DEPARATAMENTO
							<input autocomplete="nope" id = "overlayDepartamento" name = "overlayDepartamento" style="margin-left: 5px; width: 535px; height: 20px;" type="text" enabled/>
						</label>
					</div>
					<div style="padding-bottom: 5px;">
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							TELEFONO MOVIL
							<input autocomplete="nope" id = "overlayTelefono" name = "overlayTelefono" style="margin-left: 5px; width: 180px; height: 20px;" type="number" enabled/>
						</label>
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							CORREO ELECTRONICO
							<input autocomplete="nope" id = "correo" name = "correo" style="margin-left: 5px; width: 180px; height: 20px;" type="text" enabled/>
						</label>
					</div>
					<div style="padding-bottom: 5px;"> 
					<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
						TELEFONO FIJO
						<input autocomplete="nope" id ="telefonoFijo" name ="telefonoFijo" style="margin-left: 14px; width: 180px; height: 20px;" type="number" enabled/>
					</label>
					<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
						EXTENSION
						<input autocomplete="nope" id = "extension" name = "extension" style="margin-left: 83px; width: 180px; height: 20px;" type="number" enabled/>
					</label>
					</div>
					<div style="margin-top: 20px; margin-left: 60px;">
						<label style="font-family: 'Arial'; font-size: 12px; color: white;">
							<input autocomplete="nope" id = "activo" name = "activo" type="checkbox" enabled/>
							ACTIVO
						</label>
						<label style="margin-left: 80px; font-family: 'Arial'; font-size: 12px; color: white;">
							<input autocomplete="nope" id ="inactivo" name ="inactivo" type="checkbox" enabled/>
							INACTIVO
						</label>
					</div>
					<div style="padding-bottom: 20px; margin-top: 20px; ">
						<label style="font-family: 'Arial'; font-size: 12px; color: white; margin-left: 20px;">
							OBSERVACI??N
							<textarea id = "obs" name ="obs" cols="5" style="width:320px"></textarea>
						</label>
					</div>

					<div style="padding-left: 380px; margin-top: 20px">
						<button type="button" id="cancelOverlay" onclick="noneOverlay()" class="overlayBtn" style="margin-right: 20px;">
							CANCELAR
						</button>
						<button type="button" onclick="addRow()" value="contactos" class="overlayBtn">
							GUARDAR
						</button>
					</div>
				</div>
			<div style="background:#C5E0B4; height: 450px; margin-top:1px; margin-left: 3px;">

				<label style="margin-top: 0px; padding-top: 10px; padding-left: 20px;font-family: 'Arial'; font-weight: 550; font-size: 14px;">I. DATOS GENERALES</label>
				<div>
					<label style="margin-left: 25px; font-family: 'Arial'; font-size: 12px;">
						DENOMINACI??N O RAZ??N SOCIAL
						<input autocomplete="nope" name="denominacion" id ="denominacion" style="margin-left: 28px; width: 180px;"></input>
					</label>
					<label style="font-family: 'Arial'; margin-top: 10px; font-size: 12px; margin-left: 150px;">
						PAIS
						<input autocomplete="nope" style="margin-left: 70px; width: 180px;" id = "pais" name = "pais"></input>
					</label>
					<div style="margin-top: 5px; margin-bottom: 5px;">
						<label style="margin-left: 25px; font-family: 'Arial'; font-size: 12px;">
							DIRECCI??N Y/O UBICACI??N
							<input autocomplete="nope" style="margin-left: 64px; width: 180px; " id = "direccion" name = "direccion"></input>
						</label>
					</div>
				</div>
			<p style="margin-top: 0px; padding-top: 30px; padding-left: 20px;font-family: 'Arial'; font-weight: 550; font-size: 14px;">
					II. CONTACTOS
					<button type="button" class="altBtn" onclick="activeOverlay()">NUEVO CONTACTO</button>
				</p>				
			<table id="table" style="width: 100%; padding-left: 0px;">
			<thead>
			<tr style="background-color: #ED7D31; color: white; font-size: 12px;">
				<td style="width: 2%; line-height: 6px;">#</td>
				<td style="width: 15%; line-height: 6px;">NOMBRE</td>
				<td style="width: 10%; line-height: 12px;">CARGO</td>
				<td style="width: 10%; line-height: 6px;">DEPARTAMENTO</td>
				<td style="width: 10%;">TEL??FONO M??VIL</td>
				<td style="width: 10%; line-height: 6px;">TEL??FONO FIJO</td>
				<td style="width: 5%;">EXTENSI??N</td>
				<td style="width: 15%; line-height: 6px;">CORREO ELECTR??NICO</td>
				<td style="width: 10%;">ESTADO</td>
				<td style="width: 10%; line-height: 6px;">OBSERVACI??N</td>
			</tr>
			</thead>
			<tbody>
			<tr style="width: 100%;">
				<td style="width: 100%;" colspan="10">
					<div style="overflow:scroll; height: 200px; width: 100%; font-size:12px;" >
					<table id="tableT" style="width: 100%;">
						<tr>
							<td style="width: 2%"> </td>
							<td style="width: 15%"> </td>
							<td style="width: 10%"> </td>
							<td style="width: 10%"> </td>
							<td style="width: 10%"> </td>
							<td style="width: 10%"> </td>
							<td style="width: 6%"> </td>
							<td style="width: 15%"> </td>
							<td style="width: 10%"> </td>
							<td style="width: 8.5%"> </td>
						</tr>
					</table>
					</div>
				</td>
			</tr>
			</tbody>
		</table>
		<div style="margin-top: 10px; margin-bottom: 2px;">
			<button type="button" class="altBtn" style="height: 30px;">ACCIONISTAS/SOCIOS/JUNTA DIRECTIVA</button>
			<button type="button" class="altBtn" style="height: 30px; width: 217.6px;">REPRESENTANTE LEGAL</button>
		</div>
		</div>
	</form>
</div>



<script>
/* Loop through all dropdown buttons to toggle between hiding and showing its dropdown content - This allows the user to have multiple dropdowns without any conflict */
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;
for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
  	this.classList.toggle("active");
  	var dropdownContent = this.nextElementSibling;
  	if (dropdownContent.style.display === "block") {
  		dropdownContent.style.display = "none";
  	} else {
  		dropdownContent.style.display = "block";
  	}
  });
}
</script>

 <script>
	$(document).ready(function(){
    	document.getElementById("denominacion").value = localStorage.getItem("item1");
    	document.getElementById("pais").value = localStorage.getItem("item2");
    	document.getElementById("direccion").value = localStorage.getItem("item3");
	});
</script>
<script>
	$(window).on('beforeunload', function() {
    	localStorage.setItem("item1",document.getElementById("denominacion").value);
    	localStorage.setItem("item2",document.getElementById("pais").value);
    	localStorage.setItem("item3",document.getElementById("direccion").value);
	});
</script>


<script>
function noneOverlay(){
	var x = document.getElementById("overlay")
		if(x.style.display === "inline")
			x.style.display="none";
	   document.getElementById("overlayNombre").value = "";
	   
	   document.getElementById("overlayCargo").value = "";
	   
	   document.getElementById("correo").value = "";
	   
	   document.getElementById("overlayDepartamento").value = "";
	   
	   document.getElementById("overlayTelefono").value = "";
	   
	   document.getElementById("telefonoFijo").value = "";
	   
	   document.getElementById("extension").value = "";
	   
	   document.getElementById("obs").value = "";
	   
	   document.getElementById("activo").checked = false;
	   
	   document.getElementById("inactivo").checked = false;

}
</script>

<script>
function addRow(){
	
	var table = document.getElementById("tableT");
	  var rowCount = table.rows.length;
	  var row = table.insertRow(rowCount - 1);
	  var td1 = row.insertCell(0);
	  var td2 = row.insertCell(1);
	  var td3 = row.insertCell(2);
	  var td4 = row.insertCell(3);
	  var td5 = row.insertCell(4);
	  var td6 = row.insertCell(5);
	  var td7 = row.insertCell(6);
	  var td8 = row.insertCell(7);
	  var td9 = row.insertCell(8);
	  var td10 = row.insertCell(9);
	
	var c = 0;
	
	for(var i = 0; i < rowCount; i++){
		c++;
		
	}
	
	td1.innerHTML = c;
	td2.innerHTML = document.getElementById("overlayNombre").value;
	td3.innerHTML = document.getElementById("overlayCargo").value;
	td4.innerHTML = document.getElementById("overlayDepartamento").value;
	td5.innerHTML = document.getElementById("overlayTelefono").value;
	td6.innerHTML = document.getElementById("telefonoFijo").value;
	td7.innerHTML = document.getElementById("extension").value;
	td8.innerHTML = document.getElementById("correo").value;
	td9.innerHTML = "ACTIVO";
	td10.innerHTML = document.getElementById("obs").value;
	
    
	var inputN = document.createElement("input");
	inputN.setAttribute("type", "hidden");
	inputN.setAttribute("name", "nombreCont");
	inputN.setAttribute("value", document.getElementById("overlayNombre").value);
	document.getElementById("f").appendChild(inputN);
	
	var inputC = document.createElement("input");
	inputC.setAttribute("type", "hidden");
	inputC.setAttribute("name", "cargoCont");
	inputC.setAttribute("value", document.getElementById("overlayCargo").value);
	document.getElementById("f").appendChild(inputC);
	
	var inputD = document.createElement("input");
	inputD.setAttribute("type", "hidden");
	inputD.setAttribute("name", "departamentoCont");
	inputD.setAttribute("value", document.getElementById("overlayDepartamento").value);
	document.getElementById("f").appendChild(inputD);
	
	var inputT = document.createElement("input");
	inputT.setAttribute("type", "hidden");
	inputT.setAttribute("name", "telefonoCont");
	inputT.setAttribute("value", document.getElementById("overlayTelefono").value);
	document.getElementById("f").appendChild(inputT);
	
	var inputTF = document.createElement("input");
	inputTF.setAttribute("type", "hidden");
	inputTF.setAttribute("name", "telefonoFijoCont");
	inputTF.setAttribute("value", document.getElementById("telefonoFijo").value);
	document.getElementById("f").appendChild(inputTF);
	
	var inputE = document.createElement("input");
	inputE.setAttribute("type", "hidden");
	inputE.setAttribute("name", "extensionCont");
	inputE.setAttribute("value", document.getElementById("extension").value);
	document.getElementById("f").appendChild(inputE);
	
	var inputEmail = document.createElement("input");
	inputEmail.setAttribute("type", "hidden");
	inputEmail.setAttribute("name", "correoCont");
	inputEmail.setAttribute("value", document.getElementById("correo").value);
	document.getElementById("f").appendChild(inputEmail);
	
	var inputS = document.createElement("input");
	inputS.setAttribute("type", "hidden");
	inputS.setAttribute("name", "estadoCont");
	inputS.setAttribute("value", "activo");
	document.getElementById("f").appendChild(inputS);
	
	var inputO = document.createElement("input");
	inputO.setAttribute("type", "hidden");
	inputO.setAttribute("name", "obsCont");
	inputO.setAttribute("value", document.getElementById("obs").value);
	document.getElementById("f").appendChild(inputO);
	
}
</script>

<script>
function activeOverlay(){
	var x = document.getElementById("overlay")
	if(x.style.display === "none")
		x.style.display="inline";
	
}
</script>

