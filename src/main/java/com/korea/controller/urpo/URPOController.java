package com.korea.controller.urpo;

import com.korea.controller.SubController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class URPOController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("/URPO/urcon.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
