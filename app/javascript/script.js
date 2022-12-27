/*global $*/

//ハンバーガーメニュー
$(document).ready(function () {
  $(".navbar-toggler").on('click', function(){
    $(this).toggleClass('active');
  });
});

//画像切り替え機能
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

// ヘルプ
$(document).ready(function () {
//アコーディオンをクリックした時の動作
$('.accordion-title').on('click', function() {//タイトル要素をクリックしたら
  var findElm = $(this).next(".accordion-box");//直後のアコーディオンを行うエリアを取得し
  $(findElm).slideToggle();//アコーディオンの上下動作
    
  if($(this).hasClass('accordion-close')){//タイトル要素にクラス名closeがあれば
    $(this).removeClass('accordion-close');//クラス名を除去し
  }else{//それ以外は
    $(this).addClass('accordion-close');//クラス名closeを付与
  }
});
});

$(document).ready(function () {
//ページが読み込まれた際にopenクラスをつけ、openがついていたら開く動作※不必要なら下記全て削除
$(window).on('load', function(){
  $('.accordion-area li:first-of-type section').addClass("accordion-open"); //accordion-areaのはじめのliにあるsectionにopenクラスを追加
  $(".open").each(function(index, element){ //openクラスを取得
    var Title =$(element).children('.accordion-title'); //openクラスの子要素のtitleクラスを取得
    $(Title).addClass('accordion-close');       //タイトルにクラス名closeを付与し
    var Box =$(element).children('.accordion-box'); //openクラスの子要素boxクラスを取得
    $(Box).slideDown(500);          //アコーディオンを開く
  });
});
});

//ページトップ
$(document).ready(function () {
// #page-topをクリックした際の設定
$('#page-top').click(function () {
    $('body,html').animate({
        scrollTop: 0//ページトップまでスクロール
    }, 500);//ページトップスクロールの速さ。数字が大きいほど遅くなる
    return false;//リンク自体の無効化
});
});


//ページダウン
$(document).ready(function () {
  $('.page-down').click(function () {
    const position = $('#top-list').offset().top;
    $('body,html').animate({
        scrollTop: position
    }, 500);
    return false;
  });
});
