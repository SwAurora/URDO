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


<style>

#adminlogin {
	width:400px;
	height: 400px;
	margin: 300px auto;	
	display: flex;
}

.txtbox {
height: 30px;
width: 200px;
margin: 5px;
}


form {
margin-top: 16px;
}



</style>


<div id="adminlogin">
<h1></h1>
<p></p>

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




</body>
</html>