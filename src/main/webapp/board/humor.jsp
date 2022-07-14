<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>URDO</title>
  <link href="../resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
  <!--CSS 링크-->
  <link rel="stylesheet" href="../resources/css/common.css">
  <link rel="stylesheet" href="../resources/css/board.css">
  <!-- JQ -->
  <script src="https://code.jquery.com/jquery-latest.min.js"></script>

  <script>
    $(document).ready(function()
    {
      let span = document.querySelectorAll('.depth1 span');
      $('#check2').prop('checked', true);
      span[2].innerHTML = '&#65293';
      span[3].style.color = getColor('--color-point');
      span[3].style.fontWeight = 'bold';
      $('#active').css('color', getColor('--color-active')).css('font-weight', 'bold');
    })
  </script>
<body>
<!--네비게이션 시작-->
<nav class="nav-all">
  <!--헤더 시작-->
  <div id="nav-header">
    <!--로고-->
    <img src="../resources/img/sidebar/logo.svg" alt="LOGO" id="logo" class="" onclick="GoHome()">
    <div id="logo-name">
      <span class="head-span1">URDO</span>
      <span class="head-span2">유머를 위한 알렉산드리아 도서관</span>
    </div>
    <div>
      <button id="arrow" onclick="moving_sidebar()">
        <img src="../resources/img/sidebar/arrowLeft.png" alt="leftArrow">
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
        <td><img src="../resources/img/sidebar/quick-home.svg" alt="MiniHomePage" class="navHIcon"></td>
        <td><span>내 미니홈피 바로가기</span></td>
        <td><img src="../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
      <tr onclick="PointShop()">
        <td><img src="../resources/img/sidebar/quick-shop.svg" alt="PointShop" class="navHIcon"></td>
        <td><span>포인트샵</span></td>
        <td><img src="../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
      <tr onclick="MyPage()">
        <td><img src="../resources/img/sidebar/quick-myPage.svg" alt="MyPage" class="navHIcon"></td>
        <td><span>마이 페이지</span></td>
        <td><img src="../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
      </tr>
    </table>
    <div class="darkMode">
      <div class="sunMoon">
        <img src="../resources/img/sidebar/quick-moon.svg" alt="#" class="Moon navHIcon">
        <img src="../resources/img/sidebar/quick-sun.svg" alt="#" class="Sun navHIcon">
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
          <img src="../resources/img/sidebar/menu-best.svg" alt="board" class="navIcon menuIcon">
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
          <img src="../resources/img/sidebar/menu-humor.svg" alt="board" class="navIcon menuIcon">
          <span>유머</span>
        </label>
        <ul class="depth2">
          <li><a href="/BoardHumor.do" title="웃긴 자료" id="active">웃긴 자료</a></li>
        </ul>
      </li>
      <li>
        <input type="checkbox" id="check3">
        <label for="check3">
          <span class="plus_minus">&#65291</span>
          <img src="../resources/img/sidebar/menu-creation.svg" alt="board" class="navIcon menuIcon">
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
          <img src="../resources/img/sidebar/menu-region.svg" alt="board" class="navIcon menuIcon">
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
          <img src="../resources/img/sidebar/menu-theme.svg" alt="board" class="navIcon menuIcon">
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
      <img src="../resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
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
      <img src="../resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
      <span>로그아웃</span>
    </button>
  </div>
  <%
    }
  %>
</nav>
<section class="Main">
  <div class="container">
    <div id="container_Title">
      게시판 > 유머 > 웃긴자료
    </div>
    <div id="search">
      <div>웃긴 자료</div>
      <div>|</div>
      <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
      <img src="../resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
    </div>

    <!-- 게시판 내용 관련 코드 -->
    <!-- 게시판윗부분 시작 -->
    <div class="board_list_wrap">
      <select class="sel">
        <option>5개</option>
        <option selected>10개</option>
        <option>15개</option>
        <option>20개</option>
        <option>30개</option>
      </select>
      <!-- 게시판 Table -->
      <table class="board_list" id="t1">
        <colgroup>
          <col id="boardCol1">
          <col id="boardCol2">
          <col id="boardCol3">
          <col id="boardCol4">
          <col id="boardCol5">
          <col id="boardCol6">
        </colgroup>
        <tr class="titlename">
          <td class="tname">번호</td>
          <td class="tname">썸네일</td>
          <td class="tname" id="titleboard">글제목</td>
          <td class="tname">조회</td>
          <td class="tname">추천</td>
          <td class="tname">글쓴이</td>
          <td class="tname">날짜</td>
        </tr>
        <!-- 게시판 내용물 시작 -->
        <tr>
          <td>1</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지1</a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>2</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지2 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>3</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지3 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>4</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지4 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>5</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지5 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>6</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지6 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>7</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지7 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>8</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지8 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>9</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지9 </a></td>
          <td>31</td>
          <td>1</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
        <tr>
          <td>10</td>
          <td><img src="../resources/img/board/frog.png" class="pic"></td>
          <td><a href="boardContents.html" class="boardlist">가위바위보를 이기는 방법99가지10 </a></td>
          <td>331</td>
          <td>91</td>
          <td>김첨지</td>
          <td>2022-06-16</td>
        </tr>
      </table>
      <!--  페이지 숫자 -->
    </div>
    <!-- 페이지네이션 시작 -->
    <div class="boardfoot">
      <div class="page_wrap">
        <img class="page_arrow menuIcon" id="prev" src="../resources/img/board/page-arrow-back.svg">
        <div class="page_nation">
          <a href="#" class="page_num on">1</a>
          <a href="#" class="page_num">2</a>
          <a href="#" class="page_num">3</a>
        </div>
        <img class="page_arrow menuIcon" id="next" src="../resources/img/board/page-arrow-forward.svg">
      </div>
      <div class="post">
        <input type='button' value='게시글 작성' onclick="location.href='board_humorWrite.html'" class="pagebtn" id="add">
      </div>
      <!--  페이지 숫자 끝-->
      <!-- 게시판 내용 관련 코드  끝-->
    </div>
  </div>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
<!--포인트샵 JS-->
<script src="../resources/js/pointShop.js"></script>
<!--게시판 JS-->
<script src="../resources/js/board.js"></script>

</body>
</html>

