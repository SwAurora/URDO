package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.korea.controller.SubController;
import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

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
			dto = service.Select(Integer.parseInt(no));
			req.setAttribute("dto", dto);
			
			HttpSession session = req.getSession();
			session.setAttribute("dto", dto);
			
			
            req.getRequestDispatcher("/WEB-INF/board/read.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
