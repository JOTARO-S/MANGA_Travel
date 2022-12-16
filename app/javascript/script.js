/*global $*/

//ハンバーガーメニュー
$(document).ready(function () {
  $(".navbar-toggler").on('click', function(){
    $(this).toggleClass('active');
  });
});

$(document).ready(function () {
    $("#img01").on('click', function(){
      var src = $(this).attr('src');
        $("#main-img").attr("src",src);
      return false;
    });
    $("#img02").on('click', function(){
      var src = $(this).attr('src');
        $("#main-img").attr("src",src);
      return false;
    });
    $("#img03").on('click', function(){
      var src = $(this).attr('src');
        $("#main-img").attr("src",src);
      return false;
    });
    $("#img04").on('click', function(){
      var src = $(this).attr('src');
        $("#main-img").attr("src",src);
      return false;
    });
    $("#img05").on('click', function(){
      var src = $(this).attr('src');
        $("#main-img").attr("src",src);
      return false;
    });

});

function message() {
alert("新規登録・ログイン後に利用が可能です。");
}

