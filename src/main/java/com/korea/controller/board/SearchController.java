package com.korea.controller.board;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

public class SearchController implements SubController{
    BoardService service = BoardService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try {
        	// 검색 시 받아야하는 팩터들...
        	String subject = req.getParameter("subject");
            String tmplimit = req.getParameter("limit");
            String nowPage = req.getParameter("page");
            String keyword = (String) req.getParameter("keyword");
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
            
            // 검색페이지인지 단순 view페이지인지 확인하는 factor
            req.setAttribute("checkSearch", "1");
            
            
            // subject에 따른 분기문
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
                
                // 페이지네이션을 위해 keyword를 세션에남겼다.
                HttpSession session = req.getSession();
                session.setAttribute("keyword", keyword);
                
                req.getRequestDispatcher("/board/searchMain.jsp").forward(req, resp);
                
            } else if(subject.equals("bestNow")) {
            	List<BoardDTO> list = service.getBestNow(keyword ,start, limit);
                int tcnt = service.getBestNowTotalCount(keyword);
                
                if(list.isEmpty()) {
                	req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
                } else {
                	req.setAttribute("listNullMsg", null);
                }

                req.setAttribute("tcnt", tcnt);
                req.setAttribute("list", list);

                req.setAttribute("nowPage", nowPage);
                
                // 페이지네이션을 위해 keyword를 세션에남겼다.
                HttpSession session = req.getSession();
                session.setAttribute("keyword", keyword);
                
                req.getRequestDispatcher("/board/search.jsp").forward(req, resp);
                
            } else if(subject.equals("bestMonth")) {
            	List<BoardDTO> list = service.getBestMonth(keyword ,start, limit);
                int tcnt = service.getBestMonthTotalCount(keyword);
                
                if(list.isEmpty()) {
                	req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
                } else {
                	req.setAttribute("listNullMsg", null);
                }

                req.setAttribute("tcnt", tcnt);
                req.setAttribute("list", list);

                req.setAttribute("nowPage", nowPage);
                
                // 페이지네이션을 위해 keyword를 세션에남겼다.
                HttpSession session = req.getSession();
                session.setAttribute("keyword", keyword);
                
                req.getRequestDispatcher("/board/search.jsp").forward(req, resp);
                
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
                
                // 페이지네이션을 위해 keyword를 세션에남겼다.
                HttpSession session = req.getSession();
                session.setAttribute("keyword", keyword);
                
                req.getRequestDispatcher("/board/search.jsp").forward(req, resp);
            }
            
            // 조회수를 위한 쿠키
            Cookie views = new Cookie("views", "true");
            resp.addCookie(views);
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
