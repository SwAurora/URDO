<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport"
    content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>URDO</title>
  <link href="/resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
  <!--CSS 링크-->
  <link rel="stylesheet" href="/resources/css/common.css">
  <link rel="stylesheet" href="/resources/css/pointShop.css">

  <!-- JQ -->
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>

<body>
  <!--네비게이션 시작-->
  <jsp:include page="/resources/includes/nav.jsp"/>

  <section class="Main">
    <div class="container">
      <!-- 컨테이너 시작-->

      <header>
        <div id="container_Title">
          포인트샵 > 유알콘
        </div>
        <div id="search">
          <div>유알콘</div>
          <div>|</div>
          <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
          <img src="/resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
        </div>
      </header>

      <!-- 탭버튼 시작 -->
      <ul class="menu-level1">
        <li class="level1 on">
          <a href="pointShop.html" class="on">유알콘</a>
          <ul class="menu-level2">
            <li><a href="#" class="l2-list on">실시간 인기</a></li>
            <li><a href="#" class="l2-list">일간 인기</a></li>
            <li><a href="#" class="l2-list">주간 인기</a></li>
          </ul>
        </li>
        <li class="level1">
          <a href="pointShopRoom.html" class="">방꾸미기</a>
          <ul class="menu-level2">
          </ul>
        </li>
        
        <li class="level1">
          <a href="pointShopGuide.html">가이드</a>
          <ul class="menu-level2 ">

          </ul>
        </li>
      </ul>

      

    <!-- 탭컨텐츠 시작 -->
    <!-- 실시간인기 컨텐츠 -->
    <div class="tabContents on">
      <!-- 1페이지 시작 -->
      <div class="tab1_page on">
        
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon6.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon6.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">1페이지입니다.</p>
          </div>
        </span>
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon7.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon7.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2페이지입니다.</p>
          </div>
        </span>
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon10.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon10.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2페이지입니다.</p>
          </div>
        </span>
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon11.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon11.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2페이지입니다.</p>
          </div>
        </span>
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon12.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon12.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2페이지입니다.</p>
          </div>
        </span>

      </div>


      <!-- 2페이지 시작 -->
      <div class="tab1_page">
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/pointshop.png" alt="" class="static">
          <img src="/resources/img/pointShop/pointshop.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2페이지입니다.</p>
          </div>
        </span>
      </div>
      <!-- 2페이지 끝 -->

      <!-- 3페이지 시작 -->
      <div class="tab1_page">
        <span class="hov-anim-box">
          <img src="/resources/img/pointShop/pointshop.png" alt="" class="static">
          <img src="/resources/img/pointShop/pointshop.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">3페이지입니다!</p>
          </div>
        </span>
      </div>
      <!-- 3페이지 끝 -->

    </div>

      <!-- 일간인기 컨텐츠 -->
    <div class="tabContents">
      <div class="tab2_page on">
        일간인기 1페이지
      </div>
      <div class="tab2_page">일간인기 2페이지</div>
      <div class="tab2_page">일간인기 3페이지</div>
    </div>


    <!-- 주간 인기 컨텐츠 -->
    <div class="tabContents">
      <span class="hov-anim-box">
        <img src="/resources/img/pointShop/pointshop.png" alt="" class="static">
        <img src="/resources/img/pointShop/pointshop.gif" alt="" class="animated">
        <div>
          <p class="imgTitle">유알콘주간인기</p>
          <p class="imgDesc">내용입니다!</p>
        </div>
      </span>
    </div>


      

    </div> <!-- 컨테이너 끝 -->


    <!-- 페이지네이션 시작 -->
    <div class="pointfoot">
      <div class="page_wrap">
          <img class="page_arrow menuIcon" id="prev" src="/resources/img/board/page-arrow-back.svg">
          <div class="page_nation">
              <a href="#" class="page_num on">1</a>
              <a href="#" class="page_num">2</a>
              <a href="#" class="page_num">3</a>
          </div>
          <img class="page_arrow menuIcon" id="next" src="/resources/img/board/page-arrow-forward.svg">
      </div>
      <div class="post">
          <input type='button' value='제작/등록' onclick='addtr()' class="addBtn" id="add">
      </div>
      <!--  페이지 숫자 끝-->
      <!-- 게시판 내용 관련 코드  끝-->
  </div>

  </section>
  <!--전체 JS-->
  <script src="/resources/js/common.js"></script>
</body>

</html>
