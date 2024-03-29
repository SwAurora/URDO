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
                <form id="searchFrm" action="/URPO/search.do" onsubmit="return false">
                    <input type="text" class="searchBar" id="searchBar" placeholder="검색어를 입력하세요" name="keyword">
                    <a href="javascript:search()" class="searchBtn">
                        <img src="../resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon"
                             id="searchBarIcon">
                    </a>
                </form>
            </div>
        </header>

        <script>
            // 검색창 스크립트

            $('document').ready(function()
            {
                $("#searchBar").on("keyup", function(key)
                {
                    if(key.keyCode == 13)
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

        <!-- 탭버튼 시작 -->
        <ul class="menu-level1">
            <li class="level1">
                <a href="/URPO.do">유알콘</a>
            </li>
            <li class="level1 on">
                <a href="/URPO/guide.do" class="on">가이드</a>
            </li>
        </ul>

        <!-- 탭컨텐츠 시작 -->
        <!-- 실시간인기 컨텐츠 -->
        <div class="">
            <div class="guideCont">
                <p class="guideContTop">
                    유알콘은 (유알도) + (아이콘)으로 URDO 내에서 사용할 수 있는 아이콘입니다.<br>
                    회원가입 시 0포인트에서 시작합니다. URDO 회원은 포인트 샵에서 아이콘을 구매하여 프로필 아이콘으로 활용하실 수 있습니다.<br>
                    게시글 작성 시 4URPO, 게시글 추천 시 2URPO, 댓글 작성 시 1URPO가 증가하며 포인트 샵에서 원하는 유알콘을 선택하여 20URPO에 구매하실 수 있습니다.<br>
                    구매하신 아이콘은 마이페이지에서 확인할 수 있으며, 변경할 수 있습니다.<br>

                <div class="para">
                    <h3>&nbsp;▶ URDO 아이콘설명</h3>
                    <div class="paraContent">
                        <div style="position:relative;">
                            <div id="imgModal">
                                <img class="urconGuideImg" src="/resources/img/urpo/urcon/default.gif"
                                     style="width:50px;">
                            </div>
                            &nbsp;URDO에서는 아이디와 함께 아이콘을 URDO 내에서 자신을 나타내는 하나의 아이템으로 사용하고 있습니다.<br>
                            &nbsp;기본아이콘(
                            <button id="imgBtn">> 기본아이콘 보기 클릭<</button>
                            )만 쓰는 사람도 있고 독특한 자신만의 아이콘을 구매/제작 해서 쓰는 사람도 있는데요 만들고 싶어도 제작 방법과 사용 방법
                            을 모르는 분들께 약간(?)의 도움이 되고자 설명을 합니다. 창작능력은 여러분의 손에 달려있습니다. ^^; 아시는 분들은 그냥 지나쳐주세요..
                        </div>
                        <p>
                            &nbsp;URDO에서 사용되는 아이콘은 가로,세로 25*25 픽셀(Pixel)로 구성되어있습니다. 픽셀이란, 화면을 구성하는 점의 단위를 말
                            &nbsp;하는 것으로 우리가 지금 모니터를 통해 보는 모든 시각적인 화상은 픽셀이라는 작은 점으로 나타내어 집니다. 1픽셀은 여기
                            &nbsp;지금 보이는 괄호안의 점--> ( ㆍ ) 만합니다. 이게 1픽셀입니다.
                            &nbsp;URDO아이콘은 가로,세로 25*25 픽셀이라고 했으니깐 모두 625개의 점이 모여 만든 공간입니다.
                            &nbsp;이제 남은 건 저 625개의 픽셀로 구성된 작은 공간에 어떻게 원하는 아이콘을 만들어 넣을지를 생각하는 것만 남았습니다.
                            사실 그게 전부지만...
                        </p>
                    </div>
                </div>

                <script>
                    $(document).ready(function()
                    {
                        flag = 0;
                        $('#imgBtn').click(function()
                        {
                            if(flag == 0)
                            {
                                $('#imgModal')
                                    .css('display', 'block')
                                    .css('position', 'absolute')
                                    .css('top', '45px').css('left', '120px');
                                flag = 1;
                            }
                            else
                            {
                                $('#imgModal')
                                    .css('display', 'none');
                                flag = 0;
                            }
                        })
                    })

                </script>

                <div class="para">
                    <h3>
                        &nbsp;▶ 아이콘의 종류<br>
                    </h3>
                    <div class="paraContent">
                        &nbsp;URDO아이콘에 적합하게 용어를 정의하고 설명하겠습니다.<br>
                        &nbsp;URDO에서 쓰이는 아이콘을 분류하자면 크게 두가지로 나눌 수 있는데 그려넣는 방식에 따른 분류(도트아이
                        콘, 이미지아이콘)와 움직이는가의 여부(정지아이콘,애니아이콘) 등 입니다.<br>
                        <h4>1. 그려넣는 방식에 따른 분류</h4>
                        <div class="paraIn">
                            <b>도트아이콘</b>
                            &nbsp;&nbsp;도트아이콘은 주어진 공간에 점을 하나하나 찍어 표현하는 것으로 매우 깔끔한 이미지를 얻을 수 있습
                            니다. 마우스를 이용해서 선이나 면을 한번에 그어서 만드는게 아니라 정성스럽게(?) 점을 하나씩 연결해서 만든다고 보심 됩니다. 예를 들어 보면 아래와
                            같습니다.<br>
                            <b>이미지아이콘</b>
                            &nbsp;&nbsp;이미지아이콘은 사진, 이미지 등을 편집해서 넣는 방식입니다. 그린다기보다 이미 있는 기존의 사진, 이미지
                            등을 이용한다는게 다른 점입니다. 도트아이콘과는 다르게 부드러운 선처리가 가능하지만 작은 공간에 이미
                            지를 축소시켜 넣다보니 원본과 다르게 이미지가 뭉게지는 현상이 생기기도 합니다.<br>
                        </div>
                        <h4>2. 움직이는가의 여부에 따른 분류</h4>
                        <div class="paraIn">
                            <b>정지아이콘</b>
                            &nbsp;&nbsp;말그대로 정지! 움직임이 전혀 없는 아이콘입니다.<br>
                            <b>애니아이콘</b>
                            &nbsp;&nbsp;만화영화가 초당 여러개의 컷으로 구성되어있다는 걸 잘 모르는 분들은 없을 겁니다. 움직이는 애니아이콘 도 하나가 아닌 여러개의 컷으로 구성되어
                            있는데 별도의 툴(Tool)을 이용해야 만들 수 있습니다. 컷이 늘어날수록 용량이 늘어 아이콘이 늦게 뜨거나 컷과 컷사이의 움직임이 부자연스러울 수 있으니 제작 에
                            유의합니다.
                            &nbsp;아울러 움짤의 경우 IE 에서 지원하지 않는 파일이 있습니다. 움짤 이미지 파일을 IE 브라우저 위에 떨어뜨려 보고 움직이는지 꼭 확인해 보세요. (드래그
                            & 드랍)
                        </div>
                    </div>
                </div>
            </div><!-- 가이드 컨텐츠 끝 -->
        </div>
    </div>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
</body>
</html>

