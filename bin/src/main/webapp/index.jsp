<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">

    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 스와이퍼 -->
    <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css"/>
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>

</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
%>
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
                <!-- 아이콘바꿨음 -->
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

<!-- 메인 시작 -->
<section class="Main">
    <!-- 상단 -->
    <div class="container">
        <div id="main-header">
            <div id="main-header-left">
                <div id="container_Title">
                    URDO에 오신 걸 환영합니다!
                </div>
                <div id="search">
                    <div>홈</div>
                    <div>|</div>
                    <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
                    <img src="resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon"
                         id="searchBarIcon">
                </div>
            </div>


            <div id="weather">
                <img src="resources/img/index/cloud-sun.svg" class="menuIcon">
            </div>

        </div>
        <!-- 공지사항 -->
        <div id="notice">
            <div class="swiper notice-swap"> <!-- 슬라이더-->
                <ul id="notice-left">
                    <li><img src="resources/img/index/speaker.svg" width="20px" height="20px" class="menuIcon"></li>
                    <li>공지사항</li>
                </ul>
                <ul class="swiper-wrapper">
                    <li class="swiper-slide notice-slide"><span class="notice-A">임시점검</span>06:00~18:00</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">인기 도서관</span>알렉산드리아 도서관</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">게시판</span>선정적인 이미지 게시 금지</li>
                </ul>
            </div>
        </div>


        <div id="contents-top">
            <!-- 베스트 유머 게시판 -->
            <div id="best-humour">
                <table>
                    <caption class="mainTitle">베스트 유머</caption>
                    <tr id="humor-img">
                        <td><img src="resources/img/index/cat1.jpg" alt="베스트유머1"></td>
                        <td><img src="resources/img/index/dog1.jpg" alt="베스트유머2"></td>
                        <td><img src="resources/img/index/cat2.jpg" alt="베스트유머3"></td>
                        <td><img src="resources/img/index/dog2.jpg" alt="베스트유머4"></td>
                        <td><img src="resources/img/index/cat3.jpg" alt="베스트유머5"></td>
                        <td><img src="resources/img/index/dog3.jpg" alt="베스트유머6"></td>
                    </tr>
                    <tr class="best-humor-row2">
                        <td>제목</td>
                        <td>제목</td>
                        <td>제목</td>
                        <td>제목</td>
                        <td>제목</td>
                        <td>제목</td>
                    </tr>
                    <tr class="best-humor-row3">
                        <td>소제목</td>
                        <td>소제목</td>
                        <td>소제목</td>
                        <td>소제목</td>
                        <td>소제목</td>
                        <td>소제목</td>
                    </tr>
                </table>
            </div>

            <!-- 광고 -->
            <div id="banner">
                <div class="swiper banner">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner1.png"
                                                                    alt="광고1">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner2.png"
                                                                    alt="광고2">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner3.png"
                                                                    alt="광고3">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner4.png"
                                                                    alt="광고4">
                        </div>
                    </div>

                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <!-- contents-top 끝 -->
        </div>


        <div id="contents-bottom">
            <!-- 실시간 유머 등 게시판 -->
            <div id="realTimeBoard">
                <h2 class="mainTitle"> 실시간 </h2>

                <div id="tabUI">
                    <ul id="Board-menu">
                        <li class="change-borad">실시간 유머</li>
                        <li>실시간 뉴스</li>
                    </ul>
                    <div id="buttonbox">
                        <span>1/3</span>
                        <button id="prev">◀</button>
                        <button id="next">▶</button>
                    </div>
                </div>

                <div id="Board-table">
                    <table class="change-borad">
                        <tr>
                            <td>썸네일</td>
                            <td class="name">글제목</td>
                            <td>조회수</td>
                            <td>추천</td>
                            <td>글쓴이</td>
                            <td>날짜</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>실시간 유머 TEXT1</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>실시간 유머 TEXT2</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>실시간 유머 TEXT3</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>실시간 유머 TEXT4</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td>썸네일</td>
                            <td class="name">글제목</td>
                            <td>조회수</td>
                            <td>추천</td>
                            <td>글쓴이</td>
                            <td>날짜</td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>실시간 뉴스 TEXT</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>실시간 뉴스 TEXT</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>실시간 뉴스 TEXT</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>실시간 뉴스 TEXT</td>
                            <td>15</td>
                            <td>1</td>
                            <td>홍길동</td>
                            <td>2022-06-22</td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- 포인트샵 -->
            <div id="pointshop">
                <h2 class="mainTitle">포인트샵</h2>
                <ul>
                    <li class="item">아이템1</li>
                    <li>아이템2</li>
                    <li>아이템3</li>
                    <li>아이템4</li>
                    <li>아이템5</li>
                </ul>
                <div id="pointshop-table">
                    <table class="item">
                        <tr>
                            <td><img src="resources/img/pointShop/pointshop.gif"><label>로켓</label></td>
                            <td><img src="resources/img/index/pointshop-icon1.gif" alt="비 아이콘"><label>비</label></td>
                            <td><img src="resources/img/index/pointshop-icon2.gif" alt="종이 아이콘"><label>종이</label></td>
                            <td><img src="resources/img/index/pointshop-icon3.gif" alt="방울 아이콘"><label>방울</label></td>
                        </tr>
                        <tr>
                            <td><img src="resources/img/index/pointshop-icon4.gif" alt="별 아이콘"><label>별</label></td>
                            <td><img src="resources/img/index/pointshop-icon5.gif" alt="노이즈 아이콘"><label>노이즈</label></td>
                            <td><img src="resources/img/index/pointshop-icon6.gif" alt="비 아이콘"><label>비</label></td>
                            <td><img src="resources/img/index/pointshop-icon7.gif" alt="포켓몬 아이콘"><label>포켓몬</label></td>
                        </tr>
                        <tr>
                            <td><img src="resources/img/index/pointshop-icon3.gif" alt="방울 아이콘"><label>방울</label></td>
                            <td><img src="resources/img/index/pointshop-icon2.gif" alt="종이 아이콘"><label>종이</label></td>
                            <td><img src="resources/img/index/pointshop-icon7.gif" alt="포켓몬 아이콘"><label>포켓몬</label></td>
                            <td><img src="resources/img/index/pointshop-icon1.gif" alt="비 아이콘"><label>비</label></td>
                        </tr>
                    </table>

                    <table>
                        <tr>
                            <td><img src="resources/img/index/stop.png"></td>
                        </tr>
                        <tr>
                            <td>준비중입니다.</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td><img src="resources/img/index/stop.png"></td>
                        </tr>
                        <tr>
                            <td>준비중입니다.</td>
                        </tr>

                    </table>

                    <table>
                        <tr>
                            <td><img src="resources/img/index/stop.png"></td>
                        </tr>
                        <tr>

                            <td>준비중입니다.</td>
                        </tr>
                    </table>
                    <table>
                        <tr>
                            <td><img src="resources/img/index/stop.png"></td>
                        </tr>
                        <tr>
                            <td>준비중입니다.</td>
                        </tr>
                    </table>

                </div>
            </div>

        </div>

        <!-- contents-bottom 끝 -->
    </div>
    <footer>
        <div id="footer-bottom">
            <div id="footer-logo">
                <img src="resources/img/sidebar/logo.svg" alt="로고">
            </div>
            <div id="footer-terms">
                서비스 이용약관 | 개인정보 처리방침 | 청소년보호정책 | 이메일주소 무단수집거부 | 이용약관 | <span onclick="goDeveloper()"
                                                                             style="cursor:pointer;">개발자 소개</span> <br>
                URDO | 사업자등록번호 111-22-33333 | 대구 중구 중앙대로 366 반월센트럴타워 9층 | Fax 123-1234-1234 | 대표이사 XXX <br>
                Since 2022.06.XX, Copyright (c) 2022 URDO All right reserved.
            </div>
            <div id="footer-right">
                <div id="sns">
                    <img src="resources/img/index/github-square-brands.svg" alt="깃허브">
                    <img src="resources/img/index/twitter-square-brands.svg" alt="트위터">
                    <img src="resources/img/index/instagram-square-brands.svg" alt="인스타">
                </div>
                <div>
                    <select>
                        <option>부가 메뉴</option>
                    </select>
                </div>
            </div>

        </div><!--footer-bottom끝  -->

    </footer>

</section>


<!--전체 JS-->
<script src="resources/js/common.js"></script>
<!-- index JS -->
<script src="resources/js/index.js"></script>
</body>
</html>
