package com.korea.controller.board;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

public class SearchController implements SubController{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
    	String subject = req.getParameter("subject");
        try {
            String tmplimit = req.getParameter("limit");
            String nowPage = req.getParameter("page");
            String keyword = req.getParameter("keyword");
            int start = 0;
            int limit = 10;
            if(tmplimit != null && nowPage != null) {
                limit = Integer.parseInt(tmplimit);
                int nowpage = Integer.parseInt(nowPage);
                start = (limit * nowpage) - limit;
            }
            if(tmplimit != null) {
                limit = Integer.parseInt(tmplimit);
            }

            List<BoardDTO> list = service.getBoardList(subject, keyword ,start, limit);
            
            if(list.isEmpty()) {
            	req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
            }
            
            int tcnt = service.getTotalCnt(subject, keyword);

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
