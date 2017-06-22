<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>COQUITO CASH</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.jsp">Coquito Cash</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;">  <label style="text-transform: uppercase">${sessionScope.usuario}</label>&nbsp; <a href="login.jsp" class="btn btn-danger square-btn-adjust">Cerrar Sesión</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
					</li>
				
                    <li>
                        <a href="index.jsp"><i class="fa fa-dashboard fa-3x"></i> Tablero Administrativo</a>
                    </li>
                    
                    <!-- ... JSTL block ... -->
                    
                    <c:set var="usuario" value="${sessionScope.usuario}"></c:set>
                    <c:set var="clave" value="${sessionScope.clave}"></c:set>
                    
                    <sql:setDataSource var="cn" 
                                        driver="com.mysql.jdbc.Driver" 
                                        url="jdbc:mysql://localhost:3306/coquitocash" 
                                        user="root" 
                                        password="database"/>
                     <sql:query var="sqlLogin" dataSource="${cn}">
                         select tipo from login where usuario="${usuario}" and contraseña="${clave}"
                     </sql:query>
                    <c:forEach  var="fila" items="${sqlLogin.rows}">
                        <c:choose>
                            <c:when test="${fila.tipo=='ADMINISTRADOR DE SISTEMA'}">
                                <li>
                                    <a href="#"><i class="fa fa-edit fa-3x"></i> Contrato<span class="fa arrow"></span></a>
                                    <ul class="nav navbar-collapse nav-second-level">
                                        <li>
                                            <a class="active-menu" href="generarcontrato.jsp">Generar Contrato</a>
                                        </li>
                                        <li>
                                            <a href="gestionarcontrato.jsp">Gestionar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-table fa-3x"></i> Cliente<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="mantenercliente.jsp">Mantener Cliente</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-desktop fa-3x"></i> Artefacto<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="cotizarartefacto.jsp">Cotizar Artefacto</a>
                                        </li>
                                    </ul>
                                </li>
				<li>
                                    <a href="#"><i class="fa fa-bar-chart-o fa-3x"></i> Reportes<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="reporte1.jsp">Reporte 1</a>
                                        </li>
                                        <li>
                                            <a href="reporte2.jsp">Reporte 2</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${fila.tipo=='ADMINISTRADOR'}">
                                <li>
                                    <a href="#"><i class="fa fa-edit fa-3x"></i> Contrato<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="gestionarcontrato.jsp">Gestionar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-table fa-3x"></i> Cliente<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="mantenercliente.jsp">Mantener Cliente</a>
                                        </li>
                                    </ul>
                                </li>
				<li>
                                    <a href="#"><i class="fa fa-bar-chart-o fa-3x"></i> Reportes<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="reporte1.jsp">Reporte 1</a>
                                        </li>
                                        <li>
                                            <a href="reporte2.jsp">Reporte 2</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${fila.tipo=='TASADOR'}">
                                <li>
                                    <a href="#"><i class="fa fa-table fa-3x"></i> Cliente<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="mantenercliente.jsp">Mantener Cliente</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-desktop fa-3x"></i> Artefacto<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="cotizarartefacto.jsp">Cotizar Artefacto</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${fila.tipo=='ASISTENTE DE EMPENO'}">
                                <li>
                                    <a href="#"><i class="fa fa-edit fa-3x"></i> Contrato<span class="fa arrow"></span></a>
                                    <ul class="nav navbar-collapse nav-second-level">
                                        <li>
                                            <a class="active-menu" href="generarcontrato.jsp">Generar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#"><i class="fa fa-table fa-3x"></i> Cliente<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="mantenercliente.jsp">Mantener Cliente</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${fila.tipo=='ENCARGADO DE ALMACEN'}">
                                <li>
                                    <a href="#"><i class="fa fa-edit fa-3x"></i> Contrato<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="gestionarcontrato.jsp">Gestionar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>
                                No se encontraron opciones <br>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <!-- ... JSTL block ... -->
                    
                    	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <!-- ROW 1  -->
                <div class="row">
                    <div class="col-md-12">
                        <h2>Generar Contrato</h2>
                    </div>
                </div>
                <!-- /. ROW 1 -->
                <hr />
                <!-- ROW 2 -->
                <div class="row">
                    <!-- PANEL 1  -->
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Cliente
                            </div>
                            <div class="panel-body">
                                <label>Dni</label>
                                <div class="form-group input-group">
                                    
                                    <input type="text" class="form-control"/>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">
                                            <i class="fa fa-search"></i>
                                        </button>
                                    </span>
                                </div>
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Dni*</th><th>Nombres</th><th>Apellido Paterno</th><th>Apellido Materno</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>
                                                <div class="form-group">
                                                    <p class="form-control-static">-</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <p class="form-control-static">-</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <p class="form-control-static">-</p>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="form-group">
                                                    <p class="form-control-static">-</p>
                                                </div>
                                            </td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row text-center">
                                    <!--<button type="button" class="btn btn-default"><i class="fa fa-search"></i> Consultar</button>-->
                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i> Nuevo</button>
                                </div>
                            </div>
                            <!-- MODAL CLIENTE -->
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form role="form">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Nuevo Cliente</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table>
                                                <tbody>
                                                        <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Dni*</label>
                                                                <input class="form-control" placeholder="00000000" />
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Teléfono</label>
                                                                <input class="form-control" placeholder="000-0000" />
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td rowspan="2" class="text-center">
                                                            <img src="assets/img/find_user.png">
                                                        </td>
                                                        <!--<td rowspan="7">
                                                            <canvas height="100px" width="100px"></canvas>
                                                        </td>-->
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Nombres*</label>
                                                                <input class="form-control"/>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Dirección*</label>
                                                                <input class="form-control"/>
                                                            </div>
                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Apellido Paterno*</label>
                                                                <input class="form-control"/>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Departamento*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Nacimiento*</label>
                                                                <input type="date" class="form-control">
                                                            </div>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Apellido Materno*</label>
                                                                <input class="form-control"/>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Provincia*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Correo*</label>
                                                                <input class="form-control" placeholder="ejemplo@mail.com" />
                                                            </div>
                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Género*</label>
                                                                <br>                                                            
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked />Masculino
                                                                    </label>
                                                                </div>
                                                                <div class="radio">
                                                                    <label>
                                                                        <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2"/>Femenino
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Distrito*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </div>
                                                        </td>
                                                        <td>&nbsp;&nbsp;&nbsp;</td>
                                                        <td>
                                                            <div class="form-group">
                                                                <label>Ruc</label>
                                                                <input class="form-control"/>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <!--<button type="button" class="btn btn-primary">Guardar</button>-->
                                            <button type="reset" class="btn btn-primary">Limpiar</button>
                                            <button type="submit" class="btn btn-default">Guardar</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /. MODAL CLIENTE -->
                            <!-- MODAL ARTEFACTO -->
                            <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form role="form">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                            <h4 class="modal-title" id="myModalLabel">Agregar Artefacto</h4>
                                        </div>
                                        <div class="modal-body">
                                            <table class="table">
                                                <div class="form-group">
                                                    <tbody>
                                                        <tr>
                                                            <td>
                                                                <label>Monto*</label>
                                                                <input class="form-control" />
                                                            </td>
                                                            <td rowspan="5">
                                                                <fieldset>
                                                                    <div class="text-center">
                                                                    <legend>Fotos</legend>
                                                                        <img src="assets/img/find_user.png">
                                                                            <br><br><hr>
                                                                        <img src="assets/img/find_user.png">
                                                                    </div>
                                                                </fieldset>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Descripción*</label>
                                                                <input class="form-control" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Conservación*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Tipo*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Marca*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <label>Modelo*</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                            </td>
                                                            <td>
                                                                <label>Observación</label>
                                                                <textarea class="form-control"></textarea>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </div>
                                            </table>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            <!--<button type="button" class="btn btn-primary">Guardar</button>-->
                                            <button type="reset" class="btn btn-primary">Limpiar</button>
                                            <button type="submit" class="btn btn-default">Guardar</button>
                                        </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /. MODAL ARTEFACTO -->
                            <!-- MODAL MARCA Y MODELO -->
                            <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <form role="form">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                <h4 class="modal-title" id="myModalLabel">Marca y Modelo</h4>
                                            </div>
                                            <div class="modal-body" id="accordion">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" class="collapsed">Nueva Marca</a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse" style="height: 0px;">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label>Nombre*</label>
                                                                <input class="form-control"/>
                                                                <br>
                                                                <button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Agregar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo">Nuevo Modelo</a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseTwo" class="panel-collapse in" style="height: auto;">
                                                        <div class="panel-body">
                                                            <div class="form-group">
                                                                <label>Marca</label>
                                                                <select class="form-control">
                                                                    <option>One Vale</option>
                                                                    <option>Two Vale</option>
                                                                    <option>Three Vale</option>
                                                                    <option>Four Vale</option>
                                                                </select>
                                                                <br>
                                                                <label>Nombre</label>
                                                                <input class="form-control"/>
                                                                <br>
                                                                <button type="button" class="btn btn-default"><i class="fa fa-plus"></i> Agregar</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
                                            </div>
                                        </form>
                                    </div>
                                </div> 
                            </div>
                            <!-- /. MODAL MARCA Y MODELO -->
                        </div>
                    </div> 
                    <!-- /. PANEL 1  -->
                </div>
                <!-- /. ROW 2 -->
                <!-- TABLA -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Artefactos
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>CÓDIGO</th>
                                                <th>DESCRIPCIÓN</th>
                                                <th>MARCA</th>
                                                <th>MODELO</th>
                                                <th>CONSERVACIÓN</th>
                                                <th>TASACIÓN</th>
                                                <th>TIPO</th>
                                            </tr>
                                        </thead>
                                        <tbody>          
                                            <tr>
                                                <td>1</td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td><button type="button" class="btn btn-default"><i class="fa fa-trash"></i></button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row text-center ">
                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i> Añadir</button>
                                    <button type="button" class="btn btn-default" data-toggle="modal" data-target="#myModal3"><i class="fa fa-plus" ></i>  Marca y Modelo</button>
                                </div>
                           </div>
                        </div>
                    </div>
                </div>
                <!-- /. TABLA -->
                <!-- ROW -->
                <div class="row">
                    <!-- PANEL 3  -->
                    <div class="col-md-12" >
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Contrato
                            </div>
                            <div class="panel-body">
                                <div class="table-responsive">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th>Subtotal</th><th>Mora</th><th>Interés</th><th>Vencimiento</th><th>Total</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <div class="form-group">
                                                        <p class="form-control-static">-</p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <p class="form-control-static">-</p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <p class="form-control-static">- %</p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <p class="form-control-static">-/-/-</p>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div class="form-group">
                                                        <p class="form-control-static">-</p>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <div class="form-group">
                                                        <label>Días</label>
                                                        <select class="form-control">
                                                            <option>One Vale</option>
                                                            <option>Two Vale</option>
                                                            <option>Three Vale</option>
                                                            <option>Four Vale</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td colspan="4">
                                                    <label>Monto Préstamo* </label>
                                                    <div class="form-group input-group">
                                                        <span class="input-group-addon">S/.</span>
                                                        <input type="text" class="form-control">
                                                        <span class="input-group-addon">.00</span>
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row text-center ">
                                    <button type="button" class="btn btn-primary"><i class="fa fa-save"></i> Generar</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /. PANEL 3  -->
                </div>
                <!-- ROW -->
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
     <!-- MORRIS CHART SCRIPTS -->
     <script src="assets/js/morris/raphael-2.1.0.min.js"></script>
    <script src="assets/js/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
    
   
</body>
</html>
