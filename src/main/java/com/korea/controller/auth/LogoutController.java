package com.korea.controller.auth;

import com.korea.controller.SubController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        HttpSession session = req.getSession();
        session.invalidate();
        try
        {
            req.setAttribute("msg", "로그아웃 되었습니다.");
            req.getRequestDispatcher("/main.do").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
