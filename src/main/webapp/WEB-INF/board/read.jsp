<%@ page import="com.korea.dto.BoardDTO" %>
<%@ page import="com.korea.dto.ReplyDTO" %>
<%@ page import="java.util.Objects" %>
<%@ page import="java.io.File" %>
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
    <link rel="stylesheet" href="../../resources/css/DDABong.css">
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
    HttpSession session2 = request.getSession();
    String id = (String) session2.getAttribute("id");
%>
<%
    BoardDTO dto = (BoardDTO) request.getAttribute("dto");
    String board = request.getParameter("board");
    String depth1;
    String depth2;
    switch(board)
    {
        case "bestNow":
            depth1 = "베스트 게시글";
            depth2 = "실시간 베스트";
            break;
        case "bestMonth":
            depth1 = "베스트 게시글";
            depth2 = "월간 베스트";
            break;
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
                <td id="recommend">
                </td>
            </tr>
            <tr class="cont_tbl_r3">
                <td colspan="4">
                    <%
                        if(dto.getFilename() != null)
                        {
                            String fname = dto.getFilename();
                            String[] files = fname.split(";");
                            for(String file : files)
                            {
                    %>
                    <img src="/resources/files/B<%=dto.getNo()%>/<%=file%>" style="max-width: 100%; height:auto;"><br>
                    <%
                            }
                        }
                    %>
                    <%=dto.getContent()%>
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
                <button class="btn_board" onclick="PostUpdate()">수정</button>
                <a class="btn_board" href="javascript:Delete('<%=dto.getNo()%>','<%=dto.getSubject()%>')">삭제</a>
                <%
                    }
                %>
            </div>
            <button class="btn_board point" onclick="rec('<%=id%>')">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                     class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                    <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"></path>
                </svg>
                추천
            </button>
        </div>

        <!-- 댓글 등록하기 폼 시작-->
        <form>
            <div class="replyWrap">
                <table class="replyRead" id="replyRead">

                </table>
                <div class="replyPostWrap">
                    <textarea id="comment" class="replyArea" id="replyArea" placeholder="내용을 입력해주세요."></textarea>
                    <a href="javascript:replyConfirm()" class="replyBtn">댓글작성</a>
                </div>
            </div>
        </form>
        <!-- 댓글 등록하기 폼 끝--->

    </div>
    <div>
    </div>
    <form name="forDelete" method="post">
        <input type="hidden" name="no">
        <input type="hidden" name="subject">
    </form>

    <%--댓글--%>

    <script>
        listreply();

        let nickname = '<%=nickname%>';

        function replyConfirm()
        {
            if(nickname === "null")
            {
                alert('로그인 하셔야 댓글을 다실 수 있습니다.');
                location.href = '/login.jsp';
            }
            else if($('#comment').val() === "")
            {
                alert('내용을 입력해주세요.');
            }
            else
            {
                reply();
            }

        }

        function reply()
        {
            $.ajax({
                url: '/Board/reply.do',
                type: 'GET',
                data: {"comment": $('#comment').val(), "bno": '<%=dto.getNo()%>'},
                error: function()
                {
                    alert('댓글 작성에 오류가 발생했습니다!');
                },
                success: function()
                {
                	alert('댓글이 성공적으로 작성되었습니다. 1URPO를 얻었습니다.');
                    listreply();
                    $('#comment').val("");
                }
            });
        }

        function listreply()
        {
            $.ajax({
                url: '/Board/replylist.do', type: 'GET', data: {"bno": '<%=dto.getNo()%>'}, success: function(result)
                {
                    $('#replyRead').html(result);
                }, error: function()
                {
                    alert('댓글 목록 확인 에러!');
                }
            });
        }

        function replydeleteConfirm()
        {

        }

        function replydelete(rno)
        {
            let conf = confirm("댓글을 정말 삭제하시겠습니까?");
            if(conf)
            {
                $.ajax({
                    url: '/Board/replydelete.do', type: 'GET', data: {"rno": rno}, error: function()
                    {
                        alert('댓글 삭제에 오류가 발생했습니다!');
                    }, success: function()
                    {
                        listreply();
                    }
                })
            }
        }
    </script>
    <div id="forscript"></div>
    <%--모달--%>
    <div class="modal">
        <div class="dda-bong">
            <svg id="dda-bong" xmlns="http://www.w3.org/2000/svg" fill="currentColor"
                 class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
                <path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.965.22.816.533 2.511.062 4.51a9.84 9.84 0 0 1 .443-.051c.713-.065 1.669-.072 2.516.21.518.173.994.681 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.163 3.163 0 0 1-.488.901c.054.152.076.312.076.465 0 .305-.089.625-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.82 4.82 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.615.849-.232 1.574-.787 2.132-1.41.56-.627.914-1.28 1.039-1.639.199-.575.356-1.539.428-2.59z"></path>
            </svg>
        </div>
        <span id="ddabongurpo">2 URPO 획득</span>
        <div class="firework"></div>
        <div class="firework"></div>
        <div class="firework"></div>
    </div>
</section>
<script>
    // 뒤로 가기
    function goBack()
    {
        history.back();
    }

    // 게시글 수정
    function PostUpdate()
    {
        location.href = "/Board/postUpdate.do?no=" + <%=dto.getNo()%>;
    }

    // 게시글 삭제
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

    /*추천 시작*/
    function rec(id)
    {
        if(id === "null")
        {
            alert('로그인이 필요합니다.');
            location.href = '/login.jsp';
        }
        else
        {
            recUp(id);
        }
    }

    function recUp(id)
    {
        $.ajax({
            url: "/Board/rec.do", type: "POST", data: {
                no: '<%=dto.getNo()%>', id: id
            }, success: function(result)
            {
                recCount();
                $('#forscript').html(result);
            },
        })
    }

    function recCount()
    {
        $.ajax({
            url: "/Board/recCount.do", type: "POST", data: {
                no: '<%=dto.getNo()%>'
            }, success: function(count)
            {
                $("#recommend").html("추천수 : " + count);
            },
        })
    }

    recCount();
    /*추천 끝*/
</script>
<script>
    let modal = document.getElementsByClassName("modal");

    function modal_open()
    {
        modal[0].style.display = "block";

        setTimeout(function()
        {
            modal[0].style.display = "none";
        }, 2000)
    }
</script>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>