<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  HttpSession sessionchk = request.getSession();
  String id = (String) sessionchk.getAttribute("id");
  if(id == null)
  {
%>
<div id="loginWrap">
  <button onclick="Login()" class="btn" style="cursor:pointer;">
    <img src="/resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
    <span>로그인</span>
  </button>
</div>
<%
}
else
{
%>
<div id="loginWrap">
  <button onclick="Logout()" class="btn" style="cursor:pointer;">
    <img src="/resources/img/sidebar/login-unlock.svg" alt="login" class="navIcon">
    <span>로그아웃</span>
  </button>
</div>
<%
  }
%>