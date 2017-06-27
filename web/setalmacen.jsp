<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    String cod = (String) request.getParameter("xcod");
    session.setAttribute("codCont", cod);
%>
<sql:setDataSource var="cn"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coquitocash"
    user="root" 
    password="database"/>
<sql:query var="sqlConArt" dataSource="${cn}">
    select * from artefacto where contrato_id="${codCont}"
</sql:query>

<table class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>CODIGO</th>
            <th>DESCRIPCION</th>
            <th>TASACION</th>
            <th>TIPO</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach  var="fila" items="${sqlConArt.rows}">
            <tr>
                <td></td>
                <td>${fila.cod_artefacto}</td>
                <td>${fila.descripcion}</td>
                <td>${fila.tasacion}</td>
                <td>${fila.tipo_artefacto_id}</td>
                <td><button type="button" onclick="mostrarArtefacto('${fila.cod_artefacto}')" class="btn btn-default"><i class="fa fa-eye"></i></button></td>
                <td><input type="checkbox" id="${fila.cod_artefacto}"></td>
            </tr>
        </c:forEach>
    </tbody>
</table>