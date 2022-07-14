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
    <link rel="stylesheet" href="resources/css/login.css">
    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
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

<section class="Main" style="display: flex; justify-content: center; align-items: center;">
    <form action="/Login.do" method="post" onsubmit="idSave()">
        <div id="LoginBox">
            <!-- Login용 input -->
            <div class="inputBox">
                <input type="text" name="id" required="required" id="id">
                <span>ID</span>
            </div>
            <div class="inputBox">
                <input type="password" name="pw" required="required" id="pw">
                <span>PW</span>
                <div id="toggle" onclick="showHide();" class="menuIcon"></div>
            </div>
            <div class="checkbox">
                <input type="checkbox" id="chk1">
                <label for="chk1" id="chkLabel">아이디 저장</label>
            </div>

            <button type="submit" class="loginA" style="border:0; cursor:pointer">
                <span>Login</span>
                <i></i>
            </button>
            <div id="signIn">
                <a href="/SignUp.do" id="ss1">회원가입</a>
                <span id="ss2">/</span>
                <a href="#" id="ss3">비밀번호 찾기</a>
            </div>
        </div>
    </form>
    <script>
        $(function()
        {
            let cookieid = getCookie("saveid");
            console.log(cookieid);
            if(cookieid !== "")
            {
                $("input:checkbox[id='chk1']").prop("checked", true);
                $('#id').val(cookieid);
            }
        });

        function idSave()
        {
            let expdate = new Date();
            if($("#chk1").is(":checked"))
            {
                expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
                setCookie("saveid", $("#id").val(), expdate);
            }
            else
            {
                expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
                setCookie("saveid", $("#id").val(), expdate);
            }
        }

        function setCookie(name, value, expiredays)
        {
            let todayDate = new Date();
            todayDate.setTime(todayDate.getTime());
            if(todayDate > expiredays)
            {
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
            }
            else if(todayDate < expiredays)
            {
                todayDate.setDate(todayDate.getDate() + expiredays);
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toUTCString() + ";";
            }
        }

        function getCookie(Name)
        {
            let search = Name + "=";
            console.log("search : " + search);

            if(document.cookie.length > 0)
            { // 쿠키가 설정되어 있다면 
                let offset = document.cookie.indexOf(search);
                if(offset !== -1)
                { // 쿠키가 존재하면 
                    offset += search.length;
                    let end = document.cookie.indexOf(";", offset);
                    // 쿠키 값의 마지막 위치 인덱스 번호 설정
                    if(end === -1) end = document.cookie.length;
                    return unescape(document.cookie.substring(offset, end));
                }
            }
            return "";
        }
    </script>
</section>
<!--전체 JS-->
<script src="resources/js/common.js"></script>
<!--로그인 JS-->
<script src="resources/js/login.js"></script>
</body>
</html>
