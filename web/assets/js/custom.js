
/*=============================================================
    Authour URI: www.binarycart.com
    Version: 1.1
    License: MIT
    
    http://opensource.org/licenses/MIT

    100% To use For Personal And Commercial Use.
   
    ========================================================  */

(function ($) {
    "use strict";
    var mainApp = {

        main_fun: function () {
            /*====================================
            METIS MENU 
            ======================================*/
            $('#main-menu').metisMenu();

            /*====================================
              LOAD APPROPRIATE MENU BAR
           ======================================*/
            $(window).bind("load resize", function () {
                if ($(this).width() < 768) {
                    $('div.sidebar-collapse').addClass('collapse')
                } else {
                    $('div.sidebar-collapse').removeClass('collapse')
                }
            });
            
            var art1 = document.getElementById("txtart1").value;
            var art2 = document.getElementById("txtart2").value;
            var art3 = document.getElementById("txtart3").value;
            var art4 = document.getElementById("txtart4").value;
            var art5 = document.getElementById("txtart5").value;
            var art6 = document.getElementById("txtart6").value;
            var est1 = document.getElementById("txtest1").value;
            var est2 = document.getElementById("txtest2").value;
            var est3 = document.getElementById("txtest3").value;
            var est4 = document.getElementById("txtest4").value;
            var est5 = document.getElementById("txtest5").value;
            var est6 = document.getElementById("txtest6").value;
            /*====================================
            MORRIS BAR CHART
         ======================================*/
            Morris.Bar({
                element: 'morris-bar-chart',
                data: [{
                    y: 'Electro',
                    a: art1
                }, {
                    y: 'Móvil',
                    a: art2
                }, {
                    y: 'Audio',
                    a: art3
                }, {
                    y: 'Cómputo',
                    a: art4
                }, {
                    y: 'Accesorios',
                    a: art5
                }, {
                    y: 'Otros',
                    a: art6
                }],
                xkey: 'y',
                ykeys: ['a'],
                labels: ['Artefactos'],
                hideHover: 'auto',
                resize: true
            });

            /*====================================
          MORRIS DONUT CHART
       ======================================*/
            Morris.Donut({
                element: 'morris-donut-chart',
                data: [{
                    label: "Vigente",
                    value: est1
                },{
                    label: "Finalizado",
                    value: est2
                },{
                    label: "Vigente con Deudas",
                    value: est3
                }, {
                    label: "Expirado con Deudas",
                    value: est4
                }, {
                    label: "Expirado",
                    value: est5
                }, {
                    label: "Inicial",
                    value: est6
                }],
                resize: true
            });

            /*====================================
         MORRIS AREA CHART
      ======================================*/

            Morris.Area({
                element: 'morris-area-chart',
                data: [{
                    period: '2015 Q1',
                    iphone: 6810,
                    ipad: 1914,
                    itouch: 2293
                }, {
                    period: '2015 Q2',
                    iphone: 5670,
                    ipad: 4293,
                    itouch: 1881
                }, {
                    period: '2015 Q3',
                    iphone: 4820,
                    ipad: 3795,
                    itouch: 1588
                }, {
                    period: '2015 Q4',
                    iphone: 15073,
                    ipad: 5967,
                    itouch: 5175
                }, {
                    period: '2016 Q1',
                    iphone: 10687,
                    ipad: 4460,
                    itouch: 2028
                }, {
                    period: '2016 Q2',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }, {
                    period: '2016 Q3',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }, {
                    period: '2016 Q4',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }, {
                    period: '2017 Q1',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }, {
                    period: '2017 Q2',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
                }],
                xkey: 'period',
                ykeys: ['iphone', 'ipad', 'itouch'],
                labels: ['Artefactos', 'Contratos', 'Clientes'],
                pointSize: 2,
                hideHover: 'auto',
                resize: true
            });

            /*====================================
    MORRIS LINE CHART
 ======================================*/
            Morris.Line({
                element: 'morris-line-chart',
                data: [{
                    y: '2006',
                    a: 100,
                    b: 90
                }, {
                    y: '2007',
                    a: 75,
                    b: 65
                }, {
                    y: '2008',
                    a: 50,
                    b: 40
                }, {
                    y: '2009',
                    a: 75,
                    b: 65
                }, {
                    y: '2010',
                    a: 50,
                    b: 40
                }, {
                    y: '2011',
                    a: 75,
                    b: 65
                }, {
                    y: '2012',
                    a: 100,
                    b: 90
                }],
                xkey: 'y',
                ykeys: ['a', 'b'],
                labels: ['Series A', 'Series B'],
                hideHover: 'auto',
                resize: true
            });
           
     
        },

        initialization: function () {
            mainApp.main_fun();

        }

    }
    // Initializing ///

    $(document).ready(function () {
        mainApp.main_fun();
    });

}(jQuery));
