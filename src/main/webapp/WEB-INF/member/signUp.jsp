<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URDO</title>
    <link href="../../resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
    <!--CSS 링크-->
    <link rel="stylesheet" href="../../resources/css/common.css">
    <link rel="stylesheet" href="../../resources/css/signUp.css">

    <!-- JQ -->
    <script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    String back = (String) request.getAttribute("back");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
    if(back != null)
    {
        out.println(back);
    }
%>
<!--네비게이션 시작-->
<nav class="nav-all">
    <!--헤더 시작-->
    <div id="nav-header">
        <!--로고-->
        <img src="../../resources/img/sidebar/logo.svg" alt="LOGO" id="logo" class="" onclick="GoHome()">
        <div id="logo-name">
            <span class="head-span1">URDO</span>
            <span class="head-span2">유머를 위한 알렉산드리아 도서관</span>
        </div>
        <div>
            <button id="arrow" onclick="moving_sidebar()">
                <img src="../../resources/img/sidebar/arrowLeft.png" alt="leftArrow">
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
                <td><img src="../../resources/img/sidebar/quick-home.svg" alt="MiniHomePage" class="navHIcon"></td>
                <td><span>내 미니홈피 바로가기</span></td>
                <td><img src="../../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
            <tr onclick="PointShop()">
                <td><img src="../../resources/img/sidebar/quick-shop.svg" alt="PointShop" class="navHIcon"></td>
                <td><span>포인트샵</span></td>
                <td><img src="../../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
            <tr onclick="MyPage()">
                <td><img src="../../resources/img/sidebar/quick-myPage.svg" alt="MyPage" class="navHIcon"></td>
                <td><span>마이 페이지</span></td>
                <td><img src="../../resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
            </tr>
        </table>
        <div class="darkMode">
            <div class="sunMoon">
                <img src="../../resources/img/sidebar/quick-moon.svg" alt="#" class="Moon navHIcon">
                <img src="../../resources/img/sidebar/quick-sun.svg" alt="#" class="Sun navHIcon">
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
                    <img src="../../resources/img/sidebar/menu-best.svg" alt="board" class="navIcon menuIcon">
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
                    <img src="../../resources/img/sidebar/menu-humor.svg" alt="board" class="navIcon menuIcon">
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
                    <img src="../../resources/img/sidebar/menu-creation.svg" alt="board" class="navIcon menuIcon">
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
                    <img src="../../resources/img/sidebar/menu-region.svg" alt="board" class="navIcon menuIcon">
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
                    <img src="../../resources/img/sidebar/menu-theme.svg" alt="board" class="navIcon menuIcon">
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
    <form action="/SignUp.do" name="form1" method="post" onsubmit="return check()">
        <!-- 회원가입 창 input 부분 -->
        <div id="d1">
            <div id="d2">

                <div class="inputBox ipBox">
                    <input type="text" name="id" required placeholder=" " pattern="^(?=.*[a-z0-9])[a-z0-9]{6,20}$"
                           title="6~20자의 영문과 숫자로만 입력해주세요.">
                    <span>아이디</span>
                </div>

                <div class="inputBox">
                    <input type="password" name="pw" required id="password" placeholder=" "
                           pattern="^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{6,16}$"
                           title="6~16자의 영문, 숫자, 특수문자(!@#$%^&*()._-)로만 입력해주세요.">
                    <span>비밀번호</span>
                </div>

                <div class="inputBox">
                    <input type="password" name="pwchk" required="" id="passwordCheck" placeholder=" "
                           title="비밀번호와 동일하게 입력해주세요."
                           pattern="">
                    <span>비밀번호 확인</span>
                </div>

                <div class="inputBox">
                    <input type="email" name="email" required placeholder=" "
                           pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
                           title="이메일 주소를 입력하세요.">
                    <span>이메일</span>
                </div>

                <div class="inputBox ipBox">
                    <input type="text" name="nickname" required placeholder=" "
                           pattern="^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$"
                           title="2~10자의 영문, 한글, 숫자만 입력해주세요.">
                    <span>닉네임</span>
                </div>

                <button type="submit" class="SignUp" style="border:0; cursor:pointer;">
                    <span>BECOME A LIBRARIAN</span>
                    <i></i>
                </button>
            </div>

            <!-- 이용약관 -->
            <div id="joinForm">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>
                                이용약관, 개인정보 수집 및 이용,
                                위치정보 이용약관(선택), 프로모션 안내
                                메일 수신(선택)에 모두 동의합니다.
                            </li>
                            <li class="checkAllBtn">
                                <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>
                                이용약관 동의(필수)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk1">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>
                                개인정보 수집 및 이용에 대한 안내(필수)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk2">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>
                                위치정보 이용약관 동의(선택)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk3">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check04">
                        <ul class="clearfix">
                            <li>
                                이벤트 등 프로모션 알림 메일 수신(선택)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk4">
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <input type="hidden" name="flag" value="true">
    </form>
</section>
<script>
    function check()
    {
        let form = document.form1;
        let chk1 = document.getElementById('chk1');
        let chk2 = document.getElementById('chk2');
        if(form.id.value === "" || form.pw.value === "" || form.pwchk.value === "" || form.email.value === "" || form.nickname.value === "")
        {
            alert("입력되지 않은 항목이 있습니다.");
            return false;
        }
        if(form.pw.value !== form.pwchk.value)
        {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        if(chk1.checked === false || chk2.checked === false)
        {
            alert("필수 약관을 동의해 주십시오.");
            return false;
        }
        return true;
    }
</script>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>
<!--회원가입 JS-->
<script src="../../resources/js/signUp.js"></script>
</body>
</html>
