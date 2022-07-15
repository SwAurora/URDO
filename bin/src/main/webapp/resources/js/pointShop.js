$(document).ready(function () {
  $('.level1').on('click', function () {
    idx = $(this).index();
    alert(idx);
    $('.level1').removeClass('on');
    $('.level1').eq(idx).addClass('on');
    $('.level1>a').removeClass('on');
    $('.level1>a').eq(idx).addClass('on');
    $('.tabContents').removeClass('on');
    $('.tabContents').eq(idx).addClass('on');
    $('.menu-level2').removeClass('on');
    $('.menu-level2').eq(idx).addClass('on');
  })

  $('.page_num').on('click', function() {
    idx2 = $(this).index();
    $('.page_num').removeClass('on');
    $('.page_num').eq(idx2).addClass('on');
    $('.pageContents').removeClass('on');
    $('.pageContents').eq(idx2).addClass('on');
  })



  $('#prev').on('click', function() {
    idx3=$('.page_num.on').index();
    if(idx3-1 >=0) {
      $('.page_num').removeClass('on');
      $('.page_num').eq(idx3-1).addClass('on');
      // 페이지컨텐츠를 구성하지 않았음
    }
  })
  $('#next').on('click', function() {
    end = $('.page_num').length - 1;
    idx3=$('.page_num.on').index();
    if(idx3+1 <= end) {
      $('.page_num').removeClass('on');
      $('.page_num').eq(idx3+1).addClass('on');
      // 페이지컨텐츠를 구성하지 않았음
    }
  })

});





