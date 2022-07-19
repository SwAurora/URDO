<%@ page import="com.korea.dto.MemberDTO" %>
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
    <jsp:include page="/resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="../..//resources/css/myinfo.css">
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
%>
<!--네비게이션 시작-->
<jsp:include page="/resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <%
        MemberDTO dto = (MemberDTO) request.getAttribute("dto");
    %>
    <h1 style="margin:50px 0;">마이 페이지</h1>

    <div class="wrap">
        <div class="blueContainer">
            <div>
                <div class="name"><%= dto.getNickname() %>
                </div>
            </div>

        </div>
        <div class="summaryContainer">
            <div class="item">
                <div class="number">354</div>
                <div>내가 쓴 글</div>
            </div>
            <div class="item">
                <div class="number">976</div>
                <div>내가 쓴 댓글</div>
            </div>
            <div class="item">
                <div class="number">112</div>
                <div>받은 추천 수</div>
            </div>
            <div class="item">
                <div class="number">1392</div>
                <div>추천한 글</div>
            </div>
            <div class="item">
                <div class="number">1786</div>
                <div>포인트(URDO)</div>
            </div>
        </div>

        <div class="listContainer">
            <div class="item">
                <div class="text">아이디</div>
                <div class="text"><input type="text" class="ipSet" value="<%=dto.getId()%>" disabled></div>
            </div>
            <form action="/Update.do" name="frm1">
                <div class="item">
                    <div class="text">이메일</div>
                    <div class="text"><input type="text" class="ipSet" value="<%=dto.getEmail()%>" disabled>
                    </div>
                    <div class="right">
                        <button class="text" id="btn1" onclick="sujung(frm1)">수정</button>
                    </div>
                </div>
            </form>
            <form action="/Update.do" name="frm2">
                <div class="item">
                    <div class="text">닉네임</div>
                    <div class="text"><input type="text" class="ipSet" value="<%=dto.getNickname()%>" disabled>
                    </div>
                    <div class="right">
                        <button class="text" id="btn2" onclick="sujung(frm2)">수정</button>
                    </div>
                </div>
            </form>
            <script>
                function sujung(form)
                {
                    if(form === frm1)
                    {
                        let btn1 = document.getElementById('btn1');
                        btn1.innerHTML = '저장';
                    }
                    else
                    {
                        let btn2 = document.getElementById('btn2');
                        btn2.innerHTML = '저장';
                    }
                }
            </script>
        </div>
    </div>
</section>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>
