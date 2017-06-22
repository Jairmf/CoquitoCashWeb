<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose>
    <c:when test="${param.selweb == '1'}">
        <c:redirect url="https://www.olx.com.pe/nf/search/${param.txtartefacto}%20${param.txtmarca}"></c:redirect>
    </c:when>
    <c:when test="${param.selweb == '2'}">
        <c:redirect url="https://www.linio.com.pe/search?q=${param.txtartefacto}+${param.txtmarca}"></c:redirect>
    </c:when>
</c:choose>