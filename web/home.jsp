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
            @import "css/CloudIA.css";
        </style>
    </head>
    <body>
        <!--********************************* HEADER START *********************************-->              
        <header>
            <div class="Header" id="Header_index">
                <span class="Header_title" id="Header_CloudIA">Cloud.IA</span> 
                <span class="Header_title" id="Header_description">Intelligence Administration</span>
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
        <div class="div_button_left" class=icon_container>
            <a href="#" class="button" id="show_note_alert"><img  src="css/images/frecciaIN.png" class=icon/></a>
        </div>      
        <!--+++++++++++++++++++++++++++++++++++ BUTTON LEFT END +++++++++++++++++++++++++++++++++-->        

        <!--********************************* NOTE_ALERT START *********************************-->
        <div class ="note_alert" id="note_alert">
            <!--*********************************NOTE*********************************-->
            <div class="note_container_title"> NOTE </div>            
            <div class="note_container_func" class=icon_container>
                <a href="#" class="button" id="note_before"><img  src="css/images/frecciaOUT.png" class=icon/></a>
                <a href="#" class="button" id="delete_note"><img  src="css/images/elemina.png" class=icon/></a>
                <a href="#" class="button" id="note_next"><img  src="css/images/frecciaIN.png" class=icon/></a>
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
                    <th></th>  
                </tr>
            </thead>
        </table> 
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->



    </div>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!--********************************* BUTTON RIGHT START *********************************-->
    <div class="div_button_right" class=icon_container>
        <a href="#" class="button" id="show_map"><img  src="css/images/frecciaOUT.png" class=icon/></a>
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

        var oTable;
        var TableData;

        $(document).ready(function() {
            NoteOffset = 0;
            LoadNote('<%=request.getContextPath()%>', true);
            LoadAlert('<%=request.getContextPath()%>');

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
                        "aTargets": [0, 5]},
                    {"aTargets": [5],
                        "mData": null,
                        "mRender": function(data, type, full) {
                            return '<a href="#" class="button" id="show_cava_sezione"><img  src="css/images/folder.png" class=icon/></a>';
                        }}
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
                        var minLat;
                        var minLon;
                        var maxLat;
                        var maxLon;

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
                        $("#show_cava_sezione").click(ShowCava);
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

        $("#note_next").click(function() {
            NoteOffset = NoteOffset + 3;
            LoadNote('<%=request.getContextPath()%>', false);

        });

        $("#note_before").click(function() {
            NoteOffset = NoteOffset - 3;
            if (NoteOffset < 0)
                NoteOffset = 0;
            LoadNote('<%=request.getContextPath()%>', false);

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
            LoadNote('<%=request.getContextPath()%>', false);
        },
        fail: function(response) {
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
        map.removeControl(OpenLayers.Control.PanZoom);
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
        var sezione_lista_cave;
        var mappa_lista_cave;
        function ShowCava() {
            sezione_lista_cave = $(".sezione").clone();
            mappa_lista_cave = $(".left_panel").clone();
            $(".sezione").empty();
            $(".left_panel").empty();




        }
        ;
    </script>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
</body>
</html>
