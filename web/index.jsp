<!doctype html>
<html>
    <head>
        <meta charset="utf-8">
        <title>Cloud.IA</title>

        <style type="text/css">
            body{
                margin-left: 0px;
                margin-right: 0px;

            }

            #Header_index {
                font-family: Constantia, "Lucida Bright", "DejaVu Serif", Georgia, serif;
                font-size:20px;
                box-shadow: 3px 3px 3px 2px #666666;
                height: 60px;
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

            .sezione{
                background-image: url('css/images/baseCavaO.jpg');
                background-color: #ccc;
                background-repeat:no-repeat;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
                margin-bottom: 0px;
                width: 100%;
                margin-top: 0px;
                z-index: -1;

            }

            .box{
                position: absolute;   
                width: 320px; 
                border: 1px solid #ccc;   
                background-color: rgb(255,255,255);
                box-shadow: 3px 3px 3px 2px #666666;
            }

            #box_login{
                height: 145px;    
            }
            #box_sigin{
                height: 280px;    
            }

            .box_title{
                text-align: center;
                height: 40px;
                font-size: 22px;
                margin-top: 2px;
                margin-bottom: 0px;   
            }
            .text{
                margin-top: 10px;
                margin-left: 5px;
                width: 290px;

            }

            #username_login{
                position: relative;

            }

            #password_login{
                position: relative;
                width: 200px;   
            }

            .button{
                font-family: "Segoe UI Light", "Helvetica Neue", 'RobotoLight', "Segoe UI", "Segoe WP", sans-serif;
                text-align: center;   
                height: 25px;  
                margin-top: 8px;    
            }

            #button_login{
                margin-left: 10px;
                width: 80px; 
                position: absolute;
            }

            #button_sigin{
                margin-right:  12px;
                width: 90px;
                float: right;
            }

            .form{

                margin-top: -5px;
                margin-left: 8px;
            }

            .result{
                margin-left: 5px;
                margin-top: 10px;
                margin-right: 5px;
                background-color: rgb(255,198,188);
                color: rgb(87,0,38);
                text-align: center;
            }
            #result_sigin{
                margin-top: 40px;
            }
            footer{
                margin-top: 0px;
                position: relative;    
            }

            div.container_footer{
                margin-top: 0px;
                background-color: white;
                height: 22px;
                box-shadow: 3px 3px 3px 2px #666666;
            }

            div.footer_description{
                margin-top: 0px;
                vertical-align:middle;
                margin-left: 5px;
            }            

        </style>
    </head>

    <body>
        <!--********************************* HEADER *********************************-->
        <%@ include file="header.jsp" %>
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->
        <section class="sezione">
            <div class="box" id="box_login">
                <h1 class="box_title" id="entra">ENTRA</h1>
                <form class="form" action="LoginServlet" method="post">
                    <input class ="text" id="username_login" type="text" name="UserName" placeholder="Username" required="yes"/>  
                    <input class ="text" id="password_login" type="password" name="Password" placeholder="Password"  required="true"/>  
                    <input type="hidden" value="login" name="Type" >
                    <button class="button" id="button_login" type ="submit">ACCEDI</button>
                </form>
                <div class="result" id="result_login">Nome utente o password errati</div>              
            </div>             

            <div class="box" id="box_sigin">
                <h1 class="box_title" id="registrati">REGISTRATI</h1>
                <form class ="form" action="LoginServlet" method="post">
                    <input class ="text" id="username_sigin" type="text" name="UserName" placeholder="Username" required/>
                    <input class ="text" id="password_sigin" type="password" name="Password" placeholder="Password" required/>            
                    <input class ="text" id="name_sigin" type="text" name="name" placeholder="Nome" required/>                
                    <input class ="text" id="cognome_sigin" type="text" name="cognome" placeholder="Cognome" required/>                     
                    <input class ="text" id="email_sigin" type="text" name="email" placeholder="Email" required/>                       
                    <input type="hidden" value="submit" name="Type">
                    <button class="button" id="button_sigin" type ="submit">REGISTRATI</button>
                </form>                        
                <div class="result" id="result_sigin">Nome utente già presente</div>
            </div>                  

        </section>

        <!--*********************************FOOTER*********************************-->
        <%@ include file="footer.jsp" %>
        <!--++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-->     

        
        <script src="js/jquery-2.0.3.js"></script>
        <script src="js/CloudIA.js"></script>        

        <%
            String result = null;
            result = (String) request.getAttribute("result");
            if (result == "noUserAndPassword") {
                out.println("<script>");
                out.println("$(\"#result_login\").css(\"display\", \"block\");");
                out.println("$(\"#result_sigin\").css(\"display\", \"none\");");
                out.println("</script>");
            } else if (result == "UserExist") {
                out.println("<script>");
                out.println("$(\"#result_sigin\").css(\"display\", \"block\");");
                out.println("$(\"#result_login\").css(\"display\", \"none\");");
                out.println("</script>");
            } else if (result == "UserCreated") {
                out.println("<script>");
                out.println("$(\"#result_sigin\").css(\"display\", \"block\");");
                out.println("$(\"#result_sigin\").css(\"background-color\", \"rgb(152,255,163)\");");
                out.println("$(\"#result_sigin\").css(\"color\", \"rgb(9,122,0)\");");
                out.println("$(\"#result_sigin\").text(\"Utente creato con successo\");");
                out.println("$(\"#result_login\").css(\"display\", \"none\");");
                out.println("</script>");
            } else if (result == null) {
                out.println("<script>");
                out.println("$(\"#result_sigin\").css(\"display\", \"none\");");
                out.println("$(\"#result_login\").css(\"display\", \"none\");");
                out.println("</script>");
            }
        %>         
    </body>
</html>
