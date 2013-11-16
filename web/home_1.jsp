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
            .note_container_func{
                width:100%;
                height: 28px;
                /* Firefox */
                display:-moz-box;
                -moz-box-pack:center;
                -moz-box-align:center;

                /* Safari and Chrome */
                display:-webkit-box;
                -webkit-box-pack:center;
                -webkit-box-align:center;

                /* W3C */
                display:box;
                box-pack:center;
                box-align:center;               
            }

            .Proprieta_cava{
                float:left;
                width: 40%;
                height: 300px;
                background-color: red;
            }

            .categorie_docuementi{
                float:left;
                width: 60%;
                height: 300px;
                background-color: blue;                

            }
            .cambio_vista{
                width: 100%;
                height: 30px;
                position:relative;
                background-color: pink;  
            }
            .documenti{
                clear:left;
                width:100%;
                height:255px;
                background-color: yellow;
            }
            .button{ 
                border: none;
                margin-left: 0px;
                width: 24px;    
                height: 24px;    
                background-color:transparent; 
                vertical-align: middle;
            }

            .arrow_right{
                background-image: url(css/images/frecciaIN.png);
            }      

            .arrow_left{
                background-image: url(css/images/frecciaOUT.png);
            }       
            .folder{
                background-size:20px 20px;
                background-repeat:no-repeat;
                background-image: url(css/images/folder.png);
            }
            .delete{
                width: 28px;    
                height: 28px;  
                background-image: url(css/images/elemina.png);                
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
                height: 20px;
            }
            .note_container_button{
                border: none;
                margin-top: 0px;
                box-shadow: 3px 3px 3px 2px black; 
                margin-left: 100px;
                margin-bottom: 0px;
                height: 28px;
            }
            .note{
                box-shadow: 3px 3px 3px 2px white;
                background-color: white;
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
            }

            .note_image{
                width: 34px;
                height: 34px;
            }

            .note_text{
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:70%;
                margin-left: 45px;
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
                height:20px;
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
                margin-left: 5px;
            }   
            #tabs{
                
                overflow: hidden;
                width: 100%;
                margin: 8px 0px 1px -3px;
                padding: 0;
                list-style: none;
            }

            #tabs li{
                float: left;
                margin: 0 .5em 0 0;
            }

            .vista{
                position: relative;
                margin-left: 8px;
                background-color: #000;
                padding: .3em 3.7em;
                float: left;
                text-decoration: none;
                color: #fff;
            }


            .vista:focus{
                outline: 0;
            }

            .vista::after{
                content: '';
                position: absolute;
                z-index: 1;
                top: 0;
                right: -.5em;
                bottom: 0;
                width: 1em;
                background-color: #000;
                -moz-box-shadow: 2px 2px 2px rgba(0,0,0,.4);
                -webkit-box-shadow: 2px 2px 2px rgba(0,0,0,.4);
                box-shadow: 2px 2px 2px rgba(0,0,0,.4);
                -webkit-transform: skew(10deg);
                -moz-transform: skew(10deg);
                -ms-transform: skew(10deg);
                -o-transform: skew(10deg);
                transform: skew(10deg);
                -webkit-border-radius: 0 5px 0 0;
                -moz-border-radius: 0 5px 0 0;
                border-radius: 0 5px 0 0;
            }



            #content
            {
                background: #fff;
                padding: 2em;
                height: 220px;
                position: relative;
                z-index: 2;	
                border-radius: 0 5px 5px 5px;
                box-shadow: 0 -2px 3px -2px rgba(0, 0, 0, .5);
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
            <div class="note_container_func">
                <button class="arrow_left button" id="note_before"></button>                
                <button class="delete button" id="delete_note"></button>
                <button class="arrow_right button" id="note_next"></button>
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
        <ul id="tabs">
            <li><a href="#" class="vista">Vista 1</a></li>
            <li><a href="#" class="vista">Vista 2</a></li>
            <li><a href="#" class="vista">Vista 3</a></li>
            <li><a class="button arrow_left" id="arrow_left"><img src="css/images/frecciaOUT.png" border="0"></a></li>
        </ul>

        <div id="content"> 
            <div id="tab1">...</div>
            <div id="tab2">...</div>
            <div id="tab3">...</div>
        </div>

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
            NoteOffset = 0;
            LoadNote('<%=request.getContextPath()%>', true);
            LoadAlert('<%=request.getContextPath()%>');



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

    </script>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
</body>
</html>
