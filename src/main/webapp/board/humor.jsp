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
    <script>
        $(document).ready(function()
        {
            let span = document.querySelectorAll('.depth1 span');
            $('#check2').prop('checked', true);
            span[2].innerHTML = '&#65293';
            span[3].style.color = getColor('--color-point');
            span[3].style.fontWeight = 'bold';
            let activeAdd = document.querySelectorAll(".depth2 > li > a");
            activeAdd[2].id = "active";
            $('#active').css('color', getColor('--color-active')).css('font-weight', 'bold');
        })
    </script>
<body>
<%
    int totalcount; // 총 게시물
    int limit = 10; // 한페이지에 보여줄 게시물 초기값
    int totalPage; // 총 페이지 수
    int nowPage = 1; // 현재 페이지
    int pagePerBlock = 5; // 페이지네이션 보여줄 블럭 갯수 (1~10)
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
    totalPage = (int) Math.ceil((double)totalcount / limit);
    totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
    nowBlock = (int) Math.ceil((double) nowPage / pagePerBlock);
%>
<!--네비게이션 시작-->
<jsp:include page="/resources/includes/nav.jsp"/>

<!--메인 시작-->
<section class="Main">
    <div class="container">
        <div id="container_Title">
            게시판 > 유머 > 웃긴자료
        </div>
        <div id="search">
            <div>웃긴 자료</div>
            <div>|</div>
            <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
            <img src="../resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
        </div>

        <!-- 게시판 내용 관련 코드 -->
        <!-- 게시판윗부분 시작 -->
        <div class="board_list_wrap">
            <form action="/BoardHumor.do" method="get">
                <select class="sel" onchange="this.form.submit()" name="limit" id="sel1">
                    <option value="10">10개</option>
                    <option value="20">20개</option>
                    <option value="30">30개</option>
                </select>
            </form>
            <%
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
                    <col id="boardCol2">
                    <col id="boardCol3">
                    <col id="boardCol4">
                    <col id="boardCol5">
                    <col id="boardCol6">
                </colgroup>
                <tr class="titlename">
                    <td class="tname">번호</td>
                    <td class="tname">썸네일</td>
                    <td class="tname" id="titleboard">글제목</td>
                    <td class="tname">조회</td>
                    <td class="tname">추천</td>
                    <td class="tname">글쓴이</td>
                    <td class="tname">날짜</td>
                </tr>
                <!-- 게시판 내용물 시작 -->
                <%
                    ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
                    for(BoardDTO boardDTO : list)
                    {
                %>
                <tr>
                    <td><%=boardDTO.getNo()%>
                    </td>
                    <td><img src="../resources/img/board/frog.png" class="pic"></td>
                    <td ><a href="javascript:read(<%=boardDTO.getNo()%>)"><%=boardDTO.getTitle()%></a>
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
            <div class="page_wrap">
                <%
                    if(nowBlock > 1)
                    {
                %>
                <img class="page_arrow menuIcon" onclick="block(<%=nowBlock-1%>)" id="prev"
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
                                   href="javascript:paging(<%=pageStart%>)"><%=pageStart%>
                                </a>
                    <%
                            }
                            else
                            {
                    %>
                                <a class="page_num"
                                   href="javascript:paging(<%=pageStart%>)"><%=pageStart%>
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
                <img class="page_arrow menuIcon" onclick="block(<%=nowBlock+1%>)" id="next"
                     src="../resources/img/board/page-arrow-forward.svg">
                <%
                    }
                %>
            </div>
            <div class="post">
                <input type='button' value='게시글 작성' onclick="location.href='#'" class="pagebtn"
                       id="add">
            </div>
            <!--  페이지 숫자 끝-->
            <!-- 게시판 내용 관련 코드  끝-->
        </div>
    </div>

    <form name="initFrm" method="get">
        <input type="hidden" name="nowPage">
    </form>

    <%--페이징 처리 폼--%>
    <form name="readFrm" method="get">
        <input type="hidden" name="no"> <%--게시물번호--%>
        <input type="hidden" name="start"> <%--DB로 부터 읽을 시작 번호--%>
        <input type="hidden" name="limit"> <%--한 페이지에 보여줄 게시글 수--%>
        <input type="hidden" name="nowPage"> <%--현재 페이지 번호--%>
    </form>

    <script>
        // 페이징 처리함수 - 페이지 번호를 받아 해당 페이지를 표시
        function paging(pageNum)
        {
            let form = document.readFrm;
            form.nowPage.value = pageNum;
            limit = <%=limit%>;
            form.start.value = (pageNum * limit) - limit;
            form.limit.value = limit;
            form.action = "/BoardHumor.do";
            form.submit();
        }

        // 블럭처리 함수 - 이전/이후 버튼 누를 때 이전블럭/다음블럭으로 이동
        function block(value)
        {
            let form = document.readFrm;
            StartPage =
            <%=pagePerBlock%> *
            (value - 1) + 1;
            limit = <%=limit%>;
            form.nowPage.value = StartPage;
            form.start.value = (StartPage * limit) - limit + 1;
            form.limit.value = limit;
            form.action = "/BoardHumor.do";
            form.submit();
        }

        function read(no)
        {
            let form = document.readFrm;
            form.no.value = no;
            form.nowPage.value = <%=nowPage%>;
            form.action = "/Board/read.do";
            form.submit();
        }
    </script>
</section>

<!--전체 JS-->
<script src="../resources/js/common.js"></script>
<!--포인트샵 JS-->
<script src="../resources/js/pointShop.js"></script>
<!--게시판 JS-->
<script src="../resources/js/board.js"></script>

</body>
</html>

