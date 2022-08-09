<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
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
    <jsp:include page="/resources/includes/link.jsp"/>
    <!--CSS-->
    <link rel="stylesheet" href="../resources/css/board.css">
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
        out.println("<script>alert('" + msg + "')</script>");
        out.println("<script>location.href='/Board/themeGame.do'</script>");
    }
%>
<%
    int totalcount; // 총 게시물
    int limit = 10; // 한페이지에 보여줄 게시물 초기값
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
<%
	String listNullMsg = (String) request.getAttribute("listNullMsg"); // 검색결과가 없을 때의 메세지
	HttpSession session3 = request.getSession();
	String keyword = (String) session3.getAttribute("keyword"); //페이지네이션 정보처리를 위해 session에 keyword 남기기
	String subject = request.getParameter("subject");
%>


<!--네비게이션 시작-->
<jsp:include page="/resources/includes/nav.jsp"/>

<!--메인 시작-->
<section class="Main">
    <div class="container">
        <div id="container_Title">
            게시판 > 전체 게시물 검색
        </div>
        <div id="search">
            <div>전체 게시물 검색</div>
            <div>|</div>
            <form id="searchFrm" action="/Board/search.do" onsubmit="return false">
	        	<input type="hidden" name="subject" value="searchMain">
	            <input type="text" class="searchBar" placeholder="검색어를 입력하세요" name="keyword" id="searchBar" value="<%=keyword%>">
	        	<a href="javascript:search()" class="searchBtn">
	        		<img src="../resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
	        	</a>
           	</form>
        </div>
        
        <script>
        	$('document').ready(function() {
	            $("#searchBar").on("keyup",function(key){
					if(key.keyCode==13) { 
						search();
					}
				});
	        	$('#searchBar').click( function() {
	        		$('#searchBar').val("");
	        	})
        	});
        	
        	function search() {
        		if($('#searchBar').val() === "") {
        			alert("검색어를 입력해주세요.");
        		}
        		document.getElementById("searchFrm").submit();
        	}
        
        </script>

        <!-- 게시판 내용 관련 코드 -->
        <!-- 게시판윗부분 시작 -->
        <div class="board_list_wrap">
       		<%
            if(listNullMsg == null) {
            %>
            <form action="/Board/search.do" method="get">
                <select class="sel" onchange="this.form.submit()" name="limit" id="sel1">
                    <option value="10">10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                </select>
                <input type="hidden" name="subject" value="searchMain">
                <input type="hidden" name="keyword" value=<%=keyword %>>
            </form>
            <%
            }
                String getlimit = request.getParameter("limit");
                if(getlimit != null)
                {
            %>
            <script>
                $('#sel1').val('<%=getlimit%>').prop("selected", true);
            </script>
            <%
                }
            %>
            <!-- 게시판 Table -->
            <table class="board_list" id="t1">
                <colgroup>
                    <col id="boardCol1">
                    <col id="boardCol7">
                    <col id="boardCol2">
                    <col id="boardCol3">
                    <col id="boardCol4">
                    <col id="boardCol5">
                    <col id="boardCol6">
                </colgroup>
                <%
                if(listNullMsg == null) {
                %>
                <tr class="titlename">
                    <td class="tname">썸네일</td>
                    <td class="tname">게시판</td>
                    <td class="tname" id="titleboard">글제목</td>
                    <td class="tname">조회</td>
                    <td class="tname">추천</td>
                    <td class="tname">글쓴이</td>
                    <td class="tname">날짜</td>
                </tr>
                <%
                } else {
                %>
                <%=listNullMsg %>
                <%	
                }
                %>
                <!-- 게시판 내용물 시작 -->
                <%
                    ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
                    for(BoardDTO boardDTO : list)
                    {
                %>
                <tr id="tableContent">
                    <td>
                        <%
                            if(boardDTO.getFilename() != null)
                            {
                        %>
                        <img src="/resources/files/B<%=boardDTO.getNo()%>/<%=boardDTO.getFilename().split(";")[0]%>" class="pic">
                        <%
                        }
                        else
                        {
                        %>
                        <img src="../resources/img/board/thumbLogo.svg" class="pic">
                        <%
                            }
                        %>
                    </td>
                    <td>
                    <%
                    String depth2;
                    String board = boardDTO.getSubject();
                    switch(board)
                    {
                        case "bestNow":
                            depth2 = "실시간 베스트";
                            break;
                        case "bestMonth":
                            depth2 = "월간 베스트";
                            break;
                        case "humor":
                            depth2 = "웃긴 자료";
                            break;
                        case "creArt":
                            depth2 = "그림";
                            break;
                        case "creCook":
                            depth2 = "요리";
                            break;
                        case "regionRestaurant":
                            depth2 = "맛집";
                            break;
                        case "regionLandmark":
                            depth2 = "명소";
                            break;
                        case "themeGame":
                            depth2 = "게임";
                            break;
                        case "themeSports":
                            depth2 = "스포츠";
                            break;
                        case "themeMusic":
                            depth2 = "음악";
                            break;
                        default:
                            depth2 = "웃긴자료";
                    }
                    
                    
                    %>
                    <%=depth2 %>
                    
                    
                    </td>
                    <td><a href="/Board/read.do?board=themeGame&no=<%=boardDTO.getNo()%>"><%=boardDTO.getTitle()%>
                    </a>
                    </td>
                    <td><%=boardDTO.getViews()%>
                    </td>
                    <td><%=boardDTO.getRecommend()%>
                    </td>
                    <td><%=boardDTO.getWriter()%>
                    </td>
                    <td><%=boardDTO.getDate()%>
                    </td>
                </tr>
                <%
                    }
                %>
            </table>
            <!--  페이지 숫자 -->
        </div>
        <!-- 페이지네이션 시작 -->
        <div class="boardfoot">
            <div class="page_wrap" id="page_wrap">
                <%
                    if(nowBlock > 1)
                    {
                %>
                <img class="page_arrow menuIcon" onclick="block(-1)" id="prev"
                     src="../resources/img/board/page-arrow-back.svg">
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
                       href="/Board/search.do?limit=<%=limit %>&page=<%=pageStart%>&subject=searchMain&keyword=<%=keyword %>"><%=pageStart%>
                    </a>
                    <%
                    }
                    else
                    {
                    %>
                    <a class="page_num"
                       href="/Board/search.do?limit=<%=limit %>&page=<%=pageStart%>&subject=searchMain&keyword=<%=keyword %>"><%=pageStart%>
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
                     src="../resources/img/board/page-arrow-forward.svg">
                <%
                    }
                %>
            </div>
            <!--  페이지 숫자 끝-->
            <!-- 게시판 내용 관련 코드  끝-->
        </div>
    </div>
    <script>
        // num = -1 이전블럭이동, num = 1 다음블럭이동
        function block(num)
        {
            let page;
            let pageBlock = <%=pagePerBlock%>;
            let nowBlock = <%=nowBlock%>;
            let subject = '<%=subject%>';
            let keyword = '<%=keyword%>';
            if(num === 1)
            {
                page = pageBlock * nowBlock + 1;
                location.href = "/Board/search.do?limit" + <%=limit%> + "&page=" + page + "&subject=" + subject + "&keyword=" + keyword;
            }
            else
            {
                page = pageBlock * (nowBlock - 2) + pageBlock;
                location.href = "/Board/search.do?limit" + <%=limit%> + "&page=" + page + "&subject=" + subject + "&keyword=" + keyword;
            }
        }
    </script>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
<!--게시판 JS-->
<script src="../resources/js/board.js"></script>

</body>
</html>
