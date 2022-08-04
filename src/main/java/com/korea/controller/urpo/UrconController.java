package com.korea.controller.urpo;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;
import com.korea.dto.UrpoDTO;
import com.korea.service.UrpoService;

public class UrconController implements SubController
{
	UrpoService service = UrpoService.getInstance();
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
    	String category = "urcon";
        try {
            String tmplimit = req.getParameter("limit");
            String nowPage = req.getParameter("page");
            int start = 0;
            int limit = 30;
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
        	List<UrpoDTO> list = service.ShowItems(category, start, limit);
            req.setAttribute("list", list);
            int tcnt = service.getTotalCnt(category);
            req.setAttribute("tcnt", tcnt);
            req.setAttribute("nowPage", nowPage);
            req.getRequestDispatcher("/URPO/urcon.jsp").forward(req, resp);
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
}
