<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="side_nav">

	<div id="nav-header">
        <!--로고-->
        <img src="/resources/img/sidebar/logo.svg" alt="LOGO" id="logo" width="32px" height="32px">
        <div id="logo-name">
            <span class="head-span1">URDO</span>
        </div>
   	</div>


      <ul class="sidemenu sidemenuTop">
        <li>
          <a href="/main.do">
          <span>URDO 바로가기</span>
          </a>
        </li>

        <li><a href="dashBoardPage.html"><sapn> 대시보드 </sapn></a></li>
        <li><a href="#"><sapn> 사용자관리 </sapn></a></li>
        <li><a href="#"><sapn> 게시판 관리 </sapn></a>
          <ul class="subnav">
            <li><a href="/admin/notice.do">공지사항</a></li>
            <li><a href="/admin/banner.do">배너</a></li>
            <li><a href="/admin/board.do">게시글</a></li>
          </ul>
        </li>
        <li><a href="#"><sapn> 회원 관리 </sapn></a></li>

      </ul>

    </div>