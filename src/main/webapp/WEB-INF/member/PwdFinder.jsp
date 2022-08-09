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
    <link rel="stylesheet" href="resources/css/PwdFinder.css">
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

<!--메인 시작-->
<section class="Main" style="display: flex; justify-content: center; align-items: center;">
    <form action="/PwdFinder.do" method="post">
        <div id="LoginBox">
            <!-- Login용 input -->
           
           <div class="inputBox">          
                
                <input type="text" name="id" required="required" id="id">
                <span>아이디 입력</span><br>
             
            </div>    
           
            <div class="inputBox">          
                <input type="email" name="email" required="required" id="email">
                <span>이메일 입력</span><br>
             
            </div>

            <button type="submit" class="loginA" style="border:0; cursor:pointer">
                <span>SEND</span>
                <i></i>
            </button>
            <div id="caution" class="caution" >※ 가입 시 작성하신 이메일로 임시 비밀번호가 발송됩니다. <br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;임시 비밀번호로 로그인 후 비밀번호를 변경해주세요.</div>
            <input type="hidden" name="flag" value="true">
        </div>
    </form>
</section>
<!--전체 JS-->
<script src="resources/js/common.js"></script>
<!--로그인 JS-->
<script src="resources/js/login.js"></script>
</body>
</html>
