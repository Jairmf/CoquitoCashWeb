<%-- 
    Document   : agregarcursos
    Created on : 06/05/2017, 05:29:10 AM
    Author     : Estudiante
--%>

<%@page import="be.contratobe"%>
<%@page import="java.util.List"%>
<%@page import="br.contratobr"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    contratobr r = new contratobr();
    List<contratobe> lista = r.listaContratos();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="jquery-3.2.0.min.js"></script>
        <script>
            function agregar(a,b,c,d,e){
                //document.write("<tr><td>"+id+"</td><td>"+nombre+"</td><td>"+creditos+"</td></tr>");
                parametros = {
                    xcod: a,
                    xest: b,
                    xmon: c,
                    xini: d,
                    xven: e,
                    vtipo:"1"
                };
                $.ajax({
                   data: parametros,
                   url: "tablaContratos.jsp",
                   type: 'POST',
                   success: function (response) {
                        document.getElementById("dcursos").innerHTML=response;
                    }
                });
            }
            function eliminar(xcod){
                parametros = {
                    xcod: xcod,
                    xest: "",
                    xmon: "0",
                    xini: "",
                    xven: "",
                    vtipo:"2"
                };
                $.ajax({
                   data: parametros,
                   url: "tablaContratos.jsp",
                   type: 'POST',
                   success: function (response) {
                        document.getElementById("dcursos").innerHTML=response;
                    }
                });
            }

        </script>
    </head>
    <body>
        <table id="tblcursos" border="colapse" width="50%" style="font-family: arial, sans-serif; border-collapse: collapse">
            <thead style="border: 1px solid #009933; text-align: left; padding: 8px; background-color: green; color: white">
                    <tr>
                        <th>#</th>
                        <th>CÓDIGO</th>
                        <th>ESTADO</th>
                        <th>PRESTAMO</th>
                        <th>INICIO</th>
                        <th>VENCIMIENTO</th>
                    </tr>
            </thead>
            <tbody style="border: 1px solid #009933; text-align: left; padding: 8px;">
            <%
                int cont=0;
                for(contratobe e:lista){
                    cont++;
                    %>
                    <tr>
                        <td><%=cont%></td>
                        <td><%=e.getCod_contrato()%></td>
                        <td><%=e.getCod_estado_contrato()%></td>
                        <td><%=e.getMonto()%></td>
                        <td><%=e.getFec_inicio_cont()%></td>
                        <td><%=e.getFec_vencimiento()%></td>
                        <td><input type="button" value="Agregar" onclick="agregar('<%=e.getCod_contrato()%>','<%=e.getCod_estado_contrato()%>',<%=e.getMonto()%>,'<%=e.getFec_inicio_cont()%>','<%=e.getFec_vencimiento()%>')"></td>
                    </tr>
            <%
                }
            %>
            </tbody>
        </table>
            <br>
        <div id="dcursos">
            
        </div>
        
        
    </body>
</html>
