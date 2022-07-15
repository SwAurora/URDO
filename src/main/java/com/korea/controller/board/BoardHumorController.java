package com.korea.controller.board;

import com.korea.controller.SubController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardHumorController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("/board/board_Humor.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
