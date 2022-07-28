package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PostUpdateController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String flag = req.getParameter("flag");
        String no = req.getParameter("no");

        if(flag == null)
        {
            try
            {
                BoardDTO dto = service.Select(Integer.parseInt(no));
                req.setAttribute("dto", dto);
                req.getRequestDispatcher("/WEB-INF/board/postUpdate.jsp").forward(req, resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            String subject = req.getParameter("subject");
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            BoardDTO dto = new BoardDTO();
            dto.setNo(Integer.parseInt(no));
            dto.setTitle(title);
            dto.setContent(content.replaceAll("\n", "<br>"));
            service.update(dto);
            try
            {
                req.setAttribute("msg", "수정되었습니다.");
                req.getRequestDispatcher("/Board/" + subject + ".do").forward(req,resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
