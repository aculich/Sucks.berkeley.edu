$(document).ready(function() {
  
  $('#dev-request').click(function(){
    centerPopup();
    devRequestPopup();
    disableScroll();
    setupExit();
  });

  $('#close-popup').click(function(){
    closePopup();
    enableScroll();
  });

  $(window).resize(function(){
    centerPopup();
    devRequestPopup();
  });

});

setupExit = function() {
  $('#overlay').click(function() {
    closePopup();
    enableScroll();
  });
}

closePopup = function() {
  $('#request-popup').css({"display" : "none"});
  $('#overlay').css({"display" : "none"});
}

devRequestPopup = function() {
  $('#overlay').height($(document).height());
  $('#overlay').width($(document).width());
  $('#overlay').css({"display" : "block"});
}

centerPopup = function() {
  var winw = $(window).width();  
  var winh = $(window).height();  
  var popw = $('#request-popup').width();  
  var poph = $('#request-popup').height();  
  $("#request-popup").css({ 
    "display" : "block", 
    "position" : "absolute",  
    "top" : winh/2-poph/2,  
    "left" : winw/2-popw/2  
  });  
}

// left: 37, up: 38, right: 39, down: 40,
// spacebar: 32, pageup: 33, pagedown: 34, end: 35, home: 36
var keys = [37, 38, 39, 40];

function preventDefault(e) {
    e = e || window.event;
    if (e.preventDefault) {
        e.preventDefault();
    }
    e.returnValue = false;
}

function keydown(e) {
    for (var i = keys.length; i--;) {
        if (e.keyCode === keys[i]) {
            preventDefault(e);
            return;
        }
    }
}

function wheel(e) {
    preventDefault(e);
}

function disableScroll() {
    if (window.addEventListener) {
        window.addEventListener('DOMMouseScroll', wheel, false);
    }
    window.onmousewheel = document.onmousewheel = wheel;
    document.onkeydown = keydown;
}

function enableScroll() {
    if (window.removeEventListener) {
        window.removeEventListener('DOMMouseScroll', wheel, false);
    }
    window.onmousewheel = document.onmousewheel = document.onkeydown = null;
}
