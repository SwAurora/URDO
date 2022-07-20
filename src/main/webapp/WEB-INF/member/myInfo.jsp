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
    String result = request.getParameter("result");
    if(result != null)
    {
        if(result.equals("true"))
        {
            out.println("<script>alert('수정을 성공하였습니다.')</script>");
            out.println("<script>location.href='/ShowInfo.do'</script>");
        }
        else
        {
            out.println("<script>alert('수정을 실패하였습니다.')</script>");
            out.println("<script>location.href='/ShowInfo.do'</script>");
        }
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
            <div class="item">
                <div class="text">이메일</div>
                <div class="text"><input type="email" id="email" class="ipSet" value="<%=dto.getEmail()%>" disabled>
                </div>
                <a class="updateBtn" id="submitBtn1" href="javascript:sujung(1)">수정</a>
            </div>
            <div class="item">
                <div class="text">닉네임</div>
                <div class="text"><input type="text" id="nickname" class="ipSet" value="<%=dto.getNickname()%>"
                                         disabled>
                </div>
                <a class="updateBtn" id="submitBtn2" href="javascript:sujung(2)">수정</a>
            </div>
            <div class="item">
                <div class="text">비밀번호</div>
                <div class="text"></div>
                <a class="updateBtn" id="submitBtn3" href="javascript:modal()">수정</a>
            </div>
            <form action="/Update.do" name="frm1" method="post">
                <input type="hidden" name="email">
                <input type="hidden" name="nickname">
            </form>

            <script>

                // 수정
                function sujung(num)
                {
                    if(num === 1)
                    {
                        if($('#submitBtn1').html() === '저장')
                        {
                            let frm1 = document.frm1;
                            frm1.email.value = $('#email').val();
                            frm1.submit();
                        }
                        else
                        {
                            $('#submitBtn1').html('저장');
                            $("#email").attr("disabled", false);
                        }
                    }
                    else
                    {
                        if($('#submitBtn2').html() === '저장')
                        {
                            let frm1 = document.frm1;
                            frm1.nickname.value = $('#nickname').val();
                            frm1.submit();
                        }
                        else
                        {
                            $('#submitBtn2').html('저장');
                            $("#nickname").attr("disabled", false);
                        }
                    }
                }

                // 모달
                function modal()
                {
                    let modal = document.getElementsByClassName("modal");
                    let main = document.getElementsByClassName("Main");
                    modal[0].style.display = "block";
                    main[0].style.opacity = "0.5";
                }

                // 닫기
                function aaaa()
                {
                    let modal = document.getElementsByClassName("modal");
                    let main = document.getElementsByClassName("Main");
                    modal[0].style.display = "none";
                    main[0].style.opacity = "1";
                }
            </script>
        </div>
    </div>
</section>

<%-- 모달 --%>
<div class="modal">
    <div class="section_pwconfirm">
        <div class="spc_header">
            <h2>비밀번호 변경</h2>
            <p class="contxt">안전한 비밀번호로 내정보를 보호하세요</p>
            <p class="contxt contxt_list"><em>다른 아이디/사이트에서 사용한 적 없는 비밀번호</em></p>
            <p class="contxt contxt_list"><em>이전에 사용한 적 없는 비밀번호</em>가 안전합니다.</p>
        </div>
        <div class="spc_content">
            <form id="fm" name="fm">
                <fieldset>
                    <legend>비밀번호 변경</legend>
                    <input type="password" name="now_pw" id="now_pw" maxlength="20" placeholder="현재 비밀번호 입력">
                    <input type="password" id="new_pw" name="new_pw" maxlength="20" placeholder="새 비밀번호 입력">
                    <input type="password" id="conf_pw" maxlength="20" placeholder="새 비밀번호 확인 입력">

                    <p class="btn_area_btm">

                        <button type="submit" id="changeSubmit">확인</button>
                        <button type="button" onclick="aaaa();return false;">취소</button>
                    </p>

                </fieldset>
            </form>
        </div>
    </div>
</div>


<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>