package com.korea.controller.mini;

import com.korea.controller.SubController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class miniIndexController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("/mini/mini_index.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }

    }
}
