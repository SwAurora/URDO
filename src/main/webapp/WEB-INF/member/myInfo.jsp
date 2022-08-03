<%@page import="java.util.ArrayList"%>
<%@ page import="com.korea.dto.MemberDTO" %>
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

<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
    location.href="/ShowInfo.do";
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
    	ArrayList<UrpoDTO> itemlist = (ArrayList<UrpoDTO>) request.getAttribute("itemlist");
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
                <div class="number"><%=dto.getPoint()%></div>
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
                <a class="updateBtn" id="submitBtn1-1" href="javascript:cancel(1)">취소</a>
            </div>
            <div class="item">
                <div class="text">닉네임</div>
                <div class="text"><input type="text" id="nickname" class="ipSet" value="<%=dto.getNickname()%>"
                                         disabled>
                </div>
                <a class="updateBtn" id="submitBtn2" href="javascript:sujung(2)">수정</a>
                <a class="updateBtn" id="submitBtn2-1" href="javascript:cancel(2)">취소</a>
            </div>
            <div class="item">
                <a href="javascript:modal()" id="pwdchange">비밀번호 재설정</a>
            </div>
            <div class="item">
                <a href="javascript:modal2()" id="delAccount">회원 탈퇴</a>
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
                            $('#submitBtn1-1').css("display", "block");
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
                            $('#submitBtn2-1').css("display", "block");
                        }
                    }
                }

                // 취소 버튼
                function cancel(num)
                {
                    if(num === 1)
                    {
                        $('#submitBtn1').html('수정');
                        $("#email").attr("disabled", true);
                        $('#email').val("<%=dto.getEmail()%>");
                        $('#submitBtn1-1').css("display", "none");
                    }
                    else
                    {
                        $('#submitBtn2').html('수정');
                        $("#nickname").attr("disabled", true);
                        $('#nickname').val("<%=dto.getNickname()%>");
                        $('#submitBtn2-1').css("display", "none");
                    }
                }

                // 모달
                function modal()
                {
                    let modal = document.getElementsByClassName("modal");
                    let main = document.getElementsByClassName("Main");
                    modal[0].style.display = "block";
                    main[0].style.opacity = "0.5";

                    if($('#submitBtn3').html() === '저장')
                    {
                        let frm1 = document.frm1;
                        frm1.nickname.value = $('#password').val();
                        frm1.submit();
                    }
                    else
                    {
                        $('#submitBtn3').html('저장');
                        $("#password").attr("disabled", false);
                    }
                }

                function modal2()
                {
                    let modal = document.getElementsByClassName("modal_2");
                    let main = document.getElementsByClassName("Main");
                    modal[0].style.display = "block";
                    main[0].style.opacity = "0.5";
                }

                // 닫기
                function closeModal()
                {
                    let modal = document.getElementsByClassName("modal");
                    let main = document.getElementsByClassName("Main");
                    modal[0].style.display = "none";
                    main[0].style.opacity = "1";
                }

                function closeModal2()
                {
                    let modal_2 = document.getElementsByClassName("modal_2");
                    let main = document.getElementsByClassName("Main");
                    modal_2[0].style.display = "none";
                    main[0].style.opacity = "1";
                }

                function pwChk()
                {
                    let now_pw = document.getElementById("now_pw");
                    let new_pw = document.getElementById("new_pw");
                    let conf_pw = document.getElementById("conf_pw");
                    let fm = document.fm;

                    if(now_pw.value === "" || new_pw.value === "" || conf_pw.value === "")
                    {
                        alert("비어있는 항목이 있습니다.");
                    }
                    else if(new_pw.value !== conf_pw.value)
                    {
                        alert("비밀번호가 서로 다릅니다.");
                    }
                    else
                    {
                        fm.submit();
                    }
                }

                function emptyChk()
                {
                    if($('#delpw').val() === "")
                    {
                        alert("비밀번호를 입력 해주세요.");
                        return false;
                    }
                    return true;
                }
            </script>
        </div>
	    <!-- 댓글 아이콘 선택 -->
	    <style>
	    	.iconContainer {
	    		border:1px solid red;
	    	}
	    	.icon {
	    		display:flex;
	    		flex-wrap: wrap;
	    	}
	    	.imgTitle {
	    	}
	    </style>
	    <div class="iconContainer">
	    	<h1>댓글 아이콘을 선택해보세요.</h1>
			<form action="/URPO/Icon.do" method="post">
			<%
			  for(UrpoDTO urpoDTO: itemlist) {
			%>
				<div class="icon">
					<div><img src=<%=urpoDTO.getGifImage() %> alt="" class="animated"  style ="width:50px; height:50px;"></div>
					<div class="imgTitle"><%=urpoDTO.getTitle()%></div>
					<input type="radio" name="replyIcon" value=<%=urpoDTO.getNo() %>>
			<%
			}
			%>
		    	</div>
				<input type="submit" value="고르기">
	        </form>
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
            <form action="/PwdUpdate.do" id="fm" name="fm" method="post">
                <fieldset>
                    <legend>비밀번호 변경</legend>

                    <input type="password" id="now_pw" name="now_pw" maxlength="20" placeholder="현재 비밀번호 입력">
                    <input type="password" id="new_pw" name="new_pw" maxlength="20" placeholder="새 비밀번호 입력">
                    <input type="password" id="conf_pw" maxlength="20" placeholder="새 비밀번호 확인">

                    <p class="btn_area_btm">
                        <button id="changeSubmit" onclick="pwChk();return false;">확인</button>
                        <button type="button" onclick="closeModal();return false;">취소</button>
                    </p>
                </fieldset>
            </forM>
        </div>
    </div>
</div>
<%---------------------------------------------- 모달 2 -----------------------------------------------------%>

<div class="modal_2">
    <div class="section_pwconfirm">
        <div class="spc_header">
            <h2>회원탈퇴</h2>
            <p class="contxt">회원탈퇴를 하시게 되면 더이상</p>
            <p class="contxt contxt_list">유알도 <em>서비스</em> 를 이용 하실수가 없습니다.</p>
        </div>
        <div class="spc_content">
            <form action="/Delete.do" id="fm_2" name="fm_2" method="post" onsubmit="return emptyChk();">
                <fieldset>
                    <legend>비밀번호 입력</legend>

                    <input type="password" id="delpw" name="delpw" maxlength="20" placeholder="현재 비밀번호">

                    <p class="btn_area_btm">
                        <button type="submit" id="changeSubmit_2">확인</button>
                        <button type="button" onclick="closeModal2();return false;">취소</button>
                    </p>
                </fieldset>
            </forM>
        </div>
    </div>
</div>

<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>
