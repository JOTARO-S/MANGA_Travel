/*global $*/

//ハンバーガーメニュー
$(document).ready(function () {
  $(".navbar-toggler").on('click', function(){
    $(this).toggleClass('active');
  });
});

$(document).ready(function () {
  
  $(".img01").on('click', function(obj){
  alert(obj.src);
  });
});

function message() {
alert("新規登録・ログイン後に利用が可能です。");
}

