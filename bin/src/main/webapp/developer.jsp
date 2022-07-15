<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>URDO</title>
  <link href="resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
  <!--CSS 링크-->
  <link rel="stylesheet" href="resources/css/common.css">
  <link rel="stylesheet" href="resources/css/developer.css">
</head>
<body>
<!--네비게이션 시작-->
<nav class="nav-all">
  <!--헤더 시작-->
  <div id="nav-header">
    <!--로고-->
    <img src="resources/img/sidebar/logo.svg" alt="LOGO" id="logo" class="" onclick="GoHome()">
    <div id="logo-name">
      <span class="head-span1">URDO</span>
      <span class="head-span2">유머를 위한 알렉산드리아 도서관</span>
    </div>
    <div>
      <button id="arrow" onclick="moving_sidebar()">
        <img src="resources/img/sidebar/arrowLeft.png" alt="leftArrow">
      </button>
    </div>
  </div>

  <!--퀵 메뉴 시작-->
  <div id="Quick_menu">
    <table>
      <colgroup>
        <col id="Quick_col1">
        <col id="Quick_col2">
        <col id="Quick_col3">
      </colgroup>
      <tr onclick="MiniHomePage()">
        <td><img src="resources/img/sidebar/quick-home.svg" alt="MiniHomePage" class="navHIcon"></td>
        <td><span>내 미니홈피 바로가기</span></td>
        <td><img src="resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
      <tr onclick="PointShop()">
        <td><img src="resources/img/sidebar/quick-shop.svg" alt="PointShop" class="navHIcon"></td>
        <td><span>포인트샵</span></td>
        <td><img src="resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
      <tr onclick="MyPage()">
        <td><img src="resources/img/sidebar/quick-myPage.svg" alt="MyPage" class="navHIcon"></td>
        <td><span>마이 페이지</span></td>
        <td><img src="resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
    </table>
    <div class="darkMode">
      <div class="sunMoon">
        <img src="resources/img/sidebar/quick-moon.svg" alt="#" class="Moon navHIcon">
        <img src="resources/img/sidebar/quick-sun.svg" alt="#" class="Sun navHIcon">
      </div>
      <span class="darkMode-text">다크 모드</span>
      <div class="toggle-switch">
        <span class="switch"></span>
      </div>
    </div>
  </div>
  <!--메뉴 바 시작-->
  <div id="Menu_bar">
    <span>게시판</span>

    <ul class="depth1">
      <li>
        <input type="checkbox" id="check1">
        <label for="check1">
          <span class="plus_minus">&#65291</span>
          <img src="resources/img/sidebar/menu-best.svg" alt="board" class="navIcon menuIcon">
          <span>베스트 게시글</span>
        </label>
        <ul class="depth2">
          <li><a href="board_nowBest.html" title="실시간베스트">실시간 베스트</a></li>
          <li><a href="board_monthBest.html" title="월간베스트">월간 베스트</a></li>
          <li><a href="board_miniBest.html" title="미니홈피추천작">미니홈피 추천작</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check2">
        <label for="check2">
          <span class="plus_minus">&#65291</span>
          <img src="resources/img/sidebar/menu-humor.svg" alt="board" class="navIcon menuIcon">
          <span>유머</span>
        </label>
        <ul class="depth2">
          <li><a href="board_humor.html" title="웃긴 자료">웃긴 자료</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check3">
        <label for="check3">
          <span class="plus_minus">&#65291</span>
          <img src="resources/img/sidebar/menu-creation.svg" alt="board" class="navIcon menuIcon">
          <span>창작게시판</span>
        </label>
        <ul class="depth2">
          <li><a href="board_creArt.html" title="그림">그림</a></li>
          <li><a href="board_creCook.html" title="요리">요리</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check4">
        <label for="check4">
          <span class="plus_minus">&#65291</span>
          <img src="resources/img/sidebar/menu-region.svg" alt="board" class="navIcon menuIcon">
          <span>지역</span>
        </label>
        <ul class="depth2">
          <li><a href="board_regionRestaurant.html" title="맛집">맛집</a></li>
          <li><a href="board_regionLandMark.html" title="명소">명소</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check5">
        <label for="check5">
          <span class="plus_minus">&#65291</span>
          <img src="resources/img/sidebar/menu-theme.svg" alt="board" class="navIcon menuIcon">
          <span>테마</span>
        </label>
        <ul class="depth2">
          <li><a href="board_themeGame.html" title="게임">게임</a></li>
          <li><a href="board_themeSports.html" title="스포츠">스포츠</a></li>
          <li><a href="board_themeMusic.html" title="음악">음악</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <!--로그인/로그아웃 버튼-->
  <%
    HttpSession sessionchk = request.getSession();
    String id = (String) sessionchk.getAttribute("id");
    if(id == null)
    {
  %>
  <div id="loginWrap">
    <button onclick="Login()" class="btn" style="cursor:pointer;">
      <img src="resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
      <span>로그인</span>
    </button>
  </div>
  <%
  }
  else
  {
  %>
  <div id="loginWrap">
    <button onclick="Logout()" class="btn" style="cursor:pointer;">
      <img src="resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
      <span>로그아웃</span>
    </button>
  </div>
  <%
    }
  %>
</nav>

<section class="Main" style="display: flex; justify-content: center; align-items: center">
  <div class="divs1">
    <div class="divs2">
      <div class="card" style="background-image: url(resources/img/profile/김성욱.png);">
        <div class="card-content">
          <h2 class="card-title">
            김성욱
          </h2>
          <p class="card-body">
            사이드바, 레이아웃
          </p>
          <a href="#" class="button"><img src="resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(resources/img/profile/강현선.jpg);">
        <div class="card-content">
          <h2 class="card-title">
            강현선
          </h2>
          <p class="card-body">
            포인트샵,스토리보드,스타일가이드
          </p>
          <a href="#" class="button"><img src="resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>
    </div>
    <div class="divs3">
      <div class="card" style="background-image: url(resources/img/profile/정진명.png);">
        <div class="card-content">
          <h2 class="card-title">
            정진명
          </h2>
          <p class="card-body">
            로그인, 회원가입, 미니홈피
          </p>
          <a href="#" class="button"><img src="resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(resources/img/profile/허준석.jpg);">
        <div class="card-content">
          <h2 class="card-title">
            허준석
          </h2>
          <p class="card-body">
            게시판
          </p>
          <a href="#" class="button"><img src="resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(resources/img/profile/김재이.png);">
        <div class="card-content">
          <h2 class="card-title">
            김재이
          </h2>
          <p class="card-body">
            메인페이지
          </p>
          <a href="#" class="button"><img src="resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>
    </div>
  </div>
</section>

<!--전체 JS-->
<script src="resources/js/common.js"></script>
</body>
</html>
