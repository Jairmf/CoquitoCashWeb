<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<sql:setDataSource var="cn"
    driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost:3306/coquitocash"
    user="root"
    password="database"/>
<sql:update var="updEst" dataSource="${cn}">
    UPDATE contrato SET cod_estado_contrato="${param.selEstadosContrato}" WHERE cod_contrato="${sessionScope.codCont}";
</sql:update>
<c:redirect url="http://localhost:8084/CoquitoCash/gestionarcontrato.jsp"></c:redirect>