package com.korea.controller.urpo;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.dto.UrpoDTO;
import com.korea.service.UrpoService;

public class UrpoSearchController implements SubController{

	UrpoService service = UrpoService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            // 검색 시 받아야하는 팩터들...
        	String category = "urcon"; // 지금은 카테고리가 하나밖에없다.
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
            if(tmplimit != null)
            {
                limit = Integer.parseInt(tmplimit);
            }

            List<UrpoDTO> list = service.ShowKeywordItems(category, keyword, start, limit);
            
            int tcnt = service.getTotalKeywordCount(category, keyword);

            if(list.isEmpty()) {
                req.setAttribute("listNullMsg", "검색결과가 존재하지 않습니다.");
            } else {
                req.setAttribute("listNullMsg", null);
            }

            req.setAttribute("tcnt", tcnt);
            req.setAttribute("list", list);
            req.setAttribute("nowPage", nowPage);

            // 페이지네이션과 검색정보를 위해 keyword를 세션에남겼다.
            HttpSession session = req.getSession();
            session.setAttribute("keyword", keyword);

            req.getRequestDispatcher("/URPO/urconSearch.jsp?").forward(req, resp);

        } catch(Exception e) {
            e.printStackTrace();
        }
    }

}
