<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String cod = (String) request.getParameter("xcod");
%>
<iframe style="height: 500px; width: 100%;"src="assets/files/<%=cod%>.pdf"></iframe>