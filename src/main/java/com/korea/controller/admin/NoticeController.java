package com.korea.controller.admin;

import com.korea.controller.SubController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NoticeController implements SubController
{
    @Override
    public void execute(HttpServletRequest req, HttpServletResponse resp)
    {
        try
        {
            req.getRequestDispatcher("/WEB-INF/admin/notice.jsp").forward(req, resp);
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}
