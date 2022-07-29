<%@ page import="com.korea.dto.BoardDTO" %>
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
    <jsp:include page="../../resources/includes/link.jsp"/>
    <!-- CSS -->
    <link rel="stylesheet" href="../../resources/css/boardPostUpdate.css">
<body>
<%
    BoardDTO dto = (BoardDTO) request.getAttribute("dto");
%>
<!--네비게이션 시작-->
<jsp:include page="../../resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <div class="container">
        <header>
            <div id="container_Title">
                게시판 > 게시글 수정
            </div>
            <div id="search">
                <div style="font-size: 28px">게시글 수정</div>
            </div>
        </header>

        <div class="container2">
            <div id="writeField">
                <form action="/Board/postUpdate.do" name="form1" method="post" enctype="multipart/form-data">
                    <div class="title_write_area">
                        <input type="text" class="URtitle" placeholder="제목을 입력해 주세요" name="title" value="<%=dto.getTitle()%>">
                    </div>

                    <div class="main_write_area">
                        <textarea name="content" class="URmain" cols="30" rows="10"
                                  placeholder="내용을 입력해 주세요"><%=dto.getContent().replaceAll("<br>", "\n")%></textarea>
                    </div>

                    <div class="filebox">
                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                        <label for="file">파일찾기</label>
                        <input type="file" name="files" id="file" accept="image/*" onchange="fileCheck(this)" multiple/>
                    </div>
                    <div class="filelistbox">
	                    <%
	                        if(dto.getFilename() != null)
	                        {
	                            String fname = dto.getFilename();
	                            String[] files = fname.split(";");
	                            out.println("<p class=\"file_ex\">파일 목록 (삭제할 이미지를 선택해주세요)</p>");
	                            for(String file : files)
	                            {
	                    %>
	                                <label class="file_label"><input type="checkbox" class="file_list" value="<%=file%>"><%=file%></label>
	                    <%
	                            }
	                        }
	                    %>
                    </div>
                    <div class="post">
                        <input type='button' value='취소' class="CancelBtn" onclick="goBack()">
                        <input type='button' value='게시글 수정' class="WriteBtn" onclick="postchk()">
                    </div>
                    <input type="hidden" name="flag" value="true">
                    <input type="hidden" name="subject" value="<%=dto.getSubject()%>">
                    <input type="hidden" name="no" value="<%=dto.getNo()%>">
                    <input type="hidden" name="filename" value="<%=dto.getFilename()%>">
                    <input type="hidden" name="delfiles">
                </form>
            </div>
        </div>

    </div>
    <script>
        function fileCheck(obj)
        {
            let pathpoint = obj.value.lastIndexOf('.');
            let filepoint = obj.value.substring(pathpoint + 1, obj.length);
            let filetype = filepoint.toLowerCase();
            if(filetype === 'jpg' || filetype === 'gif' || filetype === 'png' || filetype === 'jpeg' || filetype === 'bmp')
            {
                let file = document.getElementById('file');
                let name = [];
                if(file.files.length > 0)
                {
                    for(let i = 0; i < file.files.length; i++)
                    {
                        name[i] = file.files[i].name;
                    }
                }
                $(".upload-name").val(name.toString());
                return true;
            }
            else
            {
                alert('이미지 파일만 선택할 수 있습니다.');
                let parentObj = obj.parentNode
                let node = parentObj.replaceChild(obj.cloneNode(true), obj);
                document.getElementById("file").value = "";
                document.getElementsByClassName("upload-name")[0].value = "";
                return false;
            }
        }

        function postchk()
        {
            let form = document.form1;

            if(form.title.value === "" || form.content.value === "")
            {
                alert("비어있는 항목이 있습니다.");
            }
            else
            {
                form.delfiles.value = delfile();
                form.submit();
            }
        }

        function delfile()
        {
            let files = "";
            for(let i = 0; i < $('.file_list').length; i++)
            {
                if($($('.file_list')[i]).is(":checked"))
                {
                    files += $($('.file_list')[i]).val() + ";";
                }
            }
            return files;
        }
    </script>
</section>
<script>
    function goBack()
    {
        history.back();
    }
</script>
<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>