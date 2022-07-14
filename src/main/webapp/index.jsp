<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URDO</title>
    <!--CSS 링크-->
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">

    <jsp:include page="resources/includes/link.jsp"/>
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
    <jsp:include page="resources/includes/header.jsp"/>
    <!--퀵 메뉴 시작-->
    <jsp:include page="resources/includes/quickMenu.jsp"/>
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
                    <li><a href="/BoardHumor.do" title="웃긴 자료">웃긴 자료</a></li>
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
    <jsp:include page="resources/includes/loginBtn.jsp"/>
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
    <!-- footer -->
    <jsp:include page="resources/includes/footer.jsp"/>

</section>


<!--전체 JS-->
<script src="resources/js/common.js"></script>
<!-- index JS -->
<script src="resources/js/index.js"></script>
</body>
</html>
