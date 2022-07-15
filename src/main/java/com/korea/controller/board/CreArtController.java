package com.korea.controller.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.korea.controller.SubController;

public class CreArtController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("/board/creArt.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}