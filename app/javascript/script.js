/*global $*/

// post-index カード開閉

$(document).ready(function(){
  var zindex = 10;
  
  $("li.card7").click(function(e){
    e.preventDefault();

    var isShowing = false;

    if ($(this).hasClass("show")) {
      isShowing = true
    }

    if ($("ul.cards7").hasClass("showing")) {
      $("li.card7.show")
        .removeClass("show");

      if (isShowing) {
        $("ul.cards7")
          .removeClass("showing");
      } else {
        $(this)
          .css({zIndex: zindex})
          .addClass("show");

      }

      zindex++;

    } else {
      // no cards in view
      $("ul.cards7")
        .addClass("showing");
      $(this)
        .css({zIndex:zindex})
        .addClass("show");
      zindex++;
    }
    
  });
});