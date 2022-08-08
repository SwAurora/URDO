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
        try {
        	String subject = req.getParameter("subject");
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

            if(subject.equals("searchMain")) {
            	List<BoardDTO> list = service.getBoardListMain(keyword ,start, limit);
                int tcnt = service.getTotalCntMain(keyword);
                
                if(list.isEmpty()) {
                	req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
                } else {
                	req.setAttribute("listNullMsg", null);
                }

                req.setAttribute("tcnt", tcnt);
                req.setAttribute("list", list);


                req.setAttribute("nowPage", nowPage);
                req.getRequestDispatcher("/board/"+subject+".jsp").forward(req, resp);
                
            } else {
            	List<BoardDTO> list = service.getBoardList(subject, keyword ,start, limit);
                int tcnt = service.getTotalCnt(subject, keyword);
                
                if(list.isEmpty()) {
                	req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
                } else {
                	req.setAttribute("listNullMsg", null);
                }

                req.setAttribute("tcnt", tcnt);
                req.setAttribute("list", list);


                req.setAttribute("nowPage", nowPage);
                req.getRequestDispatcher("/board/"+subject+".jsp").forward(req, resp);
            }
            
            Cookie views = new Cookie("views", "true");
            resp.addCookie(views);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
