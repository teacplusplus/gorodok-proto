/**
 * Created with JetBrains RubyMine.
 * User: tea
 * Date: 7/21/12
 * Time: 2:48 AM
 * To change this template use File | Settings | File Templates.
 */

function overlay_close() {$(".overlay,.overlay-gl").detach();}

$().ready(function() {
    //overlay();
    $("#but-close").live("click",function() {overlay_close();});
});

