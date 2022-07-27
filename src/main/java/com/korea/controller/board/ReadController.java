package com.korea.controller.board;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ReadController implements SubController
{
	BoardService service = BoardService.getInstance();
	BoardDTO dto = new BoardDTO();

	@Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
		try
        {
			String no = req.getParameter("no");
            int num = Integer.parseInt(no);
            Cookie[] cookies = req.getCookies();
            for(Cookie cookie : cookies)
            {
                if(cookie.getName().equals("views"))
                {
                    cookie.setMaxAge(0); // 쿠키 제거
                    resp.addCookie(cookie); // 쿠키 제거 적용
                    service.ViewsUp(num);
                    break;
                }
            }

			dto = service.Select(Integer.parseInt(no));

			req.setAttribute("dto", dto);
			
            req.getRequestDispatcher("/WEB-INF/board/read.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
