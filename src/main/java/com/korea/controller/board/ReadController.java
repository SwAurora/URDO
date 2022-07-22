package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
            File[] files = service.fileChk(no);
            for(File file : files)
            {
                System.out.println(file.getPath().split("webapp")[1]);
            }
			dto = service.Select(Integer.parseInt(no));
            req.setAttribute("files", files);
			req.setAttribute("dto", dto);
            req.getRequestDispatcher("/WEB-INF/board/read.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }

}
