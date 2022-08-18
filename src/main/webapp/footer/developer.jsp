<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>URDO</title>
  <!-- 링크 -->
  <jsp:include page="../resources/includes/link.jsp"/>
  <!-- CSS -->
  <link rel="stylesheet" href="../resources/css/developer.css">
</head>
<body>

<!--네비게이션 시작-->
<jsp:include page="../resources/includes/nav.jsp"/>

<!--메인 시작-->
<section class="Main" style="display: flex; justify-content: center; align-items: center">
  <div class="divs1">
    <div class="divs2">
      <div class="card" style="background-image: url(../resources/img/profile/김성욱.png);">
        <div class="card-content">
          <h2 class="card-title">
            김성욱
          </h2>
          <p class="card-body">
            사이드바, 레이아웃
          </p>
          <a href="https://github.com/SwAurora" class="button"><img src="../resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(../resources/img/profile/강현선.jpg);">
        <div class="card-content">
          <h2 class="card-title">
            강현선
          </h2>
          <p class="card-body">
            포인트샵,스토리보드,스타일가이드
          </p>
          <a href="https://github.com/Kanghyeonseon" class="button"><img src="../resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>
    </div>
    <div class="divs3">
      <div class="card" style="background-image: url(../resources/img/profile/정진명.png);">
        <div class="card-content">
          <h2 class="card-title">
            정진명
          </h2>
          <p class="card-body">
            로그인, 회원가입, 미니홈피
          </p>
          <a href="https://github.com/wjdwlsaud" class="button"><img src="../resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(../resources/img/profile/허준석.jpg);">
        <div class="card-content">
          <h2 class="card-title">
            허준석
          </h2>
          <p class="card-body">
            게시판
          </p>
          <a href="https://github.com/eee1717" class="button"><img src="../resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>

      <div class="card" style="background-image: url(../resources/img/profile/김재이.png);">
        <div class="card-content">
          <h2 class="card-title">
            김재이
          </h2>
          <p class="card-body">
            메인페이지
          </p>
          <a href="https://github.com/qjfwlq475" class="button"><img src="../resources/img/developer/github.svg" alt="#" class="developer-github"><span>GO GitHub</span></a>
        </div>
      </div>
    </div>
  </div>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
</body>
</html>
