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
            <!--JSTL validacion-->
            <c:if test="${param.txtusuario != null}" > 
                <c:set var="usuario" scope="session" value="${param.txtusuario}"></c:set>
                <c:set var="clave" scope="session" value="${param.txtclave}"></c:set>
            </c:if>
            <!--JSTL validacion-->
  <div style="color: white;padding: 15px 50px 5px 50px;float: right;font-size: 16px;">
      <label style="text-transform: uppercase">${sessionScope.usuario}</label>&nbsp; <a href="login.jsp" class="btn btn-danger square-btn-adjust">Cerrar Sesión</a> </div>
        </nav>
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>
				</li>
                    <li>
                        <a class="active-menu"  href="index.jsp"><i class="fa fa-dashboard fa-3x"></i> Tablero Administrativo</a>
                    </li>
                    
                    <!-- ... JSTL block ... -->
                    
                    <sql:setDataSource var="cn"
                                        driver="com.mysql.jdbc.Driver"
                                        url="jdbc:mysql://localhost:3306/coquitocash"
                                        user="root" 
                                        password="database"/>
                     <sql:query var="sqlLogin" dataSource="${cn}">
                         select tipo from login where usuario="${sessionScope.usuario}" and contraseña="${sessionScope.clave}"
                     </sql:query>
                    <c:set var="x" scope="session" value="0"></c:set>
                    <c:forEach  var="fila" items="${sqlLogin.rows}">
                        <c:choose>
                            <c:when test="${fila.tipo=='ADMINISTRADOR DE SISTEMA'}">
                                <c:set var="x" scope="session" value="1"></c:set>
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
                                <c:set var="x" scope="session" value="1"></c:set>
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
                                <c:set var="x" scope="session" value="1"></c:set>
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
                                <c:set var="x" scope="session" value="1"></c:set>
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
                                <c:set var="x" scope="session" value="1"></c:set>
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
                    <c:if test="${x!=1}">
                        <c:redirect url="http://localhost:8084/CoquitoCash/login.jsp"></c:redirect>
                    </c:if>
                    <!-- ... JSTL block ... -->
                    
                    	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner"> 
                <div class="row">
                    <div class="col-md-12">
                     <h2>Tablero Administrativo</h2>   
                        <c:forEach  var="fila" items="${sqlLogin.rows}">
                            <h5>Bienvenido ${fila.tipo}. Encantado de verte de vuelta. </h5>
                        </c:forEach>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                  <hr />
                  <div class="row text-center">
                    <img src="assets/img/coquito.png">
                </div>
                 <!-- /. ROW  -->   
                 <hr /> 
                <div class="row">
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                            <div class="panel panel-back noti-box">
                                <span class="icon-box bg-color-blue set-icon">
                                    <i class="fa fa-envelope-o"></i>
                                </span>
                                <div class="text-box" >
                                    <sql:query var="sqlCont" dataSource="${cn}">
                                         SELECT count(*) as n FROM contrato;
                                    </sql:query>
                                    <c:forEach  var="fila" items="${sqlCont.rows}">
                                        <p class="main-text">${fila.n} Nuevos</p>
                                    </c:forEach>
                                    <p class="text-muted">Contratos</p>
                                </div>
                             </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-brown set-icon">
                                <i class="fa fa-male"></i>
                            </span>
                            <div class="text-box" >
                                <sql:query var="sqlClie" dataSource="${cn}">
                                    SELECT count(*) as n FROM cliente as c, persona as p where p.id=c.persona_id;
                                </sql:query>
                                <c:forEach  var="fila" items="${sqlClie.rows}">
                                   <p class="main-text">${fila.n} Registrados</p>
                                </c:forEach>
                                <p class="text-muted">Clientes</p>
                            </div>
                         </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-ban"></i>
                            </span>
                            <div class="text-box" >
                                <sql:query var="sqlVige" dataSource="${cn}">
                                    SELECT count(*) as n FROM coquitocash.contrato where cod_estado_contrato="EST2";
                                </sql:query>
                                <c:forEach  var="fila" items="${sqlVige.rows}">
                                   <p class="main-text">${fila.n} Inactivos</p>
                                </c:forEach>
                                <p class="text-muted">Contratos</p>
                            </div>
                         </div>
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-paper-plane"></i>
                            </span>
                            <div class="text-box" >
                                <sql:query var="sqlVige" dataSource="${cn}">
                                    SELECT count(*) as n FROM contrato where cod_estado_contrato="EST1";
                                </sql:query>
                                <c:forEach  var="fila" items="${sqlVige.rows}">
                                   <p class="main-text">${fila.n} Vigentes</p>
                                </c:forEach>
                                <p class="text-muted">Contratos</p>
                            </div>
                         </div>
                     </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-archive"></i>
                            </span>
                            <div class="text-box" >
                                <sql:query var="sqlAlm" dataSource="${cn}">
                                    SELECT count(*) as n FROM artefacto;
                                </sql:query>
                                <c:forEach  var="fila" items="${sqlAlm.rows}">
                                   <p class="main-text">${fila.n} en Almacén</p>
                                </c:forEach>
                                <p class="text-muted">Artefactos</p>
                            </div>
                         </div>
                     </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">           
                        <div class="panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-building"></i>
                            </span>
                            <div class="text-box" >
                                <sql:query var="sqlEmp" dataSource="${cn}">
                                    SELECT count(*) as n FROM empleado
                                </sql:query>
                                <c:forEach  var="fila" items="${sqlEmp.rows}">
                                   <p class="main-text">${fila.n} Activos</p>
                                </c:forEach>
                                <p class="text-muted">Empleados</p>
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
