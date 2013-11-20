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
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!--*********************************SEZIONE*********************************-->
    <div class="sezione">
        <ul id="tabs">
        
            <li><a href="#" name="tab1" class="vista">Vista 1</a></li>
            <li><a href="#" name="tab2" class="vista">Vista 2</a></li>
            <li><a href="#" name="tab3" class="vista">Vista 3</a></li>
            <li><a href="#" class="button" id="before_cava"><img src="css/images/frecciaOUT_B.png" border="0"></a></li> 
            <li><span> nome cava </span></li>
            <li><a href="#" class="button" id="next_cava"><img src="css/images/frecciaIN_B.png" border="0"></a></li>
        </ul>

        <div id="content"> 
            <div id="tab1">DIV 1</div>
            <div id="tab2">DIV 2</div>
            <div id="tab3">DIV 3</div>
        </div>

    </div>
    <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->

    <!--********************************* BUTTON RIGHT START *********************************-->
    <div class="div_button_right" class=icon_container>
        <a href="#" class="button" id="show_map"><img  src="css/images/frecciaOUT.png" class=icon/></a>
    </div>           
    <!--+++++++++++++++++++++++++++++++++++ BUTTON RIGHT END +++++++++++++++++++++++++++++++++-->    

    <!--********************************* MAP START *********************************-->
    <div class ="left_panel">


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
        var This;

        $(document).ready(function() {
            NoteOffset = 0;
            LoadNote('<%=request.getContextPath()%>', true);
            LoadAlert('<%=request.getContextPath()%>');

            $("#content div").hide(); // Initially hide all content
            $("#tabs li:first").attr("id","current"); // Activate first tab
            $("#content div:first").fadeIn(); // Show first tab content

            $('#tabs a').click(function(e) {
                e.preventDefault();
                if ($(this).closest("li").attr("id") === "current"){ //detection for current tab
                 return       
                }
                else{   
                    This=this;
                $("#content div").hide(); //Hide all content
                $("#tabs li").attr("id",""); //Reset id's
                $(this).parent().attr("id","current"); // Activate this
                $('#' + $(this).attr('name')).fadeIn(); // Show content for current tab
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
