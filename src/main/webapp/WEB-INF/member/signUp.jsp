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
    <!-- CSS -->
    <link rel="stylesheet" href="../../resources/css/signUp.css">
</head>
<body>
<%
    String msg = (String) request.getAttribute("msg");
    String back = (String) request.getAttribute("back");
    if(msg != null)
    {
%>
<script>
    alert("<%=msg%>");
</script>
<%
    }
    if(back != null)
    {
        out.println(back);
    }
%>
<!--네비게이션 시작-->
<jsp:include page="/resources/includes/nav.jsp"/>

<section class="Main" style="display: flex; justify-content: center; align-items: center;">
    <form action="/SignUp.do" name="form1" method="post" onsubmit="return check()">
        <!-- 회원가입 창 input 부분 -->
        <div id="d1">
            <div id="d2">

                <div class="inputBox ipBox">
                    <input type="text" name="id" required placeholder=" " pattern="^(?=.*[a-z0-9])[a-z0-9]{6,20}$"
                           title="6~20자의 영문과 숫자로만 입력해주세요.">
                    <span>아이디</span>
                </div>

                <div class="inputBox">
                    <input type="password" name="pw" required id="password" placeholder=" "
                           pattern="^(?=.*[0-9])(?=.*[a-zA-Z])[a-zA-Z0-9!@#$%^&*()._-]{6,16}$"
                           title="6~16자의 영문, 숫자, 특수문자(!@#$%^&*()._-)로만 입력해주세요.">
                    <span>비밀번호</span>
                </div>

                <div class="inputBox">
                    <input type="password" name="pwchk" required="" id="passwordCheck" placeholder=" "
                           title="비밀번호와 동일하게 입력해주세요."
                           pattern="">
                    <span>비밀번호 확인</span>
                </div>

                <div class="inputBox">
                    <input type="email" name="email" required placeholder=" "
                           pattern="^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
                           title="이메일 주소를 입력하세요.">
                    <span>이메일</span>
                </div>

                <div class="inputBox ipBox">
                    <input type="text" name="nickname" required placeholder=" "
                           pattern="^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,10}$"
                           title="2~10자의 영문, 한글, 숫자만 입력해주세요.">
                    <span>닉네임</span>
                </div>

                <button type="submit" class="SignUp" style="border:0; cursor:pointer;">
                    <span>BECOME A LIBRARIAN</span>
                    <i></i>
                </button>
            </div>

            <!-- 이용약관 -->
            <div id="joinForm">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li>
                                이용약관, 개인정보 수집 및 이용,
                                위치정보 이용약관(선택), 프로모션 안내
                                메일 수신(선택)에 모두 동의합니다.
                            </li>
                            <li class="checkAllBtn">
                                <input type="checkbox" name="chkAll" id="chk" class="chkAll">
                            </li>
                        </ul>
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li>
                                이용약관 동의(필수)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk1">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>
                                개인정보 수집 및 이용에 대한 안내(필수)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk2">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li>
                                위치정보 이용약관 동의(선택)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk3">
                            </li>
                        </ul>
                        <textarea wrap="hard" readonly>여러분을 환영합니다.유알도 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 유알도 서비스의 이용과 관련하여 유알도 서비스를 제공하는 유알도 주식회사(이하 ‘유알도’)와 이를 이용하는 유알도 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 유알도 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.
                    </textarea>
                    </li>
                    <li class="checkBox check04">
                        <ul class="clearfix">
                            <li>
                                이벤트 등 프로모션 알림 메일 수신(선택)
                            </li>
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" class="check" id="chk4">
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
        <input type="hidden" name="flag" value="true">
    </form>
</section>
<script>
    function check()
    {
        let form = document.form1;
        let chk1 = document.getElementById('chk1');
        let chk2 = document.getElementById('chk2');
        if(form.id.value === "" || form.pw.value === "" || form.pwchk.value === "" || form.email.value === "" || form.nickname.value === "")
        {
            alert("입력되지 않은 항목이 있습니다.");
            return false;
        }
        if(form.pw.value !== form.pwchk.value)
        {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        if(chk1.checked === false || chk2.checked === false)
        {
            alert("필수 약관을 동의해 주십시오.");
            return false;
        }
        return true;
    }
</script>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>
<!--회원가입 JS-->
<script src="../../resources/js/signUp.js"></script>
</body>
</html>
