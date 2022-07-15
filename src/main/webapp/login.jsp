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
    <jsp:include page="resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" href="resources/css/login.css">
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
<jsp:include page="resources/includes/nav.jsp"/>

<!--메인 시작-->
<section class="Main" style="display: flex; justify-content: center; align-items: center;">
    <form action="/Login.do" method="post" onsubmit="idSave()">
        <div id="LoginBox">
            <!-- Login용 input -->
            <div class="inputBox">
                <input type="text" name="id" required="required" id="id">
                <span>ID</span>
            </div>
            <div class="inputBox">
                <input type="password" name="pw" required="required" id="pw">
                <span>PW</span>
                <div id="toggle" onclick="showHide();" class="menuIcon"></div>
            </div>
            <div class="checkbox">
                <input type="checkbox" id="chk1">
                <label for="chk1" id="chkLabel">아이디 저장</label>
            </div>

            <button type="submit" class="loginA" style="border:0; cursor:pointer">
                <span>Login</span>
                <i></i>
            </button>
            <div id="signIn">
                <a href="/SignUp.do" id="ss1">회원가입</a>
                <span id="ss2">/</span>
                <a href="#" id="ss3">비밀번호 찾기</a>
            </div>
        </div>
    </form>
    <script>
        $(function()
        {
            let cookieid = getCookie("saveid");
            console.log(cookieid);
            if(cookieid !== "")
            {
                $("input:checkbox[id='chk1']").prop("checked", true);
                $('#id').val(cookieid);
            }
        });

        function idSave()
        {
            let expdate = new Date();
            if($("#chk1").is(":checked"))
            {
                expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30); // 1달
                setCookie("saveid", $("#id").val(), expdate);
            }
            else
            {
                expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
                setCookie("saveid", $("#id").val(), expdate);
            }
        }

        function setCookie(name, value, expiredays)
        {
            let todayDate = new Date();
            todayDate.setTime(todayDate.getTime());
            if(todayDate > expiredays)
            {
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
            }
            else if(todayDate < expiredays)
            {
                todayDate.setDate(todayDate.getDate() + expiredays);
                document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toUTCString() + ";";
            }
        }

        function getCookie(Name)
        {
            let search = Name + "=";
            console.log("search : " + search);

            if(document.cookie.length > 0)
            { // 쿠키가 설정되어 있다면 
                let offset = document.cookie.indexOf(search);
                if(offset !== -1)
                { // 쿠키가 존재하면 
                    offset += search.length;
                    let end = document.cookie.indexOf(";", offset);
                    // 쿠키 값의 마지막 위치 인덱스 번호 설정
                    if(end === -1) end = document.cookie.length;
                    return unescape(document.cookie.substring(offset, end));
                }
            }
            return "";
        }
    </script>
</section>
<!--전체 JS-->
<script src="resources/js/common.js"></script>
<!--로그인 JS-->
<script src="resources/js/login.js"></script>
</body>
</html>
