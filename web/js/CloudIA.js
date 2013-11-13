$(document).ready(function()
{
    $(window).resize(Positioning);

    $('.note_alert').hide();
    $('.left_panel').hide();
    mapVisible=false;
    noteAlertVisible=false;
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

    //imposto la larghezza del pannello a sinistra
    $('.note_alert').css("width", $(window).width()/6); 
    
    //imposto la larghezza del pannello a destra
    $('.left_panel').css("width", $(window).width()/2); 

    //imposto l'altezza del pannello a destra
    $('.note_alert').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);
    
    //imposto la posizione della barra dei bottoni a sinistra
    $('.div_button_left').css("top", $('.Header').height() + 8);
    //imposto l'altezza della barra dei bottoni a sinistra
    $('.div_button_left').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);
    //imposto il pulsante a sinistra a metà delle barra dei pulsanti a sinistra
    $('.arrow_left').css("marginTop", ($('.div_button_left').height() - 32) / 2);
    $('.note_container').css({'height': (($('.note_alert').height() - 48) / 2)});
    $('.alert_container').css({'height': (($('.note_alert').height() - 48) / 2)});    
    

    //imposto la posizione della sezione dall'alto
    $('.sezione').css("top", $('.Header').height() + 8);
    //imposto l'altezza della sezione
    $('.sezione').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);

    //imposto la posizione della barra dei bottoni a destra    
    $('.div_button_right').css("top", $('.Header').height() + 8);
    //imposto l'altezza della barra dei bottoni a destra
    $('.div_button_right').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);    
    //imposto il pulsante a destra a metà delle barra dei pulsanti a destra    
    $('.arrow_right').css("marginTop", ($('.div_button_right').height() - 32) / 2);    
    
    $('.left_panel').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);
    $('.left_panel').css("left", window_width - $('.left_panel').width());    
    
    $('.container_footer').css("top", window_height - 45);    
    
    $('#map').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);
    $('#map').css("width", $(window).width()/2-5); 
    $('#map').css("height", $('.left_panel').height()-17); 
    //$('#map').height(window_height - $('.Header').height() - $('.container_footer').height() - 17);
    
    if ($('.note_alert').is(':visible') && $('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width() + $('.note_alert').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.note_alert').width() - $('.left_panel').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width() - $('.left_panel').width());
    } else if ($('.note_alert').is(':visible') && !$('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width() + $('.note_alert').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.note_alert').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width());
    } else if (!$('.note_alert').is(':visible') && $('.left_panel').is(':visible')) {
        $('.sezione').css("left", $('.div_button_left').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width() - $('.left_panel').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width() - $('.left_panel   ').width());
    } else {
        $('.sezione').css("left", $('.div_button_left').width());
        $('.sezione').width($(window).width() - $('.div_button_left').width() - $('.div_button_right').width());
        $('.div_button_right').css("left", window_width - $('.div_button_right').width());
    }


}

function Positioning() {

    ItemPositioning();

    SetLoginPosition();

}

function ShowNoteAlert() {
    if (noteAlertVisible===false) {
        $('.div_button_left').animate({left: '+=' + $('.note_alert').css('width')}, 300);
        $('.sezione').animate({left: '+=' + $('.note_alert').css('width'), width: '-=' + $('.note_alert').css('width')}, 300);
        $('.note_alert').show('slide', {direction: 'left'}, 300);
        $('#show_note_alert').switchClass("arrow_right", "arrow_left");
        noteAlertVisible=true;

    } else {
        $('.div_button_left').animate({left: '-=' + $('.note_alert').css('width')}, 300);
        $('.sezione').animate({left: '-=' + $('.note_alert').css('width'), width: '+=' + $('.note_alert').css('width')}, 300);
        $('.note_alert').hide('slide', {direction: 'left'}, 300);
        $('#show_note_alert').switchClass("arrow_left", "arrow_right");
        noteAlertVisible=false;
    }
}

function ShowMap() {

    if (mapVisible===false) {
        $('.div_button_right').animate({left: '-=' + $('.left_panel').css('width')}, 300);
        $('.sezione').animate({width: '-=' + $('.left_panel').css('width')}, 300);
        $('.left_panel').show('slide', {direction: 'right'}, 300,showHide(new Array(0,3,4)));
        $('#show_map').switchClass("arrow_left", "arrow_right");
        
        mapVisible=true;
        
    } else {
        $('.div_button_right').animate({left: '+=' + $('.left_panel').css('width')}, 300);
        $('.sezione').animate({width: '+=' + $('.left_panel').css('width')}, 300);
        $('.left_panel').hide('slide', {direction: 'right'}, 300,showHide(new Array(0,3,4)));
        $('#show_map').switchClass("arrow_right", "arrow_left");
        mapVisible=false;
    }
    
    map.updateSize();

}


function showHide(iCol) {
//    for (var i = 0; i < iCol.length; i++) {
//        var bVis = oTable.fnSettings().aoColumns[iCol[i]].bVisible;
//        oTable.fnSetColumnVis(iCol[i], bVis ? false : true);
//    }
}