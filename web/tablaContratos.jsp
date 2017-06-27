<%@page import="br.contratobr"%>
<%@page import="java.util.List"%>
<%@page import="be.contratobe"%>
<%@page import="br.bandejaContratos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<table id="tblcursosmat" class="table table-striped table-bordered table-hover">  
    <thead>
        <tr>
            <th>#</th>
            <th>CÓDIGO</th>
            <th>ESTADO</th>
            <th>PRESTAMO</th>
            <th>INICIO</th>
            <th>VENCIMIENTO</th>
        </tr>
    </thead>
    <tbody>
        <%
            String est = (String) request.getParameter("xest");
            String fec = (String) request.getParameter("xfec");
            String tipo = (String) request.getParameter("vtipo");
            
            contratobr r = new contratobr();
            List<contratobe> listaF;
            if(tipo.equals("1")){
                if(fec.equals("")){
                    listaF = r.listaContratosFiltradosSoloEst(est);
                }else{
                    listaF = r.listaContratosFiltrados(est, fec);
                }
            }else{
                listaF = r.listaContratos();
            }
            
            
            /*contratobe e = new contratobe();
            
            e.setCod_contrato(request.getParameter("xcod"));
            e.setCod_estado_contrato(request.getParameter("xest"));
            e.setMonto(Double.parseDouble(request.getParameter("xmon")));
            e.setFec_inicio_cont(request.getParameter("xini"));
            e.setFec_vencimiento(request.getParameter("xven"));
            
            bandejaContratos b = (bandejaContratos)session.getAttribute("bandeja");
            if(b==null){
                b=new bandejaContratos();
            }
            if(request.getParameter("vtipo").equals("1")){
                b.agregar(e);
            }else{
                b.eliminar(e.getCod_contrato());
            }
            session.setAttribute("bandeja", b);
            List<contratobe> lista = b.getLista();*/
            int cont=0;
            for(contratobe x:listaF){
                cont++;
                %>
                <tr>
                    <td><%=cont%></td>
                    <td><%=x.getCod_contrato()%></td>
                    <td><%=x.getCod_estado_contrato()%></td>
                    <td><%=x.getMonto()%></td>
                    <td><%=x.getFec_inicio_cont()%></td>
                    <td><%=x.getFec_vencimiento()%></td>
                    <td><button type="button" onclick="abrirModificar('<%=x.getCod_contrato()%>')" class="btn btn-default" data-toggle="modal" data-target="#myModal1"><i class="fa fa-edit"></i></button></td>
                    <td><button type="button" onclick="abrirAlmacenar('<%=x.getCod_contrato()%>')" class="btn btn-default" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i></button></td>
                    <td><button type="button" onclick="abrirPDF('<%=x.getCod_contrato()%>')" class="btn btn-default" data-toggle="modal" data-target="#myModal3"><i class="fa fa-file-pdf-o"></i></button></td>
                </tr>
        <%
            }
        %>
    </tbody>
</table>