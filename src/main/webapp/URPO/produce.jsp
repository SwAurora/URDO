<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/resources/img/sidebar/logo.svg" rel="shortcut icon" type="image/png">
<!--CSS 링크-->
<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/URPO.css">
<!-- JQ -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
  <!--네비게이션 시작-->
  <jsp:include page="/resources/includes/nav.jsp"/>

 	<section class="Main">
  	<div class="container"> <!-- **********container시작********** -->
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
      
			<div class="container_Contents">
				<form action="/URPO/produce.do" name="produce_form" id="produce_form" method="post">
					<select name="category">
					  <option value="urcon" selected>유알콘</option>
					  <option value="room">방꾸미기</option>
					</select>
				
				<div>
			    <input type="text" class="" placeholder="제목을 입력해주세요." name="title">
			    <textarea name="content" class="URmain" cols="30" rows="10" placeholder="설명을 입력해 주세요"></textarea>
					<input type="text" class="" placeholder="가격을 입력해주세요." name="price">
					<input type="text" class="" placeholder="staticImage" name="staticImage">
				</div>
				
				<div class="post">
				    <input type='button' value='취소' class="" onclick="goBack()">
				<input type='button' value='게시글 등록' class="" onclick="postchk()">
				</div>
				<input type="hidden" name="flag" value="true">
				
				</form>
			</div>
			
		</div> <!-- **********container 끝********** -->

  </section>
  <!--전체 JS-->
  <script src="/resources/js/common.js"></script>
</body>
</html>