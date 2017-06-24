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
font-size: 16px;">  <label style="text-transform: uppercase">${sessionScope.usuario}</label> &nbsp; <a href="login.jsp" class="btn btn-danger square-btn-adjust">Cerrar Sesión</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li class="text-center">
                        <sql:setDataSource var="cn"
                            driver="com.mysql.jdbc.Driver"
                            url="jdbc:mysql://localhost:3306/coquitocash"
                            user="root" 
                            password="database"/>
                        <sql:query var="sqlFoto" dataSource="${cn}">
                            select p.foto from login as l, empleado as e, persona as p where p.id=e.persona_id and e.login_usuario=l.usuario and l.usuario="${sessionScope.usuario}"
                        </sql:query>
                        <c:forEach  var="fila" items="${sqlFoto.rows}">
                            <c:choose>
                                <c:when test="${fila.foto != null}">
                                    <img src="${fila.foto}" class="user-image img-responsive"/>
                                </c:when>
                                <c:otherwise>
                                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </li>
				
                    <li>
                        <a href="index.jsp"><i class="fa fa-dashboard fa-3x"></i> Tablero Administrativo</a>
                    </li>
                    
                    <!-- ... JSTL block ... -->
                    
                    <c:set var="usuario" value="${sessionScope.usuario}"></c:set>
                    <c:set var="clave" value="${sessionScope.clave}"></c:set>
                    
                     <sql:query var="sqlLogin" dataSource="${cn}">
                         select tipo from login where usuario="${usuario}" and contraseña="${clave}"
                     </sql:query>
                    <c:forEach  var="fila" items="${sqlLogin.rows}">
                        <c:choose>
                            <c:when test="${fila.tipo=='ADMINISTRADOR DE SISTEMA'}">
                                <li>
                                    <a href="#"><i class="fa fa-edit fa-3x"></i> Contrato<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="generarcontrato.jsp">Generar Contrato</a>
                                        </li>
                                        <li>
                                            <a href="gestionarcontrato.jsp">Gestionar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">&nbsp;&nbsp;&nbsp;<i class="fa fa-male fa-3x"></i>&nbsp;&nbsp;&nbsp; Cliente<span class="fa arrow"></span></a>
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
                                    <ul class="nav  navbar-collapse nav-second-level">
                                        <li>
                                            <a class="active-menu" href="reporte1.jsp">Reporte 1</a>
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
                                    <a href="#">&nbsp;&nbsp;&nbsp;<i class="fa fa-male fa-3x"></i>&nbsp;&nbsp;&nbsp; Cliente<span class="fa arrow"></span></a>
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="mantenercliente.jsp">Mantener Cliente</a>
                                        </li>
                                    </ul>
                                </li>
				<li>
                                    <a href="#"><i class="fa fa-bar-chart-o fa-3x"></i> Reportes<span class="fa arrow"></span></a>
                                    <ul class="nav  navbar-collapse nav-second-level">
                                        <li>
                                            <a class="active-menu" href="reporte1.jsp">Reporte 1</a>
                                        </li>
                                        <li>
                                            <a href="reporte2.jsp">Reporte 2</a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:when test="${fila.tipo=='TASADOR'}">
                                <li>
                                    <a href="#">&nbsp;&nbsp;&nbsp;<i class="fa fa-male fa-3x"></i>&nbsp;&nbsp;&nbsp; Cliente<span class="fa arrow"></span></a>
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
                                    <ul class="nav nav-second-level">
                                        <li>
                                            <a href="generarcontrato.jsp">Generar Contrato</a>
                                        </li>
                                    </ul>
                                </li>
                                <li>
                                    <a href="#">&nbsp;&nbsp;&nbsp;<i class="fa fa-male fa-3x"></i>&nbsp;&nbsp;&nbsp; Cliente<span class="fa arrow"></span></a>
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
                <div class="row">
                    <div class="col-md-12">
                     <h2>Reporte 1</h2>
                    </div>
                </div>
                 <!-- /. ROW  -->
                 <hr />
                <!-- ESTADOS CONTRATO -->
                <sql:query var="sqlEst1" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST1";
                </sql:query>
                <sql:query var="sqlEst2" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST2";
                </sql:query>
                <sql:query var="sqlEst3" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST3";
                </sql:query>
                <sql:query var="sqlEst4" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST4";
                </sql:query>
                <sql:query var="sqlEst5" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST5";
                </sql:query>
                <sql:query var="sqlEst6" dataSource="${cn}">
                     SELECT count(*) as n FROM contrato where cod_estado_contrato="EST6";
                </sql:query>
                <c:forEach  var="fila" items="${sqlEst1.rows}">
                    <input type="text" id="txtest1" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlEst2.rows}">
                    <input type="text" id="txtest2" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlEst3.rows}">
                    <input type="text" id="txtest3" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlEst4.rows}">
                    <input type="text" id="txtest4" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlEst5.rows}">
                    <input type="text" id="txtest5" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlEst6.rows}">
                    <input type="text" id="txtest6" value="${fila.n}" hidden="true">
                </c:forEach>
                <!-- /. ESTADOS CONTRATO -->
                <!-- TIPOS ARTEFACTO -->
                <sql:query var="sqlArt1" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA01";
                </sql:query>
                <sql:query var="sqlArt2" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA02";
                </sql:query>
                <sql:query var="sqlArt3" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA03";
                </sql:query>
                <sql:query var="sqlArt4" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA04";
                </sql:query>
                <sql:query var="sqlArt5" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA05";
                </sql:query>
                <sql:query var="sqlArt6" dataSource="${cn}">
                    select count(*) as n from artefacto where tipo_artefacto_id="TA06";
                </sql:query>
                <c:forEach  var="fila" items="${sqlArt1.rows}">
                    <input type="text" id="txtart1" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlArt2.rows}">
                    <input type="text" id="txtart2" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlArt3.rows}">
                    <input type="text" id="txtart3" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlArt4.rows}">
                    <input type="text" id="txtart4" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlArt5.rows}">
                    <input type="text" id="txtart5" value="${fila.n}" hidden="true">
                </c:forEach>
                <c:forEach  var="fila" items="${sqlArt6.rows}">
                    <input type="text" id="txtart6" value="${fila.n}" hidden="true">
                </c:forEach>
                <!-- /. TIPOS ARTEFACTO -->
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-xs-12">                     
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Artefactos por Tipo
                            </div>
                            <div class="panel-body">
                                <div id="morris-bar-chart"></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12 col-sm-12 col-xs-12">                     
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                Estado de Contratos
                            </div>
                            <div class="panel-body">
                                <div id="morris-donut-chart"></div>
                            </div>
                        </div>            
                    </div>
                </div>
                 <!-- /. ROW  -->            
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