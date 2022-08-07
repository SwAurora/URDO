<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome URDO ADMIN</title>

<link rel="stylesheet" href="/resources/css/admin/common.css">

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


<style>

#adminlogin {
	width:400px;
	height: 400px;
	margin: 200px auto;	
	

}

#loginBox {
	display: flex;
	margin-top: 50px;
}

form {
margin-top: 16px;
}


.txtbox {
height: 35px;
width: 200px;
margin: 5px;
padding: 5px;
box-sizing: border-box;
line-height: 30px;
}

.btn {
width: 200px;
margin: 5px;
height: 30px;
padding: 5px;
box-sizing: border-box;
line-height: 30px;

}




</style>


<div id="adminlogin">
<h1></h1>
<p></p>


	<div id="loginBox">
	
		<div>
		<img src="/resources/img/admin/lock.svg" width="150px;">
		</div>
	
		<form action="/adminLogin.do" method="post">
			<div>
				<input type="text" name="id" class="txtbox txt" placeholder="아이디를 입력해주세요">	
			</div>
			
			<div>
				<input type="password" name="pwd" class="txtbox pwd" placeholder="비밀번호를 입력해주세요">
			</div>	
			
			<div>
				<input type="submit" class="txtbox btn" value="로그인">
			</div>
		</form>
	</div>

</div>




</body>
</html>