package com.korea.controller;

import com.korea.dto.BoardDTO;
import com.korea.service.BoardService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class MainController implements SubController
{
    BoardService service = BoardService.getInstance();

    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            List<BoardDTO> list = service.SelectBestHumor();
            List<BoardDTO> list2 = service.getBestNow();
            List<BoardDTO> list3 = service.getBestMonth();
            req.setAttribute("list", list);
            req.setAttribute("list2", list2);
            req.setAttribute("list3", list3);

            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
