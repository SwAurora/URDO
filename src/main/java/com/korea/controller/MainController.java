package com.korea.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MainController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("main.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
