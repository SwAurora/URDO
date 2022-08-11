<%@ page import="java.util.ArrayList" %>
<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="com.korea.dto.UrpoDTO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>URDO</title>
    <!-- 링크 -->
    <jsp:include page="resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="resources/css/index.css">
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
    location.href = "/";
</script>
<%
    }
%>
<!--네비게이션 시작-->
<jsp:include page="resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <!-- 상단 -->
    <div class="container">
        <div id="main-header">
            <div id="main-header-left">
                <div id="container_Title">
                    URDO에 오신 걸 환영합니다!
                </div>
                <div id="search">
                    <div>홈</div>
                    <div>|</div>
                    <form id="searchFrm" action="/Board/search.do" onsubmit="return false">
                        <input type="text" class="searchBar" placeholder="검색어를 입력하세요" id="searchBar" name="keyword">
                        <input type="hidden" name="subject" value="searchMain">
                        <a href="javascript:search()" class="searchBtn">
                            <img src="resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon"
                                 id="searchBarIcon">
                        </a>
                    </form>
                </div>
            </div>
            <script>
                $('document').ready(function()
                {
                    $("#searchBar").on("keyup", function(key)
                    {
                        if(key.keyCode === 13)
                        {
                            search();
                        }
                    });
                });

                function search()
                {
                    if($('#searchBar').val() === "")
                    {
                        alert("검색어를 입력해주세요.");
                    }
                    document.getElementById("searchFrm").submit();
                }
            </script>
            <div id="weather">
                <div><img class="weatherIcon"></div>
                <div class="weatherInfo">
                    <span class="place"></span><br>
                    <span class="temperature"></span><br>
                    <span class="weatherDescription"></span><br>
                </div>
            </div>

        </div>
        <!-- 공지사항 -->
        <div id="notice">
            <div class="swiper notice-swap"> <!-- 슬라이더-->
                <ul id="notice-left">
                    <li><img src="resources/img/index/speaker.svg" width="20px" height="20px" class="menuIcon"></li>
                    <li>공지사항</li>
                </ul>
                <ul class="swiper-wrapper">
                    <li class="swiper-slide notice-slide"><span class="notice-A">임시점검</span>06:00~18:00</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">인기 도서관</span>알렉산드리아 도서관</li>
                    <li class="swiper-slide notice-slide"><span class="notice-A">게시판</span>선정적인 이미지 게시 금지</li>
                </ul>
            </div>
        </div>


        <div id="contents-top">
            <!-- 베스트 유머 게시판 -->
            <div id="best-humor">
                <div>
                    <h1 class="mainTitle">베스트 유머</h1>
                    <%
                        ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
                    %>
                    <div id="testflex">
                    	<div id="testbox">
		                    <div id="humor-img">
		                        <%
		                            for(BoardDTO boardDTO : list)
		                            {
		                                if(boardDTO.getFilename() != null)
		                                {
		                        %>
		                        <a href="/Board/read.do?board=<%=boardDTO.getSubject()%>&no=<%=boardDTO.getNo()%>">
		                        <img src="/resources/files/B<%=boardDTO.getNo()%>/<%=boardDTO.getFilename().split(";")[0]%>"
		                                class="pic"></a>
		                        <%
		                        }
		                        else
		                        {
		                        %>
		                        <a href="/Board/read.do?board=<%=boardDTO.getSubject()%>&no=<%=boardDTO.getNo()%>"><img
		                                src="/resources/img/board/thumbLogo.svg" class="pic"></a>
		                        <%
		                                }
		                            }
		                        %>
		                 
		                 </div>
		                
		                <div style=gap:10px; height: auto; width: 100%;">
		                 
	                        <%
	                            for(BoardDTO boardDTO : list)
	                            {
	                                out.println("<span class='span1'>" + boardDTO.getTitle() + "</span>");
	                            }
	                        %>
	                       
	                        <br>
	                        
	                        <%
	                            for(BoardDTO boardDTO : list)
	                            {
	                                out.println("<span class='span2'>" + boardDTO.getRecommend() + "</span>");
	                            }
	                        %>
	                        </div>
	                        
	                        
                        </div>

                    </div>
                    </div>
                </div>
            <!-- 광고 -->
            <div id="banner">
                <div class="swiper banner">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner1.png"
                                                                    alt="광고1">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner2.png"
                                                                    alt="광고2">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner3.png"
                                                                    alt="광고3">
                        </div>
                        <div class="swiper-slide banner-slide"><img src="resources/img/index/banner/banner4.png"
                                                                    alt="광고4">
                        </div>
                    </div>

                    <div class="swiper-pagination"></div>
                </div>
            </div>
            <!-- contents-top 끝 -->
        </div>
        <div id="contents-bottom">
            <!-- 실시간 유머 등 게시판 -->
            <div id="realTimeBoard">
                <h2 class="mainTitle"> 베스트 </h2>

                <div id="tabUI">
                    <ul id="Board-menu">
                        <li class="change-board">실시간 베스트</li>
                        <li>월간 베스트</li>
                    </ul>
                    <div id="buttonbox">
                        <span id="pageNum">1/3</span>
                        <button id="prev" onclick="goPrev()">◀</button>
                        <button id="next" onclick="goNext()">▶</button>
                    </div>
                </div>
                <%
                    ArrayList<BoardDTO> list2 = (ArrayList<BoardDTO>) request.getAttribute("list2");
                    ArrayList<BoardDTO> list3 = (ArrayList<BoardDTO>) request.getAttribute("list3");
                %>
                <div id="Board-table">
                    <table id="table1" class="change-board">
                        <tr>
                                 <td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 0; i < list2.size(); i++)
                            {
                        %>
                                <tr>
                                    <td>
                        <%
                            if(list2.get(i).getFilename() != null)
                            {
                        %>
                                <img src="/resources/files/B<%=list2.get(i).getNo()%>/<%=list2.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                        <%
                        }
                        else
                        {
                        %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                        <%
                            }
                        %>
                                    </td>
                                    <td><a href="/Board/read.do?board=bestNow&no=<%=list2.get(i).getNo()%>"><%=list2.get(i).getTitle()%></a></td>
                                    <td><%=list2.get(i).getViews()%></td>
                                    <td><%=list2.get(i).getRecommend()%></td>
                                    <td><%=list2.get(i).getWriter()%></td>
                                    <td><%=list2.get(i).getDate()%></td>
                                </tr>
                        <%
                                if(i == 3)
                                    break;
                            }
                        %>

                    </table>
                    <table id="table2">
                        <tr>
                           	<td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 4; i < list2.size(); i++)
                            {
                        %>
                        <tr>
                            <td>
                                <%
                                    if(list2.get(i).getFilename() != null)
                                    {
                                %>
                                <img src="/resources/files/B<%=list2.get(i).getNo()%>/<%=list2.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                                <%
                                }
                                else
                                {
                                %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                                <%
                                    }
                                %>
                            </td>
                            <td><a href="/Board/read.do?board=bestNow&no=<%=list2.get(i).getNo()%>"><%=list2.get(i).getTitle()%></a></td>
                            <td><%=list2.get(i).getViews()%></td>
                            <td><%=list2.get(i).getRecommend()%></td>
                            <td><%=list2.get(i).getWriter()%></td>
                            <td><%=list2.get(i).getDate()%></td>
                        </tr>
                        <%
                                if(i == 7)
                                    break;
                            }
                        %>
                    </table>
                    <table id="table3">
                        <tr>     
                        	<td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 8; i < list2.size(); i++)
                            {
                        %>
                        <tr>
                            <td>
                                <%
                                    if(list2.get(i).getFilename() != null)
                                    {
                                %>
                                <img src="/resources/files/B<%=list2.get(i).getNo()%>/<%=list2.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                                <%
                                }
                                else
                                {
                                %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                                <%
                                    }
                                %>
                            </td>
                            <td><a href="/Board/read.do?board=bestNow&no=<%=list2.get(i).getNo()%>"><%=list2.get(i).getTitle()%></a></td>
                            <td><%=list2.get(i).getViews()%></td>
                            <td><%=list2.get(i).getRecommend()%></td>
                            <td><%=list2.get(i).getWriter()%></td>
                            <td><%=list2.get(i).getDate()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <table id="table4">
                        <tr>
                            <td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 0; i < list3.size(); i++)
                            {
                        %>
                        <tr>
                            <td>
                                <%
                                    if(list3.get(i).getFilename() != null)
                                    {
                                %>
                                <img src="/resources/files/B<%=list3.get(i).getNo()%>/<%=list3.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                                <%
                                }
                                else
                                {
                                %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                                <%
                                    }
                                %>
                            </td>
                            <td><a href="/Board/read.do?board=bestMonth&no=<%=list3.get(i).getNo()%>"><%=list3.get(i).getTitle()%></a></td>
                            <td><%=list3.get(i).getViews()%></td>
                            <td><%=list3.get(i).getRecommend()%></td>
                            <td><%=list3.get(i).getWriter()%></td>
                            <td><%=list3.get(i).getDate()%></td>
                        </tr>
                        <%
                                if(i == 3)
                                    break;
                            }
                        %>
                    </table>
                    <table id="table5">
                        <tr>
                          	<td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 4; i < list3.size(); i++)
                            {
                        %>
                        <tr>
                            <td>
                                <%
                                    if(list3.get(i).getFilename() != null)
                                    {
                                %>
                                <img src="/resources/files/B<%=list3.get(i).getNo()%>/<%=list3.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                                <%
                                }
                                else
                                {
                                %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                                <%
                                    }
                                %>
                            </td>
                            <td><a href="/Board/read.do?board=bestMonth&no=<%=list3.get(i).getNo()%>"><%=list3.get(i).getTitle()%></a></td>
                            <td><%=list3.get(i).getViews()%></td>
                            <td><%=list3.get(i).getRecommend()%></td>
                            <td><%=list3.get(i).getWriter()%></td>
                            <td><%=list3.get(i).getDate()%></td>
                        </tr>
                        <%
                                if(i == 7)
                                    break;
                            }
                        %>
                    </table>
                    <table id="table6">
                        <tr>
                            <td class="thumbnail">썸네일</td>
                            <td class="name">글제목</td>
                            <td class="count">조회수</td>
                            <td class="recommend">추천</td>
                            <td class="writer">글쓴이</td>
                            <td class="Bdate">날짜</td>
                        </tr>
                        <%
                            for(int i = 8; i < list3.size(); i++)
                            {
                        %>
                        <tr>
                            <td>
                                <%
                                    if(list3.get(i).getFilename() != null)
                                    {
                                %>
                                <img src="/resources/files/B<%=list3.get(i).getNo()%>/<%=list3.get(i).getFilename().split(";")[0]%>"
                                     class="bestThumb">
                                <%
                                }
                                else
                                {
                                %>
                                <img src="/resources/img/board/thumbLogo.svg" class="bestThumb">
                                <%
                                    }
                                %>
                            </td>
                            <td><a href="/Board/read.do?board=bestMonth&no=<%=list3.get(i).getNo()%>"><%=list3.get(i).getTitle()%></a></td>
                            <td><%=list3.get(i).getViews()%></td>
                            <td><%=list3.get(i).getRecommend()%></td>
                            <td><%=list3.get(i).getWriter()%></td>
                            <td><%=list3.get(i).getDate()%></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
            <!-- 포인트샵 -->
            <div id="pointshop">
                <h2 class="mainTitle">포인트샵</h2>
                <ul>
                    <li class="item">아이템1</li>
                    <li>아이템2</li>
                    <li>아이템3</li>
                    <li>아이템4</li>
                    <li>아이템5</li>
                </ul>
                <div id="pointshop-table">
                    <div class="item">
			            <%
			                ArrayList<UrpoDTO> urconList = (ArrayList<UrpoDTO>) request.getAttribute("urconList");
			                for(UrpoDTO urpoDTO : urconList)
			                {
			            %>
			            <div class="hov-ani">
			                <a class="hov-ani-box" href="/URPO/read.do?no=<%=urpoDTO.getNo()%>">
			                    <img src="<%=urpoDTO.getStaticImage() %>" alt="" data-animated="<%=urpoDTO.getGifImage() %>"
			                         data-static="<%=urpoDTO.getStaticImage() %>" class="hov-anim">
			                    <div class="hov-ani-title"><%=urpoDTO.getTitle()%></div>
			                </a>
			            </div>
			            <%
			                }
			            %>               
                    </div>


                    <div>
			            <%
			                ArrayList<UrpoDTO> urconList2 = (ArrayList<UrpoDTO>) request.getAttribute("urconList2");
			                for(UrpoDTO urpoDTO : urconList2)
			                {
			            %>
			            <div class="hov-ani">
			                <a class="hov-ani-box" href="/URPO/read.do?no=<%=urpoDTO.getNo()%>">
			                    <img src="<%=urpoDTO.getStaticImage() %>" alt="" data-animated="<%=urpoDTO.getGifImage() %>"
			                         data-static="<%=urpoDTO.getStaticImage() %>" class="hov-anim">
			                    <div class="hov-ani-title"><%=urpoDTO.getTitle()%></div>
			                </a>
			            </div>
			            <%
			                }
			            %>               
                    </div>
                    
                    <div class="">
			            <%
			                ArrayList<UrpoDTO> urconList3 = (ArrayList<UrpoDTO>) request.getAttribute("urconList3");
			                for(UrpoDTO urpoDTO : urconList3)
			                {
			            %>
			            <div class="hov-ani">
			                <a class="hov-ani-box" href="/URPO/read.do?no=<%=urpoDTO.getNo()%>">
			                    <img src="<%=urpoDTO.getStaticImage() %>" alt="" data-animated="<%=urpoDTO.getGifImage() %>"
			                         data-static="<%=urpoDTO.getStaticImage() %>" class="hov-anim">
			                    <div class="hov-ani-title"><%=urpoDTO.getTitle()%></div>
			                </a>
			            </div>
			            <%
			                }
			            %>   
                    </div>

                    <div class="" style="grid-template-columns:1fr; grid-template-rows : 1fr; ">
                        <img src="resources/img/index/stop.png" style="width:50px;">
                    </div>
                    
                    <div class=""  style="grid-template-columns:1fr; grid-template-rows : 1fr;">
                        <img src="resources/img/index/stop.png" style="width:50px;">
                    </div>
                    
   		            <script>
		                $(".hov-anim").mouseover(function()
		                {
		                    $(this).attr("src", $(this).data("animated"))
		                }), $(".hov-anim").mouseout(function()
		                {
		                    $(this).attr("src", $(this).data("static"))
		                });
		            </script>

                </div>
            </div>

        </div>

        <!-- contents-bottom 끝 -->
    </div>
    <!-- footer -->
    <jsp:include page="resources/includes/footer.jsp"/>
</section>

<!--전체 JS-->
<script src="/resources/js/common.js"></script>
<!-- index JS -->
<script src="/resources/js/index.js"></script>
</body>
</html>
