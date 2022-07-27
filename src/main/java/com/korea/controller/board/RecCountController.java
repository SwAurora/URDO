package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class RecCountController implements SubController
{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            PrintWriter out = resp.getWriter();

            int no = Integer.parseInt(req.getParameter("no"));

            // 게시글 총 추천수
            int count = service.recCount(no);

            // 추천수 출력
            out.println(count);
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
