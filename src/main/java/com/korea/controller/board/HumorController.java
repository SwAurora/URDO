package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class HumorController implements SubController
{
    BoardService service = BoardService.getInstance();
    String subject = "humor"; // DB 테이블명

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
//            String tmpstart = req.getParameter("start");
            String tmplimit = req.getParameter("limit");
            String nowPage = req.getParameter("page");
            int start = 0;
            int limit = 10;
            if(tmplimit != null && nowPage != null)
            {
                limit = Integer.parseInt(tmplimit);
                int nowpage = Integer.parseInt(nowPage);
                start = (limit * nowpage) - limit;
            }
            if(tmplimit != null)
            {
                limit = Integer.parseInt(tmplimit);
            }

            List<BoardDTO> list = service.getBoardList(subject, start, limit);
            int tcnt = service.getTotalCnt(subject);

            req.setAttribute("tcnt", tcnt);
            req.setAttribute("list", list);

            Cookie views = new Cookie("views", "true");
            resp.addCookie(views);

            req.setAttribute("nowPage", nowPage);
            req.getRequestDispatcher("/board/humor.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
