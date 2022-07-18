<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!--CSS 링크-->
    <link rel="stylesheet" href="/resources/css/boardContents.css">
    <link rel="stylesheet" href="/resources/css/common.css">
</head>
<body>
<%@page import="com.korea.dto.*" %>
<%
	BoardDTO dto = (BoardDTO) request.getAttribute("dto");
	String nowPage = (String) request.getAttribute("nowPage");
	String[] filelist = null;
	String[] filesize = null;
	if(dto.getFilename()!=null) { // 파일이 없을 때는 스플릿을 하지 않도록 해야한다.
		filelist = dto.getFilename().split(";");
	}
%>
<div class="board_wrap">
    <div class="board_title">
        <strong>공지사항</strong>
        <p>공지사항을 빠르고 정확하게 안내해드립니다.</p>
    </div>
    <div class="board_view_wrap">
        <div class="board_view">
            <div class="title">
                <%=dto.getTitle() %> %>
            </div>
            <div class="info">
                <dl>
                    <dt>번호</dt>
                    <dd>1</dd>
                </dl>
                <dl>
                    <dt>글쓴이</dt>
                    <dd>김이름</dd>
                </dl>
                <dl>
                    <dt>작성일</dt>
                    <dd>2021.1.16</dd>
                </dl>
                <dl>
                    <dt>조회</dt>
                    <dd>33</dd>
                </dl>
            </div>
            <div class="cont">
                제1의아해가무섭다고그리오.<br>
                제2의아해도무섭다고그리오.<br>
                제3의아해도무섭다고그리오.<br>
                제4의아해도무섭다고그리오.<br>
                제5의아해도무섭다고그리오.<br>
                제6의아해도무섭다고그리오.<br>
                제7의아해도무섭다고그리오.<br>
                제8의아해도무섭다고그리오.<br>
                제9의아해도무섭다고그리오.<br>
                제10의아해도무섭다고그리오.<br>
                제11의아해가무섭다고그리오.<br>
                제12의아해도무섭다고그리오.<br>
                제13의아해도무섭다고그리오.<br>
            </div>
        </div>
        <div class="bt_wrap">
            <a href="board_nowBest.html" class="on">목록</a>
            <a href="#">수정</a>
        </div>
    </div>
</div>
</body>
</html>
