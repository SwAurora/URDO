<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
<!--CSS 링크-->
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/URPO.css">
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
      
      <div class="container_Contents">
      	<div class="shopImage">이미지</div>
      	<div class="title">타이틀</div>
      	<div class="discrip">설명</div>
      </div>

  </div>

  </section>
  <!--전체 JS-->
  <script src="/resources/js/common.js"></script>
</body>
</html>