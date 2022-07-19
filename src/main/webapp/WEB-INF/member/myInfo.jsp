<%@ page import="com.korea.dto.MemberDTO" %>
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
    <jsp:include page="/resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/myinfo.css">
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
<jsp:include page="/resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <!-- 상단 -->
    <div class="container">
        <div id="main-header">
            <div id="main-header-left">
                <div id="search">
                    <div>홈</div>
                    <div>|</div>
                    <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
                    <img src="/resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon"
                         id="searchBarIcon">
                </div>
            </div>

        </div>
        <!-- 공지사항 -->
        <div id="notice">
            <div class="swiper notice-swap"> <!-- 슬라이더-->
                <ul id="notice-left">
                    <li><img src="/resources/img/index/speaker.svg" width="20px" height="20px" class="menuIcon"></li>
                    <li>공지사항</li>
                </ul>
                <ul class="swiper-wrapper">
                    <li class="swiper-slide notice-slide"><span class="notice-A">임시점검</span>06:00~18:00</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">인기 도서관</span>알렉산드리아 도서관</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">게시판</span>선정적인 이미지 게시 금지</li>
                </ul>
            </div>
        </div>


<%
    MemberDTO dto = (MemberDTO)request.getAttribute("dto");
%>

        <div id="contents">

            <h1>마이 페이지</h1>

            <div class="wrap">
                <div class="blueContainer">
                    <div>
                        <div class="name"><%= dto.getNickname() %></div>
                    </div>

                </div>
                <div class="summaryContainer">
                    <div class="item">
                        <div class="number">354</div>
                        <div>내가 쓴 글</div>
                    </div>
                    <div class="item">
                        <div class="number">976</div>
                        <div>내가 쓴 댓글</div>
                    </div>
                    <div class="item">
                        <div class="number">112</div>
                        <div>추천받은 글</div>
                    </div>
                    <div class="item">
                        <div class="number">1392</div>
                        <div>추천한 글</div>
                    </div>
                    <div class="item">
                        <div class="number">1786</div>
                        <div>포인트(URDO)</div>
                    </div>
                </div>

                <div class="listContainer">

                    <div class="item">

                        <div class="text">아이디</div>
                        <div class="text"><%= dto.getId() %></div>

                    </div>

                    <div class="item">

                        <div class="text">이메일</div>
                        <div class="text"><%= dto.getEmail() %></div>
                        <div class="right"><button class="text"> 수정</button></div>

                    </div>

                    <div class="item">

                        <div class="text">닉네임</div>
                        <div class="text"><%= dto.getNickname() %></div>
                        <div class="right"><button class="text"> 수정</button></div>

                    </div>

                </div>

            </div>


        </div>

        <!-- footer -->
        <jsp:include page="/resources/includes/footer.jsp"/>
</section>

<!--전체 JS-->
<!-- index JS -->
<script src="/resources/js/index.js"></script>
</body>
</html>