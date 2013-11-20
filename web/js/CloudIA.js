$(document).ready(function()
{

    $(window).resize(Positioning);

    $('.note_alert').hide();
    $('.left_panel').hide();
    mapVisible = false;
    noteAlertVisible = false;
    $('#show_note_alert').bind('click', ShowNoteAlert);
    $('#show_map').bind('click', ShowMap);

    Positioning();


});


function SetLoginPosition() {

    $('.box').css({'left': $('.sezione').width() - 400});
    $('#box_login').css({'top': $(".Header").height() + 120});
    $('#box_sigin').css({'top': $(".Header").height() + $("#box_login").height() + 120 + 30});

}

function ItemPositioning() {
    var window_height = $(window).height();
    var window_width = $(window).width();

    $('.note_alert,.div_button_left,.sezione,.div_button_right,.left_panel,#map').height(window_height - $('.Header').height() - $('.container_footer').height() - 30);

    $('.note_alert').css("width", $(window).width() / 6);

    $('.left_panel').css("width", $(window).width() / 2);

    $('.div_button_left,.div_button_right,.sezione').css("top", $('.Header').height() + 8);

    $('.div_button_right .arrow_left,.div_button_left .arrow_right').css("marginTop", ($('.div_button_left').height() - 32) / 2);

    $('.left_panel').css("left", window_width - $('.left_panel').width());

    $('.container_footer').css("top", window_height - 45);

    $('#map').css("width", $(window).width() / 2 - 5);
    $('#map').css("height", $('.left_panel').height() - 17);


    if ($('.note_alert').is(':visible') && $('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width() + $('.note_alert').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.note_alert').width() - $('.left_panel').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width() - $('.left_panel').width());
        $('.div_button_left').css("left", $('.note_alert').width());

    } else if ($('.note_alert').is(':visible') && !$('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width() + $('.note_alert').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.note_alert').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width());
        $('.div_button_left').css("left", $('.note_alert').width());
    } else if (!$('.note_alert').is(':visible') && $('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.left_panel').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width() - $('.left_panel   ').width());
    } else {
        $('.sezione').css("left", $('.div_button_left').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width());
    }

    numberOfNote = Math.floor(($('.note_alert').height() - $('.note_container_func').height() - $('.note_container_title').height() - $('.alert_container_title').height() - 10) / 140);
}

function Positioning() {


    ItemPositioning();
    SetLoginPosition();

}

function ShowNoteAlert() {

    if (noteAlertVisible === false) {
        $('.div_button_left').animate({left: '+=' + $('.note_alert').css('width')}, 300);
        $('.sezione').animate({left: '+=' + $('.note_alert').css('width'), width: '-=' + $('.note_alert').css('width')}, 300);
        $('.note_alert').show('slide', {direction: 'left'}, 300);
        $("#show_note_alert img").attr('src', 'css/images/frecciaOUT.png');
        noteAlertVisible = true;

    } else {
        $('.div_button_left').animate({left: '-=' + $('.note_alert').css('width')}, 300);
        $('.sezione').animate({left: '-=' + $('.note_alert').css('width'), width: '+=' + $('.note_alert').css('width')}, 300);
        $('.note_alert').hide('slide', {direction: 'left'}, 300);
        $("#show_note_alert img").attr('src', 'css/images/frecciaIN.png');
        noteAlertVisible = false;
    }
}

function ShowMap() {

    if (mapVisible === false) {
        $('.div_button_right').animate({left: '-=' + $('.left_panel').css('width')}, 300);
        $('.sezione').animate({width: '-=' + $('.left_panel').css('width')}, 300);
        $('.left_panel').show('slide', {direction: 'right'}, 300, showHide(new Array(0, 3, 4)));
        $("#show_map img").attr('src', 'css/images/frecciaIN.png')


        mapVisible = true;

    } else {
        $('.div_button_right').animate({left: '+=' + $('.left_panel').css('width')}, 300);
        $('.sezione').animate({width: '+=' + $('.left_panel').css('width')}, 300);
        $('.left_panel').hide('slide', {direction: 'right'}, 300, showHide(new Array(0, 3, 4)));
        $("#show_map img").attr('src', 'css/images/frecciaOUT.png')
        mapVisible = false;
    }

    map.updateSize();

}


function showHide(iCol) {
//    for (var i = 0; i < iCol.length; i++) {
//        var bVis = oTable.fnSettings().aoColumns[iCol[i]].bVisible;
//        oTable.fnSetColumnVis(iCol[i], bVis ? false : true);
//    }
}
var NoteOffset;
var numberOfNote;
function LoadNote(ContextPath, reload) {
    $.ajax({
        url: ContextPath + '/NoteServlet?action=fetchData',
        dataType: 'json',
        data: {
            length: numberOfNote,
            offset: NoteOffset
        },
        success: function(response) {
            $(".note_container").remove();
            if ($('.note_container').length === 0)
                $('.note_container_title').after("<div class=\"note_container\"></div>");
            $('.note_container').height(($('.note_alert').height() - $('.note_container_func').height() - $('.note_container_title').height() - $('.alert_container_title').height() - 10) / 2);
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
            console.log(response);
        },
        complete: function(response) {
            if (reload)
                setInterval(LoadNote, 10000, ContextPath, reload);
        }

    });

}

function LoadAlert(ContextPath) {
    $.ajax({
        url: ContextPath + '/AlertServlet?action=fetchData',
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
}





