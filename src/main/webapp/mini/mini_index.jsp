<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/mini/snake.css">
<link rel="stylesheet" href="/resources/css/mini/album.css">
<link rel="stylesheet" href="/resources/css/mini/guest.css">
<link rel="stylesheet" href="/resources/css/mini/home.css">
<link rel="stylesheet" href="/resources/css/mini/juk.css">
<link rel="stylesheet" href="/resources/css/mini/layout.css">

<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="/resources/includes/nav.jsp"/>

<section class="Main">
    <div class="bookcover">
        <div class="bookdot">
            <div class="page">
                <div class="column1">
                    <div class="visit"><span class="basic-text">TODAY <span id="TODAY">28</span> | TOTAL 24562</span></div>
                    <div class="profile">
                        <img class="profile-image" src="../resources/img/mini/profileImage.jpg">
                        <div class="profile-text basic-text">@Ano<br>학생이라는 죄로<br>학교라는 교도소에서<br>교실이라는 감옥에 갇혀<br>출석부라는
                            죄수명단에 올라<br>교복이라는 죄수복을 입고<br>공부란 벌을 받고<br>졸업이란 석방을 기다린다
                        </div>
                        <div class="profile-dropdown">
                            <div class="basic-text">아노(❁´◡`❁)</div>
                            <div class="dropdown">
                                <select>
                                    <option value="padotagi">파도타기</option>
                                    <option value="comunity">커뮤니티로 가기</option>
                                    <option value="instagram">인스타그램으로 가기</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="column2">
                    <div class="top-text-box">
                        <div class="title">
                            <div class="basic-text">아노의 미니홈피</div>
                        </div>
                        <div class="url">
                            <div class="basic-text">http://url주소/나중에입력</div>
                        </div>
                    </div>
                    <div class="main-content">
                        <div class="upper-content">
                            <div class="bold-text">Updated News</div>
                            <hr>
                            <div class="update-box">
                                <div class="new-text">
                                    <div class="line"><span class="photo">사진첩</span><span
                                            class="line_photo"> 학교 너무 힘들다..</span></div>
                                    <div class="line"><span class="board">게시판</span><span
                                            class="line_photo"> 사랑보다 좋은것</span></div>
                                    <div class="line"><span class="board">게시판</span><span
                                            class="line_photo"> 마 그레하입시더 댕댕이</span></div>
                                    <div class="line"><span class="photo">사진첩</span><span
                                            class="line_photo"> 2019/12/10 가평</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="bottom-content">
                            <div class="bold-text">Mini Room</div>
                            <hr>
                            <div class="miniroom"><img src="../resources/img/mini/pop-cat.gif"></div>
                        </div>
                    </div>
                </div>

                <div class="menu">
                    <a href="mini_index.do">
                        <div class="menu-box">홈</div>
                    </a>
                    <a href="mini_juk.do">
                        <div class="menu-box">쥬크박스</div>
                    </a>
                    <a href="mini_album.do">
                        <div class="menu-box">게시판</div>
                    </a>
                    <a href="mini_guest.do">
                        <div class="menu-box">방명록</div>
                    </a>
                    <a href="mini_snake.do">
                        <div class="menu-box">미니게임</div>
                    </a>
                </div>

            </div>
        </div>
    </div>
</section>

<!--전체 JS-->
<script src="/resources/js/common.js"></script>
<!-- index JS -->
<script src="/resources/js/index.js"></script>

</body>
</html>
