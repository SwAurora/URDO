<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/resources/css/common.css">
<link rel="stylesheet" href="/resources/css/notice.css">
<link rel="stylesheet" href="/resources/css/nav.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">


</head>
<body>


<!-- 사이드 네비게이션  -->
<%@include file ="../../resources/includes/nav.jsp" %>

<div id="main">
	<!-- 헤더 -->
	<!-- 오류 뜸 -->
<%-- <%@include file="../../resources/includes/header.jsp" %>
 --%>


    <section>

      <div id="sc_top">
        <h1>공지사항</h1>
        <div>
         

        </div>

       
      </div>

      <table id="notice_table">
        <tr>
          <td> check </td>
          <td>no</td>
          <td>분류</td>
          <td>제목</td>
          <td>글쓴이</td>
          <td>조회수</td>
          <td>날짜</td>
        </tr>
        
        <!-- no / tag / title / writer / count / regdate / pwd / ip / filename / filesize -->
        
        <tr>
          <td><input type="checkbox"></td>
          <td>1</td>
          <td>임시점검</td>
          <td class="name">06:00 ~ 18:00</td>
          <td>관리자</td>
          <td>1,234</td>
          <td>20220708</td>
        </tr>
        <tr>
          <td><input type="checkbox"></td>
          <td>2</td>
          <td>게시판</td>
          <td class="name">선정적인 이미지 게시 금지 </td>
          <td>관리자</td>
          <td>1,234</td>
          <td>20220708</td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>
        <tr>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
          <td></td>
        </tr>


      </table>

      <div id="junk">
        <h1></h1>
      <div id="buttonbox">
        <button class="btn">삭제</button>
        <button class="btn">수정</button>
        <button class="btn btn-write"> 글쓰기 </button>
      </div>
    </div>
      

    </section>


	<!-- 푸터  -->

    <%@include file="../../resources/includes/footer.jsp" %>

</div>

</body>
</html>