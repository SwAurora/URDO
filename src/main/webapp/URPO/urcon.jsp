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
        </li>
        <li class="level1">
          <a href="pointShopGuide.html">가이드</a>
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
				<a href="/URPO/read.do?no=<%=urpoDTO.getNo()%>">
					<img src=<%=urpoDTO.getStaticImage() %> alt="" class="static">
					<img src=<%=urpoDTO.getGifImage() %> alt="" class="animated">
				</a>
			  	</div>
			  <div>
				  <a class="imgTitle" href="/URPO/read.do?no=<%=urpoDTO.getNo()%>"><%=urpoDTO.getTitle()%></a>
			  </div>
			</div>
			<%
				}
			%>
			
					
      
    </div> <!-- 컨테이너 끝 -->
       <!-- 페이지네이션 시작 -->
    <%
	    int totalcount; // 총 게시물
	    int limit = 30; // 한페이지에 보여줄 게시물 초기값
	    int totalPage; // 총 페이지 수
	    int nowPage = 1; // 현재 페이지
	    int pagePerBlock = 5; // 페이지네이션 보여줄 블럭 갯수 (1~5)
	    int totalBlock; // 총 블럭 수
	    int nowBlock; // 현재 블럭
	%>
	<%
	    if(request.getAttribute("nowPage") != null)
	    {
	        nowPage = Integer.parseInt((String) request.getAttribute("nowPage"));
	    }
	%>
	<%
	    if(request.getParameter("limit") != null)
	    {
	        limit = Integer.parseInt(request.getParameter("limit"));
	    }
	    totalcount = (int) request.getAttribute("tcnt");
	    totalPage = (int) Math.ceil((double) totalcount / limit);
	    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
	    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
	%>
    <div class="boardfoot">
            <div class="page_wrap">
                <%
                    if(nowBlock > 1)
                    {
                %>
                <img class="page_arrow menuIcon" onclick="block(-1)" id="prev"
                     src="/resources/img/board/page-arrow-back.svg">
                <%
                    }
                %>
                <div class="page_nation">
                    <%
                        int pageStart = (nowBlock - 1) * pagePerBlock + 1;
                        int pageEnd = Math.min((pageStart + (pagePerBlock - 1)), totalPage);
                    %>
                    <%--페이지 번호--%>
                    <%
                        for(; pageStart <= pageEnd; pageStart++)
                        {
                            if(pageStart == nowPage)
                            {
                    %>
                    <a class="page_num on"
                       href="/URPO.do?limit=<%=limit%>&page=<%=pageStart%>"><%=pageStart%>
                    </a>
                    <%
                    }
                    else
                    {
                    %>
                    <a class="page_num"
                       href="/URPO.do?limit=<%=limit%>&page=<%=pageStart%>"><%=pageStart%>
                    </a>
                    <%
                            }
                        }
                    %>
                </div>
                <%
                    if(totalBlock > nowBlock)
                    {
                %>
                <img class="page_arrow menuIcon" onclick="block(1)" id="next"
                     src="/resources/img/board/page-arrow-forward.svg">
                <%
                    }
                %>
            </div>
            <!--  페이지 숫자 끝-->
            <!-- 게시판 내용 관련 코드  끝-->
        </div>
	    <script>
	        // num = -1 이전블럭이동, num = 1 다음블럭이동
	        function block(num)
	        {
	            let page;
	            let pageBlock = <%=pagePerBlock%>;
	            let nowBlock = <%=nowBlock%>;
	            if(num === 1)
	            {
	                page = pageBlock * nowBlock + 1;
	                location.href= "/URPO.do?limit=" + <%=limit%> + "&page=" + page;
	            }
	            else
	            {
	                page = pageBlock * (nowBlock - 2) + pageBlock;
	                location.href= "/URPO.do?limit=" + <%=limit%> + "&page=" + page;
	            }
	        }
	    </script>
    <!-- 페이지네이션 끝 -->
    



  </div>
  </section>

  <!--전체 JS-->
  <script src="../resources/js/common.js"></script>
</body>
</html>

