package com.korea.controller.board;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class RegionLandmarkController implements SubController
{
    BoardService service = BoardService.getInstance();
    String subject = "regionLandmark"; // DB 테이블명

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            String tmpstart = req.getParameter("start");
            String tmplimit = req.getParameter("limit");
            String nowPage = req.getParameter("nowPage");
            int start = 0;
            int limit = 10;
            if(tmpstart != null && tmplimit != null)
            {
                start = Integer.parseInt(tmpstart);
                limit = Integer.parseInt(tmplimit);
            }
            if(tmplimit != null)
            {
                limit = Integer.parseInt(tmplimit);
            }

            List<BoardDTO> list = service.getBoardList(subject, start, limit);
            int tcnt = service.getTotalCnt(subject);

            req.setAttribute("tcnt", tcnt);
            req.setAttribute("list", list);

            req.setAttribute("nowPage", nowPage);
            req.getRequestDispatcher("/board/regionLandmark.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
