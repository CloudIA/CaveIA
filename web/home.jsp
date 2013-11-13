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
        <style type="text/css" title="currentStyle">
            @import "css/demo_table.css";
        </style>
        <style type="text/css">
            body{
                margin-left: 0px;
                margin-right: 0px;
            }
            #Header_index {
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:100%;
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
            .Header_name{
                display:table-cell;
                vertical-align:middle;
                text-align: right;
            }
            span#Header_CloudIA{
                display:table-cell;
                width:140px;
            }
            .div_button_left{
                position: absolute;
                background-color: black;
                width: 24px;
            }

            .button{ 
                border: none;
                margin-left: 0px;
                width: 24px;    
                height: 24px;    
                background-color:transparent;                
            }

            .arrow_right{
                background-image: url(css/images/frecciaIN.png);
            }      

            .arrow_left{
                background-image: url(css/images/frecciaOUT.png);
            }         
            .delete{
                background-image: url(css/images/delete-26.png);                
            }
            .search{
                width: 30px;
                height: 30px;
                background-image: url(css/images/search.png);
                display: table-cell;
                vertical-align: middle;
                position: absolute;
                margin-right: 0px; 
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
                margin-left: 34px;
                margin-top: -34px;
                width: 190px;
            }

            .note_image{
                width: 34px;
                height: 34px;
            }

            .note_text{
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:70%;
                margin-left: 45px;
                width: 190px;
                margin-top: -37px;

            }
            .note_nome{

                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:80%;
                margin-top: 15px;
                margin-left: 120px;            
            }
            .note_data{
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size: 80%;
                margin-top: -15px;      
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
            .calendar {
                margin: .25em 10px 10px 0;
                padding-top: 5px;
                float: left;
                width: 60px;
                font: bold 15px/30px Arial Black, Arial, Helvetica, sans-serif;
                text-align: center;
                color: #000;
                -moz-border-radius: 3px;
                -webkit-border-radius: 3px;
                border-radius: 3px;
                position: relative;
                -moz-box-shadow: 0 2px 2px #888;
                -webkit-box-shadow: 0 2px 2px #888;
                box-shadow: 0 2px 2px #888;
            }       

            .calendar em{
                display: block;
                font: normal bold 11px/18px Arial, Helvetica, sans-serif;
                color: #fff;
                text-shadow: #00365a 0 -1px 0;
                background: #305068;
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

            .widget{
                margin-left: 60px;
                margin-top: 20px;
                background-color: black;

            }
            .widget_container{
                position: absolute;
                margin-left: 2px;
                margin-top: 2px;
            }
            .item2x2{
                display: table;
                margin-left: 2px;
                margin-top: 2px;
                float: left;
                width: 360px;    
                height: 268px;
                box-shadow: 3px 3px 3px 2px black;
            }
            .item1x1{
                display: table;
                margin-left: 2px;
                margin-top: 2px;
                float: left;
                width: 179px;    
                height: 133px;  
                box-shadow: 3px 3px 3px 2px black;
            }            
            #anagrafica{
                background: url(css/images/anagrafica.png) no-repeat;
                -moz-background-size:100% 100%;
                -webkit-background-size:100% 100%;

            }
            #terreni{
                background: url(css/images/terreni.png) no-repeat;
                -moz-background-size:100% 100%;
                -webkit-background-size:100% 100%;                         
            }
            #cave{
                background: url(css/images/cave.png) no-repeat;
                -moz-background-size:100% 100%;
                -webkit-background-size:100% 100%;                

            }
            #calendario{
                background: url(css/images/calendario.png) no-repeat;
                -moz-background-size:100% 100%;
                -webkit-background-size:100% 100%;                

            }
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
                width: 24px;
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
                <span class="Header_title" id="Header_description">intelligence Administration</span>
                <div class=icon_container>
                    <a href="contattIA.jsp" ><img  src="css/images/Rubrica.png" class=icon/></a>
                    <a href="home.jsp" ><img  src="css/images/Cava.png" class=icon/></a>
                    <img src="css/images/Calendario.png" class=icon>
                </div>
                <span class="Header_title" id="Header_name"><%out.print(request.getAttribute("nome"));
                    out.print(" ");
                    out.print(request.getAttribute("cognome"));%></span>
            </div>
        </header>                
        <!--+++++++++++++++++++++++++++++++++++ HEADER END +++++++++++++++++++++++++++++++++-->

        <!--********************************* BUTTON LEFT START *********************************-->
        <div class="div_button_left">
            <button class="arrow_right button" id="show_note_alert"></button>
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

    </div>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!--*********************************SEZIONE*********************************-->
    <div class="sezione">
        <!--*********************************ANAGRAFICA TABLE*********************************-->
        <table id="table_id" class="display" width="100%">
            <thead>
                <tr>
                    <th>Codice Cava Madre</th>
                    <th>Codice Cava</th>
                    <th>Titolare</th>
                    <th>Scadenza autorizzazione</th>
                    <th>Materiale cavato</th>
                    <th>Link</th>  
                </tr>
            </thead>
        </table> 
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->



    </div>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!--********************************* BUTTON RIGHT START *********************************-->
    <div class="div_button_right">
        <button class="arrow_left button" id="show_map"></button>
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

    <script type="text/javascript" language="javascript" src="js/jquery-2.0.3.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery-ui-1.10.3.custom.js"></script>
    <script type="text/javascript" language="javascript" src="js/jquery.dataTables.min.js"></script>
    <script type="text/javascript" language="javascript" src="js/TableTools.min.js"></script>
    <script src="js/OpenLayers.js" ></script>       
    <script src="js/statemen.js" ></script> 
    <script src="js/CloudIA.js"></script>
    <script>
        var mapVisible;
        var noteAlertVisible;
        $(document).ready(function() {
            $.ajax({
                url: '<%=request.getContextPath()%>/NoteServlet?action=fetchData',
                dataType: 'json',
                data: {
                    length: 10
                },
                success: function(response) {

                    for (i = 0; i < response.result.length; i++) {
                        var str = "<div class=\"note\" id=\"" + response.result[i].idNota + "\">";
                        str = str + "<img src=\"css/images/nota.png\" class=\"note_image\">";
                        str = str + "<div class=\"note_text\">" + response.result[i].descrizione + "</div>";
                        str = str + "<div class=\"note_nome\">" + response.result[i].nome + " " + response.result[i].cognome + "</div>";
                        str = str + "<div class=\"note_data\">" + response.result[i].data_creazione.split(" ")[0] + "</div>";
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
                        str = str + "<p class=\"calendar\">" + date[0].split("-")[2] + "<em>" + date[0].split("-")[1] + " " + date[0].split("-")[0] + "</em></p>";
                        str = str + "<div class=\"alert_text\">" + response.result[i].descrizione + "</div>";
                        str = str + "</div>";
                        $(".alert_container").append(str);
                    }
                },
                fail: function(response) {
                }

            });
            var source = new EventSource('<%=request.getContextPath()%>/NoteServlet?action=checkNewNote&length=10');
            source.onmessage = function(event) {
                var JSONData = JSON.parse(event.data).result;
                for (i = 0; i < JSONData.length; i++) {
                    if ($(".note_container").find("#" + JSONData[i].idNota).length === 0) {
                        var str = "<div class=\"note\" id=\"" + JSONData[i].idNota + "\">";
                        str = str + "<img src=\"css/images/nota.png\" class=\"note_image\">";
                        str = str + "<div class=\"note_text\">" + JSONData[i].descrizione + "</div>";
                        str = str + "<div class=\"note_nome\">" + JSONData[i].nome + " " + JSONData[i].cognome + "</div>";
                        str = str + "<div class=\"note_data\">" + JSONData[i].data_creazione.split(" ")[0] + "</div>";
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
        var oTable;
        var TableData;
        var minLat;
        var minLon;
        var maxLat;
        var maxLon;
        $(document).ready(function() {

            oTable = $('#table_id').dataTable({
                "bSortClasses": false,
                "bProcessing": true,
                "bServerSide": true,
                "bPaginate": false,
                "bInfo": false,
                "sDom": 'r<iflp>',
                "oLanguage": {"sSearch": "<div class=\"search button\"></div>"},
                "aoColumnDefs": [
                    {"bSortable": false,
                        "aTargets": [0, 5]}
                ],
                "aoColumns": [
                    {"mDataProp": "codiceMadre"},
                    {"mDataProp": "codiceCava"},
                    {"mDataProp": "ragioneSociale"},
                    {"mDataProp": "fineVal"},
                    {"mDataProp": "materiale"},
                    {"mData": null}
                ],
                "oTableTools": {
                    "sRowSelect": "single"
                },
                "sAjaxSource": "/CaveIA/CaveServlet?action=fetchData",
                "fnRowCallback": function(nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                    $(nRow).attr("id", TableData.aaData[iDisplayIndex].idCava);
                    return nRow;
                },
                "fnServerData": function(sSource, aoData, fnCallback) {
                    var jqxhr = $.getJSON(sSource, aoData, function(json) {
                        TableData = json;
                        display = false;
                        var tmp = "";
                        for (i = 0; i < TableData.aaData.length; i++) {
                            if (tmp === "")
                                tmp = '{"type": "FeatureCollection", "features": [';
                            if (TableData.aaData[i].geometry !== "") {
                                for (j = 0; j < TableData.aaData[i].geometry[0].coordinates.length; j++) {
                                    minLat = (TableData.aaData[i].geometry[0].coordinates[0][j][1] > minLat) ? minLat : TableData.aaData[i].geometry[0].coordinates[0][j][1];
                                    minLon = (TableData.aaData[i].geometry[0].coordinates[0][j][0] > minLon) ? minLon : TableData.aaData[i].geometry[0].coordinates[0][j][0];
                                    maxLat = (TableData.aaData[i].geometry[0].coordinates[0][j][1] < maxLat) ? maxLat : TableData.aaData[i].geometry[0].coordinates[0][j][1];
                                    maxLon = (TableData.aaData[i].geometry[0].coordinates[0][j][0] < maxLon) ? maxLon : TableData.aaData[i].geometry[0].coordinates[0][j][0];
                                }
                                var string = JSON.stringify(TableData.aaData[i].geometry);
                                string = string.substring(1, string.length - 1);
                                tmp = tmp + '{"type": "Feature", "id": "' + TableData.aaData[i].idCava + '", "properties": {"name": "' + TableData.aaData[i].codiceCava + '"},"geometry":' + string + '},';
                                display = true;
                            }
                        }
                        tmp = tmp.substring(0, tmp.length - 1);
                        tmp = tmp + ']}';
                        console.log(tmp);
                        vector_layer.removeAllFeatures();
                        if (display) {
                            vector_layer.addFeatures(geojson_format.read(tmp));
                            map.setCenter(
                                    new OpenLayers.LonLat((maxLon + minLon) / 2, minLat).transform(
                                    new OpenLayers.Projection("EPSG:4326"),
                                    map.getProjectionObject()
                                    ), 13);
                        }
                        fnCallback(json);
                    }).fail(function(jqxhr, textStatus, error) {
                        var err = textStatus + ", " + error;
                        console.log("Request Failed: " + err);
                    });
                }



            });
            $(".dataTables_filter").appendTo(".Header");

            $("#table_id tbody").click(function(event) {
                if ($(event.target.parentNode).hasClass('row_selected')) {
                    $(event.target.parentNode).removeClass('row_selected');
                    for (i = 0; i < vector_layer.features.length; i++) {
                        if (vector_layer.features[i].fid === $(event.target.parentNode).attr('id'))
                            selectControl.unselect(vector_layer.features[i]);
                    }
                } else {
                    $(event.target.parentNode).addClass('row_selected');
                    for (i = 0; i < vector_layer.features.length; i++) {
                        if (vector_layer.features[i].fid === $(event.target.parentNode).attr('id'))
                            selectControl.select(vector_layer.features[i]);
                    }
                }
            });
        });

        //MAP!!!!!
        map = new OpenLayers.Map({div: "map", controls: [new OpenLayers.Control.Navigation()]});
        var layer = new OpenLayers.Layer.Stamen("toner");


        var renderer = OpenLayers.Util.getParameters(window.location.href).renderer;
        renderer = (renderer) ? [renderer] : OpenLayers.Layer.Vector.prototype.renderers;

        var geojson_format = new OpenLayers.Format.GeoJSON({'internalProjection': new OpenLayers.Projection("EPSG:900913"), 'externalProjection': new OpenLayers.Projection("EPSG:4326")});

        var vector_layer = new OpenLayers.Layer.Vector("Layer 1", {
            renderers: renderer,
            styleMap: new OpenLayers.StyleMap({
                "default": new OpenLayers.Style(OpenLayers.Util.applyDefaults({
                    fillColor: "red",
                    strokeColor: "red"
                }, OpenLayers.Feature.Vector.style["default"])),
                "select": new OpenLayers.Style(OpenLayers.Util.applyDefaults({
                    fillColor: "#99CCFF",
                    strokeColor: "#AACCFF"

                }, OpenLayers.Feature.Vector.style["select"]))
            })
        });
        map.addLayers([layer, vector_layer]);
        map.removeControl(OpenLayers.Control.PanZoom)
        selectControl = new OpenLayers.Control.SelectFeature(
                [vector_layer],
                {
                    clickout: false,
                    toggle: true,
                    multiple: false,
                    hover: false,
                    multipleKey: "shiftKey" // shift key adds to selection
                }
        );
        map.addControl(selectControl);
        selectControl.activate();

        vector_layer.events.on({
            "featureselected": function(e) {
                parentNode = $("tbody").find("tr#" + e.feature.fid);
                parentNode.addClass('row_selected');
            },
            "featureunselected": function(e) {
                parentNode = $("tbody").find("tr#" + e.feature.fid);
                parentNode.removeClass('row_selected');
            }
        });

    </script>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
</body>
</html>
