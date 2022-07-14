$(document).ready(function () {
  $('.menu-level2 li').on('click', function() {
    // menu-level2 : 실시간인기, 일간인기, 주간인기
    idx = $(this).index();
    $('.l2-list').removeClass('on');
    $('.l2-list').eq(idx).addClass('on');
    $('.tabContents').removeClass('on');
    $('.tabContents').eq(idx).addClass('on');
  })


  //탭 인덱스를 받아서 그에 해당하는 페이지를 출력하는 함수
    $('.page_num').on('click', function() {
      let idx2 = $(this).index();
      $('.page_num').removeClass('on');
      $('.page_num').eq(idx2).addClass('on');
      if(idx==0) {
        $('.tab1_page').removeClass('on');
        $('.tab1_page').eq(idx2).addClass('on');
      } else if(idx==1) {
        $('.tab2_page').removeClass('on');
        $('.tab2_page').eq(idx2).addClass('on');
      } else if(idx==2) {
        $('.tab3_page').removeClass('on');
        $('.tab3_page').eq(idx2).addClass('on');
      }
  })




  $('#prev').on('click', function() {
    idx3=$('.page_num.on').index();
    if(idx3-1 >=0) {
      $('.page_num').removeClass('on');
      $('.page_num').eq(idx3-1).addClass('on');
    }
  })
  $('#next').on('click', function() {
    end = $('.page_num').length - 1;
    idx3=$('.page_num.on').index();
    if(idx3+1 <= end) {
      $('.page_num').removeClass('on');
      $('.page_num').eq(idx3+1).addClass('on');
    }
  })
});





