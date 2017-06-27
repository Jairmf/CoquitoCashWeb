function consultarCont(){
    var a = document.getElementById("selEstado").value;
    var b = document.getElementById("dcInicio").value;
    parametros = {
        xest: a,
        xfec: b,
        vtipo: "1"
    };
    $.ajax({
       data: parametros,
       url: "tablaContratos.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dcontratos").innerHTML=response;
        }
    });
}
function verTodosCont(){
    parametros = {
        xest: "",
        xfec: "",
        vtipo: "2"
    };
    $.ajax({
       data: parametros,
       url: "tablaContratos.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dcontratos").innerHTML=response;
        }
    });
}
function abrirPDF(a){
    parametros = {
        xcod: a
    };
    $.ajax({
       data: parametros,
       url: "setpdf.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("pdfmodal").innerHTML=response;
        }
    });
}
function abrirModificar(a){
    parametros = {
        xcod: a
    };
    $.ajax({
       data: parametros,
       url: "setmodificar.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dmodificar").innerHTML=response;
        }
    });
}
function abrirAlmacenar(a){
    limpiarAlmacen();
    parametros = {
        xcod: a
    };
    $.ajax({
       data: parametros,
       url: "setalmacen.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dartefactos").innerHTML=response;
        }
    });
}
function mostrarArtefacto(a){
    parametros = {
        xcod: a
    };
    $.ajax({
       data: parametros,
       url: "setartefacto.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dsartefacto").innerHTML=response;
        }
    });
}
function limpiarAlmacen(){
    parametros = {
        xcod: ""
    };
    $.ajax({
       data: parametros,
       url: "setlimpiaralmacen.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dsartefacto").innerHTML=response;
        }
    });
}
function agregarAlmacen(){
    var a = document.getElementById("selAlmacen").value;
    var b = document.getElementById("dcInicio").value;
    parametros = {
        xest: a,
        xfec: b,
        vtipo: "1"
    };
    $.ajax({
       data: parametros,
       url: "tablaContratos.jsp",
       type: 'POST',
       success: function (response) {
            document.getElementById("dcontratos").innerHTML=response;
        }
    });
}

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
            document.getElementById("dcontratos").innerHTML=response;
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
            document.getElementById("dcontratos").innerHTML=response;
        }
    });
}
verTodosCont();
limpiarAlmacen();