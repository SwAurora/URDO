<%@ page import="com.korea.dto.UrpoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
    <link rel="stylesheet" href="../resources/css/urpo.css">
</head>


<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert('<%=msg%>');
    history.back();
</script>
<%
    }
%>
<!--네비게이션 시작-->
<jsp:include page="/resources/includes/nav.jsp"/>

<section class="Main">
    <!-- 컨테이너 시작-->
    <div class="container">

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
            </li>

            <li class="level1">
                <a href="pointShopGuide.html">가이드</a>
            </li>
        </ul>
        <%
            UrpoDTO dto = (UrpoDTO) request.getAttribute("dto");
        %>
        <!-- 아이템 설명 시작 ud = urcon detail -->
        <form action="/URPO/purchase.do" method="post">
            <div class="ud_container">
                <div class="ud_title"><%=dto.getTitle() %>
                </div>
                <div class="urcon_detail">
                    <div class="ud_img"><img src=<%=dto.getGifImage() %>></div>
                    <div class="ud_contents">
                        <div>제작자 : <%=dto.getProducer() %>
                        </div>
                        <div class="ud_discription"><%=dto.getDiscription() %>
                        </div>
                        <div class="ud_pay">
                            <div class="ud_price">URPO :  <b><%=dto.getPrice() %>
                            </b> 구매하기
                            </div>
                            <input type="hidden" name="price" value="<%=dto.getPrice() %>">
                            <input type="hidden" name="no" value="<%=dto.getNo() %>">
                        </div>
                    </div>
                </div>
                <div class="report">
                    <div class="urcon_infobox">
                        <p>음란물을 유알콘으로 등록하는 경우 사이버수사대에 즉각 신고합니다.</p>
                        <p>서비스 이용에 부적절하거나, 저작권에 위반된 저작물일 경우 별도 통보 없이 판매중지될 수 있습니다.</p>
                    </div>
                </div>
            </div>
        </form>


        <!-- 아이템 설명 끝 -->

    </div>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
</body>
</html>
