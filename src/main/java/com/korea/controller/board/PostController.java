package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.MemberDTO;
import com.korea.service.BoardService;
import com.korea.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import java.net.URLEncoder;
import java.util.ArrayList;

public class PostController implements SubController
{
    BoardService service = BoardService.getInstance();
    MemberService mservice = MemberService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        try
        {
            if(flag == null) // 게시판에서 게시글 작성 누른 경우
            {
                req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
            }
            else // post.jsp에서 등록할 내용을 기입하고 글쓰기 버튼을 누른 경우
            {
                String subject = req.getParameter("subjects");
                String title = req.getParameter("title");
                String content = req.getParameter("content");
                HttpSession session = req.getSession();
                String id = (String) session.getAttribute("id");
                MemberDTO mdto = mservice.MemberSearch(id);
                String writer = mdto.getNickname();

                if(subject.equals("") || title.equals("") || content.equals(""))
                {
                    req.setAttribute("msg", "비어있는 내용이 있습니다.");
                    req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
                    return;
                }

                BoardDTO dto = new BoardDTO();
                dto.setSubject(subject);
                dto.setTitle(title);
                dto.setContent(content);
                dto.setWriter(writer);

                //첨부파일 part 전달
                ArrayList<Part> parts = (ArrayList<Part>) req.getParts();
                boolean result;
                long size = parts.get(3).getSize();
                if(size == 0) // 첨부파일이 없는 경우
                {
                    result = service.PostBoard(dto);
                }
                else // 첨부파일이 있는 경우
                {
                    result = service.PostBoard(dto, parts);
                }

                if(result)
                {
                    resp.sendRedirect("/Board/" + subject + ".do");
                }
                else
                {
                    req.setAttribute("msg", "작성에 실패했습니다.");
                    req.getRequestDispatcher("/WEB-INF/board/post.jsp").forward(req, resp);
                }
            }
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
