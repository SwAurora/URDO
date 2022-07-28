<%@ page import="com.korea.dto.UrpoDTO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
          <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
          <img src="/resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
        </div>
      </header>

      <!-- 탭버튼 시작 -->
      <ul class="menu-level1">
        <li class="level1 on">
          <a href="pointShop.html" class="on">유알콘</a>
          <ul class="menu-level2">
            <li><a href="#" class="l2-list">모든 아이템</a></li>
            <li><a href="#" class="l2-list">실시간 인기</a></li>
            <li><a href="#" class="l2-list">월간 인기</a></li>
          </ul>
        </li>
        <li class="level1">
          <a href="pointShopRoom.html" class="">방꾸미기</a>
          <ul class="menu-level2">
          </ul>
        </li>
        
        <li class="level1">
          <a href="pointShopGuide.html">가이드</a>
          <ul class="menu-level2 ">

          </ul>
        </li>
      </ul>

      

    <!-- 탭컨텐츠 시작 -->
    <!-- 실시간인기 컨텐츠 -->
    <div class="tabContents on">
			<%
				ArrayList<UrpoDTO> list = (ArrayList<UrpoDTO>) request.getAttribute("list");
			  for(UrpoDTO urpoDTO: list)
			  {
			%>
			<div class="hov-ani">
				<div class="hov-ani-img">
				  <img src=<%=urpoDTO.getStaticImage() %> alt="" class="static">
					<img src=<%=urpoDTO.getGifImage() %> alt="" class="animated">
			  </div>
			  <div>
				  <a class="imgTitle" href="javascript:modalOn()"><%=urpoDTO.getTitle()%></a>
			  </div>
			</div>
			<%
				}
			%>      		
      
    </div> <!-- 컨테이너 끝 -->
    
    <!-- 모달창 시작 -->
    
    
    <div id="urpo_modal">
    	<div class="modal_img"><img src=""></div>
    	<div class="modal_content">
    		<div class="modal_title"></div>
    		<div class="modal_discription"></div>
    		<div class="modal_price"></div>
	    	<a class="addBtn" href="javascript:modalOff()">닫기</a>
    		<div class="addBtn">구매하러가기</div>
    	</div>
    </div>
    <!-- 모달창 끝 -->
    
    <script>
    zidx=10;
    function modalOn() {
      $('#urpo_modal').css('display','flex').css('z-index',(zidx+1));
    }
    function modalOff() {
    	$('#urpo_modal').css('display', 'none');
    }
    
    </script>
    
    <!-- 페이지네이션 시작 -->
    <div class="pointfoot">
      <div class="page_wrap">
          <img class="page_arrow menuIcon" id="prev" src="/resources/img/board/page-arrow-back.svg">
          <div class="page_nation">
              <a href="#" class="page_num on">1</a>
              <a href="#" class="page_num">2</a>
              <a href="#" class="page_num">3</a>
          </div>
          <img class="page_arrow menuIcon" id="next" src="/resources/img/board/page-arrow-forward.svg">
      </div>
      <div class="post">
          <a href="/URPO/produce.do" class="addBtn">제작/등록</a>
      </div>
 	 </div>
    <!-- 페이지네이션 끝 -->


  </div>
  </section>

  <!--전체 JS-->
  <script src="../resources/js/common.js"></script>
</body>
</html>

