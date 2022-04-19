'use strict'
$(document).ready(function() {
	var disabledJstree = $('#disabledJstree').prop('value');
	
	var per = $('#crearUsuario').prop('value');
	var sel_1_1_1;
	var sel_1_1_2;
	var sel_1_1_3;
	per.includes("administrar") ? sel_1_1_1 = true : sel_1_1_1 = false;
	per.includes("digitar") ? sel_1_1_2 = true : sel_1_1_2 = false;
	per.includes("consultar") ? sel_1_1_3 = true : sel_1_1_3 = false;
	
	per = $('#reseteoPass').prop('value');
	var sel_1_2_1;
	var sel_1_2_2;
	var sel_1_2_3;
	per.includes("administrar") ? sel_1_2_1 = true : sel_1_2_1 = false;
	per.includes("digitar") ? sel_1_2_2 = true : sel_1_2_2 = false;
	per.includes("consultar") ? sel_1_2_3 = true : sel_1_2_3 = false;
	
	per = $('#accMod').prop('value');
	var sel_1_3_1;
	var sel_1_3_2;
	var sel_1_3_3;
	per.includes("administrar") ? sel_1_3_1 = true : sel_1_3_1 = false;
	per.includes("digitar") ? sel_1_3_2 = true : sel_1_3_2 = false;
	per.includes("consultar") ? sel_1_3_3 = true : sel_1_3_3 = false;
	
	per = $('#reportH').prop('value');
	var sel_1_4_1;
	per.includes("consultar") ? sel_1_4_1 = true : sel_1_4_1 = false;
	
	per = $('#distFab').prop('value');
	var sel_2_1_1;
	var sel_2_1_2;
	var sel_2_1_3;
	per.includes("administrar") ? sel_2_1_1 = true : sel_2_1_1 = false;
	per.includes("digitar") ? sel_2_1_2 = true : sel_2_1_2 = false;
	per.includes("consultar") ? sel_2_1_3 = true : sel_2_1_3 = false;
	
	per = $('#benef').prop('value');
	var sel_2_2_1;
	var sel_2_2_2;
	var sel_2_2_3;
	per.includes("administrar") ? sel_2_2_1 = true : sel_2_2_1 = false;
	per.includes("digitar") ? sel_2_2_2 = true : sel_2_2_2 = false;
	per.includes("consultar") ? sel_2_2_3 = true : sel_2_2_3 = false;
	
	per = $('#med').prop('value');
	var sel_3_1_1 = false;
	var sel_3_1_2 = false;
	var sel_3_1_3 = false;
	var sel_3_1_4 = false;
	per.includes("administrar") ? sel_3_1_1 = true : sel_3_1_1 = false;
	per.includes("digitar") ? sel_3_1_2 = true : sel_3_1_2 = false;
	per.includes("consultar") ? sel_3_1_3 = true : sel_3_1_3 = false;
	per.includes("verificar") ? sel_3_1_4 = true : sel_3_1_4 = false;
	
	per = $('#otros').prop('value');
	var sel_3_2_1;
	var sel_3_2_2;
	var sel_3_2_3;
	var sel_3_2_4;
	per.includes("administrar") ? sel_3_2_1 = true : sel_3_2_1 = false;
	per.includes("digitar") ? sel_3_2_2 = true : sel_3_2_2 = false;
	per.includes("consultar") ? sel_3_2_3 = true : sel_3_2_3 = false;
	per.includes("verificar") ? sel_3_2_4 = true : sel_3_2_4 = false;
	
	per = $('#param').prop('value');
	var sel_3_3_1;
	var sel_3_3_2;
	var sel_3_3_3;
	var sel_3_3_4;
	per.includes("administrar") ? sel_3_3_1 = true : sel_3_3_1 = false;
	per.includes("digitar") ? sel_3_3_2 = true : sel_3_3_2 = false;
	per.includes("consultar") ? sel_3_3_3 = true : sel_3_3_3 = false;
	per.includes("verificar") ? sel_3_3_4 = true : sel_3_3_4 = false;

	per = $('#cpcparam').prop('value');
	var sel_4_1_1;
	var sel_4_1_2;
	var sel_4_1_3;
	var sel_4_1_4;
	per.includes("administrar") ? sel_4_1_1 = true : sel_4_1_1 = false;
	per.includes("digitar") ? sel_4_1_2 = true : sel_4_1_2 = false;
	per.includes("consultar") ? sel_4_1_3 = true : sel_4_1_3 = false;
	per.includes("verificar") ? sel_4_1_4 = true : sel_4_1_4 = false;

	per = $('#criteva').prop('value');
	var sel_4_2_1;
	var sel_4_2_2;
	var sel_4_2_3;
	per.includes("administrar") ? sel_4_2_1 = true : sel_4_2_1 = false;
	per.includes("digitar") ? sel_4_2_2 = true : sel_4_2_2 = false;
	per.includes("consultar") ? sel_4_2_3 = true : sel_4_2_3 = false;

	per = $('#corrcomp').prop('value');
	var sel_4_3_1;
	var sel_4_3_2;
	var sel_4_3_3;
	per.includes("administrar") ? sel_4_3_1 = true : sel_4_3_1 = false;
	per.includes("digitar") ? sel_4_3_2 = true : sel_4_3_2 = false;
	per.includes("consultar") ? sel_4_3_3 = true : sel_4_3_3 = false;

	per = $('#aperturaProcesoG').prop('value');
	var sel_5_1_1;
	var sel_5_1_2;
	var sel_5_1_3;
	var sel_5_1_4;
	per.includes("administrar") ? sel_5_1_1 = true : sel_5_1_1 = false;
	per.includes("digitar") ? sel_5_1_2 = true : sel_5_1_2 = false;
	per.includes("consultar") ? sel_5_1_3 = true : sel_5_1_3 = false;
	per.includes("verificar") ? sel_5_1_4 = true : sel_5_1_4 = false;

	per = $('#aclaEnmiendasG').prop('value');
	var sel_5_2_1;
	var sel_5_2_2;
	var sel_5_2_3;
	per.includes("administrar") ? sel_5_2_1 = true : sel_5_2_1 = false;
	per.includes("digitar") ? sel_5_2_2 = true : sel_5_2_2 = false;
	per.includes("consultar") ? sel_5_2_3 = true : sel_5_2_3 = false;

	per = $('#vaciadoOfertaG').prop('value');
	var sel_5_3_1;
	var sel_5_3_2;
	var sel_5_3_3;
	per.includes("administrar") ? sel_5_3_1 = true : sel_5_3_1 = false;
	per.includes("digitar") ? sel_5_3_2 = true : sel_5_3_2 = false;
	per.includes("consultar") ? sel_5_3_3 = true : sel_5_3_3 = false;

	per = $('#recomendacionesG').prop('value');
	var sel_5_4_1;
	var sel_5_4_2;
	var sel_5_4_3;
	per.includes("administrar") ? sel_5_4_1 = true : sel_5_4_1 = false;
	per.includes("digitar") ? sel_5_4_2 = true : sel_5_4_2 = false;
	per.includes("consultar") ? sel_5_4_3 = true : sel_5_4_3 = false;

	per = $('#ratificacionesG').prop('value');
	var sel_5_5_1;
	var sel_5_5_2;
	var sel_5_5_3;
	per.includes("administrar") ? sel_5_5_1 = true : sel_5_5_1 = false;
	per.includes("digitar") ? sel_5_5_2 = true : sel_5_5_2 = false;
	per.includes("consultar") ? sel_5_5_3 = true : sel_5_5_3 = false;

	per = $('#aperturaProcesoALP').prop('value');
	var sel_6_1_1;
	var sel_6_1_2;
	var sel_6_1_3;
	var sel_6_1_4;
	per.includes("administrar") ? sel_6_1_1 = true : sel_6_1_1 = false;
	per.includes("digitar") ? sel_6_1_2 = true : sel_6_1_2 = false;
	per.includes("consultar") ? sel_6_1_3 = true : sel_6_1_3 = false;
	per.includes("verificar") ? sel_6_1_4 = true : sel_6_1_4 = false;

	per = $('#aclaEnmiendasAlp').prop('value');
	var sel_6_2_1;
	var sel_6_2_2;
	var sel_6_2_3;
	per.includes("administrar") ? sel_6_2_1 = true : sel_6_2_1 = false;
	per.includes("digitar") ? sel_6_2_2 = true : sel_6_2_2 = false;
	per.includes("consultar") ? sel_6_2_3 = true : sel_6_2_3 = false;

	per = $('#vaciadoOfertAlp').prop('value');
	var sel_6_3_1;
	var sel_6_3_2;
	var sel_6_3_3;
	var sel_6_3_4;
	per.includes("administrar") ? sel_6_3_1 = true : sel_6_3_1 = false;
	per.includes("digitar") ? sel_6_3_2 = true : sel_6_3_2 = false;
	per.includes("consultar") ? sel_6_3_3 = true : sel_6_3_3 = false;
	per.includes("vaciadoActaApertura") ? sel_6_3_4 = true : sel_6_3_4 = false;

	per = $('#recomendacionesALP').prop('value');
	var sel_6_4_1;
	var sel_6_4_2;
	var sel_6_4_3;
	per.includes("administrar") ? sel_6_4_1 = true : sel_6_4_1 = false;
	per.includes("digitar") ? sel_6_4_2 = true : sel_6_4_2 = false;
	per.includes("consultar") ? sel_6_4_3 = true : sel_6_4_3 = false;

	per = $('#solicitudCompraALP').prop('value');
	var sel_6_5_1;
	var sel_6_5_2;
	var sel_6_5_3;
	per.includes("administrar") ? sel_6_5_1 = true : sel_6_5_1 = false;
	per.includes("digitar") ? sel_6_5_2 = true : sel_6_5_2 = false;
	per.includes("consultar") ? sel_6_5_3 = true : sel_6_5_3 = false;

	per = $('#recomendacionCompraALP').prop('value');
	var sel_6_6_1;
	var sel_6_6_2;
	var sel_6_6_3;
	per.includes("administrar") ? sel_6_6_1 = true : sel_6_6_1 = false;
	per.includes("digitar") ? sel_6_6_2 = true : sel_6_6_2 = false;
	per.includes("consultar") ? sel_6_6_3 = true : sel_6_6_3 = false;

	per = $('#ratificacionCtfALP').prop('value');
	var sel_6_7_1;
	var sel_6_7_2;
	var sel_6_7_3;
	per.includes("administrar") ? sel_6_7_1 = true : sel_6_7_1 = false;
	per.includes("digitar") ? sel_6_7_2 = true : sel_6_7_2 = false;
	per.includes("consultar") ? sel_6_7_3 = true : sel_6_7_3 = false;

	per = $('#contratacionesALP').prop('value');
	var sel_6_8_1;
	var sel_6_8_2;
	var sel_6_8_3;
	per.includes("administrar") ? sel_6_8_1 = true : sel_6_8_1 = false;
	per.includes("digitar") ? sel_6_8_2 = true : sel_6_8_2 = false;
	per.includes("consultar") ? sel_6_8_3 = true : sel_6_8_3 = false;

	per = $('#contratosSuministrosALP').prop('value');
	var sel_6_9_1;
	var sel_6_9_2;
	var sel_6_9_3;
	per.includes("administrar") ? sel_6_9_1 = true : sel_6_9_1 = false;
	per.includes("digitar") ? sel_6_9_2 = true : sel_6_9_2 = false;
	per.includes("consultar") ? sel_6_9_3 = true : sel_6_9_3 = false;

	per = $('#controlGarantiasALP').prop('value');
	var sel_6_10_1;
	var sel_6_10_2;
	var sel_6_10_3;
	per.includes("administrar") ? sel_6_10_1 = true : sel_6_10_1 = false;
	per.includes("digitar") ? sel_6_10_2 = true : sel_6_10_2 = false;
	per.includes("consultar") ? sel_6_10_3 = true : sel_6_10_3 = false;

	per = $('#controlPagosALP').prop('value');
	var sel_6_11_1;
	var sel_6_11_2;
	var sel_6_11_3;
	per.includes("administrar") ? sel_6_11_1 = true : sel_6_11_1 = false;
	per.includes("digitar") ? sel_6_11_2 = true : sel_6_11_2 = false;
	per.includes("consultar") ? sel_6_11_3 = true : sel_6_11_3 = false;

	per = $('#recepcionProduALP').prop('value');
	var sel_6_12_1;
	var sel_6_12_2;
	var sel_6_12_3;
	per.includes("administrar") ? sel_6_12_1 = true : sel_6_12_1 = false;
	per.includes("digitar") ? sel_6_12_2 = true : sel_6_12_2 = false;
	per.includes("consultar") ? sel_6_12_3 = true : sel_6_12_3 = false;



	$('#jstree_div').jstree({
		 core: {
			multiple: true,
			themes: {
				'icons': false,
				'responsive': false,
				'stripes': true
			  },
			 data : [
				{
					"text" : "1. PARAMETRIZACION DE USUARIOS",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_paramu",
					"children" : [
						{
							"text" : "1. CREAR USUARIOS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_cu",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "paramUsersCreate_Admin",
									  "value": "administrar",
									  "state" : { "selected" :  sel_1_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "paramUsersCreate_Digit",
										"value": "digitar",
										"state" : { "selected" :  sel_1_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "paramUsersCreate_Consul",
										"value": "consultar",
										"state" : { "selected" :  sel_1_1_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "2. RESETEO DE CONTRASE\u00d1A",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_rs",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "paramUsersResetPass_Admin",
									  "state" : { "selected" : sel_1_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "paramUsersResetPass_Digit",
										"state" : { "selected" : sel_1_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "paramUsersResetPass_Consul",
										"state" : { "selected" : sel_1_2_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "3. ACCESO MODULO",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_am",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "paramUsersAccMod_Admin",
									  "state" : { "selected" : sel_1_3_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "paramUsersAccMod_Digit",
										"state" : { "selected" : sel_1_3_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "paramUsersAccMod_Consul",
										"state" : { "selected" : sel_1_3_3, "disabled" : disabledJstree }
									  }
							]
						},
						{
							"text" : "4. REPORTES DE HISTORIAL",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_rh",
							"children" : [
									{
									  "text" : "1. CONSULTAR (VER DATOS)",
									  "id": "paramUsersReport_Consul",
									  "state" : { "selected" : sel_1_4_1, "disabled" : disabledJstree }
									},
							]
						},
					]
				},
				{
					"text" : "2. ADMINISTRACION DE DATOS",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_manageAdminData",
					"children" : [
						{
							"text" : "1. DISTRIBUIDOR/FABRICANTE",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_df",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "dataManageDistFab_Admin",
									  "state" : { "selected" : sel_2_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "dataManageDistFab_Digit",
										"state" : { "selected" : sel_2_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "dataManageDistFab_Consul",
										"state" : { "selected" : sel_2_1_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "2. BENEFICIARIOS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_ben",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "dataManageBenf_Admin",
									  "state" : { "selected" : sel_2_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "dataManageBenf_Digit",
										"state" : { "selected" : sel_2_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "dataManageBenf_Consul",
										"state" : { "selected" : sel_2_2_3, "disabled" : disabledJstree }
									  },
							]
						},
					]
				},
				{
					"text" : "3. MEDICAMENTOS Y OTROS",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_medInsum",
					"children" : [
						{
							"text" : "1. MEDICAMENTOS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_med",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "medManage_Admin",
									  "state" : { "selected" : sel_3_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "medManage_Digit",
										"state" : { "selected" : sel_3_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "medManage_Consul",
										"state" : { "selected" : sel_3_1_3, "disabled" : disabledJstree }
									  },
									  {
									  "text" : "4. VERIFICAR (REVISAR Y APROBAR)",
									  "id": "medManage_Verif",
									  "state" : { "selected" : sel_3_1_4, "disabled" : disabledJstree }
									},
							]
						},
						{
							"text" : "2. OTROS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_otros",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "medInsumos_Admin",
									  "state" : { "selected" : sel_3_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "medInsumos_Digit",
										"state" : { "selected" : sel_3_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "medInsumos_Consul",
										"state" : { "selected" : sel_3_2_3, "disabled" : disabledJstree }
									  },
									  {
										"text" : "4. VERIFICAR (REVISAR Y APROBAR)",
										"id": "medInsumos_Verif",
										"state" : { "selected" : sel_3_2_4, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "3. PARAMETRIZACION",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_param",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "medParam_Admin",
									  "state" : { "selected" : sel_3_3_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "medParam_Digit",
										"state" : { "selected" : sel_3_3_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "medParam_Consul",
										"state" : { "selected" : sel_3_3_3, "disabled" : disabledJstree }
									  },
									  {
									  "text" : "4. VERIFICAR (REVISAR Y APROBAR)",
									  "id": "medParam_Verif",
									  "state" : { "selected" : sel_3_3_4, "disabled" : disabledJstree }
									},
							]
						},
					]
				},
				{
					"text" : "4. CONTROL PROCESOS DE COMPRA",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_procescomp",
					"children" : [
						{
							"text" : "1. PARAMETRIZACION",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_cpcparam",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "cpcparam_Admin",
									  "state" : { "selected" : sel_4_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "cpcparam_Digit",
										"state" : { "selected" : sel_4_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "cpcparam_Consul",
										"state" : { "selected" : sel_4_1_3, "disabled" : disabledJstree }
									  },
									  {
									  "text" : "4. VERIFICAR (REVISAR Y APROBAR)",
									  "id": "cpcparam_Verif",
									  "state" : { "selected" : sel_4_1_4, "disabled" : disabledJstree }
									},
							]
						},
						{
							"text" : "2. CRITERIOS DE EVALUACION VACIADO OFERTA",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_criteva",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "criteva_Admin",
									  "state" : { "selected" : sel_4_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "criteva_Digit",
										"state" : { "selected" : sel_4_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "criteva_Consul",
										"state" : { "selected" : sel_4_2_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "3. CORRELATIVO DE COMPRAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_corrcomp",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "corrcomp_Admin",
									  "state" : { "selected" : sel_4_3_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "corrcomp_Digit",
										"state" : { "selected" : sel_4_3_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "corrcomp_Consul",
										"state" : { "selected" : sel_4_3_3, "disabled" : disabledJstree }
									  },
							]
						},
					]
				},
				{
					"text" : "5. COMPRAS GENERALES",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_comprasG",
					"children" : [
						{
							"text" : "1. APERTURA PROCESO",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_aperturaProcesoG",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "aperturaProcesoG_Admin",
									  "state" : { "selected" : sel_5_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "aperturaProcesoG_Digit",
										"state" : { "selected" : sel_5_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "aperturaProcesoG_Consul",
										"state" : { "selected" : sel_5_1_3, "disabled" : disabledJstree }
									  },
									  {
									  "text" : "4. VERIFICAR (REVISAR Y APROBAR)",
									  "id": "aperturaProcesoG_Verif",
									  "state" : { "selected" : sel_5_1_4, "disabled" : disabledJstree }
									},
							]
						},
						{
							"text" : "2. ACLARACIONES Y ENMIENDAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_aclaEnmiendasG",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "aclaEnmiendasG_Admin",
									  "state" : { "selected" : sel_5_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "aclaEnmiendasG_Digit",
										"state" : { "selected" : sel_5_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "aclaEnmiendasG_Consul",
										"state" : { "selected" : sel_5_2_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "3. VACIADO DE OFERTAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_vaciadoOfertaG",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "vaciadoOfertaG_Admin",
									  "state" : { "selected" : sel_5_3_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "vaciadoOfertaG_Digit",
										"state" : { "selected" : sel_5_3_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "vaciadoOfertaG_Consul",
										"state" : { "selected" : sel_5_3_3, "disabled" : disabledJstree }
									  },
									  
							]
						},
						{
							"text" : "4. RECOMENDACIONES",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_recomendacionesG",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "recomendacionesG_Admin",
									  "state" : { "selected" : sel_5_4_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "recomendacionesG_Digit",
										"state" : { "selected" : sel_5_4_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "recomendacionesG_Consul",
										"state" : { "selected" : sel_5_4_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "5. RATIFICACIONES",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_ratificacionesG",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "ratificacionesG_Admin",
									  "state" : { "selected" : sel_5_5_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "ratificacionesG_Digit",
										"state" : { "selected" : sel_5_5_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "ratificacionesG_Consul",
										"state" : { "selected" : sel_5_5_3, "disabled" : disabledJstree }
									  },
							]
						},
					]
				},
				{
					"text" : "6. COMPRAS A LARGO PLAZO",
					"state" : { "opened" : true, "disabled" : disabledJstree },
					"id": "mod_comprasALP",
					"children" : [
						{
							"text" : "1. APERTURA PROCESO",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_aperturaProcesoALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "aperturaProcesoALP_Admin",
									  "state" : { "selected" : sel_6_1_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "aperturaProcesoALP_Digit",
										"state" : { "selected" : sel_6_1_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "aperturaProcesoALP_Consul",
										"state" : { "selected" : sel_6_1_3, "disabled" : disabledJstree }
									  },
									  {
									  "text" : "4. VERIFICAR (REVISAR Y APROBAR)",
									  "id": "aperturaProcesoALP_Verif",
									  "state" : { "selected" : sel_6_1_4, "disabled" : disabledJstree }
									},
							]
						},
						{
							"text" : "2. ACLARACIONES Y ENMIENDAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_aclaEnmiendasAlp",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "aclaEnmiendasAlp_Admin",
									  "state" : { "selected" : sel_6_2_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "aclaEnmiendasAlp_Digit",
										"state" : { "selected" : sel_6_2_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "aclaEnmiendasAlp_Consul",
										"state" : { "selected" : sel_6_2_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "3. VACIADO DE OFERTAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_vaciadoOfertAlp",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "vaciadoOfertAlp_Admin",
									  "state" : { "selected" : sel_6_3_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "vaciadoOfertAlp_Digit",
										"state" : { "selected" : sel_6_3_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "vaciadoOfertAlp_Consul",
										"state" : { "selected" : sel_6_3_3, "disabled" : disabledJstree }
									  },
									  {
										"text" : "4. ACTAAPERTURA (CREAR Y MODIFICAR ACTA)",
										"id": "vaciadoOfertAlp_ActaApertura",
										"state" : { "selected" : sel_6_3_4, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "4. RECOMENDACIONES",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_recomendacionesALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "recomendacionesALP_Admin",
									  "state" : { "selected" : sel_6_4_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "recomendacionesALP_Digit",
										"state" : { "selected" : sel_6_4_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "recomendacionesALP_Consul",
										"state" : { "selected" : sel_6_4_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "5. SOLICITUD DE COMPRA",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_solicitudCompraALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "solicitudCompraALP_Admin",
									  "state" : { "selected" : sel_6_5_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "solicitudCompraALP_Digit",
										"state" : { "selected" : sel_6_5_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "solicitudCompraALP_Consul",
										"state" : { "selected" : sel_6_5_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "6. RECOMENDACION DE COMPRA",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_recomendacionCompraALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "recomendacionCompraALP_Admin",
									  "state" : { "selected" : sel_6_6_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "recomendacionCompraALP_Digit",
										"state" : { "selected" : sel_6_6_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "recomendacionCompraALP_Consul",
										"state" : { "selected" : sel_6_6_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "7. RATIFICACION CTF",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_ratificacionCtfALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "ratificacionCtfALP_Admin",
									  "state" : { "selected" : sel_6_7_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "ratificacionCtfALP_Digit",
										"state" : { "selected" : sel_6_7_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "ratificacionCtfALP_Consul",
										"state" : { "selected" : sel_6_7_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "8. CONTRATACIONES",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_contratacionesALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "contratacionesALP_Admin",
									  "state" : { "selected" : sel_6_8_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "contratacionesALP_Digit",
										"state" : { "selected" : sel_6_8_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "contratacionesALP_Consul",
										"state" : { "selected" : sel_6_8_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "9. CONTRATOS DE SUMINISTROS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_contratosSuministrosALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "contratosSuministrosALP_Admin",
									  "state" : { "selected" : sel_6_9_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "contratosSuministrosALP_Digit",
										"state" : { "selected" : sel_6_9_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "contratosSuministrosALP_Consul",
										"state" : { "selected" : sel_6_9_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "10. CONTROL DE GARANTIAS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_controlGarantiasALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "controlGarantiasALP_Admin",
									  "state" : { "selected" : sel_6_10_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "controlGarantiasALP_Digit",
										"state" : { "selected" : sel_6_10_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "controlGarantiasALP_Consul",
										"state" : { "selected" : sel_6_10_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "11. CONTROL DE PAGOS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_controlPagosALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "controlPagosALP_Admin",
									  "state" : { "selected" : sel_6_11_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "controlPagosALP_Digit",
										"state" : { "selected" : sel_6_11_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "controlPagosALP_Consul",
										"state" : { "selected" : sel_6_11_3, "disabled" : disabledJstree }
									  },
							]
						},
						{
							"text" : "12. RECEPCION DE PRODUCTOS",
							"state" : { "selected" : false, "disabled" : disabledJstree },
							"id": "op_recepcionProduALP",
							"children" : [
									{
									  "text" : "1. ADMINISTRAR (CONTROL TOTAL)",
									  "id": "recepcionProduALP_Admin",
									  "state" : { "selected" : sel_6_12_1, "disabled" : disabledJstree }
									},
									{
										"text" : "2. DIGITAR (CREAR Y MODIFICAR)",
										"id": "recepcionProduALP_Digit",
										"state" : { "selected" : sel_6_12_2, "disabled" : disabledJstree }
									  },
									  {
										"text" : "3. CONSULTAR (VER DATOS)",
										"id": "recepcionProduALP_Consul",
										"state" : { "selected" : sel_6_12_3, "disabled" : disabledJstree }
									  },
							]
						},
					]
				},
			],
		 },
		'plugins': ["checkbox", "changed"],
	});
	
	//Seteo de permisos al seleccionar un nodo en Jstree
	$('#jstree_div').on('changed.jstree', function (e, data) {
		var permasign = "";
		if (data.action === "select_node")
		{
		//Tratamiento nodos Principales o Modulos
		 if (data.node.id === "mod_paramu")
		 {
			 $('#crearUsuario').prop('value', permasign);
			 $('#reseteoPass').prop('value', permasign);
			 $('#accMod').prop('value', permasign);
			 $('#reportH').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_cu');
			 $('#jstree_div').jstree('deselect_node', '#op_rs');
			 $('#jstree_div').jstree('deselect_node', '#op_am');
			 $('#jstree_div').jstree('deselect_node', '#op_rh');
		 }
		 if (data.node.id === "mod_manageAdminData")
		 {
			 $('#distFab').prop('value', permasign);
			 $('#benef').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_df');
			 $('#jstree_div').jstree('deselect_node', '#op_ben');
		 }
		 if (data.node.id === "mod_medInsum")
		 {
			 $('#med').prop('value', permasign);
			 $('#otros').prop('value', permasign);
			 $('#param').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_med');
			 $('#jstree_div').jstree('deselect_node', '#op_otros');
			 $('#jstree_div').jstree('deselect_node', '#op_param');
		 }
		 if (data.node.id === "mod_procescomp")
		 {
			 $('#cpcparam').prop('value', permasign);
			 $('#criteva').prop('value', permasign);
			 $('#corrcomp').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_cpcparam');
			 $('#jstree_div').jstree('deselect_node', '#op_criteva');
			 $('#jstree_div').jstree('deselect_node', '#op_corrcomp');
		 }
		 if (data.node.id === "mod_comprasG")
		 {
			 $('#aperturaProcesoG').prop('value', permasign);
			 $('#aclaEnmiendasG').prop('value', permasign);
			 $('#vaciadoOfertaG').prop('value', permasign);
			 $('#recomendacionesG').prop('value', permasign);
			 $('#ratificacionesG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_aperturaProcesoG');
			 $('#jstree_div').jstree('deselect_node', '#op_aclaEnmiendasG');
			 $('#jstree_div').jstree('deselect_node', '#op_vaciadoOfertaG');
			 $('#jstree_div').jstree('deselect_node', '#op_recomendacionesG');
			 $('#jstree_div').jstree('deselect_node', '#op_ratificacionesG');
		 }
		 if (data.node.id === "mod_comprasALP")
		 {
			 $('#aperturaProcesoALP').prop('value', permasign);
			 $('#aclaEnmiendasAlp').prop('value', permasign);
			 $('#vaciadoOfertAlp').prop('value', permasign);
			 $('#recomendacionesALP').prop('value', permasign);
			 $('#solicitudCompraALP').prop('value', permasign);
			 $('#recomendacionCompraALP').prop('value', permasign);
			 $('#ratificacionCtfALP').prop('value', permasign);
			 $('#contratacionesALP').prop('value', permasign);
			 $('#contratosSuministrosALP').prop('value', permasign);
			 $('#controlGarantiasALP').prop('value', permasign);
			 $('#controlPagosALP').prop('value', permasign);
			 $('#recepcionProduALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#op_aperturaProcesoALP');
			 $('#jstree_div').jstree('deselect_node', '#op_aclaEnmiendasAlp');
			 $('#jstree_div').jstree('deselect_node', '#op_vaciadoOfertAlp');
			 $('#jstree_div').jstree('deselect_node', '#op_recomendacionesALP');
			 $('#jstree_div').jstree('deselect_node', '#op_solicitudCompraALP');
			 $('#jstree_div').jstree('deselect_node', '#op_recomendacionCompraALP');
			 $('#jstree_div').jstree('deselect_node', '#op_ratificacionCtfALP');
			 $('#jstree_div').jstree('deselect_node', '#op_contratacionesALP');
			 $('#jstree_div').jstree('deselect_node', '#op_contratosSuministrosALP');
			 $('#jstree_div').jstree('deselect_node', '#op_controlGarantiasALP');
			 $('#jstree_div').jstree('deselect_node', '#op_controlPagosALP');
			 $('#jstree_div').jstree('deselect_node', '#op_recepcionProduALP');
		 }

		//Tratamiento nodos submodulos
		 if (data.node.id === "op_cu")
			{
			 $('#crearUsuario').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Consul');
			}
		 if (data.node.id === "op_rs")
		 {
			 $('#reseteoPass').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Consul');
		 }
		 if (data.node.id === "op_am")
		 {
			 $('#accMod').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Consul');
		 }
		 if (data.node.id === "op_rh")
		 {
			 $('#reportH').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersReport_Consul');
		 }
		 if (data.node.id === "op_df")
		 {
			 $('#distFab').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Admin');
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Digit');
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Consul');
		 }
		 if (data.node.id === "op_ben")
		 {
			 $('#benef').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Admin');
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Digit');
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Consul');
		 }
		 if (data.node.id === "op_med")
		 {
			 $('#med').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#medManage_Admin');
			 $('#jstree_div').jstree('deselect_node', '#medManage_Digit');
				$('#jstree_div').jstree('deselect_node', '#medManage_Consul');
				$('#jstree_div').jstree('deselect_node', '#medManage_Verif');
		 }
		 if (data.node.id === "op_otros")
		 {
			 $('#otros').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Admin');
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Digit');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Consul');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Verif');
		 }
		 if (data.node.id === "op_param")
		 {
			 $('#param').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#medParam_Admin');
			 $('#jstree_div').jstree('deselect_node', '#medParam_Digit');
				$('#jstree_div').jstree('deselect_node', '#medParam_Consul');
				$('#jstree_div').jstree('deselect_node', '#medParam_Verif');
		 }
		 if (data.node.id === "op_cpcparam")
		 {
			 $('#cpcparam').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Admin');
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Digit');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Consul');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Verif');
		 }
		 if (data.node.id === "op_criteva")
		 {
			 $('#criteva').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#criteva_Admin');
			 $('#jstree_div').jstree('deselect_node', '#criteva_Digit');
				$('#jstree_div').jstree('deselect_node', '#criteva_Consul');
				
		 }
		 if (data.node.id === "op_corrcomp")
		 {
			 $('#corrcomp').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#corrcomp_Admin');
			 $('#jstree_div').jstree('deselect_node', '#corrcomp_Digit');
				$('#jstree_div').jstree('deselect_node', '#corrcomp_Consul');
		 }
		 if (data.node.id === "op_aperturaProcesoG")
		 {
			 $('#aperturaProcesoG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Admin');
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Verif');
		 }
		 if (data.node.id === "op_aclaEnmiendasG")
		 {
			 $('#aclaEnmiendasG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Admin');
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Consul');
		 }
		 if (data.node.id === "op_vaciadoOfertaG")
		 {
			 $('#vaciadoOfertaG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Admin');
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Digit');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Consul');
		 }
		 if (data.node.id === "op_recomendacionesG")
		 {
			 $('#recomendacionesG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesG_Admin');
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesG_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesG_Consul');
		 }
		 if (data.node.id === "op_ratificacionesG")
		 {
			 $('#ratificacionesG').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionesG_Admin');
			 $('#jstree_div').jstree('deselect_node', '#ratificacionesG_Digit');
				$('#jstree_div').jstree('deselect_node', '#ratificacionesG_Consul');
		 }
		 if (data.node.id === "op_aperturaProcesoALP")
		 {
			 $('#aperturaProcesoALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Verif');
		 }
		 if (data.node.id === "op_aclaEnmiendasAlp")
		 {
			 $('#aclaEnmiendasAlp').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Admin');
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Digit');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Consul');
		 }
		 if (data.node.id === "op_vaciadoOfertAlp")
		 {
			 $('#vaciadoOfertAlp').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Admin');
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Digit');
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Consul');
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_ActaApertura');
		 }
		 if (data.node.id === "op_recomendacionesALP")
		 {
			 $('#recomendacionesALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Consul');
		 }
		 if (data.node.id === "op_solicitudCompraALP")
		 {
			 $('#solicitudCompraALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Consul');
		 }
		 if (data.node.id === "op_recomendacionCompraALP")
		 {
			 $('#recomendacionCompraALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Consul');
		 }
		 if (data.node.id === "op_ratificacionCtfALP")
		 {
			 $('#ratificacionCtfALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Consul');
		 }
		 if (data.node.id === "op_contratacionesALP")
		 {
			 $('#contratacionesALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratacionesALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#contratacionesALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#contratacionesALP_Consul');
		 }
		 if (data.node.id === "op_contratosSuministrosALP")
		 {
			 $('#contratosSuministrosALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Consul');
		 }
		 if (data.node.id === "op_controlGarantiasALP")
		 {
			 $('#controlGarantiasALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Consul');
		 }
		 if (data.node.id === "op_controlPagosALP")
		 {
			 $('#controlPagosALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlPagosALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#controlPagosALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#controlPagosALP_Consul');
		 }
		 if (data.node.id === "op_recepcionProduALP")
		 {
			 $('#recepcionProduALP').prop('value', permasign);
			 $('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Admin');
			 $('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Consul');
		 }
		 
		//Tratamiento nodos permisos
		//Crear Usuario
		 if (data.node.parent === "op_cu" )
		 {
		   if (data.node.id === "paramUsersCreate_Admin")
		   {
			 permasign = "administrar";
			 $('#crearUsuario').prop('value', "crearUsuario_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Consul');
		   }
		   else if (data.node.id === "paramUsersCreate_Digit")
		   {
			 permasign = "digitar";
			 $('#crearUsuario').prop('value', "crearUsuario_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Consul');
		   }
		   else if (data.node.id === "paramUsersCreate_Consul")
		   {
			 permasign = "consultar";
			 $('#crearUsuario').prop('value', "crearUsuario_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersCreate_Digit');
		   }
		 }
		
		//Reseteo de Contraseña
		 if (data.node.parent === "op_rs" )
		 {
		   if (data.node.id === "paramUsersResetPass_Admin")
		   {
			 permasign = "administrar";
			 $('#reseteoPass').prop('value', "reseteoPassword_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Consul');
		   }
		   if (data.node.id === "paramUsersResetPass_Digit")
		   {
			 permasign = "digitar";
			 $('#reseteoPass').prop('value', "reseteoPassword_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Consul');
		   }
		   if (data.node.id === "paramUsersResetPass_Consul")
		   {
			 permasign = "consultar";
			 $('#reseteoPass').prop('value', "reseteoPassword_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersResetPass_Digit');
		   }
		 }
		
		//Acceso Modulo
		 if (data.node.parent === "op_am" )
		 {
		  if (data.node.id === "paramUsersAccMod_Admin")
		  {
			 permasign = "administrar";
			 $('#accMod').prop('value', "accesos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Digit');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Consul');
		  }
		  if (data.node.id === "paramUsersAccMod_Digit")
		  {
			 permasign = "digitar";
			 $('#accMod').prop('value', "accesos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Consul');
		  }
		  if (data.node.id === "paramUsersAccMod_Consul")
		  {
			 permasign = "consultar";
			 $('#accMod').prop('value', "accesos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Admin');
			 $('#jstree_div').jstree('deselect_node', '#paramUsersAccMod_Digit');
		  }
		 }
		
		//Reportes de historial
		 if (data.node.parent === "op_rh" )
		 {
		  if (data.node.id === "paramUsersReport_Consul")
		  {
			 permasign = "consultar";
			 $('#reportH').prop('value', "reportes_" + permasign);
		  }
		 }
		
		//Distribuidor/Fabricante
		 if (data.node.parent === "op_df" )
		 {
		  if (data.node.id === "dataManageDistFab_Admin")
		  {
			 permasign = "administrar";
			 $('#distFab').prop('value', "distribuidorFabricante_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Digit');
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Consul');
		  }
		  if (data.node.id === "dataManageDistFab_Digit")
		  {
			 permasign = "digitar";
			 $('#distFab').prop('value', "distribuidorFabricante_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Admin');
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Consul');
		  }
		  if (data.node.id === "dataManageDistFab_Consul")
		  {
			 permasign = "consultar";
			 $('#distFab').prop('value', "distribuidorFabricante_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Digit');
			 $('#jstree_div').jstree('deselect_node', '#dataManageDistFab_Admin');
		  }
		 }
		
		//Beneficiarios
		 if (data.node.parent === "op_ben" )
		 {
		  if (data.node.id === "dataManageBenf_Admin")
		  {
			 permasign = "administrar";
			 $('#benef').prop('value', "beneficiarios_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Digit');
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Consul');
		  }
		  if (data.node.id === "dataManageBenf_Digit")
		  {
			 permasign = "digitar";
			 $('#benef').prop('value', "beneficiarios_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Admin');
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Consul');
		  }
		  if (data.node.id === "dataManageBenf_Consul")
		  {
			 permasign = "consultar";
			 $('#benef').prop('value', "beneficiarios_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Admin');
			 $('#jstree_div').jstree('deselect_node', '#dataManageBenf_Digit');
		  }
		 }
		
		//Medicamentos
		 if (data.node.parent === "op_med" )
		 {
		  if (data.node.id === "medManage_Admin")
		  {
			 permasign = "administrar";
			 $('#med').prop('value', "medicamentos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medManage_Digit');
				$('#jstree_div').jstree('deselect_node', '#medManage_Consul');
				$('#jstree_div').jstree('deselect_node', '#medManage_Verif');
		  }
		  if (data.node.id === "medManage_Digit")
		  {
			 permasign = "digitar";
			 $('#med').prop('value', "medicamentos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medManage_Admin');
				$('#jstree_div').jstree('deselect_node', '#medManage_Consul');
				$('#jstree_div').jstree('deselect_node', '#medManage_Verif');
		  }
		  if (data.node.id === "medManage_Consul")
		  {
			 permasign = "consultar";
			 $('#med').prop('value', "medicamentos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medManage_Admin');
				$('#jstree_div').jstree('deselect_node', '#medManage_Digit');
				$('#jstree_div').jstree('deselect_node', '#medManage_Verif');
		  }
		  if (data.node.id === "medManage_Verif")
		  {
			 permasign = "verificar";
			 $('#med').prop('value', "medicamentos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medManage_Admin');
				$('#jstree_div').jstree('deselect_node', '#medManage_Digit');
				$('#jstree_div').jstree('deselect_node', '#medManage_Consul');
		  }
		 }
		
		//Otros
		 if (data.node.parent === "op_otros" )
		 {
		  if (data.node.id === "medInsumos_Admin")
		  {
			 permasign = "administrar";
			 $('#otros').prop('value', "insumos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Digit');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Consul');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Verif');
		  }
		  if (data.node.id === "medInsumos_Digit")
		  {
			 permasign = "digitar";
			 $('#otros').prop('value', "insumos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Admin');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Consul');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Verif');
		  }
		  if (data.node.id === "medInsumos_Consul")
		  {
			 permasign = "consultar";
			 $('#otros').prop('value', "insumos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Admin');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Digit');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Verif');
		  }
		  if (data.node.id === "medInsumos_Verif")
		  {
			 permasign = "verificar";
			 $('#otros').prop('value', "insumos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medInsumos_Admin');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Digit');
				$('#jstree_div').jstree('deselect_node', '#medInsumos_Consul');
		  }
		 }
		
		//Parametrizacion
		 if (data.node.parent === "op_param" )
		 {
		  if (data.node.id === "medParam_Admin")
		  {
			 permasign = "administrar";
			 $('#param').prop('value', "parametrizacion_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medParam_Digit');
				$('#jstree_div').jstree('deselect_node', '#medParam_Consul');
				$('#jstree_div').jstree('deselect_node', '#medParam_Verif');
		  }
		  if (data.node.id === "medParam_Digit")
		  {
			 permasign = "digitar";
			 $('#param').prop('value', "parametrizacion_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medParam_Admin');
				$('#jstree_div').jstree('deselect_node', '#medParam_Consul');
				$('#jstree_div').jstree('deselect_node', '#medParam_Verif');
		  }
		  if (data.node.id === "medParam_Consul")
		  {
			 permasign = "consultar";
			 $('#param').prop('value', "parametrizacion_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medParam_Admin');
				$('#jstree_div').jstree('deselect_node', '#medParam_Digit');
				$('#jstree_div').jstree('deselect_node', '#medParam_Verif');
		  }
		  if (data.node.id === "medParam_Verif")
		  {
			 permasign = "verificar";
			 $('#param').prop('value', "parametrizacion_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#medParam_Admin');
				$('#jstree_div').jstree('deselect_node', '#medParam_Digit');
				$('#jstree_div').jstree('deselect_node', '#medParam_Consul');
		  }
		 }

		 //Control Procesos De Compra Parametrizacion
		 if (data.node.parent === "op_cpcparam" )
		 {
		  if (data.node.id === "cpcparam_Admin")
		  {
			 permasign = "administrar";
			 $('#cpcparam').prop('value', "paramOpeningPlace_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Digit');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Consul');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Verif');
		  }
		  if (data.node.id === "cpcparam_Digit")
		  {
			 permasign = "digitar";
			 $('#cpcparam').prop('value', "paramOpeningPlace_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Admin');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Consul');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Verif');
		  }
		  if (data.node.id === "cpcparam_Consul")
		  {
			 permasign = "consultar";
			 $('#cpcparam').prop('value', "paramOpeningPlace_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Admin');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Digit');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Verif');
		  }
		  if (data.node.id === "cpcparam_Verif")
		  {
			 permasign = "verificar";
			 $('#cpcparam').prop('value', "paramOpeningPlace_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#cpcparam_Admin');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Digit');
				$('#jstree_div').jstree('deselect_node', '#cpcparam_Consul');
		  }
		 }

		 //CRITERIOS DE EVALUACION VACIADO OFERTA
		 if (data.node.parent === "op_criteva" )
		 {
		  if (data.node.id === "criteva_Admin")
		  {
			 permasign = "administrar";
			 $('#criteva').prop('value', "paramCriteriosEvaluation_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#criteva_Digit');
				$('#jstree_div').jstree('deselect_node', '#criteva_Consul');
				
		  }
		  if (data.node.id === "criteva_Digit")
		  {
			 permasign = "digitar";
			 $('#criteva').prop('value', "paramCriteriosEvaluation_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#criteva_Admin');
				$('#jstree_div').jstree('deselect_node', '#criteva_Consul');
		  }
		  if (data.node.id === "criteva_Consul")
		  {
			 permasign = "consultar";
			 $('#criteva').prop('value', "paramCriteriosEvaluation_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#criteva_Admin');
				$('#jstree_div').jstree('deselect_node', '#criteva_Digit');
		  }
		 }

		 //CORRELATIVO DE COMPRAS
		 if (data.node.parent === "op_corrcomp" )
		 {
		  if (data.node.id === "corrcomp_Admin")
		  {
			 permasign = "administrar";
			 $('#corrcomp').prop('value', "paramALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#corrcomp_Digit');
				$('#jstree_div').jstree('deselect_node', '#corrcomp_Consul');
		  }
		  if (data.node.id === "corrcomp_Digit")
		  {
			 permasign = "digitar";
			 $('#corrcomp').prop('value', "paramALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#corrcomp_Admin');
				$('#jstree_div').jstree('deselect_node', '#corrcomp_Consul');
		  }
		  if (data.node.id === "corrcomp_Consul")
		  {
			 permasign = "consultar";
			 $('#corrcomp').prop('value', "paramALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#corrcomp_Admin');
				$('#jstree_div').jstree('deselect_node', '#corrcomp_Digit');
		  }
		 }


		 //APERTURA PROCESO GENERAL
		 if (data.node.parent === "op_aperturaProcesoG" )
		 {
		  if (data.node.id === "aperturaProcesoG_Admin")
		  {
			 permasign = "administrar";
			 $('#aperturaProcesoG').prop('value', "purchaseProcessesGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Verif');
		  }
		  if (data.node.id === "aperturaProcesoG_Digit")
		  {
			 permasign = "digitar";
			 $('#aperturaProcesoG').prop('value', "purchaseProcessesGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Verif');
		  }
		  if (data.node.id === "aperturaProcesoG_Consul")
		  {
			 permasign = "consultar";
			 $('#aperturaProcesoG').prop('value', "purchaseProcessesGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Verif');
		  }
		  if (data.node.id === "aperturaProcesoG_Verif")
		  {
			 permasign = "verificar";
			 $('#aperturaProcesoG').prop('value', "purchaseProcessesGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoG_Consul');
		  }
		 }

		 //ACLARACIONES Y ENMIENDAS GENERAL
		 if (data.node.parent === "op_aclaEnmiendasG" )
		 {
		  if (data.node.id === "aclaEnmiendasG_Admin")
		  {
			 permasign = "administrar";
			 $('#aclaEnmiendasG').prop('value', "amendmentsGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Digit');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Consul');
		  }
		  if (data.node.id === "aclaEnmiendasG_Digit")
		  {
			 permasign = "digitar";
			 $('#aclaEnmiendasG').prop('value', "amendmentsGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Admin');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Consul');
		  }
		  if (data.node.id === "aclaEnmiendasG_Consul")
		  {
			 permasign = "consultar";
			 $('#aclaEnmiendasG').prop('value', "amendmentsGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Admin');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasG_Digit');
		  }
		 }

		 //VACIADO DE OFERTAS GENERAL
		 if (data.node.parent === "op_vaciadoOfertaG" )
		 {
		  if (data.node.id === "vaciadoOfertaG_Admin")
		  {
			 permasign = "administrar";
			 $('#vaciadoOfertaG').prop('value', "vaciadoOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Digit');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Consul');
		  }
		  if (data.node.id === "vaciadoOfertaG_Digit")
		  {
			 permasign = "digitar";
			 $('#vaciadoOfertaG').prop('value', "vaciadoOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Admin');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Consul');
		  }
		  if (data.node.id === "vaciadoOfertaG_Consul")
		  {
			 permasign = "consultar";
			 $('#vaciadoOfertaG').prop('value', "vaciadoOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Admin');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertaG_Digit');
		  }
		 }

		 //RECOMENDACIONES GENERAL
		 if (data.node.parent === "op_recomendacionesG" )
		 {
		  if (data.node.id === "recomendacionesG_Admin")
		  {
			 permasign = "administrar";
			 $('#recomendacionesG').prop('value', "recomendacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesG_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesG_Consul');
		  }
		  if (data.node.id === "recomendacionesG_Digit")
		  {
			 permasign = "digitar";
			 $('#recomendacionesG').prop('value', "recomendacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesG_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesG_Consul');
		  }
		  if (data.node.id === "recomendacionesG_Consul")
		  {
			 permasign = "consultar";
			 $('#recomendacionesG').prop('value', "recomendacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesG_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesG_Digit');
		  }
		 }

		 //RATIFICACIONES GENERAL
		 if (data.node.parent === "op_ratificacionesG" )
		 {
		  if (data.node.id === "ratificacionesG_Admin")
		  {
			 permasign = "administrar";
			 $('#ratificacionesG').prop('value', "ratificacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionesG_Digit');
				$('#jstree_div').jstree('deselect_node', '#ratificacionesG_Consul');
		  }
		  if (data.node.id === "ratificacionesG_Digit")
		  {
			 permasign = "digitar";
			 $('#ratificacionesG').prop('value', "ratificacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionesG_Admin');
				$('#jstree_div').jstree('deselect_node', '#ratificacionesG_Consul');
		  }
		  if (data.node.id === "ratificacionesG_Consul")
		  {
			 permasign = "consultar";
			 $('#ratificacionesG').prop('value', "ratificacionOfertaGeneral_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionesG_Admin');
				$('#jstree_div').jstree('deselect_node', '#ratificacionesG_Digit');
		  }
		 }

		 //APERTURA DE PROCESO ALP
		 if (data.node.parent === "op_aperturaProcesoALP" )
		 {
		  if (data.node.id === "aperturaProcesoALP_Admin")
		  {
			 permasign = "administrar";
			 $('#aperturaProcesoALP').prop('value', "purchaseProcessesALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Verif');
		  }
		  if (data.node.id === "aperturaProcesoALP_Digit")
		  {
			 permasign = "digitar";
			 $('#aperturaProcesoALP').prop('value', "purchaseProcessesALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Consul');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Verif');
		  }
		  if (data.node.id === "aperturaProcesoALP_Consul")
		  {
			 permasign = "consultar";
			 $('#aperturaProcesoALP').prop('value', "purchaseProcessesALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Verif');
		  }
		  if (data.node.id === "aperturaProcesoALP_Verif")
		  {
			 permasign = "verificar";
			 $('#aperturaProcesoALP').prop('value', "purchaseProcessesALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#aperturaProcesoALP_Consul');
		  }
		 }

		 //ACLARACIONES Y ENMIENDAS ALP
		 if (data.node.parent === "op_aclaEnmiendasAlp" )
		 {
		  if (data.node.id === "aclaEnmiendasAlp_Admin")
		  {
			 permasign = "administrar";
			 $('#aclaEnmiendasAlp').prop('value', "amendmentsALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Digit');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Consul');
		  }
		  if (data.node.id === "aclaEnmiendasAlp_Digit")
		  {
			 permasign = "digitar";
			 $('#aclaEnmiendasAlp').prop('value', "amendmentsALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Admin');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Consul');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Verif');
		  }
		  if (data.node.id === "aclaEnmiendasAlp_Consul")
		  {
			 permasign = "consultar";
			 $('#aclaEnmiendasAlp').prop('value', "amendmentsALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Admin');
				$('#jstree_div').jstree('deselect_node', '#aclaEnmiendasAlp_Digit');
		  }
		 }

		 //VACIADO DE OFERTAS ALP
		 if (data.node.parent === "op_vaciadoOfertAlp" )
		 {
		  if (data.node.id === "vaciadoOfertAlp_Admin")
		  {
			 permasign = "administrar";
			 $('#vaciadoOfertAlp').prop('value', "vaciadoOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Digit');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Consul');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_ActaApertura');
				
		  }
		  if (data.node.id === "vaciadoOfertAlp_Digit")
		  {
			 permasign = "digitar";
			 $('#vaciadoOfertAlp').prop('value', "vaciadoOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Admin');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Consul');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_ActaApertura');
		  }
		  if (data.node.id === "vaciadoOfertAlp_Consul")
		  {
			 permasign = "consultar";
			 $('#vaciadoOfertAlp').prop('value', "vaciadoOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Admin');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Digit');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_ActaApertura');
		  }

		   if (data.node.id === "vaciadoOfertAlp_ActaApertura")
		  {
			 permasign = "actaapertura";
			 $('#vaciadoOfertAlp').prop('value', "vaciadoOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Admin');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Digit');
				$('#jstree_div').jstree('deselect_node', '#vaciadoOfertAlp_Consul');
		  }
		 }

		 //RECOMENDACIONES ALP
		 if (data.node.parent === "op_recomendacionesALP" )
		 {
		  if (data.node.id === "recomendacionesALP_Admin")
		  {
			 permasign = "administrar";
			 $('#recomendacionesALP').prop('value', "recomendacionOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Consul');
		  }
		  if (data.node.id === "recomendacionesALP_Digit")
		  {
			 permasign = "digitar";
			 $('#recomendacionesALP').prop('value', "recomendacionOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Consul');
		  }
		  if (data.node.id === "recomendacionesALP_Consul")
		  {
			 permasign = "consultar";
			 $('#recomendacionesALP').prop('value', "recomendacionOfertaALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionesALP_Digit');
		  }
		 }

		 //SOLICITUD DE COMPRA ALP
		 if (data.node.parent === "op_solicitudCompraALP" )
		 {
		  if (data.node.id === "solicitudCompraALP_Admin")
		  {
			 permasign = "administrar";
			 $('#solicitudCompraALP').prop('value', "solicitudCompraALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Consul');
		  }
		  if (data.node.id === "solicitudCompraALP_Digit")
		  {
			 permasign = "digitar";
			 $('#solicitudCompraALP').prop('value', "solicitudCompraALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Consul');
		  }
		  if (data.node.id === "solicitudCompraALP_Consul")
		  {
			 permasign = "consultar";
			 $('#solicitudCompraALP').prop('value', "solicitudCompraALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#solicitudCompraALP_Digit');
		  }
		 }

		 //RECOMENDACION DE COMPRA ALP
		 if (data.node.parent === "op_recomendacionCompraALP" )
		 {
		  if (data.node.id === "recomendacionCompraALP_Admin")
		  {
			 permasign = "administrar";
			 $('#recomendacionCompraALP').prop('value', "evaluacionRecomendacionOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Consul');
		  }
		  if (data.node.id === "recomendacionCompraALP_Digit")
		  {
			 permasign = "digitar";
			 $('#recomendacionCompraALP').prop('value', "evaluacionRecomendacionOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Consul');
		  }
		  if (data.node.id === "recomendacionCompraALP_Consul")
		  {
			 permasign = "consultar";
			 $('#recomendacionCompraALP').prop('value', "evaluacionRecomendacionOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recomendacionCompraALP_Digit');
		  }
		 }

		 //RATIFICACION CTF ALP
		 if (data.node.parent === "op_ratificacionCtfALP" )
		 {
		  if (data.node.id === "ratificacionCtfALP_Admin")
		  {
			 permasign = "administrar";
			 $('#ratificacionCtfALP').prop('value', "ratificacionCTFOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Consul');
		  }
		  if (data.node.id === "ratificacionCtfALP_Digit")
		  {
			 permasign = "digitar";
			 $('#ratificacionCtfALP').prop('value', "ratificacionCTFOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Consul');
		  }
		  if (data.node.id === "ratificacionCtfALP_Consul")
		  {
			 permasign = "consultar";
			 $('#ratificacionCtfALP').prop('value', "ratificacionCTFOferta_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#ratificacionCtfALP_Digit');
		  }
		 }

		 //CONTRATACIONES ALP
		 if (data.node.parent === "op_contratacionesALP" )
		 {
		  if (data.node.id === "contratacionesALP_Admin")
		  {
			 permasign = "administrar";
			 $('#contratacionesALP').prop('value', "contrataciones_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratacionesALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#contratacionesALP_Consul');
		  }
		  if (data.node.id === "contratacionesALP_Digit")
		  {
			 permasign = "digitar";
			 $('#contratacionesALP').prop('value', "contrataciones_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratacionesALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#contratacionesALP_Consul');
		  }
		  if (data.node.id === "contratacionesALP_Consul")
		  {
			 permasign = "consultar";
			 $('#contratacionesALP').prop('value', "contrataciones_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratacionesALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#contratacionesALP_Digit');
		  }
		 }

		 //CONTRATOS DE SUMINISTROS ALP
		 if (data.node.parent === "op_contratosSuministrosALP" )
		 {
		  if (data.node.id === "contratosSuministrosALP_Admin")
		  {
			 permasign = "administrar";
			 $('#contratosSuministrosALP').prop('value', "contratoSuministroALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Consul');
		  }
		  if (data.node.id === "contratosSuministrosALP_Digit")
		  {
			 permasign = "digitar";
			 $('#contratosSuministrosALP').prop('value', "contratoSuministroALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Consul');
		  }
		  if (data.node.id === "contratosSuministrosALP_Consul")
		  {
			 permasign = "consultar";
			 $('#contratosSuministrosALP').prop('value', "contratoSuministroALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#contratosSuministrosALP_Digit');
		  }
		 }

		 //CONTROL DE GARANTIAS ALP
		 if (data.node.parent === "op_controlGarantiasALP" )
		 {
		  if (data.node.id === "controlGarantiasALP_Admin")
		  {
			 permasign = "administrar";
			 $('#controlGarantiasALP').prop('value', "controlGarantiasALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Consul');
		  }
		  if (data.node.id === "controlGarantiasALP_Digit")
		  {
			 permasign = "digitar";
			 $('#controlGarantiasALP').prop('value', "controlGarantiasALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Consul');
		  }
		  if (data.node.id === "controlGarantiasALP_Consul")
		  {
			 permasign = "consultar";
			 $('#controlGarantiasALP').prop('value', "controlGarantiasALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#controlGarantiasALP_Digit');
		  }
		 }

		 //CONTROL DE PAGOS ALP
		 if (data.node.parent === "op_controlPagosALP" )
		 {
		  if (data.node.id === "controlPagosALP_Admin")
		  {
			 permasign = "administrar";
			 $('#controlPagosALP').prop('value', "controlPagosALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlPagosALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#controlPagosALP_Consul');
		  }
		  if (data.node.id === "controlPagosALP_Digit")
		  {
			 permasign = "digitar";
			 $('#controlPagosALP').prop('value', "controlPagosALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlPagosALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#controlPagosALP_Consul');
		  }
		  if (data.node.id === "controlPagosALP_Consul")
		  {
			 permasign = "consultar";
			 $('#controlPagosALP').prop('value', "controlPagosALP_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#controlPagosALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#controlPagosALP_Digit');
		  }
		 }

		 //RECEPCION DE PRODUCTOS ALP
		 if (data.node.parent === "op_recepcionProduALP" )
		 {
		  if (data.node.id === "recepcionProduALP_Admin")
		  {
			 permasign = "administrar";
			 $('#recepcionProduALP').prop('value', "recepcionProductos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Digit');
				$('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Consul');
		  }
		  if (data.node.id === "recepcionProduALP_Digit")
		  {
			 permasign = "digitar";
			 $('#recepcionProduALP').prop('value', "recepcionProductos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Consul');
		  }
		  if (data.node.id === "recepcionProduALP_Consul")
		  {
			 permasign = "consultar";
			 $('#recepcionProduALP').prop('value', "recepcionProductos_" + permasign);
			 $('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Admin');
				$('#jstree_div').jstree('deselect_node', '#recepcionProduALP_Digit');
		  }
		 }


		 /////
	  }
	  else if (data.action === "deselect_node")
	  {
		  if (data.node.parent === "op_cu")
		  {
			 if (
			 data.instance._model.data.paramUsersCreate_Admin.state.selected === false && 
			 data.instance._model.data.paramUsersCreate_Digit.state.selected === false &&
			 data.instance._model.data.paramUsersCreate_Consul.state.selected === false)
			 {
				 $('#crearUsuario').prop('value', permasign);
			 }
		  }
		   if (data.node.parent === "op_rs")
		  {
			  if (
			  data.instance._model.data.paramUsersResetPass_Admin.state.selected === false && 
			  data.instance._model.data.paramUsersResetPass_Digit.state.selected === false &&
			  data.instance._model.data.paramUsersResetPass_Consul.state.selected === false)
			 {
				 $('#reseteoPass').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_am")
		  {
			  if (
			  data.instance._model.data.paramUsersAccMod_Admin.state.selected === false && 
			  data.instance._model.data.paramUsersAccMod_Digit.state.selected === false &&
			  data.instance._model.data.paramUsersAccMod_Consul.state.selected === false)
			 {
				 $('#accMod').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_rh")
		  {
			  if (data.instance._model.data.paramUsersReport_Consul.state.selected === false)
			 {
				 $('#reportH').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_df")
		  {
			  if (
			  data.instance._model.data.dataManageDistFab_Admin.state.selected === false && 
			  data.instance._model.data.dataManageDistFab_Digit.state.selected === false &&
			  data.instance._model.data.dataManageDistFab_Consul.state.selected === false)
			 {
				 $('#distFab').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_ben")
		  {
			  if (
			  data.instance._model.data.dataManageBenf_Admin.state.selected === false && 
			  data.instance._model.data.dataManageBenf_Digit.state.selected === false &&
			  data.instance._model.data.dataManageBenf_Consul.state.selected === false)
			 {
				 $('#benef').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_med")
		  {
			  if (
			  data.instance._model.data.medManage_Admin.state.selected === false && 
			  data.instance._model.data.medManage_Digit.state.selected === false &&
			  data.instance._model.data.medManage_Consul.state.selected === false &&
			 data.instance._model.data.medManage_Verif.state.selected === false)
			 {
				 $('#med').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_otros")
		  {
			  if (
			  data.instance._model.data.medInsumos_Admin.state.selected === false && 
			  data.instance._model.data.medInsumos_Digit.state.selected === false &&
			  data.instance._model.data.medInsumos_Consul.state.selected === false &&
			  data.instance._model.data.medInsumos_Verif.state.selected === false)
			 {
				 $('#otros').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_param")
		  {
			  if (
			  data.instance._model.data.medParam_Admin.state.selected === false && 
			  data.instance._model.data.medParam_Digit.state.selected === false &&
			  data.instance._model.data.medParam_Consul.state.selected === false &&
			  data.instance._model.data.medParam_Verif.state.selected === false)
			 {
				 $('#param').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_cpcparam")
		  {
			  if (
			  data.instance._model.data.cpcparam_Admin.state.selected === false && 
			  data.instance._model.data.cpcparam_Digit.state.selected === false &&
			  data.instance._model.data.cpcparam_Consul.state.selected === false &&
			  data.instance._model.data.cpcparam_Verif.state.selected === false)
			 {
				 $('#cpcparam').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_criteva")
		  {
			  if (
			  data.instance._model.data.criteva_Admin.state.selected === false && 
			  data.instance._model.data.criteva_Digit.state.selected === false &&
			  data.instance._model.data.criteva_Consul.state.selected === false )
			 {
				 $('#criteva').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_corrcomp")
		  {
			  if (
			  data.instance._model.data.corrcomp_Admin.state.selected === false && 
			  data.instance._model.data.corrcomp_Digit.state.selected === false &&
			  data.instance._model.data.corrcomp_Consul.state.selected === false)
			 {
				 $('#corrcomp').prop('value', permasign);
			 }
		   }
		   if (data.node.parent === "op_aperturaProcesoG")
		   {
			   if (
			   data.instance._model.data.aperturaProcesoG_Admin.state.selected === false && 
			   data.instance._model.data.aperturaProcesoG_Digit.state.selected === false &&
			   data.instance._model.data.aperturaProcesoG_Consul.state.selected === false &&
			   data.instance._model.data.aperturaProcesoG_Verif.state.selected === false)
			  {
				  $('#aperturaProcesoG').prop('value', permasign);
			  }
			}
			if (data.node.parent === "op_aclaEnmiendasG")
			{
				if (
				data.instance._model.data.aclaEnmiendasG_Admin.state.selected === false && 
				data.instance._model.data.aclaEnmiendasG_Digit.state.selected === false &&
				data.instance._model.data.aclaEnmiendasG_Consul.state.selected === false )
			   {
				   $('#aclaEnmiendasG').prop('value', permasign);
			   }
			 }
			 if (data.node.parent === "op_vaciadoOfertaG")
			 {
				 if (
				 data.instance._model.data.vaciadoOfertaG_Admin.state.selected === false && 
				 data.instance._model.data.vaciadoOfertaG_Digit.state.selected === false &&
				 data.instance._model.data.vaciadoOfertaG_Consul.state.selected === false )
				{
					$('#vaciadoOfertaG').prop('value', permasign);
				}
			  }
			  if (data.node.parent === "op_recomendacionesG")
			  {
				  if (
				  data.instance._model.data.recomendacionesG_Admin.state.selected === false && 
				  data.instance._model.data.recomendacionesG_Digit.state.selected === false &&
				  data.instance._model.data.recomendacionesG_Consul.state.selected === false)
				 {
					 $('#recomendacionesG').prop('value', permasign);
				 }
			   }
			   if (data.node.parent === "op_ratificacionesG")
			   {
				   if (
				   data.instance._model.data.ratificacionesG_Admin.state.selected === false && 
				   data.instance._model.data.ratificacionesG_Digit.state.selected === false &&
				   data.instance._model.data.ratificacionesG_Consul.state.selected === false )
				  {
					  $('#ratificacionesG').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_aperturaProcesoALP")
			   {
				   if (
				   data.instance._model.data.aperturaProcesoALP_Admin.state.selected === false && 
				   data.instance._model.data.aperturaProcesoALP_Digit.state.selected === false &&
				   data.instance._model.data.aperturaProcesoALP_Consul.state.selected === false &&
				   data.instance._model.data.aperturaProcesoALP_Verif.state.selected === false)
				  {
					  $('#aperturaProcesoALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_aclaEnmiendasAlp")
			   {
				   if (
				   data.instance._model.data.aclaEnmiendasAlp_Admin.state.selected === false && 
				   data.instance._model.data.aclaEnmiendasAlp_Digit.state.selected === false &&
				   data.instance._model.data.aclaEnmiendasAlp_Consul.state.selected === false)
				  {
					  $('#aclaEnmiendasAlp').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_vaciadoOfertAlp")
			   {
				   if (
				   data.instance._model.data.vaciadoOfertAlp_Admin.state.selected === false && 
				   data.instance._model.data.vaciadoOfertAlp_Digit.state.selected === false &&
				   data.instance._model.data.vaciadoOfertAlp_Consul.state.selected === false &&
				   data.instance._model.data.vaciadoOfertAlp_ActaApertura.state.selected === false)
				  {
					  $('#vaciadoOfertAlp').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_recomendacionesALP")
			   {
				   if (
				   data.instance._model.data.recomendacionesALP_Admin.state.selected === false && 
				   data.instance._model.data.recomendacionesALP_Digit.state.selected === false &&
				   data.instance._model.data.recomendacionesALP_Consul.state.selected === false)
				  {
					  $('#recomendacionesALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_solicitudCompraALP")
			   {
				   if (
				   data.instance._model.data.solicitudCompraALP_Admin.state.selected === false && 
				   data.instance._model.data.solicitudCompraALP_Digit.state.selected === false &&
				   data.instance._model.data.solicitudCompraALP_Consul.state.selected === false)
				  {
					  $('#solicitudCompraALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_recomendacionCompraALP")
			   {
				   if (
				   data.instance._model.data.recomendacionCompraALP_Admin.state.selected === false && 
				   data.instance._model.data.recomendacionCompraALP_Digit.state.selected === false &&
				   data.instance._model.data.recomendacionCompraALP_Consul.state.selected === false)
				  {
					  $('#recomendacionCompraALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_ratificacionCtfALP")
			   {
				   if (
				   data.instance._model.data.ratificacionCtfALP_Admin.state.selected === false && 
				   data.instance._model.data.ratificacionCtfALP_Digit.state.selected === false &&
				   data.instance._model.data.ratificacionCtfALP_Consul.state.selected === false)
				  {
					  $('#ratificacionCtfALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_contratacionesALP")
			   {
				   if (
				   data.instance._model.data.contratacionesALP_Admin.state.selected === false && 
				   data.instance._model.data.contratacionesALP_Digit.state.selected === false &&
				   data.instance._model.data.contratacionesALP_Consul.state.selected === false)
				  {
					  $('#contratacionesALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_contratosSuministrosALP")
			   {
				   if (
				   data.instance._model.data.contratosSuministrosALP_Admin.state.selected === false && 
				   data.instance._model.data.contratosSuministrosALP_Digit.state.selected === false &&
				   data.instance._model.data.contratosSuministrosALP_Consul.state.selected === false)
				  {
					  $('#contratosSuministrosALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_controlGarantiasALP")
			   {
				   if (
				   data.instance._model.data.controlGarantiasALP_Admin.state.selected === false && 
				   data.instance._model.data.controlGarantiasALP_Digit.state.selected === false &&
				   data.instance._model.data.controlGarantiasALP_Consul.state.selected === false)
				  {
					  $('#controlGarantiasALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_controlPagosALP")
			   {
				   if (
				   data.instance._model.data.controlPagosALP_Admin.state.selected === false && 
				   data.instance._model.data.controlPagosALP_Digit.state.selected === false &&
				   data.instance._model.data.controlPagosALP_Consul.state.selected === false)
				  {
					  $('#controlPagosALP').prop('value', permasign);
				  }
				}
				if (data.node.parent === "op_recepcionProduALP")
			   {
				   if (
				   data.instance._model.data.recepcionProduALP_Admin.state.selected === false && 
				   data.instance._model.data.recepcionProduALP_Digit.state.selected === false &&
				   data.instance._model.data.recepcionProduALP_Consul.state.selected === false)
				  {
					  $('#recepcionProduALP').prop('value', permasign);
				  }
				}
	  }
	}).jstree();
	
});