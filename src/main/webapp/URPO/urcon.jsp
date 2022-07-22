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
  <%--링크--%>
  <jsp:include page="/resources/includes/link.jsp"/>
  <!--CSS 링크-->
  <link rel="stylesheet" href="../resources/css/URPO.css">
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
            <li><a href="#" class="l2-list">실시간 인기</a></li>
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
        
        <div class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon6.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon6.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">첫 번째 아이콘.</p>
          </div>
        </div>
        <div class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon7.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon7.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2두 번째 아이콘.</p>
          </div>
        </div>
        <div class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon10.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon10.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2세 번째아이콘.</p>
          </div>
        </div>
        <div class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon11.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon11.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2네번째아이콘.</p>
          </div>
        </div>
        <div class="hov-anim-box">
          <img src="/resources/img/pointShop/urcon12.bmp" alt="" class="static">
          <img src="/resources/img/pointShop/urcon12.gif" alt="" class="animated">
          <div>
            <p class="imgTitle">유알콘실시간인기</p>
            <p class="imgDesc">2다섯번째아이콘.</p>
          </div>
        </div>
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
          <a href="/URPO/produce.do" class="addBtn">제작/등록</a>
      </div>
      <!--  페이지 숫자 끝-->
      <!-- 게시판 내용 관련 코드  끝-->
 	 </div>
  </div>
  </section>

  <!--전체 JS-->
  <script src="../resources/js/common.js"></script>
</body>
</html>

