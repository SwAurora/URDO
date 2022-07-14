<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="Quick_menu">
    <table>
        <colgroup>
            <col id="Quick_col1">
            <col id="Quick_col2">
            <col id="Quick_col3">
        </colgroup>
        <tr onclick="MiniHomePage()">
            <td><img src="/resources/img/sidebar/quick-home.svg" alt="MiniHomePage" class="navHIcon"></td>
            <td><span>내 미니홈피 바로가기</span></td>
            <td><img src="/resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
        </tr>
        <tr onclick="PointShop()">
            <td><img src="/resources/img/sidebar/quick-shop.svg" alt="PointShop" class="navHIcon"></td>
            <td><span>포인트샵</span></td>
            <td><img src="/resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
        </tr>
        <tr onclick="MyPage()">
            <td><img src="/resources/img/sidebar/quick-myPage.svg" alt="MyPage" class="navHIcon"></td>
            <td><span>마이 페이지</span></td>
            <td><img src="/resources/img/sidebar/quick-golink.svg" alt="arrow" class="linkIcon menuIcon"></td>
        </tr>
    </table>
    <div class="darkMode">
        <div class="sunMoon">
            <img src="/resources/img/sidebar/quick-moon.svg" alt="#" class="Moon navHIcon">
            <img src="/resources/img/sidebar/quick-sun.svg" alt="#" class="Sun navHIcon">
        </div>
        <span class="darkMode-text">다크 모드</span>
        <div class="toggle-switch">
            <span class="switch"></span>
        </div>
    </div>
</div>
