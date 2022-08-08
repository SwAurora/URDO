<%@ page import="java.util.ArrayList" %>
<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URDO</title>
    <!-- 링크 -->
    <jsp:include page="resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
    location.href = "/";
</script>
<%
    }
%>
<!--네비게이션 시작-->
<jsp:include page="resources/includes/nav.jsp"/>

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
                    <form id="searchFrm" action="/Board/search.do" onsubmit="return false">
	                    <input type="text" class="searchBar" placeholder="검색어를 입력하세요" id="searchBar" name="keyword">
	                    <input type="hidden" name="subject" value="searchMain">
	                    <a href="javascript:search()" class="searchBtn">
	                    	<img src="resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon"
	                         id="searchBarIcon">
                        </a>
                    </form>
                </div>
            </div>
            <script>
                $('document').ready(function()
                {
                    $("#searchBar").on("keyup", function(key)
                    {
                        if(key.keyCode === 13)
                        {
                            search();
                        }
                    });
                });

                function search()
                {
                    if($('#searchBar').val() === "")
                    {
                        alert("검색어를 입력해주세요.");
                    }
                    document.getElementById("searchFrm").submit();
                }
            </script>
            <div id="weather">
                <div><img class="weatherIcon"></div>
                <div>
                    <span class="place"></span><br>
                    <span class="temperature"></span><br>
                    <span class="weatherDescription"></span><br>
                </div>
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
            <div id="best-humor">
                <table>
                    <caption class="mainTitle">베스트 유머</caption>
                    <%
                        ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
                    %>
                    <tr id="humor-img">
                    <%
                        for(BoardDTO boardDTO : list)
                        {
                            if(boardDTO.getFilename() != null)
                            {
                    %>
                                <td><a href="/Board/read.do?board=<%=boardDTO.getSubject()%>&no=<%=boardDTO.getNo()%>"><img src="/resources/files/B<%=boardDTO.getNo()%>/<%=boardDTO.getFilename().split(";")[0]%>" class="pic"></a></td>
                    <%
                            }
                            else
                            {
                    %>
                                <td><a href="/Board/read.do?board=<%=boardDTO.getSubject()%>&no=<%=boardDTO.getNo()%>"><img src="/resources/img/board/thumbLogo.svg" class="pic"></a></td>
                    <%
                            }
                        }
                    %>
                    </tr>
                    <tr class="best-humor-row2">
                        <%
                            for(BoardDTO boardDTO : list)
                            {
                                out.println("<td>" + boardDTO.getTitle() + "</td>");
                            }
                        %>
                    </tr>
                    <tr class="best-humor-row3">
                        <%
                            for(BoardDTO boardDTO : list)
                            {
                                out.println("<td>" + boardDTO.getRecommend() + "</td>");
                            }
                        %>
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
                <h2 class="mainTitle"> 베스트 </h2>

                <div id="tabUI">
                    <ul id="Board-menu">
                        <li class="change-board">실시간 베스트</li>
                        <li>월간 베스트</li>
                    </ul>
                    <div id="buttonbox">
                        <span>1/3</span>
                        <button id="prev">◀</button>
                        <button id="next">▶</button>
                    </div>
                </div>
                <%
                    ArrayList<BoardDTO> list2 = (ArrayList<BoardDTO>) request.getAttribute("list2");
                	System.out.println(list2.toString());
                %>
                <div id="Board-table">
                    <table class="change-board">
                        <tr>
                            <td>썸네일</td>
                            <td class="name">글제목</td>
                            <td>조회수</td>
                            <td>추천</td>
                            <td>글쓴이</td>
                            <td>날짜</td>
                        </tr>
                        <%
                        
                            for(BoardDTO boardDTO : list2)
                            {
                                out.println("<tr>");
                                if(boardDTO.getFilename() != null)
                                {
                        %>
                                    <td><img src="/resources/files/B<%=boardDTO.getNo()%>/<%=boardDTO.getFilename().split(";")[0]%>" alt="#" class="bestThumb"></td>
                        <%
                                }
                                else
                                {
                        %>
                                    <td><img src="/resources/img/board/thumbLogo.svg" alt="#" class="bestThumb"></td>
                        <%
                                }
                        %>
                                <td class="name"><a href="/Board/read.do?board=<%=boardDTO.getSubject()%>&no=<%=boardDTO.getNo()%>"><%=boardDTO.getTitle()%></a></td>
                                <td><%=boardDTO.getViews()%></td>
                                <td><%=boardDTO.getRecommend()%></td>
                                <td><%=boardDTO.getWriter()%></td>
                                <td><%=boardDTO.getDate()%></td>
                        <%
                                out.println("</tr>");
                            }
                        %>

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
                            <td><img src="resources/img/index/pointshop-icon5.gif" alt="노이즈 아이콘"><label>노이즈</label></td>
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
<script src="/resources/js/common.js"></script>
<!-- index JS -->
<script src="/resources/js/index.js"></script>
</body>
</html>
