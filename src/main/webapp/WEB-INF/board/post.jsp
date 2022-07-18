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
    <link rel="stylesheet" href="../../resources/css/boardPost.css">
    <link rel="stylesheet" href="../../resources/css/pointShop.css">
<body>
<%
    String msg = (String) request.getAttribute("msg");
    if(msg != null)
    {
%>
<script>
    alert('<%=msg%>');
</script>
<%
    }
%>
<!--네비게이션 시작-->
<jsp:include page="../../resources/includes/nav.jsp"/>

<!-- 메인 시작 -->
<section class="Main">
    <div class="container">
        <header>
            <div id="container_Title">
                게시판 > 게시글 작성
            </div>
            <div id="search">
                <div style="font-size: 28px">게시글 작성</div>
            </div>
        </header>

        <div class="container2">
            <div id="writeField">
                <form action="/BoardPost.do" method="post" enctype="multipart/form-data">
                        <select name="subjects" id="sel1">
                            <option value="humor">웃긴 자료</option>
                            <option value="creArt" style="text-align: center">그림</option>
                            <option value="creCook">요리</option>
                            <option value="regionRestaurant">맛집</option>
                            <option value="regionLandmark">명소</option>
                            <option value="regionLandmark">게임</option>
                            <option value="regionLandmark">스포츠</option>
                            <option value="regionLandmark">음악</option>
                        </select>
                        <%
                            String subject = request.getParameter("subject");

                            if(subject != null)
                            {
                        %>
                        <script>
                            $('#sel1').val('<%=subject%>').prop("selected", true);
                        </script>
                        <%
                            }
                        %>
                    <div class="title_write_area">
                        <input type="text" class="URtitle" placeholder="제목을 입력해 주세요" name="title">
                    </div>

                    <div class="main_write_area">
                        <textarea name="content" class="URmain" cols="30" rows="10" placeholder="내용을 입력해 주세요"></textarea>
                    </div>

                    <div class="filebox">
                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                        <label for="file">파일찾기</label>
                        <input type="file" name="files" id="file" accept="image/*" multiple/>
                    </div>

                    <div class="post">
                        <input type='button' value='취소' class="CancelBtn" onclick="goBack()">
                        <input type='button' value='게시글 등록' class="WriteBtn" onclick="submit()">
                    </div>
                    <input type="hidden" name="flag" value="true">
                </form>
            </div>
        </div>

    </div>
    <script>
        $("#file").on('change', function()
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
        })

        function goBack()
        {
            history.back();
        }
    </script>
</section>

<!--전체 JS-->
<script src="../../resources/js/common.js"></script>

</body>
</html>