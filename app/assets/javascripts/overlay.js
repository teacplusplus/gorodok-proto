/**
 * Created with JetBrains RubyMine.
 * User: tea
 * Date: 7/21/12
 * Time: 2:48 AM
 * To change this template use File | Settings | File Templates.
 */
function overlay() {
    $("body").prepend("<div class='overlay' style='height:"+$(document).height()+"px; width:"+$(document).width()+"px;'></div><div class='overlay-gl'><table class='overlay-in'><tr><td>"+
        "<div class='overlay-bl'><div class='overlay-cl'><img src='img/but_close.png' id='but-close' title='Закрыть' /></div>"+
        "<div class='overlay-h1'>Круглосуточная парковка в СК «Олимпийский»</div>"+
        "<div class='overlay-cn'><div class='overlay-l'>Адрес:</div><div class='overlay-r' id='value-adress'>Москва, Театральный пр., 5</div>"+
        "<div class='overlay-l'>Дата и время:</div><div class='overlay-r' id='value-date'>19.03.2012 19-00 - 19.03.2012 21-00</div>"+
        "<div class='overlay-l'>Сумма</div><div class='overlay-r' id='value-sum'>300 руб.</div>"+
        "<div class='overlay-ph'>Введите номер телефона, мы отправим вам подтверждение брони.<div class='block'><input type='text' name='value-text' /></div></div>"+
        "<div class='overlay-ph'>Введите код с картинки<div class='block'><img src='img/capture.png' /></div></div>"+
        "<div class='overlay-ag'><input type='checkbox' value='yes' />Я согласен с условиями <a href='#' target='_blank'>пользовательского соглашения</a></div>"+
        "<div class='overlay-bt' align='center'><input type='submit' /></div>"+
        "</div></div></td></tr></table></div>");
    $(".overlay, .overlay").fadeIn(500, function() {
        $(".overlay-ph input").mask("(999)-999-99-99");
        $(".overlay-ph input").focus();
    });
}

function overlay_close() {$(".overlay,.overlay-gl").detach();}

$().ready(function() {
    //overlay();
    $("#but-close").live("click",function() {overlay_close();});
});

