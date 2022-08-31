/**
 * Created by Takayuki on 2016/02/07.
 */

// document.write("ハローワールド");

$(function() {
    $('a[href^=#]').click(function() {
        var speed = 400; // ミリ秒
        var href = $(this).attr("href");
        var target = $(href == "#" || href == "" ? 'html' : href);
        //$($.browser.safari ? 'body' : 'html').animate({scrollTop:position}, speed, 'swing');
        var body = 'body';
        var userAgent = window.navigator.userAgent.toLowerCase();
        if (userAgent.indexOf('msie') > -1 || userAgent.indexOf('trident') > -1 || userAgent.indexOf("firefox") > -1 ) { /*IE6.7.8.9.10.11*/
            body = 'html';
        }
        $(body).animate({
            scrollTop: position
        }, speed, 'swing');
        return false;
    });
});

