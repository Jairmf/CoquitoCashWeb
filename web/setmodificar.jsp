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
<sql:query var="sqlConMod" dataSource="${cn}">
    select * from contrato as c, cliente as cl, persona as p where p.id=cl.persona_id and cl.persona_id=c.cod_cliente and c.cod_contrato="${codCont}"
</sql:query>

<sql:query var="sqlEstCon" dataSource="${cn}">
    select * from estado_contrato
</sql:query>
<table class="table">
    <div class="form-group">
        <tbody>
            <c:forEach  var="fila" items="${sqlConMod.rows}">
            <tr>
                <td>
                    <label>Fecha Inicio</label>
                    <p class="form-control-static" />${fila.fec_inicio_cont}</p>
                </td>
                <td>
                    <label>Interes</label>
                    <p class="form-control-static" />${fila.interes} %</p>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Fecha Vencimiento</label>
                    <p class="form-control-static" />${fila.fec_vencimiento}</p>
                </td>
                <td>
                    <label>Prestamo Maximo</label>
                    <p class="form-control-static" />S/. ${fila.prestamoMax}</p>
                </td>
            </tr>
            <tr>
                <td>
                    <label>Dias de Empeño</label>
                    <p class="form-control-static" />${fila.diasEmpenio}</p>
                </td>
                <td>
                    <label>Nombre Cliente</label>
                    <p class="form-control-static" />${fila.ape_paterno} ${fila.ape_matero} ${fila.nombre}</p>
                </td>
            </tr>
            <tr>
                    <td>
                    <label>Monto</label>
                    <p class="form-control-static" />S/. ${fila.monto}</p>
                </td>
                <td>
                    <label>Estado</label>
                    <select class="form-control" name="selEstadosContrato">
                        <c:forEach  var="fila2" items="${sqlEstCon.rows}">
                            <c:choose>
                                <c:when test="${fila.cod_estado_contrato==fila2.id}">
                                    <option value="${fila2.id}" selected="selected">${fila2.estado}</option>
                                </c:when>
                                <c:otherwise>
                                    <option value="${fila2.id}">${fila2.estado}</option>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            </c:forEach>
        </tbody>
    </div>
</table>