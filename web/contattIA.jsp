<%-- 
    Document   : home
    Created on : 13-ago-2013, 11.28.03
    Author     : marco.bonamente
--%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/ui.jqgrid.css" rel="stylesheet" type="text/css">
        <link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css">
        <style type="text/css">
            body{
                margin-left: 0px;
                margin-right: 0px;
            }
            #Header_index {
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:20px;
                box-shadow: 3px 3px 3px 2px #666666;
                height: 40px;
                width: 100%;
                margin-right: 0px;
                margin-left: 0px;
                display:table;
            }
            span.Header_title{
                display:table-cell;
                vertical-align:middle;
            }
            span#Header_CloudIA{
                width:140px;
            }
            .div_button_left{
                position: absolute;
                background-color: black;
                width: 32px;
            }

            .button_left,
            .button_right{ 
                border: none;
                margin-left: 0px;
                box-shadow: 3px 3px 3px 2px black;                

            }
            .note_alert{
                position: absolute;
                width: 250px;
                background-color: black;
            }

            .note_container{
                height: 180px;
                overflow:auto;
            }
            .note_container_title{
                background: white;
                margin-top: 2px;
                text-align: center;
                width: 100%;
                margin-left: 0px;
                margin-bottom: 2px;
            }
            .note_container_button{
                border: none;
                margin-top: 0px;
                box-shadow: 3px 3px 3px 2px black; 
                margin-left: 100px;
                margin-bottom: 0px;
            }
            .note{
                box-shadow: 3px 3px 3px 2px white;
                background-color: white;
                width: 240px;
                padding-left: 5px;
                height: 70px;
                margin-bottom: 5px;

            }
            .highlight{
                background-color: gainsboro;
            }
            .note_title{
                font-weight: bold;
                font-size: 75%;
                position: relative;
                margin-left: 45px;
                margin-top: -45px;
                width: 190px;
            }

            .note_image{
                width: 42px;
                height: 42px;
            }

            .note_text{
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:70%;
                margin-left: 45px;
                width: 190px;

            }
            .alert_container{
                height: 200px;
                overflow:auto;      
            }
            .alert{
                box-shadow: 3px 3px 3px 2px white;
                background-color: white;
                width: 240px;
                padding-left: 5px;
                height: 70px;
                margin-bottom: 5px;

            }            
            .alert_container_title{
                margin-bottom: 2px;
                background: white;
                margin-top: 2px;
                text-align: center;
                width: 100%;
                margin-left: 0px;
            }
            .calendar{
                margin:.25em 10px 10px 0;
                padding-top:5px;
                float:left;
                width:60px;
                background:#ededef;
                background: -webkit-gradient(linear, left top, left bottom, from(#ededef), to(#ccc)); 
                background: -moz-linear-gradient(top,  #ededef,  #ccc); 
                font:bold 25px/35px Arial Black, Arial, Helvetica, sans-serif;
                text-align:center;
                color:#000;
                text-shadow:#fff 0 1px 0;	
                -moz-border-radius:3px;
                -webkit-border-radius:3px;
                border-radius:3px;	
                position:relative;
                -moz-box-shadow:0 2px 2px #888;
                -webkit-box-shadow:0 2px 2px #888;
                box-shadow:0 2px 2px #888;
            }            

            .calendar em{
                display:block;
                font:normal bold 11px/18px Arial, Helvetica, sans-serif;
                color:#fff;
                text-shadow:#00365a 0 -1px 0;	
                background:#04599a;
                background:-webkit-gradient(linear, left top, left bottom, from(#04599a), to(#00365a)); 
                background:-moz-linear-gradient(top,  #04599a,  #00365a); 
                -moz-border-radius-bottomright:3px;
                -webkit-border-bottom-right-radius:3px;	
                border-bottom-right-radius:3px;
                -moz-border-radius-bottomleft:3px;
                -webkit-border-bottom-left-radius:3px;	
                border-bottom-left-radius:3px;	
                border-top:1px solid #00365a;
            }    

            .calendar:before, .calendar:after{
                content:'';
                float:left;
                position:absolute;
                top:5px;	
                width:8px;
                height:8px;
                background:#111;
                z-index:1;
                -moz-border-radius:10px;
                -webkit-border-radius:10px;
                border-radius:10px;
                -moz-box-shadow:0 1px 1px #fff;
                -webkit-box-shadow:0 1px 1px #fff;
                box-shadow:0 1px 1px #fff;
            }
            .calendar:before{left:11px;}	
            .calendar:after{right:11px;}

            .calendar em:before, .calendar em:after{
                content:'';
                float:left;
                position:absolute;
                top:-5px;	
                width:4px;
                height:14px;
                background:#dadada;
                background:-webkit-gradient(linear, left top, left bottom, from(#f1f1f1), to(#aaa)); 
                background:-moz-linear-gradient(top,  #f1f1f1,  #aaa); 
                z-index:2;
                -moz-border-radius:2px;
                -webkit-border-radius:2px;
                border-radius:2px;
            }
            .calendar em:before{left:13px;}	
            .calendar em:after{right:13px;}	            


            .sezione{
                position: absolute;
            }

            .ui-jqgrid{
                margin-left: 60px;
                margin-top: 20px;
            }

            .inputbutton{
                background-color: black;
                height: 32px;
            }
            .div_button_right{
                position: absolute;
                background-color: black;
                width: 32px;
            }            

            .left_panel{
                position: absolute;
                background-color: black;
                width: 1200px;
            }
            #map{
                height: 800px;
                width: 1190px;
                border: 2px solid black;
            }

            .arrow_right_small{
                width: 26px;    
                height: 26px;
                background: white;
                background-image: url(css/images/right_round-26.png);
            }
            .arrow_right_medium{
                width: 32px;    
                height: 32px;
                background: white;
                background-image: url(css/images/right_round-32.png);
            }      

            .arrow_left_small{
                width: 26px;    
                height: 26px;
                background: white;
                background-image: url(css/images/left_round-26.png);
            }
            .arrow_left_medium{
                width: 32px;    
                height: 32px;
                background: white;
                background-image: url(css/images/left_round-32.png);
            }              
            .delete{
                width: 26px;    
                height: 26px;
                background: white;
                background-image: url(css/images/delete-26.png);                
            }

            footer{
                margin-top: 0px;
                width: 100%;
            }

            .container_footer{
                position: absolute;
                width: 100%;
                background-color: white;
                height: 22px;
                box-shadow: 3px 3px 3px 2px #666666;
            }

            .footer_description{
                margin-top: 0px;
                vertical-align:middle;
                position: absolute;
            }            
        </style>
    </head>
    <body>
        <!--********************************* HEADER START *********************************-->
        <header>
            <div class="Header" id="Header_index">
                <span class="Header_title" id="Header_CloudIA">Cloud.IA</span> 
                <span class="Header_title" id="Header_space"> </span>
                <span class="Header_title" id="Header_description">intelligence Administration</span>
                <div class=icon_container>
                    <a href="contattIA.jsp" ><img  src="css/images/Rubrica.png" class=icon/></a>
                    <a href="home.jsp" ><img  src="css/images/Cava.png" class=icon/></a>
                    <img src="css/images/Calendario.png" class=icon>
                </div>
                <span class="Header_title" id="Header_name"><%out.print(request.getAttribute("nome")); out.print(" ") ;out.print(request.getAttribute("cognome")) ;%></span>
                
                
               
            </div>
        </header>
        <!--+++++++++++++++++++++++++++++++++++ HEADER END +++++++++++++++++++++++++++++++++-->

        <!--********************************* BUTTON LEFT START *********************************-->
        <div class="div_button_left">
            <button class="arrow_right_medium button_left" id="show_note_alert"></button>
        </div>      
        <!--+++++++++++++++++++++++++++++++++++ BUTTON LEFT END +++++++++++++++++++++++++++++++++-->

        <!--********************************* NOTE_ALERT START *********************************-->
        <div class ="note_alert" id="note_alert">
            <!--*********************************NOTE*********************************-->
            <div class="note_container_title"> NOTE </div>            
            <div class="note_container"></div>
            <div class="note_container_func">
                <button class="delete note_container_button" id="delete_note"></button>
            </div>
            <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

            <!--*********************************ALERT*********************************-->
            <div class="alert_container_title"> ALERT </div>
            <div class="alert_container"></div>
            <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->            

        </div>
        <!--+++++++++++++++++++++++++++++++++++ NOTE_ALERT END +++++++++++++++++++++++++++++++++-->

        <!--*********************************SEZIONE START*********************************-->
        <div class="sezione">
            <!--*********************************DIV JQ_GRID*********************************-->
            <div class ="jqGrid_div">
                <!--*********************************ANAGRAFICA TABLE*********************************-->
                <table id="tableAnagrafica"></table>
                <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
            </div>
            <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->          
            <div class="inputbutton">
                <button class="buttonTable" id="editRow">Edit Selected</button>
                <button class="buttonTable" id="addRow">Add Row</button>
                <button class="buttonTable" id="search">Search</button>
                <button class="buttonTable" id="reset">Reset</button>                
            </div>        
            <div class="inputAnagrafica">
                <input class="ragioneSociale_input" type="text" name="ragioneSociale"   value="" />
                <input class="cf_input"             type="text" name="cf"               value="" />
                <input class="piva_input"           type="text" name="piva"             value="" />
                <input class="citta_input"          type="text" name="citta"            value="" />                    
                <input class="indirizzo_input"      type="text" name="indirizzo"        value="" />
                <input class="tel_input"            type="text" name="tel"              value="" />
                <input class="cel_input"            type="text" name="cel"              value="" />
                <input class="fax_input"            type="text" name="fax"              value="" />
                <input class="email_input"          type="text" name="email"            value="" />
                <input class="pec_input"            type="text" name="pec"              value="" />
                <br>
                <button class="accept" id="accept">OK</button>
                <button class="deny" id="deny">Cancel</button>
            </div>            

        </div>
        <!--+++++++++++++++++++++++++++++++++++ SEZIONE END +++++++++++++++++++++++++++++++++-->

        <!--********************************* BUTTON RIGHT START *********************************-->
        <div class="div_button_right">
            <button class="arrow_left_medium button_right" id="show_map"></button>
        </div>      
        <!--+++++++++++++++++++++++++++++++++++ BUTTON RIGHT END +++++++++++++++++++++++++++++++++-->    

        <!--********************************* MAP START *********************************-->
        <div class ="left_panel">
            <div id="map">
            </div>

        </div>
        <!--+++++++++++++++++++++++++++++++++++ MAP END +++++++++++++++++++++++++++++++++-->        

        <!--********************************* FOOTER START *********************************-->
        <footer>
            <div class="container_footer">  
                <div class ="footer_description"> Powered by SMART-PLANNING</div>
            </div>
        </footer>      
        <!--+++++++++++++++++++++++++++++++++++ FOOTER END +++++++++++++++++++++++++++++++++-->

        <!--*********************************SCRIPT*********************************-->
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/jquery-ui-1.10.3.custom.js"></script>        
        <script src="js/jquery.jqGrid.src.js"></script>
        <script src="js/OpenLayers.js" ></script>            
        <script src="js/CloudIA.js"></script>
        <script>

            $(document).ready(function() {
                $.ajax({
                    url: '<%=request.getContextPath()%>/NoteServlet?action=fetchData',
                    dataType: 'json',
                    data: {
                        length: 20
                    },
                    success: function(response) {

                        for (i = 0; i < response.result.length; i++) {
                            var str = "<div class=\"note\" id=\"" + response.result[i].idNota + "\">";
                            str = str + "<img src=\"user_images/Superman_logo-4.gif\" class=\"note_image\">";
                            str = str + "<div class=\"note_title\">" + response.result[i].titolo + "</div>";
                            str = str + "<div class=\"note_text\">" + response.result[i].descrizione + "</div>";
                            str = str + "</div>";
                            $(".note_container").append(str);

                            $("#" + response.result[i].idNota).click(function() {
                                var myClass = $(this).attr("class");
                                if (myClass.indexOf("highlight") === -1) {
                                    $(this).addClass("highlight");
                                } else {
                                    $(this).removeClass("highlight");
                                }
                            });
                        }
                    },
                    fail: function(response) {
                    }

                });

                $.ajax({
                    url: '<%=request.getContextPath()%>/AlertServlet?action=fetchData',
                    dataType: 'json',
                    data: {
                    },
                    success: function(response) {
                        for (i = 0; i < response.result.length; i++) {
                            var date = response.result[i].istante.split(" ");
                            var str = "<div class=\"alert\" id=\"" + response.result[i].idAlert + "\">";
                            str = str + "<p class=\"calendar\">" + date[2] + "<em>" + date[1] + "</em></p>";
                            str = str + "<div class=\"alert_text\">" + response.result[i].descrizione + "</div>";
                            str = str + "</div>";
                            $(".alert_container").append(str);
                        }
                    },
                    fail: function(response) {
                    }

                });

                var source = new EventSource('<%=request.getContextPath()%>/NoteServlet?action=checkNewNote&length=20');
                source.onmessage = function(event) {
                    var JSONData = JSON.parse(event.data).result;
                    for (i = 0; i < JSONData.length; i++) {
                        if ($(".note_container").find("#" + JSONData[i].idNota).length === 0) {
                            var str = "<div class=\"note\" id=\"" + JSONData[i].idNota + "\">";
                            str = str + "<img src=\"user_images/Superman_logo-4.gif\" class=\"note_image\">";
                            str = str + "<div class=\"note_title\">" + JSONData[i].titolo + "</div>";
                            str = str + "<div class=\"note_text\">" + JSONData[i].descrizione + "</div>";
                            str = str + "</div>";
                            $(".note_container").append(str);

                            $("#" + JSONData[i].idNota).click(function() {
                                var myClass = $(this).attr("class");
                                if (myClass.indexOf("highlight") === -1) {
                                    $(this).addClass("highlight");
                                } else {
                                    $(this).removeClass("highlight");
                                }
                            });


                        }
                    }
                };


            });

            $("#delete_note").click(function() {

                var arrayNote = $(".note_container").find(".note");
                var size = arrayNote.size();
                var idNote = [];
                var counter = 0;
                for (i = 0; i < size; i++) {
                    if (arrayNote[i].className.indexOf("highlight") !== -1) {
                        idNote[counter] = arrayNote[i].id;
                        counter++;
                    }
                }

                $.ajax({
                    url: '<%=request.getContextPath()%>/NoteServlet?action=deleteNote',
                    dataType: 'json',
                    data: {
                        length: 20,
                        idNote: idNote

                    },
                    success: function(response) {
                        var str = "";
                        for (var i = 0; i < idNote.length; i++) {
                            $("#" + idNote[i]).fadeOut(300, function() {
                                $(this).remove();
                            });
                        }

                        for (i = 0; i < response.result.length; i++) {
                            if ($(".note_container").find("#" + response.result[i].idNota).length === 0) {
                                var str = "<div class=\"note\" id=\"" + response.result[i].idNota + "\">";
                                str = str + "<img src=\"user_images/Superman_logo-4.gif\" class=\"note_image\">";
                                str = str + "<div class=\"note_title\">" + response.result[i].titolo + "</div>";
                                str = str + "<div class=\"note_text\">" + response.result[i].descrizione + "</div>";
                                str = str + "</div>";
                                $(".note_container").append(str);

                                $("#" + response.result[i].idNota).click(function() {
                                    var myClass = $(this).attr("class");
                                    if (myClass.indexOf("highlight") === -1) {
                                        $(this).addClass("highlight");
                                    } else {
                                        $(this).removeClass("highlight");
                                    }
                                });


                            }
                        }


                    },
                    fail: function(response) {
                    }

                });

            });
           var Resultdata;
           jQuery("#tableAnagrafica").jqGrid({
                url: '<%=request.getContextPath()%>/AnagraficaServlet?action=fetchData',
                datatype: "json",
                colNames: ['Ragione Sociale', 'Codice Fiscale', 'Partita IVA', 'Indirizzo', 'Citta', 'Tel', 'Cel', 'Fax', 'E-mail', 'PEC'],
                colModel: [
                    {name: 'ragioneSociale'},
                    {name: 'cf', width: 105},
                    {name: 'piva', width: 75},
                    {name: 'indirizzo'},
                    {name: 'citta', width: 180},
                    {name: 'tel', width: 75},
                    {name: 'cel', width: 75},
                    {name: 'fax', width: 75},
                    {name: 'email', width: 155},
                    {name: 'pec', width: 155}
                ],
                rowNum: 20,
                loadtext: "Attendere il caricamento...",
                sortname: 'ragioneSociale',
                sortorder: 'asc',
                loadComplete: function(data) {
                   Resultdata=data;
                   
                },
                onSelectRow: function(id) {
                    
                    var gr = jQuery("#tableAnagrafica").jqGrid('getGridParam', 'selrow');
                    
                    var id = Resultdata.rows[gr-1].idAnagrafica;
                    
                    var citta = Resultdata.rows[gr-1].citta;
                    var indirizzo = Resultdata.rows[gr-1].indirizzo;
                    var geom = Resultdata.rows[gr-1].geom.coordinates;
                    
                    if (citta !== "") { 
                        if (geom === undefined || geom === "") { 
                            console.log(indirizzo);
                                $.ajax({
                                
                            
                                url: "http://services.gisgraphy.com//geocoding/geocode?address=" + indirizzo + " " + citta + "&country=It&format=json",
                                async: false,
                                dataType: 'jsonp',
                                success: function(res) {
                                    var ol = $('.map').data('openlayers');
                                    map.setCenter(
                                            new OpenLayers.LonLat(res.result[0].lng, res.result[0].lat).transform(
                                            new OpenLayers.Projection("EPSG:4326"),
                                            map.getProjectionObject()
                                            ), 16);
                                    markers.clearMarkers();
                                    markers.addMarker(new OpenLayers.Marker(new OpenLayers.LonLat(res.result[0].lng, res.result[0].lat).transform(
                                            new OpenLayers.Projection("EPSG:4326"),
                                            map.getProjectionObject()
                                            ), icon.clone()));
                                    map.addLayer(markers);

                                    $.ajax({
                                        url: '<%=request.getContextPath()%>/AnagraficaServlet?action=addPoint',
                                        dataType: 'json',
                                        data: {
                                            idAnagrafica: id,
                                            lat: res.result[0].lat,
                                            lng: res.result[0].lng
                                        },
                                        success: function(response) {
                                        },
                                        fail: function(response) {
                                        }

                                    });

                                }
                            });
                            
                        } else {
                            var ol = $('.map').data('openlayers');
                            markers.clearMarkers();
                            map.setCenter(
                                    new OpenLayers.LonLat(geom[1], geom[0]).transform(
                                    new OpenLayers.Projection("EPSG:4326"),
                                    map.getProjectionObject()
                                    ), 16);

                            markers.addMarker(new OpenLayers.Marker(new OpenLayers.LonLat(geom[1], geom[0]).transform(
                                    new OpenLayers.Projection("EPSG:4326"),
                                    map.getProjectionObject()
                                    ), icon.clone()));
                            map.addLayer(markers);
                        }

                    }
                }
            });



            var map = new OpenLayers.Map('map');
            var wms = new OpenLayers.Layer.OSM("OpenLayers OSM");
            map.addLayer(wms);
            map.zoomToMaxExtent();
            var markers = new OpenLayers.Layer.Markers("Markers");
            var size = new OpenLayers.Size(21, 25);
            var offset = new OpenLayers.Pixel(-(size.w / 2), -size.h);
            var icon = new OpenLayers.Icon('css/images/pin.png', size, offset);
        </script>
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
    </body>
</html>
