package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeleteController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        String no = req.getParameter("no");
        String subject = req.getParameter("subject");
        boolean result = service.delete(Integer.parseInt(no));
        if(result)
        {
            try
            {
                resp.sendRedirect("/Board/" + subject + ".do");
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
        else
        {
            try
            {
                req.setAttribute("msg", "삭제에 실패했습니다.");
                req.getRequestDispatcher("/Board/read.do").forward(req,resp);
            }
            catch(Exception e)
            {
                e.printStackTrace();
            }
        }
    }
}
