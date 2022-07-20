<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="java.util.Objects" %>
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
    <jsp:include page="../../resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" href="../../resources/css/common.css">
    <link rel="stylesheet" href="../../resources/css/boardRead.css">
<body>
<%
    String msg = (String) request.getAttribute("msg");

    if(msg != null)
    {
%>
<script>
    alert('<%=msg%>');
    history.back();
</script>
<%
    }
%>
<%
    BoardDTO dto = (BoardDTO) request.getAttribute("dto");
    String subject = dto.getSubject();
    String depth1;
    String depth2;
    switch(subject)
    {
        case "humor":
            depth1 = "유머";
            depth2 = "웃긴 자료";
            break;
        case "creArt":
            depth1 = "창작";
            depth2 = "그림";
            break;
        case "creCook":
            depth1 = "창작";
            depth2 = "요리";
            break;
        case "regionRestaurant":
            depth1 = "지역";
            depth2 = "맛집";
            break;
        case "regionLandmark":
            depth1 = "지역";
            depth2 = "명소";
            break;
        case "themeGame":
            depth1 = "테마";
            depth2 = "게임";
            break;
        case "themeSports":
            depth1 = "테마";
            depth2 = "스포츠";
            break;
        case "themeMusic":
            depth1 = "테마";
            depth2 = "음악";
            break;
        default:
            depth1 = "유머";
            depth2 = "웃긴자료";
    }
%>
<!--네비게이션 시작-->
<jsp:include page="../../resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <div class="container">
        <div id="container_Title">
            게시판 > <%=depth1%> > <%=depth2%>
        </div>
        <div id="search">
            <div><%=depth2%>
            </div>
            <div>|</div>
            <input type="text" class="searchBar" placeholder="검색어를 입력하세요">
            <img src="../resources/img/sidebar/main-searchbar.svg" class="searchBarIcon menuIcon" id="searchBarIcon">
        </div>
    </div>

    <div class="container2">
        <table class="cont_tbl">
            <tr class="cont_tbl_r1">
                <td colspan="4"><%=dto.getTitle()%>
                </td>
            </tr>
            <tr class="cont_tbl_r2">
                <td>작성자 : <%=dto.getWriter()%>
                </td>
                <td>작성일시 : <%=dto.getDate()%>
                </td>
                <td>조회수 : <%=dto.getViews()%>
                </td>
                <td>추천수 : <%=dto.getRecommend()%>
                </td>
            </tr>
            <tr class="cont_tbl_r3">
                <td colspan="4"><%=dto.getContent()%>
                </td>
            </tr>
        </table>

        <div class="btn_container">
            <div class="btn_group">
                <button class="btn_board" onclick="goBack()">목록</button>
                <%
                    HttpSession session1 = request.getSession();
                    String nickname = (String) session1.getAttribute("nickname");
                    String writer = dto.getWriter();

                    if(Objects.equals(nickname, writer))
                    {
                %>
                <button class="btn_board">수정</button>
                <a class="btn_board" href="javascript:Delete('<%=dto.getNo()%>','<%=dto.getSubject()%>')">삭제</a>
                <%
                    }
                %>
            </div>
            <button class="btn_board point">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                    <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"></path>
                </svg>
                추천
            </button>
        </div>
    </div>
    <div>
    </div>
    <form name="forDelete" method="post">
        <input type="hidden" name="no">
        <input type="hidden" name="subject">
    </form>
</section>
<script>
    function goBack()
    {
        history.back();
    }

    function Delete(no, subj)
    {
        let form = document.forDelete;
        form.no.value = no;
        form.subject.value = subj;
        form.action = "/Board/delete.do";
        let conf = confirm("정말 삭제하시겠습니까?");
        if(conf)
        {
            form.submit();
        }
    }
</script>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>