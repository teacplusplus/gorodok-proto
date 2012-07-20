/**
 * Created with JetBrains RubyMine.
 * User: tea
 * Date: 7/21/12
 * Time: 2:49 AM
 * To change this template use File | Settings | File Templates.
 */
h1 = ["Концерт группы &laquo;Сплин&raquo; в СК &laquo;Олимпийский&raquo;","Заголовок 2","Заголовок 3","Заголовок 4","Заголовок 5"];
text =["Ремейк забытого хоррора про неприятных подвальных жителей, имеющих планы на въехавшую в дом семью, &mdash; по сценарию Гильермо дель Торо","Текст 2", "Текст 3", "Текст 4", "Текст 5"];
links =["link1.htm","link2.htm", "link3.htm", "link4.htm", "link5.htm"];

id = 1;
slides = 5;
delay = 8000;

function next() {
    if(id==slides) {id=0;}
    $(".slider-in").animate({"left":605*id*-1},500);
    $(".slider-h1").html(h1[id]);
    $(".slider-text").html(text[id]);
    $("#slider-button").attr("alt",links[id]);
    $(".slider-pages div").removeAttr("class");
    $(".slider-pages div").each(function() {if($(this).html()==(id+1)) {$(this).attr("class","active");}});
    if(id==0) {clearInterval(slider_interval);} else {id++;}
}

$().ready(function () {
    //$(".slider").hover(function() {clearInterval(slider_interval);},function() {slider_interval = setInterval(next, delay);});
    $(".slider-pages div").click(function() {
        clearInterval(slider_interval);
        $(".slider-pages div").removeAttr("class");
        $(this).attr("class","active");
        id = $(this).text()*1-1;
        $(".slider-h1").html(h1[id]);
        $(".slider-text").html(text[id]);
        $("#slider-button").attr("alt",links[id]);
        $(".slider-in").animate({"left":605*id*-1},500);
    });
    $(".slider-h1").html(h1[0]);
    $(".slider-text").html(text[0]);
    $("#slider-button").click(function() {window.location=$(this).attr("alt");});

    slider_interval = setInterval(next, delay);
});