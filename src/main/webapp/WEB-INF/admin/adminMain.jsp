<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> URDO 관리페이지 </title>

<link rel="stylesheet" href="/resources/css/admin/common.css">
<link rel="stylesheet" href="/resources/css/admin/adminMain.css">
<link rel="stylesheet" href="/resources/css/admin/nav.css">
<link rel="stylesheet" href="/resources/css/admin/footer.css">
<link rel="stylesheet" href="/resources/css/admin/header.css">

<!-- 차트 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>


</head>
<body>
  

<!-- 사이드 네비게이션  -->
<%@include file ="/resources/includes/admin/nav.jsp" %>



<header>
  <div id="headerTop">
      <h1></h1>
      <ul id="headernav">
        <li id="todobtn"><a href="javascript:showTodolist()">TODO </a></li>
        <!-- 클릭시 todo -->
         <li><a href="/main.do" style="color:black;"> 메인이동 </a></li>
      </ul>
  </div>

  <div id="todolist">
 
    <div id="txtbox">
        <input type="text" id="txt" placeholder="할 일을 입력하세요">
        <button class="add" onclick="addlist()"> + </button>
    </div>

    <nav id="DoDone">
        <ul>
          <a href="javascript:Showdoitlist()"><li class="on">Doit</li></a>
          <a href="javascript:Showdonelist()"><li>Done</li></a>
        </ul>
    </nav>

    <div class="contentbox doit">
        <table id="doing" class="list"></table>
    </div>
    <div class="contentbox done">
        <table id="donelist" class="list"></table>
    </div>
</div>
</header>



<section>
  <div id="dashBoard">

    <!-- 1번 -->
    <div id="statistics_box">
      
      <div class="stat day">
        <span> 일별 방문자 수</span>
        <p class="status">3,123</p>
      </div>

      <div class="stat week">
        <span> 주별 방문자 수</span>
        <p class="status">123,123</p>
      </div>

      <div class="stat month">
        <span class="title_name"> 월별 방문자 수 </span>

        <p class="status"> 12,134,422 </p>
      </div>

      <button class="view_stat"> 통계보기 </button>
    </div>

    <!-- 차트 -->
    <div id="chart">
      <div id="paddingTest">
      <canvas id="line-chart" width="800" height="250"></canvas>
    </div>
    </div>


    <!-- 공지사항 미니창 -->
    <div id="miniBoard">
      
      <!-- 공지사항 --> 
      <div class="board">
        <table class="Board-table notice">
        <caption> 
          <span class="captionTag">공지사항</span> 
          <span class="link"><a href="/admin/notice.do">상세보기</a></span>
        </caption>
          <tr>		      
              <td>분류</td>
              <td>제목</td>		   
              <td>날짜</td>
            </tr>
            <tr>	         
              <td>임시점검</td>
              <td class="name">06:00 ~ 18:00</td>
              <td>20220708</td>
            </tr>
            <tr>
              <td>게시판</td>
              <td class="name">선정적인 이미지 게시 금지 </td>
              <td>20220708</td>
            </tr>
            <tr>
              <td></td>
              <td class="name"> </td>
              <td></td>
            </tr>    
            <tr>
              <td></td>
              <td class="name"></td>
              <td></td>
            </tr>   
            <tr>
              <td></td>
              <td class="name"> </td>
              <td></td>
            </tr>    
            <tr>
              <td></td>
              <td class="name"></td>
              <td></td>
            </tr>     
        
        </table>
      </div>
      
      <div class="board">
      <table class="Board-table banner">
        <caption>
          <span class="captionTag">광고 수정</span>
          <span class="link"><a href="/admin/banner.do">상세보기</a></span>
        </caption>
          
        </table>
      </div>

        <div class="board">
          <table class="Board-table URDOboard">
          <caption> 
            <span class="captionTag">게시글 수정</span> 
            <span class="link"><a href="/admin/board.do">상세보기</a></span>
          </caption>
               
          
          </table>
        </div>




    </div>


<!-- dashBoard 끝 -->
  </div>


<%@include file="/resources/includes/admin/footer.jsp" %>
</section>


<!-- 푸터  -->


<script src="/resources/js/adminMain.js"></script>


</body>
</html>