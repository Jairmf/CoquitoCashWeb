<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    String cod = (String) request.getParameter("xcod");
    session.setAttribute("codArt", cod);
%>
<sql:setDataSource var="cn"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coquitocash"
    user="root" 
    password="database"/>

<sql:query var="sqlVerArt" dataSource="${cn}">
    select a.contrato_id as cont, a.cod_artefacto as art, a.descripcion as des, a.tasacion as tas, t.tipo as tip, e.nombre as est, a.dato_adicional as dat, s.estado as sta, m.modelo as md from artefacto as a, esta_conserva as e, tipo_artefacto as t, modelo as m,estado_artefacto as s where a.estado_artefacto_id=s.id and a.esta_conserva_id=e.id and a.tipo_artefacto_id=t.id and a.modelo_id=m.id and a.cod_artefacto="${codArt}"
</sql:query>
  
<table>
    <tbody>
        <c:forEach  var="fila" items="${sqlVerArt.rows}">
            <tr>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Codigo Contrato</label>
                        <p class="form-control-static" >${fila.contrato_id}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Código Artefacto</label>
                        <p class="form-control-static" >${fila.cod_artefacto}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td rowspan="2" >
                    <img style="height: 200px;width: 200px" src="assets/img/artefactos/${fila.cod_artefacto}.jpg">
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Descripción</label>
                        <p class="form-control-static" >${fila.descripcion}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Tasación</label>
                        <p class="form-control-static" >${fila.tasacion}</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Tipo</label>
                        <p class="form-control-static" >${fila.tipo}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Estado</label>
                        <p class="form-control-static" >${fila.estado}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td rowspan="2">
                    <div class="form-group">
                        <label>Observaciones</label>
                        <p class="form-control-static" >${fila.dato_adicional}</p>
                    </div>
                </td>
            </tr>
            <tr>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Conservación</label>
                        <p class="form-control-static" >${fila.nombre}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                    <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <div class="form-group">
                        <label>Modelo</label>
                        <p class="form-control-static" >${fila.modelo}</p>
                    </div>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </c:forEach>
    </tbody>
</table>